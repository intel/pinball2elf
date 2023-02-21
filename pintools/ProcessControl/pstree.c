/*BEGIN_LEGAL 
BSD License 

Copyright (c)2022 Intel Corporation. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
END_LEGAL */

#include "pstree.h"

void set_procfs_task_dir(pid_t pid, char *dir)
{
    snprintf(dir, MAXSTR, "/proc/%d/task/", pid);
}

void set_procfs_children_file(pid_t pid, pid_t tid, char *file)
{
    snprintf(file, MAXSTR, "/proc/%d/task/%d/children", pid, tid);
}

unsigned long get_all_tasks(pid_t pid, pid_t *tasks)
{
    char tdir_path[MAXSTR];
    DIR *tdir;
    struct dirent *item;
    unsigned long count = 0;

    set_procfs_task_dir(pid, tdir_path);

    tdir = opendir(tdir_path);
    if (tdir == NULL) {
        perror("get_all_tasks: Failed to open task directory");
        exit(EXIT_FAILURE);
    }
    while ((item = readdir(tdir)) != NULL) {
        /* skip . and ..    */
        if (!strcmp(".", item->d_name) || 
            !strcmp("..", item->d_name)) {
            continue;
        }
        tasks[count] = (pid_t) atol(item->d_name);
        count++;
        if (count >= MAXPROCS) {
            fprintf(stderr, "error: reached max limit of tasks: %d\n", MAXPROCS);
            exit(EXIT_FAILURE);
        }
    }

    if (count <= 0) {
        fprintf(stderr, "error: unable to read tasks for pid %d\n", pid);
        exit(EXIT_FAILURE);
    }

    if (closedir(tdir)) {
        perror("get_all_tasks: warning: unable to close task directory");
    }
    return count;
}

unsigned long get_all_children(pid_t pid, pid_t tid, pid_t *children)
{
    char cfile_path[MAXSTR];
    FILE *cfile;
    unsigned long count = 0;
    pid_t val;

    set_procfs_children_file(pid, tid, cfile_path);
    cfile = fopen(cfile_path, "r");
    if (cfile == NULL) {
        perror("get_all_children");
        fprintf(stderr, "error: couldn't open children file. Is CONFIG_CHECKPOINT_RESTORE enabled in the kernel?\n");
        exit(EXIT_FAILURE);
    }
    while (fscanf(cfile, "%d", &val) == 1) {
        children[count] = val;
        count++;
        if (count >= MAXPROCS) {
            fprintf(stderr, "error: reached max limit of children: %d\n", MAXPROCS);
            exit(EXIT_FAILURE);
        }
    }
    if (fclose(cfile)) {
        perror("warning: unable to close children file");
    }
    return count;
}

/* 
 * get the full process tree rooted at <pid>
 * <pout> is the output array of pids
 * <tout> is the output array of tids
 * return value: no. of items output successfully
 * (zero on error)
*/
unsigned long get_pstree(pid_t pid, pid_t *pout, pid_t *tout)
{
    unsigned long tcount, ccount, t, c, n, tail, head;
    pid_t tasks[MAXPROCS], children[MAXPROCS];
    pid_t pidq[MAXPROCS], ppidq[MAXPROCS];
    pid_t val, ppid;

    /* initialize queue with given pid */
    pidq[0] = pid;
    ppidq[0] = -1;
    tail = 1;
    head = 0;
    n = 0;
    /* until pidq is empty  */
    while (head < tail && tail <= MAXPROCS) {
        /* dequeue unprocessed pids */
        val = pidq[head];
        ppid = ppidq[head];
        head++;
        /* write to output */
        tcount = get_all_tasks(val, tasks);
        for (t = 0; t < tcount; t++) {
            if (n+t < MAXPROCS) {
                pout[n+t] = val;
                tout[n+t] = tasks[t];
#if VERBOSE > 1
        fprintf(stdout, "PID: %d, TID: %d, PPID: %d\n", pout[n+t], tout[n+t], ppid);
#endif
            } else {
                fprintf(stderr, "error: reached max limit of tasks: %d\n", MAXPROCS);
                exit(EXIT_FAILURE);
            }

            /* push all children into the queue */
            ccount = get_all_children(val, tasks[t], children);
            for (c=0; c < ccount; c++) {
                if (tail < MAXPROCS) {
                    pidq[tail] = children[c];
                    ppidq[tail] = val;
                    tail++;
                } else {
                    fprintf(stderr, "error: reached max limit of tasks: %d\n", MAXPROCS);
                    exit(EXIT_FAILURE);
                }
            }
        }
        n += tcount;
    }
    return n;
}

