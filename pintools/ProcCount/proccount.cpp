/*
 * Copyright (C) 2004-2021 Intel Corporation.
 * SPDX-License-Identifier: BSD-3-Clause
 */

//
// This tool counts the number of times a routine is executed and
// the number of instructions executed in a routine
//

#include <fstream>
#include <iomanip>
#include <iostream>
#include <map>
#include <string.h>
#include <sys/syscall.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <fcntl.h>           
#include <sys/stat.h>
#include "pin.H"
#include "atomic.hpp"

using std::cerr;
using std::dec;
using std::endl;
using std::hex;
using std::ofstream;
using std::setw;
using std::string;

KNOB<string> KnobOutDir(KNOB_MODE_WRITEONCE, "pintool", "outdir", ".", "Output directory");
KNOB<string> KnobMsg(KNOB_MODE_WRITEONCE, "pintool", "msgfile", "msg.out", "tool messages");
ofstream outFile;
ofstream msgFile;
BOOL proc_fini_called = FALSE;

// Holds instruction count for a single procedure
typedef struct RtnCount
{
    string _name;
    string _image;
    ADDRINT _address;
    RTN _rtn;
    UINT64 _rtnCount;
    UINT64 _icount;
    struct RtnCount* _next;
} RTN_COUNT;

// Linked list of instruction counts for each routine
RTN_COUNT* RtnList = 0;

typedef RTN_COUNT *RTN_COUNT_PTR;
typedef std::map<string, RTN_COUNT_PTR> RTNNAME_MAP;

RTNNAME_MAP RtnNameMap;

RTN_COUNT *OtherRC = NULL;

// This function is called before every instruction is executed
VOID docount(UINT64* counterptr, UINT32 value) 
{
ATOMIC::OPS::Increment<UINT64>
 (counterptr, value);
}
VOID docount_tid0(THREADID tid, char * rtnname,  UINT64* counterptr, UINT32 value) 
{
  if(tid==0)
  {
  ATOMIC::OPS::Increment<UINT64>
  (counterptr, value);
  if(strcmp(rtnname,"floorf") == 0)
   outFile << "Incrementing for " << rtnname << endl;
  }
}
//{ (*counterptr) += value; }

const char* StripPath(const char* path)
{
    const char* file = strrchr(path, '/');
    if (file)
        return file + 1;
    else
        return path;
}

VOID InitOtherRoutine()
{
    OtherRC = new RTN_COUNT;
    OtherRC->_name     = "NORTN";
    OtherRC->_image    = "NOIMAGE";
    OtherRC->_address  = 0;
    OtherRC->_icount   = 0;
    OtherRC->_rtnCount = 0;
}

// Pin calls this function every time a new rtn is executed
VOID Routine(RTN rtn, VOID* v)
{
    if (RtnNameMap.find(RTN_Name(rtn)) == RtnNameMap.end())
    {
      // Allocate a counter for this routine
      RTN_COUNT* rc = new RTN_COUNT;

      // The RTN goes away when the image is unloaded, so save it now
      // because we need it in the fini
      rc->_name     = RTN_Name(rtn);
      rc->_image    = StripPath(IMG_Name(SEC_Img(RTN_Sec(rtn))).c_str());
      rc->_address  = RTN_Address(rtn);
      rc->_icount   = 0;
      rc->_rtnCount = 0;

      // Add to list of routines
      rc->_next = RtnList;
      RtnList   = rc;


    // Add to the map to find this later...
      RtnNameMap[ rc->_name ] = rc;

      //cerr << "Instrumenting RTN " << RTN_Name(rtn) << endl;
      RTN_Open(rtn);

    // Insert a call at the entry point of a routine to increment the call count
    RTN_InsertCall(rtn, IPOINT_BEFORE, (AFUNPTR)docount, IARG_PTR, &(rc->_rtnCount),IARG_UINT32, 1, IARG_END);
      //RTN_InsertCall(rtn, IPOINT_BEFORE, (AFUNPTR)docount_tid0, IARG_THREAD_ID, IARG_PTR, rc->_name.c_str(), IARG_PTR, &(rc->_rtnCount),IARG_UINT32, 1, IARG_END);

    RTN_Close(rtn);
   }
   else
   {
      //cerr << "SKIP Instrumenting RTN " << RTN_Name(rtn) << endl;
   }
}

