/*BEGIN_LEGAL 
BSD License 

Copyright (c) 2021 Intel Corporation. All rights reserved.
 
Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are
met:

Redistributions of source code must retain the above copyright notice,
this list of conditions and the following disclaimer.  Redistributions
in binary form must reproduce the above copyright notice, this list of
conditions and the following disclaimer in the documentation and/or
other materials provided with the distribution.  Neither the name of
the Intel Corporation nor the names of its contributors may be used to
endorse or promote products derived from this software without
specific prior written permission.
 
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE INTEL OR
ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
END_LEGAL */

#ifndef RTNPERF_H
#define RTNPERF_H

/*
 A Pin-probes module for gettin RDTSC at the entry/exit of RTNs (~ functions)
 Motivation: Need a light-weight mechanism to  measure function execution time
*/

#include <algorithm>
#include <sstream> 
#include <fstream> 
#include <iostream> 
#include <cctype>
#include <string>
#include <map>
#include <set>
#include <sys/syscall.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <libgen.h>
#include <unistd.h>
#include <fcntl.h>
#include <dirent.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <limits.h> // for PATH_MAX definition
#include <fcntl.h> // for  AT_FDCWD
#include "pin.H"
#include "tool_macros.h"


using namespace std;
namespace RTN_PERF{

typedef void (*EXITFUNCPTR)(int);


typedef std::map<int, UINT64> Tid2UINT64_MAP;

typedef struct _RINFO
{
 string name;
 Tid2UINT64_MAP count;
 UINT32 icount_static;
#ifdef RTNSANITY
 UINT64 count_after;
#endif
 Tid2UINT64_MAP tsc_entry_last;
 Tid2UINT64_MAP tsc_exit_last;
 Tid2UINT64_MAP tsc_delta_sum;
} RINFO;

typedef RINFO *RINFO_PTR;
typedef std::map<string, RINFO_PTR> RTNNAME_MAP;

typedef RTNNAME_MAP::iterator RTNNAME_MAP_ITER; 

uint64_t rdtsc(){
    unsigned int lo,hi;
    __asm__ __volatile__ ("rdtsc" : "=a" (lo), "=d" (hi));
    return ((uint64_t)hi << 32) | lo;
}


class RTNPERF
{
  public:
    // Constructor
    RTNPERF()
    : _rtnperfExcludefileKnob( KNOB_MODE_WRITEONCE,
      "pintool",
      "rtnperf:exclude_file",
      "",
      "File with suffixes to exclude "
      ),
     _rtnperfIncludefileKnob( KNOB_MODE_WRITEONCE,
      "pintool",
      "rtnperf:include_file",
      "",
      "File with suffixes to Include "
      ),
     _rtnperfImageKnob( KNOB_MODE_WRITEONCE,
      "pintool",
      "rtnperf:image",
      "",
      "Image of of interest"
      ),
     _rtnperfRoutineKnob( KNOB_MODE_WRITEONCE,
      "pintool",
      "rtnperf:routine",
      "",
      "Routine of of interest"
      ),
     _rtnperfRoutinePrefixKnob( KNOB_MODE_WRITEONCE,
      "pintool",
      "rtnperf:prefix",
      "",
      "All routines with 'prefix' in their name unmangled name"
      ),
     _rtnperfDemangledKnob( KNOB_MODE_WRITEONCE,
      "pintool",
      "rtnperf:demangled",
      "name_only", // none, name_only, full
      "Is the routine of interest name demangled, if yes, how? "
      ),
     _rtnperfOutfileKnob( KNOB_MODE_WRITEONCE,
      "pintool",
      "rtnperf:outfile",
      "rtnperf.txt", 
      "Output file"
      ),
     _rtnperfIcountKnob( KNOB_MODE_WRITEONCE,
      "pintool",
      "rtnperf:minicount",
      "1", 
      "Only process RTNs with static instrucition count >= minicount"
      ),
    _rtnperfVerboseKnob( KNOB_MODE_WRITEONCE,
      "pintool",
      "rtnperf:verbose",
      "0",
      "Print verbose information about probes"
      )
      { }
    BOOL Activate(PTHREAD_PROBE::PTHREAD_PROBE *ptprobe, bool JITmode)
    {
       _NumThreads=1; // only the main thread exists at this point.
       _rpverbose =  _rtnperfVerboseKnob.Value();
       _rpptprobe = ptprobe;
       _rpdemangled  = _rtnperfDemangledKnob.Value();
       _ImageOI =  _rtnperfImageKnob.Value();
       _RoutineOI =  _rtnperfRoutineKnob.Value();
       _RoutinePrefix =  _rtnperfRoutinePrefixKnob.Value();
       PIN_InitLock(&_rtnperf_lock);
       if ( !_RoutineOI.empty() && !_RoutinePrefix.empty() )
       {
         cerr << "ERROR: both -rtnperf:routine and -rtnperf:prefix provided." << endl;
         return false;
       }
        if (! _RoutinePrefix.empty() )
        {
          cerr << "-rtnperf:prefix ==> -rtnperf:demangled name_only " << endl;
         _rpdemangled  = "name_only";
        }

       if(_rpverbose) cerr << "ImageOI " << _ImageOI << endl;
       if(_rpverbose) cerr << "RoutineOI " << _RoutineOI << endl;
       InitExcludedPrefixes(_rtnperfExcludefileKnob.Value());
       InitIncludedPrefixes(_rtnperfIncludefileKnob.Value());
       //PrintExcludedPrefixes();
       _outFile.open(_rtnperfOutfileKnob.Value().c_str(),  std::ofstream::out | std::ofstream::trunc);
       if(_rpptprobe)
       {
           _rpptprobe->RegisterCreateCallback(OnPthreadCreate, this);
           _rpptprobe->RegisterExitCallback(OnPthreadExit, this);
       }

       if(JITmode)
       {
         cerr << "-JITmode not supported in this version." << endl;
         return false;
       }
       else
        IMG_AddInstrumentFunction(IMAGE_LOAD, this);
       return true;
    }