/* given end > begin, compute the interval elapsed in nanoseconds */
unsigned long long elapsed_nsec(struct timespec begin, struct timespec end)
{
    struct timespec intvl;
    unsigned long long nsec = 0;
    intvl.tv_sec = end.tv_sec - begin.tv_sec;
    if (end.tv_nsec < begin.tv_nsec) {
        intvl.tv_sec -= 1;
        intvl.tv_nsec = end.tv_nsec + 1000000000LL - begin.tv_nsec;
    } else {
        intvl.tv_nsec = end.tv_nsec - begin.tv_nsec;
    }
    /* in nanoseconds   */
    nsec = intvl.tv_sec * 1000000000LL + intvl.tv_nsec;

#if VERBOSE > 3
    fprintf(stdout, "elapsed_nsec: begin: %lu.%09lu s, end : %lu.%09lu s, elapsed: %llu ns\n", \
            begin.tv_sec, begin.tv_nsec, end.tv_sec, end.tv_nsec, nsec);
#endif
    return nsec;
}

/* given begin/end timestamps and a time period in us,
 * sleep for intvl = period - (end-begin)
 */
void sleep_remaining(struct timespec begin, struct timespec end, unsigned long period_us)
{
    struct timespec intvl;
    unsigned long long nsec = 0;

#if VERBOSE > 2
    fprintf(stdout, "begin: %lu.%09lu s, end : %lu.%09lu s, budget: %lu us\n", \
            begin.tv_sec, begin.tv_nsec, end.tv_sec, end.tv_nsec, period_us);
#endif

    /* end < begin */
    if (end.tv_sec < begin.tv_sec || (end.tv_sec == begin.tv_sec && end.tv_nsec < begin.tv_nsec))
        return;

    /* elapsed interval */
    nsec = elapsed_nsec(begin, end);

    /* budget exhausted */
    if (nsec >= period_us * 1000LL) {
        return;
    } else {
        intvl.tv_sec = (period_us * 1000LL - nsec) / 1000000000LL;
        intvl.tv_nsec = (period_us * 1000LL - nsec) % 1000000000LL;
    }

#if VERBOSE > 2
    fprintf(stdout, "sleeping for %lu.%09lu s\n", intvl.tv_sec, intvl.tv_nsec);
#endif

    if (nanosleep(&intvl, NULL)) {
        perror("sleep_remaining");
    }
}

/* given a pid, setup a userspace icounter for polling  */
int setup_icount_poll(pid_t pid)
{
    struct perf_event_attr pe;
    int pfd = -1;

    memset(&pe, 0, sizeof(struct perf_event_attr));
    pe.type = PERF_TYPE_HARDWARE;
    pe.size = sizeof(struct perf_event_attr);
    pe.config = PERF_COUNT_HW_INSTRUCTIONS;
    pe.disabled = 1;
    pe.inherit = 0;
    pe.pinned = 1;
    pe.exclude_kernel = 1;
    pe.exclude_hv = 1;
    pfd = syscall(__NR_perf_event_open, &pe, pid, -1, -1, 0);
    if (pfd < 0) {
        perror("setup_icount_poll: unable to setup icount");
        exit(EXIT_FAILURE);
    }
    ioctl(pfd, PERF_EVENT_IOC_RESET, 0);
    ioctl(pfd, PERF_EVENT_IOC_ENABLE, 0);
    return pfd;
}

