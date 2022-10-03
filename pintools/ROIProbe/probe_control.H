/*BEGIN_LEGAL 
BSD License 

Copyright (c)2022 Intel Corporation. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
END_LEGAL */

#ifndef PROBE_CONTROL_H
#define PROBE_CONTROL_H

/*
 A controller class with Pin-Probes
 Motivation: Need a light-weight mechanism to specify region of interest.
 
*/

#include <algorithm>
#include <sstream> 
#include <fstream> 
#include <iostream> 
#include <cctype>
#include <string>
#include <list>
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
#include "atomic.hpp"

#define LOCALTYPE 
using namespace std;
namespace PROBE_CONTROL{

typedef enum {
  PROBE_EVENT_INVALID = 0,
  PROBE_EVENT_RSTART,
  PROBE_EVENT_RSTOP,
  PROBE_EVENT_IDELTASTOP,
  PROBE_EVENT_ISTART,
  PROBE_EVENT_ISTOP,
  PROBE_EVENT_PCDELTASTOP,
  PROBE_EVENT_PCSTART,
  PROBE_EVENT_PCSTOP
}PROBE_EVENT_TYPE;

typedef pair<PROBE_EVENT_TYPE,UINT64> IEPAIR;
typedef list<IEPAIR> IELIST;
typedef IELIST::iterator IELISTITER;

static IEPAIR istart_pair;
static IEPAIR istop_pair;
static IEPAIR idelta_pair;

typedef pair<UINT64,UINT64> PCEPAIR;
typedef list<PCEPAIR> PCELIST;
typedef PCELIST::iterator PCELISTITER;

static PCEPAIR pcstart_pair;
static PCEPAIR pcstop_pair;
static PCEPAIR pcdelta_pair;

typedef struct _RINFO
{
 string name;
 UINT64 count;
 BOOL probed;
 IELIST ielist;
} RINFO;

static const UINT32 RCOUNT=500;
static const UINT32 BUFSIZE=2000;

static RINFO *rinfo[RCOUNT];
static UINT32 recordNum = 0;
static BOOL pbverbose = FALSE;
static PIN_LOCK probeLock;

typedef VOID (*PROBE_CONTROL_HANDLER)(PROBE_EVENT_TYPE);
static PROBE_CONTROL_HANDLER UserCallBack = NULL;

  string EventStr(PROBE_EVENT_TYPE e)
  {
      switch(e)
      {
        case PROBE_EVENT_RSTART:
        {
          return "RTNstart";
          break;
        }
        case PROBE_EVENT_RSTOP:
        {
          return "RTNstop";
          break;
        }
        case PROBE_EVENT_ISTART:
        {
          return "istart";
          break;
        }
        case PROBE_EVENT_IDELTASTOP:
        {
          return "ideltastop";
          break;
        }
        case PROBE_EVENT_ISTOP:
        {
          return "istop";
          break;
        }
        case PROBE_EVENT_PCSTART:
        {
          return "pcstart";
          break;
        }
        case PROBE_EVENT_PCDELTASTOP:
        {
          return "pcdeltastop";
          break;
        }
        case PROBE_EVENT_PCSTOP:
        {
          return "pcstop";
          break;
        }
        default:
        {
          return "INVALID";
        }
      }
  }

  VOID PrintRinfo(RINFO *r)
  {
    cerr << " name: " << r->name;
    cerr << " count: " << dec << r->count;
    IELISTITER itr;
    cerr << " ielist: ";
    for(itr=r->ielist.begin(); itr != r->ielist.end(); ++itr)
      cerr << " " << EventStr(itr->first) << " " << itr->second;
    cerr << endl;
  }
  
  VOID PrintRspecs()
  {
    for(UINT32 i=0; i<recordNum; i++)
      PrintRinfo(rinfo[i]);
  }

  RINFO * FindName(string instr)
  {
    for(UINT32 i=0; i<recordNum; i++)
   {
    if(!rinfo[i]) break;
    if(rinfo[i]->name == instr) return rinfo[i];
   }
   return NULL;
  }

