/*BEGIN_LEGAL 
BSD License 

Copyright (c)2022 Intel Corporation. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
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
#if defined(SDE_INIT)
#  include "sde-init.H"
#endif
#include "probe_control.H"
#include "tool_macros.h"
#include "lte_perf.h"

using namespace std;
using namespace PROBE_CONTROL;

static PROBECONTROL pbcontrol;

KNOB<BOOL> KnobVerbose(KNOB_MODE_WRITEONCE, "pintool", "verbose", "0",
                  "Verbose output");

KNOB<BOOL> KnobEarlyOut(KNOB_MODE_WRITEONCE, "pintool", "exit_on_stop", "0",
                  "Exit process after 'stop' reached");

KNOB<BOOL> KnobEnableOnStart(KNOB_MODE_WRITEONCE, "pintool", "enable_on_start", "0",
                  "Enable perf counters after 'start' reached (default 0: enble perf counters at the beginning of execution.)");

KNOB<string> KnobPerfOut(KNOB_MODE_WRITEONCE, "pintool", "perfout", "perf.txt",
                  "output file");

void read_environ(); // function to be added by pinball2elf*.sh scripts
__lte_static int verbose=0;
__lte_static   uint64_t istartcount = 0;
__lte_static   uint64_t istopcount = 0;
__lte_static int counters_started=0;

// Based on /usr/include/linux/perf_event.h
__lte_static const char * hw_event_name[]= {
  "hw_cpu_cycles:", //0
  "hw_instructions:", //1
  "hw_cache_references:", //2
  "hw_cache_misses:", //3
  "hw_branch_instructions:", //4
  "hw_branch_misses:", //5
  "hw_bus_cycles:", //6
  "hw_stalled_cycles_frontend:", //7
  "hw_stalled_cycles_backend:", //8
  "hw_ref_cpu_cycles:" //9
};
#define PERF_COUNT_HW_MAX 10
#define MAXICOUNT 100000000000000

__lte_static const char * sw_event_name[]= {
  "sw_cpu_clock:", //0
  "sw_task_clock:", //1
  "sw_page_faults:", //2
  "sw_context_switches:", //3
  "sw_cpu_migrations:", //4
  "sw_page_faults_min:", //5
  "sw_page_faults_maj:", //6
  "sw_alignment_faults:", //7
  "sw_emulation_faults:", //8
  "sw_dummy:", //9
  "sw_bpf_output:", //10
};
#define PERF_COUNT_SW_MAX 11
#define PERF_TMAX 32

#define NUM_PERF_COUNT (PERF_COUNT_HW_MAX + PERF_COUNT_SW_MAX )

typedef int perfevent_t;
__lte_static int e_num=0; // number of threads
__lte_static int hw_event_enabled[PERF_COUNT_HW_MAX]={0};
__lte_static int sw_event_enabled[PERF_COUNT_SW_MAX]={0};
__lte_static perfevent_t e_hw_perf[PERF_TMAX][PERF_COUNT_HW_MAX]={0};
__lte_static perfevent_t e_sw_perf[PERF_TMAX][PERF_COUNT_SW_MAX]={0};

uint64_t rdtsc(){
    unsigned int lo,hi;
    __asm__ __volatile__ ("rdtsc" : "=a" (lo), "=d" (hi));
    return ((uint64_t)hi << 32) | lo;
}
#include "environ.c"
__lte_static char s_tid[] = "tid: ";
__lte_static char s_fd[] = "fd: ";
__lte_static char s_icount[] = "icount: ";
__lte_static char s_scount[] = "samples: ";
__lte_static char s_cycles[] = "cycles: ";
__lte_static char s_cycles_ref[] = "cycles_ref: ";
__lte_static char sep[] = "------------------------------------------------\n";

__lte_static const char* my_output_file[] = {"dummy"};
int out_fd = -1;

void init_perf()
{
   int i,j;
   if(e_num > PERF_TMAX)
   {
    lte_write(1, "Only PERF_TMAX threads supported:", lte_strlen("Only PERF_TMAX threads supported:")-1); lte_diprintfe(1, PERF_TMAX, '\n');
    e_num = PERF_TMAX;
   }

   for(i = 0; i < e_num; ++i)
   {
    for(j = 0; j <PERF_COUNT_HW_MAX  ; ++j)
    {
      e_hw_perf[i][j] = -1;
    }
    for(j = 0; j <PERF_COUNT_SW_MAX  ; ++j)
    {
      e_sw_perf[i][j] = -1;
    }
   }
}

void setup_perfcounters(uint64_t tnum, lte_td_t td)
{
   int j;
   if(verbose)lte_write(2, "PERF monitoring: outfile ", lte_strlen("PERF monitoring: outfile ")-1); 
   if(verbose)lte_write(2, my_output_file[tnum], lte_strlen(my_output_file[tnum])-1); 
   if(verbose)lte_write(2, "\n PERF_TYPE_HARDWARE:", lte_strlen("\n PERF_TYPE_HARDWARE:")-1); 
   for(j = 0; j <PERF_COUNT_HW_MAX  ; ++j)
   {
      if(hw_event_enabled[j])
      {
        e_hw_perf[tnum][j] = lte_pe_open_thread_perf_event(td, PERF_TYPE_HARDWARE, j, 0 /*isglobal*/);
        if(verbose)
        {
          lte_write(2, hw_event_name[j], lte_strlen(hw_event_name[j])-1); 
          lte_diprintfe(2, j, ' ');
        }
      }
   }
   if(verbose)lte_write(2, "\n PERF_TYPE_SOFTWARE:", lte_strlen("\n PERF_TYPE_SOFTWARE:")-1); 
   for(j = 0; j <PERF_COUNT_SW_MAX  ; ++j)
   {
      if(sw_event_enabled[j])
      {
        e_sw_perf[tnum][j] = lte_pe_open_thread_perf_event(td, PERF_TYPE_SOFTWARE, j, 0 /*isglobal*/);
        if(verbose)
        {
          lte_write(2, sw_event_name[j], lte_strlen(sw_event_name[j])-1); 
          lte_diprintfe(2, j, ' ');
        }
      }
   }
   if(verbose)lte_write(2, "\n", lte_strlen("\n")-1); 
}