/* given a pid, setup a group of hardware perfcounters for interrupting.
 * leader is the first counter and is expected to be a userspace
 * counter (e.g., userspace icount). returns file descriptors
 * in 'pfds' for configs specified in 'cfgs'. 'size' is the length
 * of both these arrays
 */
void setup_perfcounters_group(pid_t pid, unsigned long long leader_count, int *pfds, unsigned long long *cfgs, unsigned long size)
{
    struct perf_event_attr pe;
    unsigned long i;

    memset(&pe, 0, sizeof(struct perf_event_attr));
    pe.type = PERF_TYPE_HARDWARE;
    pe.size = sizeof(struct perf_event_attr);
    pe.config = cfgs[0];
    pe.sample_type = PERF_SAMPLE_READ;
    pe.sample_period = leader_count;
    pe.watermark = 1;
    pe.wakeup_watermark = 1;
    pe.disabled = 1;
    pe.inherit = 0;
    pe.pinned = 1;
    pe.exclude_kernel = 1;
    pe.exclude_hv = 1;
    pfds[0] = syscall(__NR_perf_event_open, &pe, pid, -1, -1, 0);
    if (pfds[0] < 0) {
        perror("setup_perfcounters_interrupt: unable to setup leader count");
        exit(EXIT_FAILURE);
    }
    /* setup SIGIO to fire once watermark is reached    */
    fcntl(pfds[0], F_SETOWN, pid);
    fcntl(pfds[0], F_SETFL, fcntl(pfds[0], F_GETFL) | FASYNC);
    /* remaining counters in the group  */
    for (i=1; i < size; i++) {
        memset(&pe, 0, sizeof(struct perf_event_attr));
        pe.type = PERF_TYPE_HARDWARE;
        pe.size = sizeof(struct perf_event_attr);
        pe.config = cfgs[i];
        pe.sample_type = PERF_SAMPLE_READ;
        pe.disabled = 1;
        pe.inherit = 0;
        pfds[i] = syscall(__NR_perf_event_open, &pe, pid, -1, pfds[0], 0);
        if (pfds[i] < 0) {
            fprintf(stderr, "error setting up performance counter %lu\n", i);
            perror("setup_perfcounters_interrupt: unable to setup group perfcounters");
            exit(EXIT_FAILURE);
        }
    }
    for (i=0; i < size; i++) {
        ioctl(pfds[i], PERF_EVENT_IOC_RESET, 0);
        ioctl(pfds[i], PERF_EVENT_IOC_ENABLE, 0);
    }
}

/* setup a hardware breakpoint in 'pid'
 * at 'addr' to fire after 'count' 
 * occurrences.
 */
int setup_pccount(pid_t pid, void *addr, unsigned long long count)
{
    struct perf_event_attr pe;
    int pfd = -1;

    memset(&pe, 0, sizeof(struct perf_event_attr));
    pe.type = PERF_TYPE_BREAKPOINT;
    pe.size = sizeof(struct perf_event_attr);
    pe.config = 0;
    pe.bp_type = HW_BREAKPOINT_X;
    pe.bp_addr = (unsigned long) addr;
    pe.bp_len = sizeof(long);
    pe.sample_type = PERF_SAMPLE_IP;
    pe.sample_period = count;
    pe.watermark = 1;
    pe.wakeup_watermark = 1;
    pe.disabled = 1;
    pe.inherit = 0;
    pe.pinned = 1;
    pe.exclude_kernel = 1;
    pe.exclude_hv = 1;
    pfd = syscall(__NR_perf_event_open, &pe, pid, -1, -1, 0);
    if (pfd < 0) {
        perror("setup_pccount: unable to setup pccount");
        exit(EXIT_FAILURE);
    }
    /* setup SIGIO to fire once watermark is reached    */
    fcntl(pfd, F_SETOWN, pid);
    fcntl(pfd, F_SETFL, fcntl(pfd, F_GETFL) | FASYNC);
    ioctl(pfd, PERF_EVENT_IOC_RESET, 0);
    ioctl(pfd, PERF_EVENT_IOC_ENABLE, 0);
    return pfd;
}