  BOOL IsPCstring(string instr)
  {
   if ((instr.c_str()[0] == '0') &&(instr.c_str()[1] == 'x')) return TRUE;
   return FALSE;
  }

static VOID MyRTNProbe(UINT32 i)
  {
    if (i==RCOUNT) return; // not a user-specifed probe-point

    RINFO *trinfo = rinfo[i];
    ASSERTX(trinfo);
    //if(pbverbose) cerr << " MyRTNProbe " << trinfo->name << endl;
    ATOMIC::OPS::Increment<UINT64>
      (&trinfo->count,1);
    //if(pbverbose) cerr << " exec_count " << trinfo->count << endl;
    if(trinfo->ielist.empty()) return;
    //if(pbverbose) cerr << " front " << endl;
    //if(pbverbose) PrintRinfo(trinfo);
    PIN_GetLock(&probeLock, 1);
    if(trinfo->count != trinfo->ielist.front().second)
    { 
      PIN_ReleaseLock(&probeLock);
      return;
    } 
    PROBE_EVENT_TYPE event = trinfo->ielist.front().first;
    cerr << " exec_count " << dec << trinfo->count << endl;
    cerr << EventStr(event) << " event triggered @" << trinfo->name << ":" << dec << trinfo->ielist.front().second << endl << flush;
    trinfo->ielist.pop_front();
    PIN_ReleaseLock(&probeLock);
    if (UserCallBack) UserCallBack(event);
    return;
  }
class PROBECONTROL
{
  public:
    // Constructor
    PROBECONTROL()
    : _rspecInKnob( KNOB_MODE_WRITEONCE,
      "pintool",
      "probecontrol:in",
      "",
      "File with region specification (one per line):\n\t<roispec>:<count>; roispec: <event>,<rtnname>|<hexaddr>; event: 'RTNstart'|'RTNstop'; rtnname: STRING; hexaddr:HEXNUMBER"
      ),
    _rspecVerboseKnob( KNOB_MODE_WRITEONCE,
      "pintool",
      "probecontrol:verbose",
      "0",
      "Print verbose information about probes"
      )
      { }
    VOID RegisterHandler(PROBE_CONTROL_HANDLER  callback)
    {
      UserCallBack = callback;
    }
    BOOL Activate()
    {
       // Register ImageLoad to be called when an image is loaded
       PIN_InitLock(&probeLock);
       IMG_AddInstrumentFunction(IMAGE_LOAD, 0);
       pbverbose =  _rspecVerboseKnob.Value();
       return ParseROISpec();
    }
    UINT64 IstartCount()
    {
      return istart_pair.second;
    }
    UINT64 IstopCount()
    {
      return istop_pair.second;
    }
    UINT64 IdeltaCount()
    {
      return idelta_pair.second;
    }
    UINT64 PCstartValue()
    {
      return pcstart_pair.first;
    }
    UINT64 PCstartCount()
    {
      return pcstart_pair.second;
    }
    UINT64 PCstopValue()
    {
      return pcstop_pair.first;
    }
    UINT64 PCstopCount()
    {
      return pcstop_pair.second;
    }
    UINT64 PCdeltastopValue()
    {
      return pcdelta_pair.first;
    }
    UINT64 PCdeltastopCount()
    {
      return pcdelta_pair.second;
    }
  private:   
  KNOB<string> _rspecInKnob;
  KNOB<BOOL> _rspecVerboseKnob;


