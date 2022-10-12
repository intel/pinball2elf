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

KNOB<BOOL> KnobEnableOnStart(KNOB_MODE_WRITEONCE, "pintool", "enable_on_start", "0",
                  "Enable perf counters after 'start' reached (default 0: enble perf counters at the beginning of execution.)");

KNOB<string> KnobPerfOut(KNOB_MODE_WRITEONCE, "pintool", "perfout", "perf.txt",
                  "output file");

void read_environ(); // function to be added by pinball2elf*.sh scripts
__lte_static int verbose=0;
__lte_static   uint64_t istartcount = 0;
__lte_static   uint64_t istopcount = 0;
__lte_static   uint64_t ideltacount = 0;
__lte_static   uint64_t pcstartcount = 0;
__lte_static   uint64_t pcstopcount = 0;
__lte_static   uint64_t pcdeltacount = 0;
__lte_static   uint64_t pcstartvalue = 0;
__lte_static   uint64_t pcstopvalue = 0;
__lte_static   uint64_t pcdeltavalue = 0;
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
__lte_static perfevent_t e_hw_idelta_perf;
__lte_static perfevent_t e_hw_pcdelta_perf;

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



void disable_perfcounters(uint64_t tnum)
{
   int my_out_fd =  out_fd;
   int j;
   for(j = 0; j <PERF_COUNT_HW_MAX  ; ++j)
   {
      if(hw_event_enabled[j])
      {
        lte_pe_disable(e_hw_perf[tnum][j]);
      }
   }
   for(j = 0; j <PERF_COUNT_SW_MAX  ; ++j)
   {
      if(sw_event_enabled[j])
      {
        lte_pe_disable(e_sw_perf[tnum][j]);
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
    if(istopcount)
    {
      lte_write(my_out_fd, "\tSim-end-icount (input)", lte_strlen("\tSim-end-icount (input)")-1); 
      lte_diprintfe(my_out_fd, istopcount, '\n');
    }
    if(ideltacount)
    {
      lte_write(my_out_fd, "\tSim-end-deltaicount (input)", lte_strlen("\tSim-end-deltaicount (input)")-1); 
      lte_diprintfe(my_out_fd, ideltacount, '\n');
    }

        if(counters_started) print_perfcounters(tnum);
        lte_fsync(my_out_fd);
        lte_write(my_out_fd, sep, lte_strlen(sep)-1);
        lte_write(my_out_fd, "Thread end: TSC ", lte_strlen("Thread end: TSC ")-1); 
        lte_diprintfe(my_out_fd, rdtsc(), '\n');
        lte_fsync(my_out_fd);
   // Why are we exiting here? Without the exit, process becomes a zombie
   // libperf will otherwise do an lte_exit() to support graceful exit
   // libperf  supports ELFie as well where an extra monitor thread exists
   //  so  using lte_exit_group() in libperfle may not be safe.
   //  so best to do lte_exit_group() here
   cerr <<  "Exiting on performance counter stop event by design" << endl; 
   lte_exit_group(0);
}


void simendpccount_callback(lte_td_t td, int signum, siginfo_t* info, void* p)
{
   pid_t tid = lte_pe_get_thread_tid(td);
   uint64_t tnum = lte_pe_get_thread_num_by_tid(tid);
   int my_out_fd = out_fd;
   lte_write(my_out_fd, "Simulation end: TSC ", lte_strlen("Simulation end: TSC ")-1); 
        lte_diprintfe(my_out_fd, rdtsc(), '\n');
    if(pcstopcount)
    {
      lte_write(my_out_fd, "\tSim-end-pcvalue (input)", lte_strlen("\tSim-end-pcvalue (input)")-1); 
      lte_xiprintfe(my_out_fd, pcstopvalue, '\n');
      lte_write(my_out_fd, "\tSim-end-pccount (input)", lte_strlen("\tSim-end-pccount (input)")-1); 
      lte_diprintfe(my_out_fd, pcstopcount, '\n');
    }
    if(pcdeltacount)
    {
      lte_write(my_out_fd, "\tSim-end-deltapcvalue (input)", lte_strlen("\tSim-end-deltapcvalue (input)")-1); 
      lte_xiprintfe(my_out_fd, pcdeltavalue, '\n');
      lte_write(my_out_fd, "\tSim-end-deltapccount (input)", lte_strlen("\tSim-end-deltapccount (input)")-1); 
      lte_diprintfe(my_out_fd, pcdeltacount, '\n');
    }

        if(counters_started) print_perfcounters(tnum);
        lte_fsync(my_out_fd);
        lte_write(my_out_fd, sep, lte_strlen(sep)-1);
        lte_write(my_out_fd, "Thread end: TSC ", lte_strlen("Thread end: TSC ")-1); 
        lte_diprintfe(my_out_fd, rdtsc(), '\n');
        lte_fsync(my_out_fd);
   // Why are we exiting here? Without the exit, process becomes a zombie
   // libperf will otherwise do an lte_exit() to support graceful exit
   // libperf  supports ELFie as well where an extra monitor thread exists
   //  so  using lte_exit_group() in libperfle may not be safe.
   //  so best to do lte_exit_group() here
   cerr <<  "Exiting on performance counter stop event by design" << endl; 
   lte_exit_group(0);
}

void start_idelta_counter()
{
   if (e_hw_idelta_perf > 0 ) return; // already called before
   if((ideltacount != 0) && (pcdeltacount != 0))
   {
        cerr <<  "Only one of 'istopdelta' and 'pcstopdelta' can be specified" << endl;
        exit(1);
   }
   lte_td_t td = NULL;
    if(ideltacount != 0)
    {
      if(verbose)lte_write(2, "starting idelta counter:\n", lte_strlen("starting idelta counter:\n")-1); 
      td = lte_pe_init_thread_sampling_idelta(0, ideltacount, ideltacount, &simendicount_callback);
      e_hw_idelta_perf = lte_pe_get_thread_fd(td);
      lte_pe_disable(e_hw_idelta_perf);
      if(verbose)
      {
        lte_write(2, " Delta icount: ", lte_strlen(" Delta icount: ")-1); 
        lte_diprintfe(2, ideltacount, '\n');
      }
    }
}

void start_pcdelta_counter()
{
   if (e_hw_pcdelta_perf > 0 ) return; // already called before
   if((ideltacount != 0) && (pcdeltacount != 0))
   {
        cerr <<  "Only one of 'istopdelta' and 'pcstopdelta' can be specified" << endl;
        exit(1);
   }
   lte_td_t td = NULL;
    if(pcdeltacount != 0)
    {
      if(verbose)lte_write(2, "starting pcdelta counter:\n", lte_strlen("starting pcdelta counter:\n")-1); 
      td = lte_pe_init_thread_sampling_pcdelta(0, pcdeltavalue, pcdeltacount, pcdeltacount, &simendpccount_callback);
      e_hw_pcdelta_perf = lte_pe_get_thread_fd(td);
      lte_pe_disable(e_hw_idelta_perf);
      if(verbose)
      {
        lte_write(2, " Delta pcvalue: ", lte_strlen(" Delta pcvalue: ")-1); 
        lte_xiprintfe(2, pcdeltavalue, '\n');
        lte_write(2, " Delta pccount: ", lte_strlen(" Delta pccount: ")-1); 
        lte_diprintfe(2, pcdeltacount, '\n');
      }
    }
}

void warmupendicount_callback(lte_td_t td, int signum, siginfo_t* info, void* p)
{
   pid_t tid = lte_pe_get_thread_tid(td);
   uint64_t tnum = lte_pe_get_thread_num_by_tid(tid);
   int fd = lte_pe_get_thread_fd(td);
   int my_out_fd = out_fd;
   lte_write(my_out_fd, "Warmup end: TSC ", lte_strlen("Warmup end: TSC ")-1); 
        lte_diprintfe(my_out_fd, rdtsc(), '\n');
    lte_write(my_out_fd, "\tWarmup-end-icount (input)", lte_strlen("\tWarmup-end-icount (input)")-1); 
    lte_diprintfe(my_out_fd, istartcount, '\n');
        if(counters_started) print_perfcounters(tnum);
        lte_write(my_out_fd, sep, lte_strlen(sep)-1);
        lte_fsync(my_out_fd);
     if(ideltacount) 
     {
        cerr <<  ": enabling ideltastop counter: " << ideltacount << endl;
        lte_pe_enable(e_hw_idelta_perf);
     }
}

void warmupendpccount_callback(lte_td_t td, int signum, siginfo_t* info, void* p)
{
   pid_t tid = lte_pe_get_thread_tid(td);
   uint64_t tnum = lte_pe_get_thread_num_by_tid(tid);
   int fd = lte_pe_get_thread_fd(td);
   int my_out_fd = out_fd;
   lte_write(my_out_fd, "Warmup end: TSC ", lte_strlen("Warmup end: TSC ")-1); 
        lte_diprintfe(my_out_fd, rdtsc(), '\n');
    lte_write(my_out_fd, "\tWarmup-end-pcvalue (input)", lte_strlen("\tWarmup-end-pcvalue (input)")-1); 
    lte_xiprintfe(my_out_fd, pcstartvalue, '\n');
    lte_write(my_out_fd, "\tWarmup-end-pccount (input)", lte_strlen("\tWarmup-end-pccount (input)")-1); 
    lte_diprintfe(my_out_fd, pcstartcount, '\n');
        if(counters_started) print_perfcounters(tnum);
        lte_write(my_out_fd, sep, lte_strlen(sep)-1);
        lte_fsync(my_out_fd);
     if(ideltacount) 
     {
        cerr <<  ": enabling ideltastop counter: " << ideltacount << endl;
        lte_pe_enable(e_hw_idelta_perf);
     }
     if(pcdeltacount) 
     {
        cerr <<  ": enabling pcdeltastop pc: 0x" << hex << pcdeltavalue << endl;
        cerr <<  ":    pcdeltastop counter: " << dec << pcdeltacount << endl;
        lte_pe_enable(e_hw_pcdelta_perf);
     }
}

void check_counters()
{
   if((pcstartcount != 0) || (pcstopcount != 0) || (pcdeltacount != 0))
   {
    if((istartcount != 0) || (istopcount != 0))
    {
        cerr <<  "Only one of 'PC+count' and 'ICount' events can be specified" << endl;
        exit(1);
    }
   }
}

void start_icounters()
{
   lte_td_t td = NULL;

   check_counters();
   if((istopcount != 0) && (ideltacount != 0))
   {
        cerr <<  "Only one of 'istop' and 'istopdelta' can be specified" << endl;
        exit(1);
   }
   if((istartcount != 0) && ((istopcount != 0) || (ideltacount != 0)))
   {
      cerr <<  "'istop' " << istopcount << endl;
      if(verbose)lte_write(2, "Using warmup:\n", lte_strlen("Using warmup:\n")-1); 
      if(istopcount)
        td = lte_pe_init_thread_sampling_icount(0, istopcount, istopcount, &simendicount_callback, istartcount, istartcount, &warmupendicount_callback);
      else
        td = lte_pe_init_thread_sampling_icount(0, MAXICOUNT, MAXICOUNT, &simendicount_callback, istartcount, istartcount, &warmupendicount_callback);
      if(verbose)
      {
        lte_write(2, " Warmup-end icount: ", lte_strlen(" Warmup-end icount: ")-1); 
        lte_diprintfe(2, istartcount, ' ');
        if(istopcount)
        {
          lte_write(2, "Simulation end icount: ", lte_strlen("Simulation end icount: ")-1); 
          lte_diprintfe(2, istopcount, '\n');
        }
        else
        {
          lte_write(2, "Simulation end delta-icount: ", lte_strlen("Simulation end delta-icount: ")-1); 
          lte_diprintfe(2, ideltacount, '\n');
        }
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
    if((istartcount == 0) && (ideltacount != 0))
    {
      if(verbose)lte_write(2, "NOT using warmup or sim\n", lte_strlen("NOT using warmup or sim\n")-1); 
      td = lte_pe_init_thread_sampling_icount(0, MAXICOUNT, MAXICOUNT, &simendicount_callback, 0, 0, NULL);
    }
    if((istopcount == 0) && (ideltacount == 0))
    {
      if(verbose)lte_write(2, "NOT using icount events\n", lte_strlen("NOT using icount events\n")-1); 
      if(istartcount)lte_write(2, "Ignoring istart without istop/ideltastop\n", lte_strlen("Ignoring istart without istop/ideltastop\n")-1); 
      td = lte_pe_init_thread_sampling_icount(0, MAXICOUNT, MAXICOUNT, &simendicount_callback, 0, 0, NULL);
    }
   setup_perfcounters(0, td);
   enable_perfcounters(0);
   if(ideltacount) start_idelta_counter();
   counters_started=1;
}

void start_pccounters()
{
   lte_td_t td = NULL;
   check_counters();
   // Always use an icounter group leader
   td = lte_pe_init_thread_sampling_icount(0, MAXICOUNT, MAXICOUNT, &simendicount_callback, 0, 0, NULL);
   if((pcstopcount != 0) && (pcdeltacount != 0))
   {
        cerr <<  "Only one of 'pcstop' and 'pcstopdelta' can be specified" << endl;
        exit(1);
   }
   if((pcstartcount != 0) && ((pcstopcount != 0) || (pcdeltacount != 0) || (ideltacount != 0)))
   {
      cerr <<  "'pcstop:0x" << hex << pcstopvalue << ":" << dec << pcstopcount << endl;
      if(verbose)lte_write(2, "Using warmup:\n", lte_strlen("Using warmup:\n")-1); 
      if(pcstopcount)
         lte_pe_init_thread_sampling_bp(0, pcstopvalue, pcstopcount, pcstopcount, &simendpccount_callback, pcstartvalue, pcstartcount, pcstartcount, &warmupendpccount_callback);
      else  // either pcdeltacount or ideltacount is non-zero 
         lte_pe_init_thread_sampling_bp(0, 0, 0, 0, NULL, pcstartvalue, pcstartcount, pcstartcount, &warmupendpccount_callback);
      if(verbose)
      {
        lte_write(2, " Warmup-end pcvalue: ", lte_strlen(" Warmup-end pcvalue: ")-1); 
        lte_xiprintfe(2, pcstartvalue, ' ');
        lte_write(2, " Warmup-end pccount: ", lte_strlen(" Warmup-end pccount: ")-1); 
        lte_diprintfe(2, pcstartcount, ' ');
        if(pcstopcount)
        {
          lte_write(2, "Simulation end pcvalue: ", lte_strlen("Simulation end pcvalue: ")-1); 
          lte_xiprintfe(2, pcstopvalue, '\n');
          lte_write(2, "Simulation end pccount: ", lte_strlen("Simulation end pccount: ")-1); 
          lte_diprintfe(2, pcstopcount, '\n');
        }
        else
        {
          lte_write(2, "Simulation end delta-pcvalue: ", lte_strlen("Simulation end delta-pcvalue: ")-1); 
          lte_xiprintfe(2, pcdeltavalue, '\n');
          lte_write(2, "Simulation end delta-pccount: ", lte_strlen("Simulation end delta-pccount: ")-1); 
          lte_diprintfe(2, pcdeltacount, '\n');
        }
      }
    }
    if((pcstartcount == 0) && (pcstopcount != 0))
    {
      if(verbose)lte_write(2, "NOT using warmup:\n", lte_strlen("NOT using warmup:\n")-1); 
      lte_pe_init_thread_sampling_bp(0, pcstopvalue, pcstopcount, pcstopcount, &simendpccount_callback,0, 0, 0, NULL);
      if(verbose)
      {
        lte_write(2, " End pcvalue: ", lte_strlen(" End pcvalue: ")-1); 
        lte_xiprintfe(2, pcstopvalue, '\n');
        lte_write(2, " End pccount: ", lte_strlen(" End pccount: ")-1); 
        lte_diprintfe(2, pcstopcount, '\n');
      }
    }
    if((pcstartcount == 0) && (pcdeltacount != 0))
    {
      if(verbose)lte_write(2, "NOT using warmup or sim\n", lte_strlen("NOT using warmup or sim\n")-1); 
    }
    if((pcstopcount == 0) && (pcdeltacount == 0) && (ideltacount == 0))
    {
      if(verbose)lte_write(2, "NOT using pccount events\n", lte_strlen("NOT using pccount events\n")-1); 
    }
   setup_perfcounters(0, td);
   enable_perfcounters(0);
   if(pcdeltacount) start_pcdelta_counter();
   if(ideltacount) start_idelta_counter(); // We allow idelta with PCcount
   counters_started=1;
}


void perf_on_entry(uint64_t num_threads)
{
   uint64_t ptscentry = rdtsc();
   if(KnobEnableOnStart) start_pccounters();
   if(KnobEnableOnStart) start_icounters();
   lte_write(out_fd, "RTN ROI start: TSC ", lte_strlen("RTN ROI start: TSC ")-1); 
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
   ideltacount = pbcontrol.IdeltaCount(); 
   pcstartcount = pbcontrol.PCstartCount(); 
   pcstopcount = pbcontrol.PCstopCount(); 
   pcdeltacount = pbcontrol.PCdeltastopCount(); 
   pcstartvalue = pbcontrol.PCstartValue(); 
   pcstopvalue = pbcontrol.PCstopValue(); 
   pcdeltavalue = pbcontrol.PCdeltastopValue(); 
   e_hw_idelta_perf = -1;
   e_hw_pcdelta_perf = -1;
   if(!KnobEnableOnStart) start_pccounters();
   if(!KnobEnableOnStart) start_icounters();
}

void perf_on_exit()
{
   uint64_t ptscend = rdtsc();
    int my_out_fd = out_fd;
    lte_write(my_out_fd, "RTN ROI end: TSC ", lte_strlen("RTN ROI end: TSC ")-1); 
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

VOID MyEventHandler(PROBE_EVENT_TYPE pe)
{
  cerr << "MyEventHandler called: ";
  switch(pe)
      {
        case PROBE_EVENT_RSTART:
        {
          cerr <<  "RTNstart";
          perf_on_entry(/*num_threads*/1);
          if(ideltacount) 
          {
              cerr <<  ": enabling ideltastop counter: " << ideltacount << endl;
              lte_pe_enable(e_hw_idelta_perf);
          }
          break;
        }
        case PROBE_EVENT_RSTOP:
        {
          cerr <<  "RTNstop";
          perf_on_exit();
          cerr <<  ": Exiting on performance counter stop event by design" << endl; 
          exit(0);
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
    pbcontrol.RegisterHandler(MyEventHandler);

    perf_activate(1);
    // Start the program, never returns
    PIN_StartProgramProbed();

    return 0;
}