inline void parse_error_check(const char *arg, const char *err, const char *last)
{
    if (errno) {
        perror(err);
        exit(EXIT_FAILURE);
    } else if (last == arg || *last != '\0') {
        fprintf(stderr, "%s\n", err);
        exit(EXIT_FAILURE);
    }
}

long parse_long(char *arg, const char *err)
{
    long result;
    char *last;
    errno = 0;
    result = strtol(arg, &last, 0);
    parse_error_check(arg, err, last);
    return result;
}

unsigned long long parse_ull(char *arg, const char *err)
{
    unsigned long long result;
    char *last;
    errno = 0;
    result = strtoull(arg, &last, 0);
    parse_error_check(arg, err, last);
    return result;
}

double parse_double(char *arg, const char *err)
{
    double result;
    char *last;
    errno = 0;
    result = strtod(arg, &last);
    parse_error_check(arg, err, last);
    return result;
}

void copy_ull(unsigned long long *dst, unsigned long long *src, \
              unsigned long count)
{
    memcpy(dst, src, count * sizeof(unsigned long long));
}

void ptrace_cmd(enum __ptrace_request cmd, pid_t pid, void *addr, void *data, \
                const int strict, const char *msg)
{
    int retval;

    errno = 0;
    retval = ptrace(cmd, pid, addr, data);

#if VERBOSE > 2
    fprintf(stdout, "ptrace: cmd: %d, tid: %d, addr: %ld, data: %ld, strict: %d, retval: %d, errno: %d, msg: %s\n", \
            cmd, pid, (long) addr, (long) data, strict, retval, errno, msg);
#endif

    if (retval && strict) {
        perror (msg);
        fprintf(stderr, "ptrace error %d for tid %d\n", errno, pid);
        exit(EXIT_FAILURE);
    } else if (retval && errno != ESRCH) {
        perror (msg);
        fprintf(stderr, "ptrace error %d for tid %d\n", errno, pid);
        exit(EXIT_FAILURE);
    }
}

void get_monotonic(struct timespec *tp, const char *msg)
{
    if (clock_gettime(CLOCK_MONOTONIC, tp)) {
        perror(msg);
        exit(EXIT_FAILURE);
    }
#if VERBOSE > 3
    fprintf(stdout, "get_monotonic: %s: %lu.%09lu s\n", msg, tp->tv_sec, tp->tv_nsec);
#endif
}

/* search current pids/tids */
int search_thread(pid_t *tout, unsigned long count, pid_t tid)
{
    unsigned long i;
    for (i=0; i < count; i++) {
        if (tout[i] == tid) {
            return i;
        }
    }
    return -1;
}

/* append new thread created by clone if not already present  */
int append_thread(pid_t *pout, pid_t *tout, int *pfds, unsigned long *count, \
                   pid_t pid, pid_t tid)
{
    int i;
    if (*count >= MAXPROCS) {
        fprintf(stderr, "error: reached max limit of tasks: %d at PID: %d, TID: %d\n", MAXPROCS, pid, tid);
        exit(EXIT_FAILURE);
    }
    i = search_thread(tout, *count, tid);
    if (i >= 0) {
        if (pid != 0 && tout[i] == tid && pout[i] == pid) {
#if VERBOSE > 1
            fprintf(stdout, "PID: %d, TID: %d already present\n", pid, tid);
#endif
            return 0;
        } else if (tout[i] == tid && pout[i] == 0) {
            pout[i] = pid;
#if VERBOSE > 1
            fprintf(stdout, "Updating PID to %d for TID %d\n", pid, tid);
#endif
            return 0;
        } else if (tout[i] == tid && pout[i] != 0 && pid == 0) {
#if VERBOSE > 1
            fprintf(stdout, "PID %d for TID %d already known\n", pout[i], tid);
#endif
            return 0;
        }
    }
    pout[*count] = pid;
    tout[*count] = tid;
    if (pfds) {
        pfds[*count] = setup_icount_poll(tid);
    }
#if VERBOSE > 1
    if (pfds) {
        fprintf(stdout, "New thread with PID: %d, TID: %d and PFD: %d appended\n", pid, tid, pfds[*count]);
    } else {
        fprintf(stdout, "New thread with PID: %d, TID: %d appended\n", pid, tid);
    }
#endif
    (*count)++;
    return 1;
}