  BOOL ParseROISpec()
  {
    if (strcmp(_rspecInKnob.Value().c_str(),"") == 0)
    {
      return FALSE;
    }
    string filename = _rspecInKnob.Value().c_str();
    ifstream rfile(filename.c_str());
    if (!rfile.is_open())
    {
      cerr << "Could not open ROI specification file '" <<
      _rspecInKnob.Value().c_str() << "'" << endl;
      ASSERTX(0);
    }
    // Read records from the file
    UINT32 lineNum = 0;
    string rtnOrPC;
    string eventstr;
    PROBE_EVENT_TYPE event;
    string ecountstr;
    UINT64 ecount;
    string evaluestr;
    UINT64 evalue;

    while(true)
    {
      RINFO *trinfo = NULL;
      if( rfile.eof() )
      {
        break;
      }
  
      UINT32 recordLen = 0;
      CHAR record[BUFSIZE+1];
      string field;


      // Get the next line
      rfile.getline(record, BUFSIZE);
      lineNum++;

      // Ignore empty lines
      recordLen = strnlen_s(record, BUFSIZE+1);
      if (recordLen == 0)
       continue;

      // first letter '#' : this is a comment 
      if(record[0]=='#')
       continue;

      ASSERTX(recordNum < RCOUNT);
      istringstream s(record);

      // Get event name
      if(pbverbose) cerr << "Record # " << recordNum << " " << record << endl;
      field.clear();
      getline(s, field, ':');
      ASSERT(!field.empty(), "Empty event field.");
      eventstr = field;

      if (strcmp(eventstr.c_str(),"RTNstart") == 0) event = PROBE_EVENT_RSTART;
      else if (strcmp(eventstr.c_str(),"RTNstop") == 0) event = PROBE_EVENT_RSTOP;
      else if (strcmp(eventstr.c_str(),"istart") == 0) event = PROBE_EVENT_ISTART;
      else if (strcmp(eventstr.c_str(),"istop") == 0) event = PROBE_EVENT_ISTOP;
      else if (strcmp(eventstr.c_str(),"ideltastop") == 0) event = PROBE_EVENT_IDELTASTOP;
      else if (strcmp(eventstr.c_str(),"pcstart") == 0) event = PROBE_EVENT_PCSTART;
      else if (strcmp(eventstr.c_str(),"pcstop") == 0) event = PROBE_EVENT_PCSTOP;
      else if (strcmp(eventstr.c_str(),"pcdeltastop") == 0) event = PROBE_EVENT_PCDELTASTOP;
      else ASSERT(FALSE, "Invalid event field."+eventstr);

      switch(event)
      {
        case PROBE_EVENT_RSTART:
        case PROBE_EVENT_RSTOP:
        {
          field.clear();
          getline(s, field, ':');
          rtnOrPC = field;
          if(pbverbose) cerr << "name " << rtnOrPC << endl;
          trinfo = FindName(rtnOrPC);
          if (trinfo == NULL)
          {
            trinfo = new RINFO;
            rinfo[recordNum]=trinfo;
            trinfo->count = 0;
            trinfo->probed = FALSE;
            trinfo->name = rtnOrPC;
            recordNum++;
          }
          field.clear();
          getline(s, field, ':');
          ecountstr = field;
          ecount=atol(ecountstr.c_str());
          if(pbverbose) cerr << "ecountstr " << ecountstr  << " ecount " << dec << ecount << endl;

          IEPAIR iepair = make_pair(event,ecount);
          trinfo->ielist.push_back(iepair);
          //trinfo->ielist.sort();
          //trinfo->ielist.unique();
          if(pbverbose)PrintRinfo(trinfo);
          break;
        } 
        case PROBE_EVENT_ISTART:
        case PROBE_EVENT_ISTOP:
        case PROBE_EVENT_IDELTASTOP:
        {
          field.clear();
          getline(s, field, ':');
          ecountstr = field;
          ecount=atol(ecountstr.c_str());
          if(pbverbose) cerr << "ecountstr " << ecountstr  << " ecount " << dec << ecount << endl;
          IEPAIR iepair = make_pair(event,ecount);
          if (event == PROBE_EVENT_ISTART)
          {
            if(istart_pair.first != PROBE_EVENT_INVALID)
            {
              cerr << "Only one istart event allowed, second seen." << endl;
              ASSERTX(0);
            }
            istart_pair = iepair;
          }
          if (event == PROBE_EVENT_ISTOP)
          {
            if(istop_pair.first != PROBE_EVENT_INVALID)
            {
              cerr << "Only one istop event allowed, second seen." << endl;
              ASSERTX(0);
            }
            istop_pair = iepair;
          }
          if (event == PROBE_EVENT_IDELTASTOP)
          {
            if(istop_pair.first != PROBE_EVENT_INVALID)
            {
              cerr << "Only one ideltastop event allowed, second seen." << endl;
              ASSERTX(0);
            }
            idelta_pair = iepair;
          }
          break;
        } 

        case PROBE_EVENT_PCSTART:
        case PROBE_EVENT_PCSTOP:
        case PROBE_EVENT_PCDELTASTOP:
        {
          field.clear();
          getline(s, field, ':');
          evaluestr = field;
          evalue=strtol(evaluestr.c_str(),NULL,16);
          if(pbverbose) cerr << "evaluestr " << evaluestr  << " evalue " << hex << evalue << endl;
          field.clear();
          getline(s, field, ':');
          ecountstr = field;
          ecount=atol(ecountstr.c_str());
          if(pbverbose) cerr << "ecountstr " << ecountstr  << " ecount " << dec << ecount << endl;
          PCEPAIR pcepair = make_pair(evalue,ecount);
          if (event == PROBE_EVENT_PCSTART)
          {
            pcstart_pair = pcepair;
          }
          if (event == PROBE_EVENT_PCSTOP)
          {
            pcstop_pair = pcepair;
          }
          if (event == PROBE_EVENT_PCDELTASTOP)
          {
            pcdelta_pair = pcepair;
          }
          break;
        } 
        default:
        {
          ASSERTX(0);
        } 
     }
    }
    rfile.close();

    return TRUE;
  }


