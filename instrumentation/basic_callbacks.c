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

void preopen_files(); // function to be added by pinball2elf*.sh scripts
void set_heap(); // function to be added by pinball2elf*.sh scripts
void read_environ(); // function to be added by pinball2elf*.sh scripts
__lte_static int core_base=0;
__lte_static int verbose=0;
__lte_static int use_pccount=0; // not used for 'basic'
__lte_static int use_warmup=0; // not used for 'basic'
__lte_static int hw_event_enabled[PERF_COUNT_HW_MAX]={0}; // not used for 'basic'
__lte_static int sw_event_enabled[PERF_COUNT_SW_MAX]={0}; // not used for 'basic'

void elfie_on_start(uint64_t num_threads, void* context)
{
   pid_t pid = lte_getpid();
   read_environ();
   lte_write(1, "core_base: ", sizeof("core_base: ")-1); lte_diprintfe(1, core_base, '\n');
   lte_write(1, s_pid, sizeof(s_pid)-1); lte_diprintfe(1, pid, '\n');
   lte_fsync(1);
  lte_syscall(__NR_write, 2, (uint64_t)strp, sizeof(strp)-1, 0, 0, 0); 
  lte_fsync(2);
  lte_diprintfe(1, num_threads, '\n');

  // preopen_files()  and set_heap() definitions to be added by pinball2elf*.sh script 
   preopen_files();
   set_heap();
  lte_fsync(1);
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
