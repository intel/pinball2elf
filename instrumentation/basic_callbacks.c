#include <stdio.h>
#include <unistd.h>
#include <sys/syscall.h>
#include "lte_perf.h"
#include <sys/mman.h>
#include <sched.h>
__lte_static char s_pid[] = " pid: ";
__lte_static char s_tid[] = " tid: ";
__lte_static char strp[] = "process_callback() [ inside ELFie] called. Num_threads: ";
__lte_static char strt[] = "thread_callback() [ inside ELFie] called for thread ";
__lte_static char s_replay[] = "Replaying system calls...\n ";

void elfie_on_start(uint64_t num_threads, void* context)
{
   pid_t pid = lte_getpid();
   lte_write(1, s_pid, sizeof(s_pid)-1); lte_diprintfe(1, pid, '\n');
   lte_fsync(1);
  lte_syscall(__NR_write, 2, (uint64_t)strp, sizeof(strp)-1, 0, 0, 0); 
  lte_fsync(2);
  lte_diprintfe(1, num_threads, '\n');
  lte_fsync(1);
  // do_replay_syscalls definition to be added by pinball2elf*.sh script 
   if (do_replay_syscalls) replay_syscalls();
  return;
}

lte_td_t elfie_on_thread_start(uint64_t tnum, void* context, uint64_t icount)
{
  pid_t tid = lte_gettid();
  lte_write(1, s_tid, sizeof(s_tid)-1); lte_diprintfe(1, tid, '\n');
  lte_syscall(__NR_write, 2, (uint64_t)strt, sizeof(strt)-1, 0, 0, 0); 
  lte_fsync(2);
  lte_diprintfe(1, tnum, '\n');
  lte_fsync(1);
   return NULL;
}
void __stack_chk_fail() {}
