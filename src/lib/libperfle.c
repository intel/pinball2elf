/*BEGIN_LEGAL 
BSD License 

Copyright (c)2019 Intel Corporation. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
END_LEGAL */
#include "lte_perf.h"
#include "lte_lc.h"
#include <sys/mman.h>
#include <stdlib.h>
#include <string.h>

#define LIBPERFLE_SAMASK
#define LIBPERFLE_SIGRT
//#define LIBPERF_SIGRT_DEBUG

typedef struct thread_info_s {
   int fd; // must be the first
   pid_t tid;
   uint64_t icount;
   uint64_t icount_max;
   uint64_t icount_period;
   uint64_t samples;
   uint64_t stack_size;
   void* stack;
   lte_pe_cbk_t callback;
} __attribute__((packed)) thread_info_t;

// put these variables into ".data" and explicitly set them to 0
// as loader not necessarily fills .bss with zeroes
__lte_static thread_info_t* s_thread = NULL;
__lte_static uint64_t s_num_threads = 0;
__lte_static int s_blocked_signals_num = 0;
__lte_static int s_sig_overflow = SIGIO;

// following variables will be in .bss
static int s_blocked_signals[_NSIG];
#ifdef LIBPERFLE_SAMASK
static sigset_t s_sa_mask;
#endif

static __inline__ void lte_pe_error(int errcode)
{
   lte_exit(errcode);
}

static __inline__ void lte_pe_refresh(int fd)
{
   lte_ioctl(fd, PERF_EVENT_IOC_REFRESH, 1);
}

void lte_pe_disable(int fd)
{
   lte_ioctl(fd, PERF_EVENT_IOC_DISABLE, PERF_IOC_FLAG_GROUP);
}

void lte_pe_enable(int fd)
{
   lte_ioctl(fd, PERF_EVENT_IOC_ENABLE, PERF_IOC_FLAG_GROUP);
}

void lte_pe_reset(int fd)
{
   lte_ioctl(fd, PERF_EVENT_IOC_RESET, PERF_IOC_FLAG_GROUP);
}

void lte_pe_close(int fd)
{
   lte_close(fd);
}


static __inline__ int lte_pe_get_overflow_sig()
{
   return s_sig_overflow;
}

uint64_t lte_pe_get_num_threads()
{
   return s_num_threads;
}

uint64_t lte_pe_get_thread_num_by_tid(pid_t tid)
{
   if(s_thread)
   {
      thread_info_t* p = &s_thread[0];
      thread_info_t* pend = &s_thread[s_num_threads];
      for(; p != pend; ++p)
         if(p->tid == tid)
            return (p - s_thread);
   }
   return INVALID_TNUM;
}


static uint64_t lte_pe_get_thread_num_by_fd(int fd)
{
   if(s_thread)
   {
      thread_info_t* p = &s_thread[0];
      thread_info_t* pend = &s_thread[s_num_threads];
      for(; p != pend; ++p)
         if(p->fd == fd)
            return (p - s_thread);
   }
   return INVALID_TNUM;
}

lte_td_t lte_pe_get_thread_desc(uint64_t tnum)
{
   return (tnum < s_num_threads) ? &s_thread[tnum] : NULL;
}

int lte_pe_get_perf_fd(lte_td_t td)
{
   if(td)
   {
      thread_info_t* tinfo = (thread_info_t*)td;
      return tinfo->fd;
   }
   return -1;
}

uint64_t lte_pe_get_thread_num(lte_td_t td)
{
   if(td && s_thread)
   {
      uint64_t tnum = ((thread_info_t*)td) - s_thread;
      if(tnum < s_num_threads)
         return tnum;
   }
   return INVALID_TNUM;
}

uint64_t lte_pe_get_thread_samples(lte_td_t td)
{
   return td ? ((thread_info_t*)td)->samples : 0;
}

uint64_t lte_pe_get_thread_icount(lte_td_t td)
{
   return td ? ((thread_info_t*)td)->icount : 0;
}

uint64_t lte_pe_get_thread_icount_max(lte_td_t td)
{
   return td ? ((thread_info_t*)td)->icount_max : 0;
}

uint64_t lte_pe_get_thread_icount_period(lte_td_t td)
{
   return td ? ((thread_info_t*)td)->icount_period : 0;
}

pid_t lte_pe_get_thread_tid(lte_td_t td)
{
   return td ? ((thread_info_t*)td)->tid : 0;
}