    static VOID OnPthreadCreate(int tid, void *v)
    {
      RTNPERF *rtnperf =  ( RTNPERF *)v;
      cerr << "OnPthreadCreate() tid " << tid << " rtnperf 0x" << hex << (ADDRINT) rtnperf << endl;
     rtnperf->_NumThreads++;
    }

    static VOID OnPthreadExit(int tid, void *v)
    {
      RTNPERF *rtnperf =  ( RTNPERF *)v;
      cerr << "OnPthreadExit() tid " << tid << " rtnperf 0x" << hex << (ADDRINT) rtnperf << endl;
    }
  RTNNAME_MAP _RtnNameMap;
  UINT32 _NumThreads;
  ofstream _outFile;

  private:   
  KNOB<string> _rtnperfExcludefileKnob;
  KNOB<string> _rtnperfIncludefileKnob;
  KNOB<string> _rtnperfImageKnob;
  KNOB<string> _rtnperfRoutineKnob;
  KNOB<string> _rtnperfRoutinePrefixKnob;
  KNOB<string> _rtnperfDemangledKnob;
  KNOB<string>   _rtnperfOutfileKnob;
  KNOB<UINT32>   _rtnperfIcountKnob;
  KNOB<BOOL> _rtnperfVerboseKnob;
  EXITFUNCPTR _origExit;
  string _ImageOI="";
  string _RoutineOI="";
  string _RoutinePrefix="";
  set<string> _excludedPrefixes;
  set<string> _includedPrefixes;