pid_t find_pid(pid_t *pout, pid_t *tout, unsigned long count, pid_t tid)
{
    unsigned long i;
    for (i=0; i < count; i++) {
        if (tout[i] == tid) {
            return pout[i];
        }
    }
    return 0;
}

void seize_tid(pid_t tid)
{
    pid_t child;
    int wstatus;
#if VERBOSE > 0
    fprintf(stdout, "Seizing Thread with TID: %d\n", tid);
#endif
    ptrace_cmd(PTRACE_SEIZE, tid, 0, \
               (void *)(PTRACE_O_TRACECLONE | \
               PTRACE_O_TRACEFORK | \
               PTRACE_O_TRACEVFORK | \
               PTRACE_O_TRACEEXIT), \
               1, "seize_tid:ptrace_seize");
#if VERBOSE > 2
    child = waitpid(tid, &wstatus, WNOHANG);
    if(child != tid || !WIFSTOPPED(wstatus)) {
        perror("seize_tid");
        fprintf(stderr, "warning: unexpected thread state. child: %d, tid: %d, wstatus: %d\n", child, tid, wstatus);
    }
#endif
}

void continue_tid(pid_t tid, pid_t pid)
{
#if VERBOSE > 0
    fprintf(stdout, "Continuing Thread with TID: %d\n", tid);
#endif
    if (kill(pid, SIGCONT)) {
        perror("continue_tid");
        exit(EXIT_FAILURE);
    }
    ptrace_cmd(PTRACE_CONT, tid, 0, 0, 0, "continue_tid:ptrace_cont");
}

void interrupt_tid(pid_t tid)
{
    pid_t child;
    int wstatus;
#if VERBOSE > 0
    fprintf(stdout, "Interrupting Thread with TID: %d\n", tid);
#endif
    ptrace_cmd(PTRACE_INTERRUPT, tid, 0, 0, 1, "interrupt_tid:ptrace_interrupt");
#if VERBOSE > 2
    child = waitpid(tid, &wstatus, WNOHANG);
    if (child != tid || !WIFSTOPPED(wstatus)) {
        perror("interrupt_tid");
        fprintf(stderr, "warning: unexpected thread state. child: %d, tid: %d, wstatus: %d\n", child, tid, wstatus);
    }
#endif
}

void detach_tid(pid_t tid, pid_t pid)
{
#if VERBOSE > 0
    fprintf(stdout, "Detaching from thread with TID: %d\n", tid);
#endif
    if (kill(pid, SIGSTOP)) {
        perror("detach_tid");
        exit(EXIT_FAILURE);
    }
    ptrace_cmd(PTRACE_DETACH, tid, 0, 0, 0, "detach_tid:ptrace_detach");
}

unsigned long long read_single_icount(int pfd)
{
    unsigned long long val;
    if (read(pfd, &val, sizeof(val)) == sizeof(val)) {
        return val;
    } else {
        fprintf(stderr, "warning: unable to read icount from fd: %d\n", pfd);
        return 0;
    }
}

