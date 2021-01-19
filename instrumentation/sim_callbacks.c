#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/syscall.h>
#include "lte_perf.h"
#include <sys/mman.h>
#include <sched.h>
#define PERF_COUNT_SW_MAX 11
#define PERF_COUNT_HW_MAX 10

__lte_static char mlockerrmesg[] = "mlockall() failed\n";

void preopen_files(); // function to be added by pinball2elf*.sh scripts
void set_heap(); // function to be added by pinball2elf*.sh scripts
void read_environ(); // function to be added by pinball2elf*.sh scripts
__lte_static int core_base=0;
__lte_static int verbose=0;
__lte_static int use_pccount=0; // not used for 'sim'
__lte_static int use_warmup=0; // not used for 'sim'
__lte_static int hw_event_enabled[PERF_COUNT_HW_MAX]={0}; // not used for 'sim'
__lte_static int sw_event_enabled[PERF_COUNT_SW_MAX]={0}; // not used for 'sim'

void elfie_on_start(uint64_t num_threads, void* context)
{
  int retval = 0;
  read_environ();
   if(verbose)
   {
    lte_write(2, "elfie_on_start() num_threads: ", lte_strlen("elfie_on_start() num_threads: ")-1); 
    lte_diprintfe(2, num_threads, '\n');
   }
  if (core_base >= 0)
  {
      lte_syscall(__NR_write, 2, (uint64_t)"Will set affinity using  ", lte_strlen("Will set affinity using ")-1, 0, 0, 0); 
      lte_write(1, "core_base: ", lte_strlen("core_base: ")-1); lte_diprintfe(1, core_base, '\n');
      lte_write(1, "  elfie tid: 0 ", lte_strlen("  elfie tid: 0 ")-1); 
      lte_write(1, " core id: ", lte_strlen(" core id: ")-1); lte_diprintfe(1, core_base, '\n');
  }
  else
  {
    lte_syscall(__NR_write, 2, (uint64_t)"Will skip affinity setting as core_base is negative \n", lte_strlen("Will skip affinity setting as core_base is negative \n")-1, 0, 0, 0); 
  }
  lte_syscall(__NR_write, 2, (uint64_t)str, lte_strlen(str)-1, 0, 0, 0); 
  retval = lte_syscall(__NR_mlockall, MCL_CURRENT | MCL_FUTURE, 0, 0, 0, 0, 0);
  if (retval !=0 )
   lte_syscall(__NR_write, 2, (uint64_t)mlockerrmesg, lte_strlen(mlockerrmesg)-1, 0, 0, 0); 
  // preopen_files() definition to be added by pinball2elf*.sh script 
   preopen_files();
  // set_heap() definition to be added by pinball2elf*.sh script 
   set_heap();
  return;
}

__lte_static char errmesg[] = "sched_setaffinity() failed\n";
__lte_static cpu_set_t my_set;        
lte_td_t elfie_on_thread_start(uint64_t tnum, void* context, uint64_t icount)
{
    int retval = 0;
    int tid = lte_syscall(__NR_gettid, 0, 0, 0, 0, 0, 0); // OS assigned tid 
   if(verbose)
   {
    lte_write(2, "elfie_on_thread_start() elfie_tid: ", lte_strlen("elfie_on_thread_start() elfie_tid: ")-1); 
    lte_diprintfe(2, tnum, ' ');
    lte_write(2, "icount: ", lte_strlen("icount: ")-1); 
    lte_diprintfe(2, icount, '\n');
   }
    if (core_base >= 0)
    {
      CPU_ZERO(&my_set);      
      CPU_SET((int)core_base+tnum, &my_set);   // 'id' ranges from 0... 
      retval = lte_syscall(SYS_sched_setaffinity,tid, sizeof(cpu_set_t), (uint64_t)(&my_set), 0, 0, 0); 
      if (retval !=0 )
      {
        lte_syscall(__NR_write, 2, (uint64_t)errmesg, lte_strlen(errmesg)-1, 0, 0, 0); 
      }
   }
   return lte_pe_get_thread_desc(tnum);
}
void __stack_chk_fail() {}
// preopen_files() to be added by pinball2elf*.sh script
// set_heap() to be added by pinball2elf*.sh script
