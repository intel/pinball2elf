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

/* given a pid, setup a userspace icounter   */
int setup_icount(pid_t pid);
/* setup a hardware breakpoint in 'pid'
 * at 'addr' to fire after 'count' 
 * occurrences.
 */
int setup_pccount(pid_t pid, void *addr, unsigned long count);
long parse_long(char *arg, const char *err);
unsigned long long parse_ull(char *arg, const char *err);
void copy_ull(unsigned long long *dst, unsigned long long *src, \
              unsigned long count);
void ptrace_cmd(enum __ptrace_request cmd, pid_t pid, void *addr, void *data, \
                const int strict, const char *msg);
void get_monotonic(struct timespec *tp, const char *msg);

/* append new thread created by clone if not already present  */
int append_thread(pid_t *pout, pid_t *tout, int *pfds, unsigned long *count, \
                   pid_t pid, pid_t tid);
pid_t find_pid(pid_t *pout, pid_t *tout, unsigned long count, pid_t tid);
unsigned long long read_single_icount(int pfd);
unsigned long long read_all_icounts(int *pfds, unsigned long *tdone, \
                                    unsigned long long *icounts, unsigned long long *prevcounts, \
                                    unsigned long count);
int handle_exit(pid_t *pout, pid_t *tout, int *pfds, unsigned long *tdone, \
                unsigned long long *icounts, unsigned long count, \
                pid_t child, int wstatus, \
                unsigned long *donecount);

/* handle ptrace stop events */
int handle_stop(pid_t *pout, pid_t *tout, int *pfds, unsigned long *tdone, \
                unsigned long long *icounts, unsigned long *count, \
                pid_t child, int wstatus, unsigned long *donecount);
#endif