int lte_pe_get_thread_fd(lte_td_t td)
{
   return td ? ((thread_info_t*)td)->fd : -1;
}

static __inline__ thread_info_t* lte_pe_get_thread_info_by_tnum(uint64_t tnum)
{
   return (tnum < s_num_threads) ? &s_thread[tnum] : NULL;
}

static __inline__ thread_info_t* lte_pe_get_thread_info_by_tid(pid_t tid)
{
   return lte_pe_get_thread_info_by_tnum(lte_pe_get_thread_num_by_tid(tid));
}

static __inline__ thread_info_t* lte_pe_get_thread_info_by_fd(int fd)
{
   return lte_pe_get_thread_info_by_tnum(lte_pe_get_thread_num_by_fd(fd));
}

static void lte_pe_free_threads_info()
{
   if(s_thread)
   {
      thread_info_t* p = s_thread;
      thread_info_t* pend = s_thread + s_num_threads;
      for(; p != pend; ++p)
      {
         if(!p->stack)
            lte_munmap(p->stack, p->stack_size);
      }
      lte_munmap(s_thread, s_num_threads*sizeof(thread_info_t));
      s_num_threads = 0;
      s_thread = NULL;
   }
}

static int lte_pe_alloc_threads_info(uint64_t num_threads)
{
   if(!num_threads)
      lte_pe_error(EXIT_FAILURE);

   if(num_threads > s_num_threads)
      lte_pe_free_threads_info();

   if(!s_thread)
   {
      s_thread = (thread_info_t*)lte_mmap(0, num_threads*sizeof(thread_info_t),
          PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0);
      if(!s_thread)
         lte_pe_error(EXIT_FAILURE);
      else
         lte_memset(s_thread, 0, num_threads*sizeof(thread_info_t));
   }
   s_num_threads = num_threads;

   thread_info_t* p = s_thread;
   thread_info_t* pend = s_thread + num_threads;
   if(p)
   {
      for(; p != pend; ++p)
      {
         if(!p->stack)
         {
            p->stack = lte_mmap(0, SIGSTKSZ, PROT_READ|PROT_WRITE|PROT_EXEC,MAP_PRIVATE|MAP_ANONYMOUS|MAP_GROWSDOWN, -1, 0);
            if(!p->stack)
               lte_pe_error(EXIT_FAILURE);
            p->stack_size = SIGSTKSZ;
         }
         p->fd = -1;
         p->icount = 0;
         p->icount_period = 0;
         p->icount_max = 0;
         p->samples = 0;
      }
   }
   else
   {
      lte_pe_error(EXIT_FAILURE);
      return 1; //will now execute 
   }
   return 0; // success
}

static void lte_pe_update_icount(thread_info_t* tinfo)
{
   uint64_t icount = lte_pe_read(tinfo->fd);
   if(icount)
      __sync_lock_test_and_set(&tinfo->icount, icount);
}

static void lte_pe_sample(thread_info_t* tinfo, int signum, siginfo_t* siginfo, void* ucontext)
{
   if(tinfo && tinfo->fd != -1)
   {
      lte_pe_update_icount(tinfo);
      __sync_add_and_fetch(&tinfo->samples, 1);
      if(tinfo->callback)
         tinfo->callback(tinfo, signum, siginfo, ucontext);
   }
}

