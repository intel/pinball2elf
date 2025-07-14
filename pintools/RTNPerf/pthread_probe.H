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

#ifndef PTHREAD_PROBE_H
#define PTHREAD_PROBE_H

/*
 A Pin-probes module for gettin RDTSC at the entry/exit of RTNs (~ functions)
 Motivation: Need a light-weight mechanism to  measure function execution time
*/

#include <string>
#include <map>
#include <set>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <limits.h> // for PATH_MAX definition
#include <pthread.h>
#include "pin.H"
#include "tool_macros.h"


using namespace std;
namespace PTHREAD_PROBE{

typedef int (*PTHREADCREATEFUNCPTR)(pthread_t* , __const pthread_attr_t* , void* (*__start_routine)(void*), void * );
typedef void (*PTHREADEXITFUNCPTR)(void * );
typedef pthread_t (*mypthread_self_t)();

typedef void (*pthread_callback)(int, void *);


typedef std::map<pthread_t, int> PTHREAD_MAP;

class PTHREAD_PROBE
{
  public:
    // Constructor
    PTHREAD_PROBE()
     : _pthreadMaxcountKnob( KNOB_MODE_WRITEONCE,
      "pintool",
      "pthread:maxcount",
      "99", 
      "Allow only 99 threads to be cerated."
      ),
     _pthreadVerboseKnob( KNOB_MODE_WRITEONCE,
      "pintool",
      "pthread:verbose",
      "0", 
      "Verbose mode"
      )
      { }
    BOOL Activate(bool JITmode)
    {
       _ppverbose =  _pthreadVerboseKnob.Value();
       _ppmaxcount =  _pthreadMaxcountKnob.Value();
       _ptOnPthreadCreate = NULL;
       PIN_InitLock(&_ptprobe_lock);
       if(JITmode)
       {
         cerr << "-JITmode not supported in this version." << endl;
         return false;
       }
       else
        IMG_AddInstrumentFunction(IMAGE_LOAD, this);
       return true;
    }

    VOID RegisterCreateCallback(pthread_callback OnPthreadCreate, void *v)
    {
       _ptOnPthreadCreate = OnPthreadCreate;
       _ptOnPthreadCreateValue = v;
    }

    VOID RegisterExitCallback(pthread_callback OnPthreadExit, void *v)
    {
       _ptOnPthreadExit = OnPthreadExit;
       _ptOnPthreadExitValue = v;
    }

    int ThreadId()
    {
    pthread_t pthread_id = _app_pthread_self_ptr();
    //cerr << "ThreadId() pthread_id 0x" << hex << (ADDRINT) pthread_id << endl;
     return _PthreadMap[pthread_id];
    }


  PTHREAD_MAP _PthreadMap;
  UINT32 _ThreadNum;

  private:   
  KNOB<UINT32>   _pthreadMaxcountKnob;
  KNOB<BOOL> _pthreadVerboseKnob;
  PTHREADCREATEFUNCPTR _origPthreadCreate;
  PTHREADEXITFUNCPTR _origPthreadExit;
  mypthread_self_t _app_pthread_self_ptr; 
  pthread_callback _ptOnPthreadCreate;
  pthread_callback _ptOnPthreadExit;
  void * _ptOnPthreadCreateValue;
  void * _ptOnPthreadExitValue;
  PIN_LOCK _ptprobe_lock;

