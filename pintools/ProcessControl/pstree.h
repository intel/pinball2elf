/*BEGIN_LEGAL 
BSD License 

Copyright (c)2022 Intel Corporation. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
END_LEGAL */

#ifndef PSTREE_H
#define PSTREE_H
#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <dirent.h>
#include <string.h>
#include <signal.h>
#include <time.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/ptrace.h>
#include <sys/ioctl.h>
#define _GNU_SOURCE
#include <sys/syscall.h>
#include <linux/perf_event.h>
#include <linux/hw_breakpoint.h>

#define MAXSTR      1024
#define MAXPROCS    4096

void set_procfs_task_dir(pid_t pid, char *dir);
void set_procfs_children_file(pid_t pid, pid_t tid, char *file);
unsigned long get_all_tasks(pid_t pid, pid_t *tasks);
unsigned long get_all_children(pid_t pid, pid_t tid, pid_t *children);

/* 
 * get the full process tree rooted at <pid>
 * <pout> is the output array of pids
 * <tout> is the output array of tids
 * return value: no. of items output successfully
 * (zero on error)
*/
unsigned long get_pstree(pid_t pid, pid_t *pout, pid_t *tout);

/* given end > begin, compute the interval elapsed in nanoseconds */
unsigned long long elapsed_nsec(struct timespec begin, struct timespec end);

/* given begin/end timestamps and a time period in us,
 * sleep for intvl = period - (end-begin)
 */
void sleep_remaining(struct timespec begin, struct timespec end, unsigned long period_us);

/* given a pid, setup a userspace icounter for polling  */
int setup_icount_poll(pid_t pid);
/* given a pid, setup a group of hardware perfcounters for interrupting.
 * leader is the first counter and is expected to be a userspace
 * counter (e.g., userspace icount). returns file descriptors
 * in 'pfds' for configs specified in 'cfgs'. 'size' is the length
 * of both these arrays
 */
void setup_perfcounters_group(pid_t pid, unsigned long long leader_count, int *pfds, unsigned long long *cfgs, unsigned long size);
/* setup a hardware breakpoint in 'pid'
 * at 'addr' to fire after 'count' 
 * occurrences.
 */
int setup_pccount(pid_t pid, void *addr, unsigned long long count);
long parse_long(char *arg, const char *err);
unsigned long long parse_ull(char *arg, const char *err);
double parse_double(char *arg, const char *err);
void copy_ull(unsigned long long *dst, unsigned long long *src, \
              unsigned long count);
void ptrace_cmd(enum __ptrace_request cmd, pid_t pid, void *addr, void *data, \
                const int strict, const char *msg);
void get_monotonic(struct timespec *tp, const char *msg);

/* append new thread created by clone if not already present  */
int append_thread(pid_t *pout, pid_t *tout, int *pfds, unsigned long *count, \
                   pid_t pid, pid_t tid);
pid_t find_pid(pid_t *pout, pid_t *tout, unsigned long count, pid_t tid);
void seize_tid(pid_t tid);
void continue_tid(pid_t tid, pid_t pid);
void interrupt_tid(pid_t tid);
void detach_tid(pid_t tid, pid_t pid);
unsigned long long read_single_icount(int pfd);
unsigned long long read_all_icounts(int *pfds, unsigned long *tdone, \
                                    unsigned long long *icounts, unsigned long long *prevcounts, \
                                    unsigned long count);
/* read perf counter values from the group setup by setup_perfcounters_group */
void read_perfcounters_group(int *pfds, unsigned long long *vals, unsigned long count);
int handle_exit(pid_t *pout, pid_t *tout, int *pfds, unsigned long *tdone, \
                unsigned long long *icounts, unsigned long count, \
                pid_t child, int wstatus, \
                unsigned long *donecount);

/* handle ptrace stop events */
int handle_stop(pid_t *pout, pid_t *tout, int *pfds, unsigned long *tdone, \
                unsigned long long *icounts, unsigned long *count, \
                pid_t child, int wstatus, unsigned long *donecount);
#endif