static void lte_pe_sighandler(int signum, siginfo_t* siginfo, void* ucontext)
{
   if(signum == SIGIO)
   {
      if(siginfo->si_code != POLL_HUP)
         lte_pe_error(EXIT_FAILURE);

      lte_ioctl(siginfo->si_fd, PERF_EVENT_IOC_DISABLE, PERF_IOC_FLAG_GROUP);

      thread_info_t* tinfo_tid = lte_pe_get_thread_info_by_tid(lte_gettid());
      if(tinfo_tid && tinfo_tid->fd != siginfo->si_fd)
         lte_ioctl(tinfo_tid->fd, PERF_EVENT_IOC_DISABLE, PERF_IOC_FLAG_GROUP);

      thread_info_t* tinfo_sig = lte_pe_get_thread_info_by_fd(siginfo->si_fd);
      if(tinfo_sig)
      {
         lte_pe_sample(tinfo_sig, signum, siginfo, ucontext);

         if(tinfo_tid == tinfo_sig || !tinfo_tid)
         {
            if(tinfo_sig->icount >= tinfo_sig->icount_max || tinfo_sig->icount_period >= tinfo_sig->icount_max)
            {
               lte_exit(EXIT_SUCCESS);
            }
            lte_ioctl(tinfo_sig->fd, PERF_EVENT_IOC_ENABLE, PERF_IOC_FLAG_GROUP);
            lte_ioctl(tinfo_sig->fd, PERF_EVENT_IOC_REFRESH, 1);
            return;
         }
      }

      if(tinfo_tid && tinfo_tid->fd != siginfo->si_fd)
         lte_ioctl(tinfo_tid->fd, PERF_EVENT_IOC_ENABLE, PERF_IOC_FLAG_GROUP);
   }
   else if(signum == s_sig_overflow) // if s_sig_overflow == SIGIO, it will be handled by the first if-then
   {
      thread_info_t* tinfo_tid = lte_pe_get_thread_info_by_tid(lte_gettid());
      if(tinfo_tid)
      {
         lte_ioctl(tinfo_tid->fd, PERF_EVENT_IOC_DISABLE, PERF_IOC_FLAG_GROUP);
         lte_pe_sample(tinfo_tid, signum, siginfo, ucontext);
         if(tinfo_tid->icount >= tinfo_tid->icount_max || tinfo_tid->icount_period >= tinfo_tid->icount_max)
         {
            lte_exit(EXIT_SUCCESS);
         }
         lte_ioctl(tinfo_tid->fd, PERF_EVENT_IOC_ENABLE, PERF_IOC_FLAG_GROUP);
         lte_ioctl(tinfo_tid->fd, PERF_EVENT_IOC_REFRESH, 1);
      }
   }
   else
   {
      int* s = s_blocked_signals;
      int* send = s_blocked_signals + s_blocked_signals_num;
      for(; s != send; ++s)
      {
         if(*s != signum)
            continue;

         thread_info_t* tinfo_tid = lte_pe_get_thread_info_by_tid(lte_gettid());
         if(tinfo_tid)
         {
            lte_ioctl(tinfo_tid->fd, PERF_EVENT_IOC_DISABLE, PERF_IOC_FLAG_GROUP);
            lte_pe_sample(tinfo_tid, signum, siginfo, ucontext);
         }
         lte_exit(EXIT_SUCCESS); // we need EXIT_SUCCESS for monitor thread (otherwise SIDCHLD won't come?)
      }
   }
}

extern int out_fd[];
__lte_static char s_sighandler[] = "sighandler ";
__lte_static char s_tid[] = "tid: ";

static void lte_pe_sighandler_process(int signum, siginfo_t* siginfo, void* ucontext)
{
   //lte_write(out_fd, s_sighandler, sizeof(s_sighandler)-1); lte_diprintfe(out_fd, signum,     ' ');
   if(signum == SIGIO)
   {
      if(siginfo->si_code != POLL_IN) // not POLL_HUP for the process case
        lte_pe_error(EXIT_FAILURE);

      lte_ioctl(siginfo->si_fd, PERF_EVENT_IOC_DISABLE, PERF_IOC_FLAG_GROUP);

      thread_info_t* tinfo_tid = lte_pe_get_thread_info_by_tid(lte_gettid());
      if((tinfo_tid != NULL) && (tinfo_tid->fd != siginfo->si_fd))
         lte_ioctl(tinfo_tid->fd, PERF_EVENT_IOC_DISABLE, PERF_IOC_FLAG_GROUP);

      thread_info_t* tinfo_sig = lte_pe_get_thread_info_by_fd(siginfo->si_fd);
      if(tinfo_sig)
      {
         lte_pe_sample(tinfo_sig, signum, siginfo, ucontext);

         if(tinfo_tid == tinfo_sig || !tinfo_tid)
         {
            if(tinfo_sig->icount >= tinfo_sig->icount_max || tinfo_sig->icount_period >= tinfo_sig->icount_max)
            {
               lte_exit_group(EXIT_SUCCESS);
            }
            lte_ioctl(tinfo_sig->fd, PERF_EVENT_IOC_ENABLE, PERF_IOC_FLAG_GROUP);
            lte_ioctl(tinfo_sig->fd, PERF_EVENT_IOC_REFRESH, 1); 
            return;
         }
      }

      if(tinfo_tid && tinfo_tid->fd != siginfo->si_fd)
         lte_ioctl(tinfo_tid->fd, PERF_EVENT_IOC_ENABLE, PERF_IOC_FLAG_GROUP);
   }
   else if(signum == s_sig_overflow) // if s_sig_overflow == SIGIO, it will be handled by the first if-then
   {
      thread_info_t* tinfo_tid = lte_pe_get_thread_info_by_tid(lte_gettid());
      if(tinfo_tid)
      {
         lte_ioctl(tinfo_tid->fd, PERF_EVENT_IOC_DISABLE, PERF_IOC_FLAG_GROUP);
         lte_pe_sample(tinfo_tid, signum, siginfo, ucontext);
         if(tinfo_tid->icount >= tinfo_tid->icount_max || tinfo_tid->icount_period >= tinfo_tid->icount_max)
         {
            lte_exit_group(EXIT_SUCCESS);
         }
         lte_ioctl(tinfo_tid->fd, PERF_EVENT_IOC_ENABLE, PERF_IOC_FLAG_GROUP);
         lte_ioctl(tinfo_tid->fd, PERF_EVENT_IOC_REFRESH, 1);
      }
   }
   else
   {
      int* s = s_blocked_signals;
      int* send = s_blocked_signals + s_blocked_signals_num;
      for(; s != send; ++s)
      {
         if(*s != signum)
            continue;

         thread_info_t* tinfo_tid = lte_pe_get_thread_info_by_tid(lte_gettid());
         if(tinfo_tid)
         {
            lte_ioctl(tinfo_tid->fd, PERF_EVENT_IOC_DISABLE, PERF_IOC_FLAG_GROUP);
            lte_pe_sample(tinfo_tid, signum, siginfo, ucontext);
         }
         lte_exit_group(EXIT_SUCCESS); // we need EXIT_SUCCESS for monitor thread (otherwise SIDCHLD won't come?)
      }
   }
}