unsigned long long read_all_icounts(int *pfds, unsigned long *tdone, \
                                    unsigned long long *icounts, unsigned long long *prevcounts, \
                                    unsigned long count)
{
    unsigned long long total = 0, val;
    unsigned long i;
    for (i=0; i < count; i++) {
        /* exited threads: close perfcounter fd   */
        if (tdone[i] && prevcounts[i] == icounts[i]) {
            val = icounts[i];
        } else {
            val = read_single_icount(pfds[i]);
            icounts[i] = val;
        }
#if VERBOSE > 2
        fprintf(stdout, "%llu\t", val);
#endif
        total += val;
    }
#if VERBOSE > 2
    fprintf(stdout, "\n");
#endif
#if VERBOSE > 1
    fprintf(stdout, "%llu\n", total);
#endif
    return total;
}

/* read perf counter values from the group setup by setup_perfcounters_group */
void read_perfcounters_group(int *pfds, unsigned long long *vals, unsigned long count)
{
    unsigned long i;
    for (i=0; i < count; i++) {
        if (read(pfds[i], &vals[i], sizeof(vals[i])) != sizeof(vals[i])) {
            fprintf(stderr, "warning: unable to read perfcounter %lu from fd: %d\n", i, pfds[i]);
        }
    }
}

int handle_exit(pid_t *pout, pid_t *tout, int *pfds, unsigned long *tdone, \
                unsigned long long *icounts, unsigned long count, \
                pid_t child, int wstatus, \
                unsigned long *donecount)
{
    unsigned long i;
    for (i=0; i < count; i++) {
        if (tout[i] == child) {
            if (icounts && pfds) {
                icounts[i] = read_single_icount(pfds[i]);
            }
            /* count if not counted already */
            if (!tdone[i]) {
                tdone[i] = 1;
                (*donecount)++;
#if VERBOSE > 0
            if (icounts && pfds) {
                fprintf(stdout, "Thread with PID: %d, TID: %d exiting after %llu instructions\n", pout[i], tout[i], icounts[i]);
            } else {
                fprintf(stdout, "Thread with PID: %d, TID: %d exiting\n", pout[i], tout[i]);
            }
#endif
                /* continue exiting */
                if (WIFSTOPPED(wstatus)) {
#if VERBOSE > 1
                    fprintf(stdout, "Exiting thread with PID: %d, TID: %d stopped by ptrace with signal %d (%s)\n", \
                            pout[i], tout[i], WSTOPSIG(wstatus), strsignal(WSTOPSIG(wstatus)));
#endif
                    ptrace_cmd(PTRACE_CONT, child, 0, 0, 1, "handle_exit:ptrace_cont");
                } else if (WIFEXITED(wstatus)) {
#if VERBOSE > 1
                    fprintf(stdout, "Thread with PID: %d, TID: %d exiting with status %d\n", \
                            pout[i], tout[i], WEXITSTATUS(wstatus));
#endif
                } else if (WIFSIGNALED(wstatus)) {
#if VERBOSE > 1
                    fprintf(stdout, "Thread with PID: %d, TID: %d terminated by signal %d (%s)\n", \
                            pout[i], tout[i], WTERMSIG(wstatus), strsignal(WTERMSIG(wstatus)));
#endif
                }
                ptrace_cmd(PTRACE_DETACH, child, 0, 0, 0, "handle_exit:ptrace_detach");
                break;
            }
        }
    }

    /* all threads have exited  */
    if (*donecount >= count)
            return 1;
    return 0;
}