  BOOL _rpverbose = FALSE;
  string _rpdemangled  = "name_only";
  PTHREAD_PROBE::PTHREAD_PROBE *_rpptprobe;
  PIN_LOCK _rtnperf_lock;
  
// Should we process this RTN?
  BOOL ProcessRoutine(RTN rtn) 
{
  string demangled_name = DemangledRTNName(RTN_Name(rtn));
  const char * s1 = demangled_name.c_str();
  if(RTN_NumIns(rtn) < _rtnperfIcountKnob.Value())
  {
      if(_rpverbose) cerr << "Skipping " << s1 << " with static icount " << RTN_NumIns(rtn) << endl;
      return false;
  }

  if (_includedPrefixes.size() && InIncludedPrefixes(demangled_name))
  {
   if(_excludedPrefixes.size() && InExcludedPrefixes(demangled_name))
   {
      if(_rpverbose) cerr << "Excluding " << demangled_name << endl;
      return false;
   }
    return true;
  }

  if (_RoutinePrefix.empty() &&  _RoutineOI.empty()) return false; 

  if (!_RoutinePrefix.empty() && (demangled_name.find(_RoutinePrefix)  == 0)) 
  {
   if(_excludedPrefixes.size() && InExcludedPrefixes(demangled_name))
   {
      if(_rpverbose) cerr << "Excluding " << demangled_name << endl;
      return false;
   }
    return true;
  }

  if (!_RoutineOI.empty() && (demangled_name == _RoutineOI)) 
  {
    return true;
  }
  return false;
}

// Should we process this IMG?
  BOOL ProcessImage(IMG img) 
{
  if(_ImageOI.empty()) return true; // all images will be processed
  if(IMG_Name(img).find("libc.so") != string::npos)  return true; // for handling "_exit()"
  if(IMG_Name(img).find(_ImageOI) != string::npos)  return true; // for handling  user-specified image
  return false;
}

static VOID PrintStats(void *v)
{
 static BOOL called=false;
 RTNPERF *rtnperf =  ( RTNPERF *)v;
 cerr << "Entered PrintStats() called before: " << called << endl;
 if(called) return;
 called=true;
 for(RTNNAME_MAP_ITER it = rtnperf->_RtnNameMap.begin(); it != rtnperf->_RtnNameMap.end(); it++)
 {
    RINFO *trinfo = it->second;
#ifdef RTNSANITY
#else
     if (trinfo)  
     {
         rtnperf->_outFile << "RTN_Name: " << trinfo->name << " ( " <<  it->first << " ) " <<  " Static instruction count " << dec << trinfo->icount_static << endl;
      for (UINT32 tid = 0; tid < rtnperf->_NumThreads; tid++)
       {
        UINT64 avg = trinfo->count[tid]?( trinfo->tsc_delta_sum[tid]/trinfo->count[tid]) : 0;
         rtnperf->_outFile << " tid " << dec << tid << "  Call count before " << trinfo->count[tid] << " Average TSC for RTN " << avg << " tsc_entry_last " << trinfo->tsc_entry_last[tid] << " tsc_exit_last " << trinfo->tsc_exit_last[tid]  << " last call TSC " << trinfo->tsc_exit_last[tid] - trinfo->tsc_entry_last[tid] << endl;
       }
     }
#endif
 }
 rtnperf->_outFile.close();
}

string DemangledRTNName(const std::string& rtnname)
{
    if (_rpdemangled == "none") return rtnname;
    if (_rpdemangled == "name_only") return PIN_UndecorateSymbolName(rtnname, UNDECORATION_NAME_ONLY);
    if (_rpdemangled == "full") return PIN_UndecorateSymbolName(rtnname, UNDECORATION_COMPLETE);
    return rtnname;
}

void InitExcludedPrefixes(string fname)
{
   ifstream efile;
   string prefix;
   if (fname.empty()) return;
   efile.open(fname.c_str());
   if (!efile.is_open()) {
     cerr << "Error opening " << fname << endl;  
     exit(1);
   }
   while(getline(efile, prefix))
   {
    //cerr << "Will exclude prefix " << prefix << endl;
    _excludedPrefixes.insert(prefix);
   }
   efile.close();
}

void InitIncludedPrefixes(string fname)
{
   ifstream efile;
   string prefix;
   if (fname.empty()) return;
   efile.open(fname.c_str());
   if (!efile.is_open()) {
     cerr << "Error opening " << fname << endl;  
     exit(1);
   }
   while(getline(efile, prefix))
   {
    //cerr << "Will include prefix " << prefix << endl;
    _includedPrefixes.insert(prefix);
   }
   efile.close();
}


BOOL InExcludedPrefixes(string demangled_name)
{
  for(string prefix : _excludedPrefixes){
    //cerr << "Exclude prefix " << prefix << endl;
    if (demangled_name.find(prefix)  == 0) 
    {
      //cerr << "Found " << prefix << " to exclude " << demangled_name << endl;
      return true;
    }
  }
  return false;
}

BOOL InIncludedPrefixes(string demangled_name)
{
  //const char * s1 = demangled_name.c_str();
  //cerr << "Looking for " << s1 << endl;
  for(string prefix : _includedPrefixes){
    //cerr << "Include prefix " << prefix << endl;
    if (demangled_name.find(prefix)  == 0) 
    {
      //cerr << "Found " << prefix << " to include " << demangled_name << endl;
      return true;
    }
  }
  return false;
}
 

VOID PrintExcludedPrefixes()
{
  for(string prefix : _excludedPrefixes){
    cerr << "Exclude prefix " << prefix << endl;
   if (_excludedPrefixes.find(prefix) != _excludedPrefixes.end())
      cerr << "Found prefix " << prefix << endl;
  }
}

static VOID ExitInProbeMode(EXITFUNCPTR origExit, int code, void *v)
{
    PrintStats(v);
    origExit(code);
}

static VOID MyProbeBefore(RINFO_PTR trinfo, VOID *v)
{
 RTNPERF *rtnperf =  ( RTNPERF *)v;
 PIN_GetLock(&rtnperf->_rtnperf_lock, 1);
  int tid = rtnperf->_rpptprobe->ThreadId();
  //cerr << "MyProbeBefore tid " << tid << endl;
  trinfo->count[tid]++;
  trinfo->tsc_entry_last[tid]=rdtsc();
 PIN_ReleaseLock(&rtnperf->_rtnperf_lock);
}

// TODO: We have per-thread counts/tsc values in a tid-indexex map.
// But is the map indexing thread-safe?
static VOID MyProbeAfter(RINFO_PTR trinfo, VOID *v)
{
 RTNPERF *rtnperf =  ( RTNPERF *)v;
 PIN_GetLock(&rtnperf->_rtnperf_lock, 1);
   int tid = rtnperf->_rpptprobe->ThreadId();
#ifdef RTNSANITY
 trinfo->count_after[tid]++;
#endif
    trinfo->tsc_exit_last[tid]=rdtsc();
    trinfo->tsc_delta_sum[tid] += (trinfo->tsc_exit_last[tid] - trinfo->tsc_entry_last[tid]);
 PIN_ReleaseLock(&rtnperf->_rtnperf_lock);
    //trinfo->tsc_entry=0;
}

static VOID IMAGE_LOAD(IMG img, VOID* v)
{
  RTNPERF *rtnperf =  ( RTNPERF *)v;
  if(!rtnperf->ProcessImage(img)) return;
      for (SEC sec = IMG_SecHead(img); SEC_Valid(sec); sec = SEC_Next(sec))
      {
        for (RTN rtn = SEC_RtnHead(sec); RTN_Valid(rtn); rtn = RTN_Next(rtn))
        {
          {
            if (RTN_Name(rtn) == "_exit" || RTN_Name(rtn) == "exit")
            {
             if(!RTN_IsSafeForProbedInsertion(rtn))
             {
                cerr << "WARNING:Cannot insert probe at "+RTN_Name(rtn)+"\n";
                continue;
             }
               if(rtnperf->_rpverbose) cerr << "Replacing " << RTN_Name(rtn) << " from " << IMG_Name(img) << endl;
               //rtnperf->_origExit = (EXITFUNCPTR)RTN_ReplaceProbed(rtn, AFUNPTR(ExitInProbeMode));
               PROTO myexit_proto  = PROTO_Allocate(PIN_PARG(void), CALLINGSTD_DEFAULT, "_exit", PIN_PARG(int), PIN_PARG_END());
               rtnperf->_origExit =  (EXITFUNCPTR)RTN_ReplaceSignatureProbed(rtn, (AFUNPTR)ExitInProbeMode, IARG_PROTOTYPE, myexit_proto,
                                                      IARG_ORIG_FUNCPTR, IARG_FUNCARG_ENTRYPOINT_VALUE, 0, IARG_PTR, v,  IARG_END);
               PROTO_Free(myexit_proto);
           }
          }
           if(rtnperf->ProcessRoutine(rtn))
           {
             if(!RTN_IsSafeForProbedInsertion(rtn))
             {
                cerr << "WARNING:Cannot insert probe at "+RTN_Name(rtn)+"\n";
                continue;
             }
             RINFO *trinfo = new RINFO;
             string trname = rtnperf->DemangledRTNName(RTN_Name(rtn));
             trinfo->icount_static = RTN_NumIns(rtn);
             rtnperf->_RtnNameMap[ RTN_Name(rtn)] = trinfo;

             PROTO myproto1 = PROTO_Allocate( PIN_PARG(void), CALLINGSTD_DEFAULT,
              "MyProbeBefore", PIN_PARG(RINFO_PTR), PIN_PARG(VOID *),  PIN_PARG_END());

             PROTO myproto2 = PROTO_Allocate( PIN_PARG(void), CALLINGSTD_DEFAULT,
              "MyProbeAfter", PIN_PARG(RINFO_PTR), PIN_PARG(VOID *), PIN_PARG_END());

             if(rtnperf->_rpverbose)cerr << "found rtn" << " " << trname <<  " static icount " << dec << RTN_NumIns(rtn) << " address:0x" << hex << RTN_Address(rtn) << " in " << IMG_Name(img) <<endl;
             RTN_InsertCallProbed(rtn, IPOINT_BEFORE, 
              (AFUNPTR)MyProbeBefore, 
                IARG_PROTOTYPE, myproto1,
                IARG_PTR, trinfo, // pointer to RINFO for this RTN
                IARG_PTR, v, 
                IARG_END);
             RTN_InsertCallProbed(rtn, IPOINT_AFTER, 
              (AFUNPTR)MyProbeAfter, 
                IARG_PROTOTYPE, myproto2,
                IARG_PTR, trinfo, // pointer to RINFO for this RTN
                IARG_PTR, v, 
                IARG_END);
             PROTO_Free(myproto1);
             PROTO_Free(myproto2);
          }
        } // end for RTN
         //if (found) break; // out of SEC loop
      } // end for SEC
    }
};
}
#endif