static int lte_pe_open_perf_event(pid_t pid, int cpu, int fd_group, uint32_t pe_type, uint64_t pe_config, uint64_t icount_period, uint8_t isglobal)
{
   struct perf_event_attr pe;
   lte_memset(&pe, 0, sizeof(pe));
   pe.type = pe_type;
   pe.size = sizeof(pe);
   pe.config = pe_config;
   pe.disabled = 1;
   if(isglobal)pe.disabled = 1; // FIXME added for testing
   if(isglobal)pe.inherit = 1; // Added for process monitoring.
   if(isglobal)pe.inherit_stat = 1; // Added for process monitoring.
   pe.sample_type = PERF_SAMPLE_IP;
   pe.sample_period = icount_period;
   pe.exclude_kernel = 1;
   pe.exclude_user = 0;
   pe.exclude_hv = 1;
   return lte_perf_event_open(&pe, pid, cpu, fd_group, 0);
}

static lte_td_t lte_pe_set_sampling_cbk(uint64_t tnum, int cpu, pid_t pid, uint64_t icount_period, uint64_t icount_max, lte_pe_cbk_t callback)
{
   thread_info_t* tinfo = lte_pe_get_thread_info_by_tnum(tnum);

   if(!tinfo)
      return NULL;
   if(icount_period > icount_max)
      icount_period = icount_max;
   if(!icount_period)
      return NULL;

   // TODO: Add support of periodic sampling; it is disabled by the time
   // if(icount_period != icount_max)
      // icount_period = icount_max;

   stack_t ss = {
      .ss_sp = tinfo->stack,
      .ss_flags = 0,
      .ss_size = tinfo->stack_size
   };
   int sa_onstack = 0;
   if(ss.ss_sp && !lte_sigaltstack(&ss, 0))
      sa_onstack = SA_ONSTACK;

   tinfo->callback = callback;

   struct sigaction sa;
   lte_memset(&sa, 0, sizeof(sa));
   sa.sa_sigaction = &lte_pe_sighandler;
   sa.sa_flags = SA_SIGINFO | sa_onstack;
   #ifdef LIBPERFLE_SAMASK
   sa.sa_mask = s_sa_mask;
   #endif

   int sig = s_sig_overflow;

   if(lte_sigaction(sig, &sa, NULL) < 0)
      lte_pe_error(EXIT_FAILURE);

   if(s_blocked_signals_num)
   {
      int* signum = s_blocked_signals;
      int* sigend = s_blocked_signals + s_blocked_signals_num;
      for(; signum != sigend; ++signum)
          if(lte_sigaction(*signum, &sa, NULL) < 0)
            lte_pe_error(EXIT_FAILURE);
   }

   lte_td_t td = NULL;
   int fd = lte_pe_open_perf_event(pid, cpu, -1, PERF_TYPE_HARDWARE, PERF_COUNT_HW_INSTRUCTIONS, icount_period, 0 /*isglobal*/);
   if(fd != -1)
   {
      lte_fcntl(fd, F_SETFL, O_NONBLOCK|O_ASYNC);
      lte_fcntl(fd, F_SETSIG, sig);
      #if 0
      lte_fcntl(fd, F_SETOWN, lte_gettid());
      #else
      // since Linux 2.6.32
      struct f_owner_ex foex;
      foex.type = F_OWNER_TID;
      foex.pid = lte_gettid();
      lte_fcntl(fd, F_SETOWN_EX, &foex);
      #endif
      lte_ioctl(fd, PERF_EVENT_IOC_RESET, 0);
      td = tinfo;
   }

   tinfo->tid = lte_gettid();
   tinfo->icount_period = icount_period;
   tinfo->icount_max = icount_max;
   tinfo->fd = fd;

   return td;
}