void enable_perfcounters(uint64_t tnum)
{
   int my_out_fd =  out_fd;
   int j;
   for(j = 0; j <PERF_COUNT_HW_MAX  ; ++j)
   {
      if(hw_event_enabled[j])
      {
        lte_pe_enable(e_hw_perf[tnum][j]);
      }
   }
   for(j = 0; j <PERF_COUNT_SW_MAX  ; ++j)
   {
      if(sw_event_enabled[j])
      {
        lte_pe_enable(e_sw_perf[tnum][j]);
      }
   }
}

void print_perfcounters(uint64_t tnum)
{
   int my_out_fd =  out_fd;
   int j;
   uint64_t count=0;
   for(j = 0; j <PERF_COUNT_HW_MAX  ; ++j)
   {
      if(hw_event_enabled[j])
      {
        lte_pe_disable(e_hw_perf[tnum][j]);
        count = lte_pe_read(e_hw_perf[tnum][j]);
        lte_write(my_out_fd, hw_event_name[j], lte_strlen(hw_event_name[j])-1); lte_diprintfe(my_out_fd, count, ' ');
        lte_pe_enable(e_hw_perf[tnum][j]);
      }
   }
   for(j = 0; j <PERF_COUNT_SW_MAX  ; ++j)
   {
      if(sw_event_enabled[j])
      {
        lte_pe_disable(e_sw_perf[tnum][j]);
        count = lte_pe_read(e_sw_perf[tnum][j]);
        lte_write(my_out_fd, sw_event_name[j], lte_strlen(sw_event_name[j])-1); lte_diprintfe(my_out_fd, count, ' ');
        lte_pe_enable(e_sw_perf[tnum][j]);
      }
   }
   lte_write(my_out_fd, "\n", lte_strlen("\n")-1); 
}

void simendicount_callback(lte_td_t td, int signum, siginfo_t* info, void* p)
{
   pid_t tid = lte_pe_get_thread_tid(td);
   uint64_t tnum = lte_pe_get_thread_num_by_tid(tid);
   int my_out_fd = out_fd;
   lte_write(my_out_fd, "Simulation end: TSC ", lte_strlen("Simulation end: TSC ")-1); 
        lte_diprintfe(my_out_fd, rdtsc(), '\n');
    lte_write(my_out_fd, "\tSim-end-icount ", lte_strlen("\tSim-end-icount ")-1); 
    lte_diprintfe(my_out_fd, istopcount, '\n');

        if(counters_started) print_perfcounters(tnum);
        lte_fsync(my_out_fd);
        lte_write(my_out_fd, sep, lte_strlen(sep)-1);
        lte_write(my_out_fd, "Thread end: TSC ", lte_strlen("Thread end: TSC ")-1); 
        lte_diprintfe(my_out_fd, rdtsc(), '\n');
        lte_fsync(my_out_fd);
   lte_exit_group(0);
}

void warmupendicount_callback(lte_td_t td, int signum, siginfo_t* info, void* p)
{
   pid_t tid = lte_pe_get_thread_tid(td);
   uint64_t tnum = lte_pe_get_thread_num_by_tid(tid);
   int fd = lte_pe_get_thread_fd(td);
   int my_out_fd = out_fd;
   lte_write(my_out_fd, "Warmup end: TSC ", lte_strlen("Warmup end: TSC ")-1); 
        lte_diprintfe(my_out_fd, rdtsc(), '\n');
    lte_write(my_out_fd, "\tWarmup-end-icount ", lte_strlen("\tWarmup-end-icount ")-1); 
    lte_diprintfe(my_out_fd, istartcount, '\n');
        if(counters_started) print_perfcounters(tnum);
        lte_write(my_out_fd, sep, lte_strlen(sep)-1);
        lte_fsync(my_out_fd);
}