  static VOID IMAGE_LOAD(IMG img, VOID* v)
  {
    BOOL found = FALSE;
    for(UINT32 i=0; i<recordNum; i++)
    {
      RINFO *trinfo;
      trinfo = rinfo[i];
      if(trinfo->probed) continue;
      //cerr << "Looking for " << trinfo->name << endl;
      found = FALSE;
      for (SEC sec = IMG_SecHead(img); SEC_Valid(sec); sec = SEC_Next(sec))
      {
        for (RTN rtn = SEC_RtnHead(sec); RTN_Valid(rtn); rtn = RTN_Next(rtn))
        {
          if(IsPCstring(trinfo->name)) 
          {
            UINT64 pc=strtol(trinfo->name.c_str(),NULL,16);
            RTN_Open(rtn);
            // search for needed instructions
            for (INS ins = RTN_InsHead(rtn); INS_Valid(ins) ; ins = INS_Next(ins))
            {
                const ADDRINT insAddr = INS_Address(ins);
                //if(pbverbose) out_file << "INS @ " << hex << insAddr << endl;
                //if(pbverbose) out_file << INS_Disassemble(ins) << endl;     
                if (pc == insAddr)  // found the instruction create dummy function
                {
                  if( pbverbose) cerr << "found PC :" << trinfo->name <<  " pcval:0x" << hex << pc << " in RTN " << RTN_Name(rtn) << endl;
                  RTN_Close(rtn);
                  RTN newRtn = RTN_CreateAt(pc, "TriggerHere_" + trinfo->name);
                  if(!RTN_IsSafeForProbedInsertion(newRtn))
                  {
                    cerr << "WARNING:Cannot insert probe at "+INS_Disassemble(ins)+"\n";
                    continue;
                     // see if this is a direct jump and if yes try probing
                     // its target
                  }
                  PROTO myproto = PROTO_Allocate( PIN_PARG(void), CALLINGSTD_DEFAULT,
                   //"MyRTNProbe", PIN_PARG(UINT32),  PIN_PARG(UINT32), PIN_PARG_END());
                   "MyRTNProbe", PIN_PARG_END());
                  if(pbverbose) cerr << "Created rtn" << ":" << RTN_Name(newRtn) <<  " address:0x" << hex << RTN_Address(newRtn) <<endl;
                  RTN_InsertCallProbed(newRtn, IPOINT_BEFORE, 
                    (AFUNPTR)MyRTNProbe, 
                      IARG_PROTOTYPE, myproto,
                      IARG_UINT32, i, // index into rinfo[] 
                      IARG_END);
                   trinfo->probed = TRUE;
                   found = TRUE;
                   PROTO_Free(myproto);
                  break; // out of INS loop
                }
            }
            if(!found) RTN_Close(rtn);
            if(found) break;// out of RTN loop
          }
          else
          {
           if(strstr(RTN_Name(rtn).c_str(), trinfo->name.c_str()))
           {
             //cerr << "PARTIAL match rtn" << ":" << RTN_Name(rtn) << " in " << IMG_Name(img) <<endl;
           }
           if(RTN_Name(rtn) == trinfo->name)
           {
             PROTO myproto = PROTO_Allocate( PIN_PARG(void), CALLINGSTD_DEFAULT,
              "MyRTNProbe", PIN_PARG(UINT32), PIN_PARG_END());
             if(pbverbose)cerr << "found rtn" << ":" << RTN_Name(rtn) <<  " address:0x" << hex << RTN_Address(rtn) <<endl;
             if(!RTN_IsSafeForProbedInsertion(rtn))
             {
                cerr << "WARNING:Cannot insert probe at "+RTN_Name(rtn)+"\n";
                continue;
                // see if this is a direct jump and if yes try probing
                // its target
             }
             RTN_InsertCallProbed(rtn, IPOINT_BEFORE, 
              (AFUNPTR)MyRTNProbe, 
                IARG_PROTOTYPE, myproto,
                IARG_UINT32, i, // index into rinfo[] 
                IARG_END);
              trinfo->probed = TRUE;
              found = TRUE;
              break; // out of RTN loop
            }
           }
         } // end for RTN
         if (found) break; // out of SEC loop
      } // end for SEC
    }
  }
};

}
#endif
