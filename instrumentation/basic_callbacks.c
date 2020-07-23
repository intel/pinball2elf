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
__lte_static char s_preopen[] = "Pre-opening files...\n ";

void preopen_files(); // function to be added by pinball2elf*.sh scripts
void set_heap(); // function to be added by pinball2elf*.sh scripts

void elfie_quit()
{
   lte_write(1, "ELFIE quit called\n", sizeof("ELFIE quit called\n")-1);
   lte_exit_group(0);
}

void elfie_on_start(uint64_t num_threads, void* context)
{
   pid_t pid = lte_getpid();
   lte_write(1, s_pid, sizeof(s_pid)-1); lte_diprintfe(1, pid, '\n');
   lte_fsync(1);
  lte_syscall(__NR_write, 2, (uint64_t)strp, sizeof(strp)-1, 0, 0, 0); 
  lte_fsync(2);
  lte_diprintfe(1, num_threads, '\n');
  lte_fsync(1);
  // preopen_files()  and set_heap() definitions to be added by pinball2elf*.sh script 
   preopen_files();
   set_heap();
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

// preopen_files() to be added by pinball2elf*.sh script 
// set_heap() to be added by pinball2elf*.sh script 
