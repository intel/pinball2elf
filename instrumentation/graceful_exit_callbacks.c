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

__lte_static char s_pid[] = " pid: ";
__lte_static char s_tid[] = " tid: ";
__lte_static char s_replay[] = "Replaying system calls...\n ";
__lte_static char strp[] = "process_callback() [ inside ELFie] called. Num_threads: ";
__lte_static char strt[] = "thread ";


void elfie_on_start(uint64_t num_threads, void* context)
{
   pid_t pid = lte_getpid();
   lte_write(1, s_pid, sizeof(s_pid)-1); lte_diprintfe(1, pid, '\n');
   lte_fsync(1);

  lte_syscall(__NR_write, 2, (uint64_t)strp, sizeof(strp)-1, 0, 0, 0); 
  lte_fsync(2);
  lte_diprintfe(1, num_threads, '\n');
  lte_fsync(1);

   static lte_sigset_t set;
   lte_sigemptyset(&set);
   lte_sigaddset(&set, SIGILL);
   lte_sigaddset(&set, SIGSEGV);
   lte_pe_init(num_threads, 0/*SIGPEOVFL*/, &set);

  // do_replay_syscalls definition to be added by pinball2elf*.sh script 
   if (do_replay_syscalls) replay_syscalls();
   lte_fsync(1);
}

lte_td_t elfie_on_thread_start(uint64_t tnum, void* context, uint64_t icount)
{
  lte_syscall(__NR_write, 2, (uint64_t)strt, sizeof(strt)-1, 0, 0, 0); 
  lte_fsync(2);
  lte_diprintfe(1, tnum, '\n');
  lte_fsync(1);
  pid_t tid = lte_gettid();
  lte_write(1, s_tid, sizeof(s_tid)-1); lte_diprintfe(1, tid, '\n');
  lte_fsync(1);
   lte_td_t td = lte_pe_set_thread_end(tnum, icount);
   return lte_pe_get_thread_desc(tnum);
}

// replay_syscalls() to be added by pinball2elf*.sh script 
