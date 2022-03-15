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
#if defined(SDE_INIT)
#  include "sde-init.H"
#endif


#include "pinball-sysstate.H"

#if defined(SDE_INIT)
#include "sde-pinplay-supp.H"
#endif


#include "pinplay.H"
#include "pinplay-debugger-shell.H"
PINPLAY_ENGINE *my_pinplay_engine;
static PINPLAY_ENGINE pp_pinplay_engine;

DR_DEBUGGER_SHELL::ICUSTOM_INSTRUMENTOR *
    CreatePinPlayInstrumentor(DR_DEBUGGER_SHELL::ISHELL *);
DR_DEBUGGER_SHELL::ISHELL *shell = NULL;

DR_DEBUGGER_SHELL::ICUSTOM_INSTRUMENTOR
    *CreatePinPlayInstrumentor(DR_DEBUGGER_SHELL::ISHELL *shell)
{
    return new PINPLAY_DEBUGGER_INSTRUMENTOR(shell);
}


PINBALL_SYSSTATE::SYSSTATE pbsysstate;

#if ! defined(SDE_INIT)
#define KNOB_LOG_NAME  "log"
#define KNOB_REPLAY_NAME "replay"
#define KNOB_FAMILY "pintool:pinplay-driver"

KNOB_COMMENT pinplay_driver_knob_family(KNOB_FAMILY, "PinPlay Driver Knobs");

KNOB<BOOL>KnobPinPlayReplayer(KNOB_MODE_WRITEONCE, KNOB_FAMILY,
                       KNOB_REPLAY_NAME, "0", "Replay a pinball");
KNOB<BOOL>KnobPinPlayLogger(KNOB_MODE_WRITEONCE,  KNOB_FAMILY,
                     KNOB_LOG_NAME, "0", "Create a pinball");

#endif



#if ! defined(SDE_INIT)
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
#if defined(SDE_INIT)
    sde_pin_init(argc,argv);
    sde_init();
#else
    if( PIN_Init(argc,argv) )
    {
        return Usage(argv[0]);
    }
#endif
   PIN_InitSymbols();

#if defined(SDE_INIT)
    // This is a replay-only tool (for now)
    my_pinplay_engine = sde_tracing_get_pinplay_engine();
#else
    my_pinplay_engine = &pp_pinplay_engine;
    my_pinplay_engine->Activate(argc, argv, KnobPinPlayLogger, KnobPinPlayReplayer);
#endif

#if ! defined(SDE_INIT)
    DEBUG_STATUS debugStatus = PIN_GetDebugStatus();

    if (debugStatus != DEBUG_STATUS_DISABLED)
    {
        shell = DR_DEBUGGER_SHELL::CreatePinPlayShell();
        DR_DEBUGGER_SHELL::STARTUP_ARGUMENTS args;
        if (my_pinplay_engine->IsReplayerActive())
        {
            args._customInstrumentor = CreatePinPlayInstrumentor(shell);
        }
        if (!shell->Enable(args))
            return 1;
    }
#endif

    if(pbsysstate.Activate(my_pinplay_engine) == 0)
    {
      cerr << "SYSSTATE activation failed. Returning without replay. \n";
      return 1;
    }
    
 
    // Start the program, never returns
    PIN_StartProgram();

    return 0;
}