// Pin calls this function every time a new basic block is encountered
// It inserts a call to docount

VOID Trace(TRACE trace, VOID* v)
{
    RTN_COUNT *rc = NULL;
    RTN rtn = TRACE_Rtn( trace );
    if (! RTN_Valid(rtn))
      rc = OtherRC;
    else
    {
      RTNNAME_MAP::const_iterator pos = RtnNameMap.find( RTN_Name(rtn) );
      if (pos == RtnNameMap.end())
        rc = OtherRC;
      else 
        rc = pos->second;
    }
    // Visit every basic block  in the trace
    for (BBL bbl = TRACE_BblHead(trace); BBL_Valid(bbl); bbl = BBL_Next(bbl))
    {
        // Insert a call to docount for every bbl, passing the number of instructions.
        // IPOINT_ANYWHERE allows Pin to schedule the call anywhere in the bbl to obtain best performance.
        // Use a fast linkage for the call.
        BBL_InsertCall(bbl, IPOINT_BEFORE, (AFUNPTR)docount, IARG_PTR, &(rc->_icount), IARG_UINT32, BBL_NumIns(bbl), IARG_END);
    }
}

VOID OutPut(RTN_COUNT *rc)
{
  // UNDECORATION_NAME_ONLY
  // UNDECORATION_COMPLETE
  if (rc->_icount > 0)
    outFile << PIN_UndecorateSymbolName(rc->_name, UNDECORATION_NAME_ONLY)<< "#\t" << rc->_image << "#\t0x" << hex << rc->_address << dec
             << "#\t" << rc->_rtnCount << "#\t" << rc->_icount << endl;
}

VOID OutputProcCount()
{
    outFile << "Procedure#\t"
            << "Image#\t"
            << "Address#\t"
            << "Calls#\t"
            << "Instructions" << endl;

    OutPut(OtherRC);
    for (RTN_COUNT* rc = RtnList; rc; rc = rc->_next)
    {
      OutPut(rc);
    }
    outFile.close();
}

PIN_LOCK pinLock;

/* ===================================================================== */

VOID ProcFini()
{
      PIN_GetLock(&pinLock, PIN_GetTid());
    if (!proc_fini_called)
    {
      proc_fini_called = TRUE;
      msgFile << "TOOL: Proc  Fini: " << PIN_GetTid() << endl << std::flush;
      OutputProcCount();
    }
      PIN_ReleaseLock(&pinLock);
}

VOID OnSyscallEntry(THREADID threadIndex, CONTEXT* ctxt, SYSCALL_STANDARD std, VOID* v)
{
    ADDRINT sysnum = PIN_GetSyscallNumber(ctxt, std);
    if (sysnum == SYS_exit)
    {
      PIN_GetLock(&pinLock, threadIndex + 1);
      msgFile << "TOOL: At exit in " << PIN_GetTid() << endl;
      PIN_ReleaseLock(&pinLock);
      //ProcFini();
    }
    if (sysnum == SYS_exit_group)
    {
      PIN_GetLock(&pinLock, threadIndex + 1);
      msgFile << "TOOL: At exit_group in " << PIN_GetTid() << endl;
      PIN_ReleaseLock(&pinLock);
      //ProcFini();
    }
    if (sysnum == SYS_execve)
    {
      PIN_GetLock(&pinLock, threadIndex + 1);
      msgFile << "TOOL: At execve in " << PIN_GetTid() << endl;
      const char * pathname =  (const char *) PIN_GetSyscallArgument(ctxt, std, 0);
      msgFile << "   ->" << pathname << endl;
      outFile << "EXECVE#"<< PIN_GetTid() << "#" << pathname <<  "# 0" << "# 0" << endl;
      
      PIN_ReleaseLock(&pinLock);
      ProcFini();
    }

}

