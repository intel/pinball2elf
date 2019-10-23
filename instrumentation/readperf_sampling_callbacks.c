/*BEGIN_LEGAL 
BSD License 

Copyright (c) 2016-2019 Intel Corporation. All rights reserved.
 
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
#include "lte_perf.h"

#ifndef _GNU_SOURCE
# define _GNU_SOURCE
#endif
#include <unistd.h>
#include <sys/syscall.h>

typedef int perfevent_t;

__lte_static char s_start[] = "start ";
__lte_static char s_sample[] = "sample ";
__lte_static char s_exit[] = "exit ";
__lte_static char s_pid[] = "pid: ";
__lte_static char s_tid[] = "tid: ";
__lte_static char s_fd[] = "fd: ";
__lte_static char s_icount[] = "icount: ";
__lte_static char s_scount[] = "samples: ";
__lte_static char s_cycles[] = "cycles: ";
__lte_static char s_cycles_ref[] = "cycles_ref: ";
__lte_static char s_replay[] = "Replaying system calls...\n ";

FILEDECL

__lte_static uint64_t e_num = 0;
__lte_static perfevent_t* e = NULL;
__lte_static perfevent_t* e_cycles = NULL;
__lte_static perfevent_t* e_cycles_ref = NULL;

void callback(lte_td_t td, int signum, siginfo_t* info, void* p)
{
   pid_t tid = lte_pe_get_thread_tid(td);
   uint64_t tnum = lte_pe_get_thread_num_by_tid(tid);
   int fd = lte_pe_get_thread_fd(td);
   int my_out_fd = out_fd[tnum];
      // read icounter
      uint64_t icount = lte_pe_read_thread_icount(td);

      if(icount > wicount_arr[tnum])
      {
        // read cycles
        lte_pe_disable(e_cycles[tnum]);
        lte_pe_disable(e_cycles_ref[tnum]);
        uint64_t cycles = lte_pe_read(e_cycles[tnum]);
        uint64_t cycles_ref = lte_pe_read(e_cycles_ref[tnum]);
        lte_write(my_out_fd, s_icount, sizeof(s_icount)-1); lte_diprintfe(my_out_fd, icount, ' ');
        lte_write(my_out_fd, s_cycles, sizeof(s_cycles)-1); lte_diprintfe(my_out_fd, cycles, ' ');
        lte_write(my_out_fd, s_cycles_ref, sizeof(s_cycles_ref)-1); lte_diprintfe(my_out_fd, cycles_ref, ' ');
        lte_write(my_out_fd, s_scount, sizeof(s_scount)-1); lte_diprintf(my_out_fd, lte_pe_get_thread_samples(td));
        lte_fsync(my_out_fd);
        lte_pe_enable(e_cycles[tnum]);
        lte_pe_enable(e_cycles_ref[tnum]);
      }
}

lte_td_t elfie_on_thread_start(uint64_t tnum, void* context, uint64_t icount)
{
   pid_t tid = lte_gettid();

   uint64_t my_period = 1000000;
   lte_td_t td = lte_pe_init_thread_sampling(tnum, my_period, icount, &callback);
   if(td && e)
   {
      // open other events, instruction counter of this thread will be group leader
      e_cycles[tnum] = lte_pe_open_thread_perf_event(td, PERF_TYPE_HARDWARE, PERF_COUNT_HW_CPU_CYCLES, 0 /*isglobal*/);
      e_cycles_ref[tnum] = lte_pe_open_thread_perf_event(td, PERF_TYPE_HARDWARE, PERF_COUNT_HW_REF_CPU_CYCLES, 0 /*isglobal*/);
   }
   char* fname = my_output_file[tnum];
   out_fd[tnum] = lte_open(fname, O_WRONLY | O_CREAT | O_TRUNC , S_IRUSR|S_IWUSR|S_IRGRP);
   return lte_pe_get_thread_desc(tnum);
}

void elfie_on_start(uint64_t num_threads, void* context)
{
   pid_t pid = lte_getpid();

   static lte_sigset_t set;
   lte_sigemptyset(&set);
   lte_sigaddset(&set, SIGILL);
   lte_sigaddset(&set, SIGSEGV);
   lte_pe_init(num_threads, 0/*SIGPEOVFL*/, &set);

   e = (perfevent_t*)lte_alloc(num_threads * 2 * sizeof(perfevent_t));
   if(e)
   {
      e_num = num_threads;
      e_cycles = e;
      e_cycles_ref = e + e_num;

      int i;
      for(i = 0; i < e_num; ++i)
         e_cycles[i] = e_cycles_ref[i] = -1;
   }
  // do_replay_syscalls definition to be added by pinball2elf*.sh script 
   if (do_replay_syscalls) replay_syscalls();
}

void elfie_on_exit()
{
   pid_t pid = lte_getpid();

   int i;
   for(i = 0; i < lte_pe_get_num_threads(); ++i)
   {
      // read icounter
      lte_td_t td = lte_pe_get_thread_desc(i);
      uint64_t icount = lte_pe_read_thread_icount(td);

      // read cycles
      lte_pe_disable(e_cycles[i]);
      lte_pe_disable(e_cycles_ref[i]);
      uint64_t cycles = lte_pe_read(e_cycles[i]);
      uint64_t cycles_ref = lte_pe_read(e_cycles_ref[i]);
      if (i > FILECOUNT) continue;

      int my_out_fd = out_fd[i];
      lte_write(my_out_fd, s_tid, sizeof(s_tid)-1); lte_diprintfe(my_out_fd, lte_pe_get_thread_tid(td), ' ');
      lte_write(my_out_fd, s_icount, sizeof(s_icount)-1); lte_diprintfe(my_out_fd, icount, ' ');
      lte_write(my_out_fd, s_cycles, sizeof(s_cycles)-1); lte_diprintfe(my_out_fd, cycles, ' ');
      lte_write(my_out_fd, s_cycles_ref, sizeof(s_cycles_ref)-1); lte_diprintfe(my_out_fd, cycles_ref, ' ');
      lte_write(my_out_fd, s_scount, sizeof(s_scount)-1); lte_diprintf(my_out_fd, lte_pe_get_thread_samples(td));
      lte_fsync(my_out_fd);
      lte_close(my_out_fd);
   }
}
// replay_syscalls() to be added by pinball2elf*.sh script 
