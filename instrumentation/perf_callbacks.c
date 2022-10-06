#include "lte_perf.h"

#ifndef _GNU_SOURCE
# define _GNU_SOURCE
#endif
#include <unistd.h>
#include <sys/syscall.h>
#include <sched.h>


#define PERF_TMAX 32
#define MAXICOUNT 100000000000000
typedef int perfevent_t;
__lte_static char s_pid[] = " pid: ";
__lte_static char s_tid[] = " tid: ";
__lte_static char s_rip[] = " rip: ";
__lte_static char strp[] = "on_start:\n num_threads: ";
__lte_static char strb[] = "on_exit:\n";
__lte_static char sep[] = "------------------------------------------------\n";
__lte_static char s_cycles[] = "cycles: ";
__lte_static char s_cycles_ref[] = "cycles_ref: ";
__lte_static char s_instructions[] = "instructions: ";

FILEDECL


void preopen_files(); // function to be added by pinball2elf*.sh scripts
void set_heap(); // function to be added by pinball2elf*.sh scripts
void read_environ(); // function to be added by pinball2elf*.sh scripts
__lte_static int core_base=-1;
__lte_static int verbose=0;
__lte_static int use_pccount=0;
__lte_static int use_warmup=0; 
// Based on /usr/include/linux/perf_event.h
__lte_static char * hw_event_name[]= {
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

__lte_static char * sw_event_name[]= {
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

#define NUM_PERF_COUNT (PERF_COUNT_HW_MAX + PERF_COUNT_SW_MAX )

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

void print_perfcounters(uint64_t tnum)
{
   int my_out_fd = out_fd[tnum];
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

void simendpccount_callback(lte_td_t td, int signum, siginfo_t* info, void* p)
{
   pid_t tid = lte_pe_get_thread_tid(td);
   uint64_t tnum = lte_pe_get_thread_num_by_tid(tid);
   int my_out_fd = out_fd[tnum];
   lte_write(my_out_fd, "Simulation end: TSC ", lte_strlen("Simulation end: TSC ")-1); 
        lte_diprintfe(my_out_fd, rdtsc(), '\n');
    lte_write(my_out_fd, "\tSim-end-PC:count 0x", lte_strlen("\tSim-end-PC:count 0x")-1); 
    lte_xiprintfe(my_out_fd, pcaddr_arr[tnum], ':');lte_diprintfe(my_out_fd, pccount_arr[tnum], '\n');

        print_perfcounters(tnum);
        lte_fsync(my_out_fd);
        lte_write(my_out_fd, sep, lte_strlen(sep)-1);
        lte_write(my_out_fd, "Thread end: TSC ", lte_strlen("Thread end: TSC ")-1); 
        lte_diprintfe(my_out_fd, rdtsc(), '\n');
        lte_fsync(my_out_fd);
}


void warmupendpccount_callback(lte_td_t td, int signum, siginfo_t* info, void* p)
{
   pid_t tid = lte_pe_get_thread_tid(td);
   uint64_t tnum = lte_pe_get_thread_num_by_tid(tid);
   int fd = lte_pe_get_thread_fd(td);
   int my_out_fd = out_fd[tnum];
   lte_write(my_out_fd, "Warmup end: TSC ", lte_strlen("Warmup end: TSC ")-1); 
        lte_diprintfe(my_out_fd, rdtsc(), '\n');
    lte_write(my_out_fd, "\tWarmup-end-PC:count 0x", lte_strlen("\tWarmup-end-PC:count 0x")-1); 
    lte_xiprintfe(my_out_fd, wpcaddr_arr[tnum], ':');lte_diprintfe(my_out_fd, wpccount_arr[tnum], '\n');
    print_perfcounters(tnum);
    lte_write(my_out_fd, sep, lte_strlen(sep)-1);
    lte_fsync(my_out_fd);
}

void simendicount_callback(lte_td_t td, int signum, siginfo_t* info, void* p)
{
   pid_t tid = lte_pe_get_thread_tid(td);
   uint64_t tnum = lte_pe_get_thread_num_by_tid(tid);
   int my_out_fd = out_fd[tnum];
   lte_write(my_out_fd, "Simulation end: TSC ", lte_strlen("Simulation end: TSC ")-1); 
        lte_diprintfe(my_out_fd, rdtsc(), '\n');
    lte_write(my_out_fd, "\tSim-end-icount ", lte_strlen("\tSim-end-icount ")-1); 
    lte_diprintfe(my_out_fd, icount_arr[tnum], '\n');

        print_perfcounters(tnum);
        lte_fsync(my_out_fd);
        lte_write(my_out_fd, sep, lte_strlen(sep)-1);
        lte_write(my_out_fd, "Thread end: TSC ", lte_strlen("Thread end: TSC ")-1); 
        lte_diprintfe(my_out_fd, rdtsc(), '\n');
        lte_fsync(my_out_fd);
}

void warmupendicount_callback(lte_td_t td, int signum, siginfo_t* info, void* p)
{
   pid_t tid = lte_pe_get_thread_tid(td);
   uint64_t tnum = lte_pe_get_thread_num_by_tid(tid);
   int fd = lte_pe_get_thread_fd(td);
   int my_out_fd = out_fd[tnum];
   lte_write(my_out_fd, "Warmup end: TSC ", lte_strlen("Warmup end: TSC ")-1); 
        lte_diprintfe(my_out_fd, rdtsc(), '\n');
    lte_write(my_out_fd, "\tWarmup-end-icount ", lte_strlen("\tWarmup-end-icount ")-1); 
    lte_diprintfe(my_out_fd, wicount_arr[tnum], '\n');
        print_perfcounters(tnum);
        lte_write(my_out_fd, sep, lte_strlen(sep)-1);
        lte_fsync(my_out_fd);
}

__lte_static char errmesg[] = "sched_setaffinity() failed\n";
__lte_static cpu_set_t my_set;        
lte_td_t elfie_on_thread_start(uint64_t tnum, void* context, uint64_t icount)
{
   pid_t tid = lte_gettid();
    int retval = 0;
   lte_td_t td = NULL;
   if(verbose)
   {
    lte_write(2, "elfie_on_thread_start() elfie_tid: ", lte_strlen("elfie_on_thread_start() elfie_tid: ")-1); 
    lte_diprintfe(2, tnum, ' ');
    lte_write(2, "icount: ", lte_strlen("icount: ")-1); 
    lte_diprintfe(2, icount, '\n');
   }

   if(verbose)lte_write(2, "Exit condition:\n", lte_strlen("Exit condition:\n")-1); 
   if(use_pccount)
   {
    int flag = (wpccount_arr[tnum]!=0 && (use_warmup != 0));
    if( flag )
    {
      // Use an icounter group leader
      td = lte_pe_init_thread_sampling_icount(0, MAXICOUNT, MAXICOUNT, &simendicount_callback, 0, 0, NULL);
      if(verbose)lte_write(2, "Using warmup:\n", lte_strlen("Using warmup:\n")-1); 
      lte_pe_init_thread_sampling_bp(tnum, pcaddr_arr[tnum], pccount_arr[tnum], pccount_arr[tnum], &simendpccount_callback, wpcaddr_arr[tnum], wpccount_arr[tnum], wpccount_arr[tnum], &warmupendpccount_callback);
      if(verbose)
      {
        lte_write(2, " Warmup-end PC 0x", lte_strlen(" Warmup-end PC 0x")-1); 
        lte_xiprintfe(2, wpcaddr_arr[tnum], ' ');
        lte_write(2, "count: ", lte_strlen("count: ")-1); 
        lte_diprintfe(2, wpccount_arr[tnum], ' ');
        lte_write(2, " End PC 0x", lte_strlen(" End PC 0x")-1); 
        lte_xiprintfe(2, pcaddr_arr[tnum], ' ');
        lte_write(2, "count: ", lte_strlen("count: ")-1); 
        lte_diprintfe(2, pccount_arr[tnum], '\n');
      }
    }
    else
    {
      if(verbose)lte_write(2, "NOT using warmup:\n", lte_strlen("NOT using warmup:\n")-1); 
      // Use an icounter group leader
      td = lte_pe_init_thread_sampling_icount(0, MAXICOUNT, MAXICOUNT, &simendicount_callback, 0, 0, NULL);
      lte_pe_init_thread_sampling_bp(tnum, pcaddr_arr[tnum], pccount_arr[tnum], pccount_arr[tnum], &simendpccount_callback, 0, 0, 0, NULL);
      if(verbose)
      {
        lte_write(2, " End PC 0x", lte_strlen(" End PC 0x")-1); 
        lte_xiprintfe(2, pcaddr_arr[tnum], ' ');
        lte_write(2, "count: ", lte_strlen("count: ")-1); 
        lte_diprintfe(2, pccount_arr[tnum], '\n');
      }
    }
   }
   else
   {
    int flag = (wicount_arr[tnum]!=0 && (use_warmup != 0));
    if(flag)
    {
      if(verbose)lte_write(2, "Using warmup:\n", lte_strlen("Using warmup:\n")-1); 
      td = lte_pe_init_thread_sampling_icount(tnum, icount_arr[tnum], icount_arr[tnum], &simendicount_callback, wicount_arr[tnum], wicount_arr[tnum], &warmupendicount_callback);
      if(verbose)
      {
        lte_write(2, " Warmup-end icount: ", lte_strlen(" Warmup-end icount: ")-1); 
        lte_diprintfe(2, wicount_arr[tnum], ' ');
        lte_write(2, "End icount: ", lte_strlen("End icount: ")-1); 
        lte_diprintfe(2, icount_arr[tnum], '\n');
      }
    }
    else
    {
      if(verbose)lte_write(2, "NOT using warmup:\n", lte_strlen("NOT using warmup:\n")-1); 
      td = lte_pe_init_thread_sampling_icount(tnum, icount_arr[tnum], icount_arr[tnum], &simendicount_callback, 0, 0, NULL);
      if(verbose)
      {
        lte_write(2, " End icount: ", lte_strlen(" End icount: ")-1); 
        lte_diprintfe(2, icount_arr[tnum], '\n');
      }
    }
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
   setup_perfcounters(tnum, td);
   int my_out_fd = out_fd[tnum];
   lte_write(my_out_fd, "Thread start: TSC ", lte_strlen("Thread start: TSC ")-1); 
        lte_diprintfe(my_out_fd, rdtsc(), '\n');
   lte_write(my_out_fd, sep, lte_strlen(sep)-1);
   lte_fsync(my_out_fd);
   return lte_pe_get_thread_desc(tnum);
}

void elfie_on_start(uint64_t num_threads, void* context)
{
   e_num = num_threads;
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
   if(use_pccount && (pcaddr_arr[0] == 0x0))
   {
    lte_write(1, "Ignoring ELFIE_PCCOUNT=1\n", lte_strlen("Ignoring ELFIE_PCCOUNT=1\n")-1); 
    use_pccount=0;
   }

   init_perf();

   pid_t pid = lte_getpid();

   lte_write(1, sep, lte_strlen(sep)-1);
   lte_write(1, sep, lte_strlen(sep)-1);
   lte_fsync(1);
  
   static lte_sigset_t set;
   lte_sigemptyset(&set);
   lte_sigaddset(&set, SIGILL);
   lte_sigaddset(&set, SIGSEGV);
   lte_pe_init(num_threads, 0/*SIGPEOVFL*/, &set);

   uint64_t ptscstart = rdtsc();
   int i;
   for(i = 0; i < lte_pe_get_num_threads(); ++i)
   {
      if (i > FILECOUNT) continue;

      char* fname = my_output_file[i];
      out_fd[i] = lte_open(fname, O_WRONLY | O_CREAT | O_TRUNC , S_IRUSR|S_IWUSR|S_IRGRP);
      int my_out_fd = out_fd[i];
      lte_write(my_out_fd, "ROI start: TSC ", lte_strlen("ROI start: TSC ")-1); 
        lte_diprintfe(my_out_fd, ptscstart, '\n');
      lte_fsync(my_out_fd);
   }
  // preopen_files()  and set_heap() definitions to be added by pinball2elf*.sh script 
   preopen_files();
   set_heap();
}

void elfie_on_exit()
{
   uint64_t ptscend = rdtsc();
   int i,j;
   for(i = 0; i < lte_pe_get_num_threads(); ++i)
   {
    if (i > FILECOUNT) continue;
    int my_out_fd = out_fd[i];
    lte_write(my_out_fd, "ROI end: TSC ", lte_strlen("ROI end: TSC ")-1); 
    lte_diprintfe(my_out_fd, ptscend, '\n');
    print_perfcounters(i);
    lte_fsync(my_out_fd);
    lte_close(my_out_fd);
   }
}