VOID ProcStart(pid_t pid)
{
    PIN_GetLock(&pinLock, pid);
    msgFile << "TOOL: Proc Start: " << PIN_GetTid() << endl;
    char outFileName[ 15 + 10]; // strlen("/proccount.out")+1+10
    sprintf(outFileName, "/proccount.%d.out", pid);    
    string outdir = KnobOutDir.Value();
    //cerr << "outFileName " << (outdir+outFileName).c_str() << endl;
    if (outFile.is_open()) outFile.close(); // Might have inherited from the parent...
    outFile.open((outdir+outFileName).c_str(),  std::ofstream::out | std::ofstream::app);
    if(!outFile)
      cerr << "Failed to open outFileName " << (outdir+outFileName).c_str() << " errno " << std::strerror(errno) << endl;
        
    PIN_AddSyscallEntryFunction(OnSyscallEntry, 0);
    atexit(ProcFini);
    PIN_ReleaseLock(&pinLock);
}

/* ===================================================================== */

VOID AfterForkInChild(THREADID threadid, const CONTEXT* ctxt, VOID* arg)
{
    PIN_GetLock(&pinLock, threadid + 1);
    msgFile << "TOOL: After fork in child:" << PIN_GetTid() << endl;
    PIN_ReleaseLock(&pinLock);

    for (RTN_COUNT* rc = RtnList; rc; rc = rc->_next)
    {
       rc->_icount = 0;
    }
    ProcStart(PIN_GetTid());
}

// This function is called when the application exits
// It prints the name and count for each procedure
VOID Fini(INT32 code, VOID* v)
{
    PIN_GetLock(&pinLock, PIN_GetPid());
    msgFile << "TOOL: Application   Fini: " << PIN_GetTid() << endl << std::flush;
    PIN_ReleaseLock(&pinLock);
    msgFile.close();
    //ProcFini(); // main process finishes
}

/* ===================================================================== */
/* Print Help Message                                                    */
/* ===================================================================== */

INT32 Usage()
{
    cerr << "This Pintool counts the number of times a routine is executed" << endl;
    cerr << "and the number of instructions executed in a routine" << endl;
    cerr << endl << KNOB_BASE::StringKnobSummary() << endl;
    return -1;
}


/* ===================================================================== */
/* Main                                                                  */
/* ===================================================================== */

int main(int argc, char* argv[])
{
    // Initialize symbol table code, needed for rtn instrumentation
    PIN_InitSymbols();


    // Initialize pin
    if (PIN_Init(argc, argv)) return Usage();

    string outdir = KnobOutDir.Value();
    if (mkdir(outdir.c_str(), 0777) == -1)
    {
      cerr << "Unable to create directory " << outdir << endl;
      if(errno == EEXIST)
      {
       cerr << ": directory " << outdir << " already exists" << endl;
      }
      else
      	exit(1);
    }
    const char* msgFileName = KnobMsg.Value().c_str();
    msgFile.open(msgFileName);
    msgFile << "TOOL: main: " << PIN_GetTid() << endl << std::flush;
 
    // forks a new process.
    PIN_AddForkFunction(FPOINT_AFTER_IN_CHILD, AfterForkInChild, 0);

    InitOtherRoutine();

    ProcStart(PIN_GetTid()); // Main process starts
    outFile << "MAIN#" << PIN_GetTid() << "#"; 
    bool dashseen = false;
    for (int i=0; i<argc; i++)
    {
      if(dashseen) outFile << argv[i] << " ";
      if(strcmp(argv[i],"--") == 0) dashseen=true;
    }
    outFile << "# 0" << "# 0" << endl;

    // Register Routine to be called to instrument rtn
    RTN_AddInstrumentFunction(Routine, 0);

    // Register Trace to be called to instrument trace
    TRACE_AddInstrumentFunction(Trace, 0);

    // Register Fini to be called when the application exits
    PIN_AddFiniFunction(Fini, 0);

    // Start the program, never returns
    PIN_StartProgram();

    return 0;
}