static lte_td_t lte_pe_set_sampling_cbk_process(uint64_t tnum, int cpu, pid_t pid, uint64_t icount_period, uint64_t icount_max, lte_pe_cbk_t callback, int fd)
{
   thread_info_t* tinfo = lte_pe_get_thread_info_by_tnum(tnum);

   if(!tinfo)
      return NULL;
   if(icount_period > icount_max)
      icount_period = icount_max;
   if(!icount_period)
      return NULL;

   // TODO: Add support of periodic sampling; it is disabled by the time
   // if(icount_period != icount_max)
      // icount_period = icount_max;

   stack_t ss = {
      .ss_sp = tinfo->stack,
      .ss_flags = 0,
      .ss_size = tinfo->stack_size
   };
   int sa_onstack = 0;
   if(ss.ss_sp && !lte_sigaltstack(&ss, 0))
      sa_onstack = SA_ONSTACK;

   tinfo->callback = callback;

   struct sigaction sa;
   lte_memset(&sa, 0, sizeof(sa));
   sa.sa_sigaction = &lte_pe_sighandler_process;
   sa.sa_flags = SA_SIGINFO | sa_onstack;
   #ifdef LIBPERFLE_SAMASK
   sa.sa_mask = s_sa_mask;
   #endif

   int sig = s_sig_overflow;

   if(lte_sigaction(sig, &sa, NULL) < 0)
      lte_pe_error(EXIT_FAILURE);

   if(s_blocked_signals_num)
   {
      int* signum = s_blocked_signals;
      int* sigend = s_blocked_signals + s_blocked_signals_num;
      for(; signum != sigend; ++signum)
          if(lte_sigaction(*signum, &sa, NULL) < 0)
            lte_pe_error(EXIT_FAILURE);
   }

   lte_td_t td = NULL;
   if(tnum == 0)
   {
      fd = lte_pe_open_perf_event(pid, cpu, -1, PERF_TYPE_HARDWARE, PERF_COUNT_HW_INSTRUCTIONS, icount_period, 1 /*global*/);
   }

   tinfo->tid = lte_gettid();
   tinfo->icount_period = icount_period;
   tinfo->icount_max = icount_max;
   tinfo->fd = fd;
   if(fd != -1)
   {
      lte_fcntl(fd, F_SETFL, O_NONBLOCK|O_ASYNC);
      lte_fcntl(fd, F_SETSIG, sig);
      #if 0
      lte_fcntl(fd, F_SETOWN, lte_gettid());
      #else
      // since Linux 2.6.32
      struct f_owner_ex foex;
      foex.type = F_OWNER_TID;
      foex.pid = lte_gettid(); 
      lte_fcntl(fd, F_SETOWN_EX, &foex);
      #endif
      lte_ioctl(fd, PERF_EVENT_IOC_RESET, 0);
      td = tinfo;
   }

   return td;
}

static int __lte_pe_init(uint64_t num_threads, const void* sigset)
{
   #ifdef LIBPERFLE_SIGRT
   #ifdef LIBPERF_SIGRT_DEBUG
   if(SIGPEOVFL_MIN <= s_sig_overflow && s_sig_overflow <= SIGPEOVFL_MAX)
   {
      static char s[] = "overflow sig [rt]: ";
      lte_puts(1, s);
      lte_diprintf(1, s_sig_overflow);
   }
   else if(s_sig_overflow == SIGIO)
   {
      static char s[] = "overflow sig: SIGIO\n";
      lte_puts(1, s);
   }
   else
   {
      static char s[] = "overflow sig: ";
      lte_puts(1, s);
      lte_diprintf(1, s_sig_overflow);
   }
   #endif
   #endif

   s_blocked_signals_num = 0;
   #ifdef LIBPERFLE_SAMASK
   lte_sigemptyset(&s_sa_mask);
   lte_sigaddset(&s_sa_mask, s_sig_overflow);
   #endif
   if(sigset)
   {
      int signum;
      for(signum = 1; signum < _NSIG; ++signum)
      {
         if(lte_sigismember((const lte_sigset_t*)sigset, signum))
         {
            s_blocked_signals[s_blocked_signals_num++] = signum;
            #ifdef LIBPERFLE_SAMASK
            lte_sigaddset(&s_sa_mask, signum);
            #endif
         }
      }
   }
   return lte_pe_alloc_threads_info(num_threads);
}

