/*BEGIN_LEGAL 
BSD License 

Copyright (c)2019 Intel Corporation. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
END_LEGAL */
#ifndef LTE_PERF_H
#define LTE_PERF_H

#ifndef _GNU_SOURCE
# define _GNU_SOURCE 1
#endif

#include <ucontext.h>
#include "lte_lc.h"

#define __lte_data    __attribute__ ((section (".data")))
#define __lte_static  static __lte_data

#define INVALID_TNUM  (~(uint64_t)0)

// We use the hard limits of the kernel to signal 'performance counter overflow'
// as don't want to link with libc (SIGRTMIN/MAX are function calls in libc).
// Don't use __SIGRTMIN..__SIGRTMIN+3 they can be used by threading libraries.
#define SIGPEOVFL_MIN  __SIGRTMIN
#define SIGPEOVFL_MAX  __SIGRTMAX
#define SIGPEOVFL      SIGPEOVFL_MAX

typedef void* lte_td_t;
typedef void (*lte_pe_cbk_t)(lte_td_t, int, siginfo_t*, void*);

#ifdef __cplusplus
extern "C" {
#endif

uint64_t lte_pe_get_num_threads();
lte_td_t lte_pe_get_thread_desc(uint64_t tnum);

uint64_t lte_pe_get_thread_num(lte_td_t td);
pid_t lte_pe_get_thread_tid(lte_td_t td);
int lte_pe_get_thread_fd(lte_td_t td);

uint64_t lte_pe_get_thread_samples(lte_td_t td);
uint64_t lte_pe_get_thread_icount(lte_td_t td);
uint64_t lte_pe_get_thread_icount_max(lte_td_t td);
uint64_t lte_pe_get_thread_icount_period(lte_td_t td);
uint64_t lte_pe_read_thread_icount(lte_td_t td);

// initializes the library; returns 0 on success, and performs SYS_exit error
// if sigovfl is from [SIGPEOVFL_MIN, SIGPEOVFL_MAX], than sigovfl will be sent
// on performance counter overflow, otherwise SIGIO
int lte_pe_init(uint64_t num_threads, int sigovfl, const void* sigset);
// initiazile sampling for the thread specified by tnum; on error returns 0
lte_td_t lte_pe_init_thread_sampling_idelta(uint64_t tnum, uint64_t icount_period, uint64_t icount_max, lte_pe_cbk_t callback);

lte_td_t lte_pe_init_thread_sampling_pcdelta(uint64_t tnum, uint64_t bp_addr, uint64_t bpcount_period, uint64_t bpcount_max, lte_pe_cbk_t callback);

lte_td_t lte_pe_init_thread_sampling_icount(uint64_t tnum, uint64_t icount_period, uint64_t icount_max, lte_pe_cbk_t callback, uint64_t wicount_period, uint64_t wicount_max, lte_pe_cbk_t wcallback); 

// initiazile bp sampling for the thread specified by tnum; on error returns 0
void lte_pe_init_thread_sampling_bp(uint64_t tnum, uint64_t bp_addr, uint64_t bp_period, uint64_t bpcount_max, lte_pe_cbk_t callback, uint64_t wbp_addr, uint64_t wbp_period, uint64_t wbpcount_max, lte_pe_cbk_t wcallback); 

// sets icount for the thread specified by tnum; on error returns 0
lte_td_t lte_pe_set_thread_end(uint64_t tnum, uint64_t icount);
// returns perf counter file descriptor for non-zero td. "-1" if td is 0.
int lte_pe_get_perf_fd(lte_td_t td);

// opens file descriptor for performance monitoring using event descriptor attached to td as a group leader; -1 on error
int lte_pe_open_thread_perf_event(lte_td_t td, uint32_t pe_type, uint64_t pe_config, uint8_t isglobal);
uint64_t lte_pe_read(int fd);
uint64_t lte_pe_get_thread_num_by_tid(pid_t tid);

void lte_pe_disable(int fd);
void lte_pe_enable(int fd);
void lte_pe_reset(int fd);
void lte_pe_close(int fd);

#ifdef __cplusplus
}
#endif

#endif //LTE_PERF_H
