/*BEGIN_LEGAL 
Intel Open Source License 

Copyright (c) 2002-2020 Intel Corporation. All rights reserved.
 
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
#include <iostream>
#include <fstream>
#include <string>
#include <sstream>
#include <list>
#include <unistd.h>
#include <sys/syscall.h>
#include <sched.h>
#include <sys/stat.h>
#include <limits.h>


#include "pin.H"
#include "pthread_probe.H"
#include "RTNPerf.H"

static RTN_PERF::RTNPERF rpcontrol;
static PTHREAD_PROBE::PTHREAD_PROBE ppcontrol;

KNOB<BOOL> NoProbeKnob( KNOB_MODE_WRITEONCE,
      "pintool",
      "noprobe",
      "0",
      "Run in probe mode without any probes added"
      );
KNOB<BOOL> JITKnob( KNOB_MODE_WRITEONCE,
      "pintool",
      "JITmode",
      "0",
      "Run in JIT mode for sanity testing of RTN count"
      );

INT32 Usage()
{
    std::cerr << KNOB_BASE::StringKnobSummary() << std::endl;

    return -1;
}



// argc, argv are the entire command line, including pin -t <toolname> -- ...
int main(int argc, char * argv[])
{
    if( PIN_Init(argc,argv) )
    {
        return Usage();
    }
    PIN_InitSymbols();
    //PIN_AddFiniFunction(Fini, 0); Does not work in Probe mode!

    if (!NoProbeKnob)
    {
      if(JITKnob)
      {
         std::cerr << "-JITmode not supported currently. Exiting.." << std::endl;
         PIN_ExitProcess(1);
      }
      if (!ppcontrol.Activate(JITKnob))
      {
        std::cerr << "WARNING: PTHREAD_PROBE not activated." << std::endl;
      }
      if (!rpcontrol.Activate(&ppcontrol, JITKnob))
      {
        std::cerr << "WARNING: RTNPerf not activated." << std::endl;
      }
    }
    // Start the program, never returns
    if(JITKnob)
      PIN_StartProgram();
    else
      PIN_StartProgramProbed();

    return 0;
}
