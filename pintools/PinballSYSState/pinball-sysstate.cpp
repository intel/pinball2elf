/*BEGIN_LEGAL 
BSD License 

Copyright (c) 2020  Intel Corporation. All rights reserved.
 
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
#include <string>
#include <sstream>

#include "pin.H"
#if defined(EMX_INIT)
#  include "emx-init.H"
#endif

#include "pinball-sysstate.H"

#if defined(EMX_INIT)
#include "emx-pinplay-supp.H"
#endif
#include "pinplay.H"
static PINPLAY_ENGINE *pinplay_engine;
static PINPLAY_ENGINE pp_pinplay_engine;

PINBALL_SYSSTATE::SYSSTATE pbsysstate;

#if ! defined(EMX_INIT)
#define KNOB_LOG_NAME  "log"
#define KNOB_REPLAY_NAME "replay"
#define KNOB_FAMILY "pintool:pinplay-driver"

KNOB_COMMENT pinplay_driver_knob_family(KNOB_FAMILY, "PinPlay Driver Knobs");

KNOB<BOOL>KnobPinPlayReplayer(KNOB_MODE_WRITEONCE, KNOB_FAMILY,
                       KNOB_REPLAY_NAME, "0", "Replay a pinball");
KNOB<BOOL>KnobPinPlayLogger(KNOB_MODE_WRITEONCE,  KNOB_FAMILY,
                     KNOB_LOG_NAME, "0", "Create a pinball");

#endif



#if !defined(EMX_INIT)
LOCALFUN INT32 Usage(CHAR *prog)
{
    cerr << "Usage: " << prog << " Args  -- app appargs ..." << endl;
    cerr << "Arguments:" << endl;
    cerr << KNOB_BASE::StringKnobSummary();
    cerr << endl;
    
    return -1;
}
#endif

// argc, argv are the entire command line, including pin -t <toolname> -- ...
int main(int argc, char * argv[])
{
#if defined(EMX_INIT)
    emx_pin_init(argc,argv);
    emx_init();
#else
    if( PIN_Init(argc,argv) )
    {
        return Usage(argv[0]);
    }
#endif
   PIN_InitSymbols();

#if defined(EMX_INIT)
    // This is a replay-only tool (for now)
    pinplay_engine = emx_tracing_get_pinplay_engine();
#else
    pinplay_engine = &pp_pinplay_engine;
    pinplay_engine->Activate(argc, argv, KnobPinPlayLogger, KnobPinPlayReplayer);
#endif

    pbsysstate.Activate(pinplay_engine->IsLoggerActive(), 
      pinplay_engine->IsReplayerActive());
    // Start the program, never returns
    PIN_StartProgram();

    return 0;
}