void start_counters()
{
   lte_td_t td = NULL;
   if((istartcount != 0) && (istopcount != 0))
   {
      if(verbose)lte_write(2, "Using warmup:\n", lte_strlen("Using warmup:\n")-1); 
      td = lte_pe_init_thread_sampling_icount(0, istopcount, istopcount, &simendicount_callback, istartcount, istartcount, &warmupendicount_callback);
      if(verbose)
      {
        lte_write(2, " Warmup-end icount: ", lte_strlen(" Warmup-end icount: ")-1); 
        lte_diprintfe(2, istartcount, ' ');
        lte_write(2, "End icount: ", lte_strlen("End icount: ")-1); 
        lte_diprintfe(2, istopcount, '\n');
      }
    }
    if((istartcount == 0) && (istopcount != 0))
    {
      if(verbose)lte_write(2, "NOT using warmup:\n", lte_strlen("NOT using warmup:\n")-1); 
      td = lte_pe_init_thread_sampling_icount(0, istopcount, istopcount, &simendicount_callback, 0, 0, NULL);
      if(verbose)
      {
        lte_write(2, " End icount: ", lte_strlen(" End icount: ")-1); 
        lte_diprintfe(2, istopcount, '\n');
      }
    }
    if(istopcount == 0)
    {
      if(verbose)lte_write(2, "NOT using icount events\n", lte_strlen("NOT using icount events\n")-1); 
      if(istartcount)lte_write(2, "Ignoring istart without istop\n", lte_strlen("Ignoring istart without istop\n")-1); 
      td = lte_pe_init_thread_sampling_icount(0, MAXICOUNT, MAXICOUNT, &simendicount_callback, 0, 0, NULL);
    }
   counters_started=1;
   setup_perfcounters(0, td);
   enable_perfcounters(0);
}

void perf_on_entry(uint64_t num_threads)
{
   uint64_t ptscentry = rdtsc();
   if(KnobEnableOnStart) start_counters();
   lte_write(out_fd, "ROI start: TSC ", lte_strlen("ROI start: TSC ")-1); 
   lte_diprintfe(out_fd, ptscentry, '\n');
   if(counters_started) print_perfcounters(0);
   lte_write(out_fd, sep, lte_strlen(sep)-1);
   lte_fsync(out_fd);
}

void perf_activate(uint64_t num_threads)
{
   pid_t pid = lte_getpid();

   read_environ();

   init_perf();

   static lte_sigset_t set;
   lte_sigemptyset(&set);
   lte_sigaddset(&set, SIGILL);
   lte_sigaddset(&set, SIGSEGV);
   lte_pe_init(num_threads, 0/*SIGPEOVFL*/, &set);

   const char* fname = KnobPerfOut.Value().c_str(); 
   my_output_file[0] = fname;
   out_fd = lte_open(fname, O_WRONLY | O_CREAT | O_TRUNC , S_IRUSR|S_IWUSR|S_IRGRP);
   istartcount = pbcontrol.IstartCount(); 
   istopcount = pbcontrol.IstopCount(); 
   if(!KnobEnableOnStart) start_counters();
}

void perf_on_exit()
{
   uint64_t ptscend = rdtsc();
    int my_out_fd = out_fd;
    lte_write(my_out_fd, "ROI end: TSC ", lte_strlen("ROI end: TSC ")-1); 
    lte_diprintfe(my_out_fd, ptscend, '\n');
    if(counters_started)
    {
       print_perfcounters(0);
    }
    else
    {
      lte_write(my_out_fd, "PERF counters not started ", lte_strlen("PERF counters not started ")-1); 
    }
    lte_fsync(my_out_fd);
    lte_close(my_out_fd);
}

VOID MyProbeHandler(PROBE_EVENT_TYPE pe)
{
  cerr << "MyHandler called: ";
  switch(pe)
      {
        case PROBE_EVENT_START:
        {
          cerr <<  "start";
          perf_on_entry(/*num_threads*/1);
          break;
        }
        case PROBE_EVENT_STOP:
        {
          cerr <<  "stop";
          perf_on_exit();
          if(KnobEarlyOut) exit(0);
          break;
        }
        default:
        {
          cerr <<  "INVALID";
        }
      }
  cerr << endl << flush;
  return;
}

INT32 Usage()
{
    cerr << KNOB_BASE::StringKnobSummary() << endl;

    return -1;
}
// argc, argv are the entire command line, including pin -t <toolname> -- ...
int main(int argc, char * argv[])
{
#if defined(SDE_INIT)
    sde_pin_init(argc,argv);
    sde_init();
#else
    if( PIN_Init(argc,argv) )
    {
        return Usage();
    }
#endif
    PIN_InitSymbols();

    verbose=KnobVerbose.Value();

    if (!pbcontrol.Activate())
    {
      cerr << "WARNING: Probe control not activated." << endl;
    }
    pbcontrol.RegisterHandler(MyProbeHandler);

    perf_activate(1);
    // Start the program, never returns
    PIN_StartProgramProbed();

    return 0;
}