/* handle ptrace stop events */
int handle_stop(pid_t *pout, pid_t *tout, int *pfds, unsigned long *tdone, \
                unsigned long long *icounts, unsigned long *count, \
                pid_t child, int wstatus, unsigned long *donecount)
{
    pid_t pid;
    unsigned long tid;
    /* PTRACE_EVENT_EXIT    */
    if (((wstatus>>8) == (SIGTRAP | (PTRACE_EVENT_EXIT<<8)))) {
        return handle_exit(pout, tout, pfds, tdone, icounts, *count, child, wstatus, donecount);
    /* PTRACE_EVENT_CLONE */
    } else if ((wstatus>>8) == (SIGTRAP | (PTRACE_EVENT_CLONE<<8))) {
        ptrace_cmd(PTRACE_GETEVENTMSG, child, 0, &tid, 1, "handle_stop:clone:ptrace_geteventmsg");
        /* PID of the new thread is the same as the tracee  */
        pid = find_pid(pout, tout, *count, child);
        /* append thread if not done already */
        append_thread(pout, tout, pfds, count, pid, tid);
#if VERBOSE > 0
        fprintf(stdout, "New thread created by TID %d with TID: %lu. current count: %lu\n", child, tid, *count);
#endif
        /* continue main thread */
        ptrace_cmd(PTRACE_CONT, child, 0, 0, 1, "handle_stop:clone:ptrace_cont");
    /* PTRACE_EVENT_FORK || PTRACE_EVENT_VFORK  */
    } else if ((wstatus>>8) == (SIGTRAP | (PTRACE_EVENT_FORK<<8)) || \
               (wstatus>>8) == (SIGTRAP | (PTRACE_EVENT_VFORK<<8))) {
        ptrace_cmd(PTRACE_GETEVENTMSG, child, 0, &tid, 1, "handle_stop:fork_vfork:ptrace_geteventmsg");
        /* PID of the new thread is the same as the tid  */
        pid = tid;
        /* append thread if not done already */
        append_thread(pout, tout, pfds, count, pid, tid);
#if VERBOSE > 0
        fprintf(stdout, "New process created by TID %d with PID: %lu. current count: %lu\n", child, tid, *count);
#endif
        /* continue main thread */
        ptrace_cmd(PTRACE_CONT, child, 0, 0, 1, "handle_stop:fork_vfork:ptrace_cont");
    /* PTRACE_EVENT_STOP of new thread   */
    } else if ((wstatus >> 16) == PTRACE_EVENT_STOP && search_thread(tout, *count, child) < 0) {
#if VERBOSE > 1
        fprintf(stdout, "ptrace_event_stop at TID %d with status 0x%x, signal %d (%s)\n", child, \
                wstatus, WSTOPSIG(wstatus), strsignal(WSTOPSIG(wstatus)));
#endif
        /* new thread: append if not done already   */
        append_thread(pout, tout, pfds, count, 0, child);
        /* continue execution */
        ptrace_cmd(PTRACE_CONT, child, 0, 0, 1, "handle_stop:autoattach:ptrace_cont");
    /* group-stop: convert to PTRACE_LISTEN */
    } else if ((wstatus >> 16) == PTRACE_EVENT_STOP && ((WSTOPSIG(wstatus) == SIGSTOP || \
               WSTOPSIG(wstatus) == SIGTSTP ||  WSTOPSIG(wstatus) == SIGTTIN || \
               WSTOPSIG(wstatus) == SIGTTOU))) {
#if VERBOSE > 1
        fprintf(stdout, "group stop at TID %d with signal %d (%s)\n", child, \
                WSTOPSIG(wstatus), strsignal(WSTOPSIG(wstatus)));
#endif
        ptrace_cmd(PTRACE_LISTEN, child, 0, 0, 1, "handle_stop:ptrace_listen");
    /* signal-delivery-stop: pass on the signal */
    } else {
#if VERBOSE > 1
        fprintf(stdout, "signal-delivery stop at TID %d with status 0x%x, signal %d (%s)\n", child, \
                wstatus, WSTOPSIG(wstatus), strsignal(WSTOPSIG(wstatus)));
#endif
        ptrace_cmd(PTRACE_CONT, child, 0, (void *)(long)(WSTOPSIG(wstatus)), 1, "handle_stop:signal_stop:ptrace_cont");
    }
    return 0;
}