  BOOL _ppverbose = FALSE;
  UINT32 _ppmaxcount = 99;

static int PthreadCreateInProbeMode(pthread_t *thread, const pthread_attr_t *attr,
                          void *(*start_routine) (void *), void *arg, void *v)
{
  PTHREAD_PROBE *ptprobe =  ( PTHREAD_PROBE *)v;
    int retval = ptprobe->_origPthreadCreate(thread, attr, start_routine, arg);
    if(retval==0)
    {
      pthread_t pthread_id = *thread;
      PIN_GetLock(&ptprobe->_ptprobe_lock, 1);
       UINT32 tid= ptprobe->_ThreadNum++;
       ASSERTX(tid < ptprobe->_ppmaxcount );
       ptprobe->_PthreadMap[pthread_id] = tid;
     PIN_ReleaseLock(&ptprobe->_ptprobe_lock);
    if(ptprobe->_ppverbose) cerr << "original pthread_create() pthread_id 0x"<< hex << pthread_id <<  " assigned tid " << dec << tid <<  endl;
       if(ptprobe->_ptOnPthreadCreate) ptprobe->_ptOnPthreadCreate(tid, ptprobe->_ptOnPthreadCreateValue);
    }
    return retval;
}

static void PthreadExitInProbeMode(void *retval, void *v)
{
  PTHREAD_PROBE *ptprobe =  ( PTHREAD_PROBE *)v;
  int tid = ptprobe->ThreadId();
    if(ptprobe->_ptOnPthreadExit) ptprobe->_ptOnPthreadExit(tid, ptprobe->_ptOnPthreadExitValue);
    ptprobe->_origPthreadExit(retval);
}

static pthread_t PthreadSelfInProbeMode( void *v)
{
  PTHREAD_PROBE *ptprobe =  ( PTHREAD_PROBE *)v;
   //cerr << "PthreadSelfInProbeMode() calling original pthread_self()" << endl;
    return ptprobe->_app_pthread_self_ptr();
}

static VOID IMAGE_LOAD(IMG img, VOID* v)
{
  PTHREAD_PROBE *ptprobe =  ( PTHREAD_PROBE *)v;
  if(IMG_Name(img).find("libpthread.so") != string::npos)
  {
   RTN rtn = RTN_FindByName(img, "pthread_create");
   if(RTN_Valid(rtn))
   {
    if(!RTN_IsSafeForProbedInsertionEx(rtn, PROBE_MODE_ALLOW_RELOCATION))
    {
      cerr << "WARNING:Cannot insert probe at "+RTN_Name(rtn)+"\n";
    }
    else
    {
      if(ptprobe->_ppverbose) cerr << "Replacing " << RTN_Name(rtn) << " from " << IMG_Name(img) << endl;
      PROTO myptcreate_proto  = PROTO_Allocate(PIN_PARG(int), CALLINGSTD_DEFAULT, "pthread_create", PIN_PARG(void *),  PIN_PARG(void *),  PIN_PARG(void *), PIN_PARG(void *), PIN_PARG_END());
      ptprobe->_origPthreadCreate =  (PTHREADCREATEFUNCPTR)RTN_ReplaceSignatureProbedEx(rtn, PROBE_MODE_ALLOW_RELOCATION, (AFUNPTR)PthreadCreateInProbeMode, IARG_PROTOTYPE, myptcreate_proto,
      IARG_FUNCARG_ENTRYPOINT_VALUE, 0, IARG_FUNCARG_ENTRYPOINT_VALUE, 1, IARG_FUNCARG_ENTRYPOINT_VALUE, 2, IARG_FUNCARG_ENTRYPOINT_VALUE, 3, IARG_PTR, v,  IARG_END);
      PROTO_Free(myptcreate_proto);
    }
   }
  }
  if(IMG_Name(img).find("libc.so") != string::npos)
  {
    RTN rtn = RTN_FindByName(img, "pthread_self");
   if(RTN_Valid(rtn))
   {
    if(!RTN_IsSafeForProbedInsertionEx(rtn, PROBE_MODE_ALLOW_RELOCATION))
    {
      cerr << "WARNING:Cannot insert probe at "+RTN_Name(rtn)+"\n";
    }
    else
    {
      if(ptprobe->_ppverbose) cerr << "Replacing " << RTN_Name(rtn) << " from " << IMG_Name(img) << endl;
      PROTO myptself_proto  = PROTO_Allocate(PIN_PARG(pthread_t), CALLINGSTD_DEFAULT, "pthread_self",  PIN_PARG_END());
      ptprobe->_app_pthread_self_ptr = (mypthread_self_t) RTN_ReplaceSignatureProbed(rtn, (AFUNPTR)PthreadSelfInProbeMode, IARG_PROTOTYPE, myptself_proto,
      IARG_PTR, v,  IARG_END);
      if(ptprobe->_ppverbose) cerr << "Found " << RTN_Name(rtn) << " Address 0x" << hex << (ADDRINT) ptprobe->_app_pthread_self_ptr << " in " << IMG_Name(img) << endl;
      pthread_t pthread_id = ptprobe->_app_pthread_self_ptr();
      UINT32 tid = ptprobe->_ThreadNum++;
      ptprobe->_PthreadMap[pthread_id] = tid;
      if(ptprobe->_ppverbose) cerr << "Main thread pthread_id 0x"<< hex << pthread_id <<  " assigned tid " << dec << tid <<  endl;
      PROTO_Free(myptself_proto);
    }
   }

   rtn = RTN_FindByName(img, "pthread_exit");
   if(RTN_Valid(rtn))
   {
    if(!RTN_IsSafeForProbedInsertionEx(rtn, PROBE_MODE_ALLOW_RELOCATION))
    {
      cerr << "WARNING:Cannot insert probe at "+RTN_Name(rtn)+"\n";
    }
    else
    {
      if(ptprobe->_ppverbose) cerr << "Replacing " << RTN_Name(rtn) << " from " << IMG_Name(img) << endl;
      PROTO myptexit_proto  = PROTO_Allocate(PIN_PARG(void), CALLINGSTD_DEFAULT, "pthread_create", PIN_PARG(void *), PIN_PARG_END());
      ptprobe->_origPthreadExit =  (PTHREADEXITFUNCPTR)RTN_ReplaceSignatureProbedEx(rtn, PROBE_MODE_ALLOW_RELOCATION, (AFUNPTR)PthreadExitInProbeMode, IARG_PROTOTYPE, myptexit_proto,
      IARG_FUNCARG_ENTRYPOINT_VALUE, 0, IARG_PTR, v,  IARG_END);
      PROTO_Free(myptexit_proto);
    }
   }
  }
 }
};
}
#endif