int lte_pe_init(uint64_t num_threads, int sigovfl, const void* sigset)
{
   #ifdef LIBPERFLE_SIGRT
   s_sig_overflow = (SIGPEOVFL_MIN <= sigovfl && sigovfl <= SIGPEOVFL_MAX) ? sigovfl : SIGIO;
   #endif
   return __lte_pe_init(num_threads, sigset);
}

uint64_t lte_pe_read_thread_icount(lte_td_t td)
{
   thread_info_t* tinfo = (thread_info_t*)td;
   if(!tinfo)
      return 0;
   if(tinfo->fd != -1)
      lte_pe_update_icount(tinfo);
   return tinfo->icount;
}

lte_td_t lte_pe_set_thread_end(uint64_t tnum, uint64_t icount)
{
   return lte_pe_set_sampling_cbk(tnum, -1, 0/*lte_gettid()*/, icount, icount, NULL);
}

lte_td_t lte_pe_init_process_sampling(uint64_t tnum, uint64_t icount_period, uint64_t icount_max, lte_pe_cbk_t callback, int perf_fd)
{
   //return lte_pe_set_sampling_cbk_process(tnum, -1, lte_getpid(), icount_period, icount_max, callback);
   return lte_pe_set_sampling_cbk_process(tnum, -1, 0, icount_period, icount_max, callback, perf_fd);
}

lte_td_t lte_pe_init_thread_sampling(uint64_t tnum, uint64_t icount_period, uint64_t icount_max, lte_pe_cbk_t callback)
{
   return lte_pe_set_sampling_cbk(tnum, -1, 0/*lte_gettid()*/, icount_period, icount_max, callback);
}

static void lte_pe_brkhandler(int signum, siginfo_t* siginfo, void* ucontext)
{
   if(signum == SIGTRAP)
   {
      thread_info_t* tinfo = lte_pe_get_thread_info_by_tid(lte_gettid());
      if(tinfo && tinfo->callback)
         tinfo->callback(tinfo, signum, siginfo, ucontext);
   }
}

lte_td_t lte_pe_set_breakpoint_action(uint64_t tnum, lte_pe_cbk_t callback)
{
   thread_info_t* tinfo = lte_pe_get_thread_info_by_tnum(tnum);

   if(!tinfo)
      return NULL;

   stack_t ss = {
      .ss_sp = tinfo->stack,
      .ss_flags = 0,
      .ss_size = tinfo->stack_size
   };
   int sa_onstack = 0;
   if(ss.ss_sp && !lte_sigaltstack(&ss, 0))
      sa_onstack = SA_ONSTACK;

   tinfo->tid = lte_gettid();
   tinfo->callback = callback;

   struct sigaction sa;
   lte_memset(&sa, 0, sizeof(sa));
   sa.sa_sigaction = lte_pe_brkhandler;
   sa.sa_flags = SA_SIGINFO | sa_onstack;

   #ifdef LIBPERFLE_SAMASK
   lte_sigaddset(&s_sa_mask, SIGTRAP);
   sa.sa_mask = s_sa_mask;
   #endif

   if(lte_sigaction(SIGTRAP, &sa, NULL) < 0)
      lte_pe_error(EXIT_FAILURE);

   return tinfo;
}


int lte_pe_open_thread_perf_event(lte_td_t td, uint32_t pe_type, uint64_t pe_config, uint8_t isglobal)
{
   thread_info_t* tinfo = (thread_info_t*)td;
   return (tinfo && tinfo->fd != -1) ? lte_pe_open_perf_event(tinfo->tid, -1, tinfo->fd, pe_type, pe_config, 0, isglobal) : -1;
}

uint64_t lte_pe_read(int fd)
{
   uint64_t counter;
   return (lte_read(fd, &counter, sizeof(counter)) >= 0) ? counter : 0;
}
