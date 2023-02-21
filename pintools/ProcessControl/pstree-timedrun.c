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

/* global variable: set this to pause and exit now  */
static unsigned int pstree_stop_now = 0;

/* SIGUSR1 handler  */
void usr1_handler(int signum)
{
#if VERBOSE > 0
    fprintf (stdout, "usr1_handler: signum: %d(%s), pstree_stop_now: %d\n", signum, strsignal(signum), pstree_stop_now);
#endif
    if (signum != SIGUSR1)
        return;
    pstree_stop_now = 1;
}

int main(int argc, char *argv[])
{
    pid_t pid, child, thispid;
    pid_t pout[MAXPROCS], tout[MAXPROCS];
    unsigned long tdone[MAXPROCS]={0}, donecount = 0;
    unsigned long us, count, i;
    struct timespec begin, end, origin;
    int wstatus;
    unsigned long long total = 0;
    double limit;
    // signal handlers for asynchronous exit
    sigset_t all_mask, usr1_mask;
    struct sigaction usr1_action;
    thispid = getpid();

    if (argc != 4) {
        fprintf(stderr, "usage: %s <pid> <us> <limit>\n", argv[0]);
        fprintf(stderr, "stop a process tree after executing for a given number of seconds or on receiving SIGUSR1 asynchronously\n");
        fprintf(stderr, "<pid>    :     pid of the root of a SIGSTOPPED pstree\n");
        fprintf(stderr, "<us>     :     polling time period in microseconds\n");
        fprintf(stderr, "<limit>  :     decimal no. of seconds after which to stop (0 for run to completion)\n");
        return EXIT_FAILURE;
    }

    /* block all signals    */
#if VERBOSE > 0
    fprintf (stdout, "blocking all signals for PID: %d\n", thispid);
#endif
    sigfillset(&all_mask);
    sigprocmask(SIG_BLOCK, &all_mask, NULL);

    /* install SIGUSR1 handler   */
#if VERBOSE > 0
    fprintf (stdout, "installing SIGUSR1 handler for PID: %d\n", thispid);
#endif
    sigfillset(&usr1_mask);
    sigdelset(&usr1_mask, SIGUSR1);
    usr1_action.sa_handler = usr1_handler;
    usr1_action.sa_mask = usr1_mask;
    usr1_action.sa_flags = 0;
    sigaction(SIGUSR1, &usr1_action, NULL);
    fprintf (stdout, "controller PID: %d, address of global variable for asynchronous exit: %p\n", thispid, &pstree_stop_now);

    /* command line arguments   */
    errno = 0;
    pid = parse_long(argv[1], "parse_long: Invalid PID");
    us = parse_long(argv[2], "parse_long: Invalid polling period");
    limit = parse_double(argv[3], "parse_double: Invalid duration");

    count = get_pstree(pid, pout, tout);
    fprintf (stdout, "pstree size: %lu\n", count);
#if VERBOSE > 0
    fprintf (stdout, "printing PID/TID:\n");
    for (i=0; i < count; i++) {
        fprintf(stdout, "%d/%d\n", pout[i], tout[i]);
    }
#endif

    /* make all tids tracees */
    for (i=0; i < count; i++)
        seize_tid(tout[i]);

    /* restart tracees  */
    for (i=0; i < count; i++)
        continue_tid(tout[i], pout[i]);

    /* start time */
    get_monotonic(&origin, "main:monotonic:origin");
    /* measure time for periodic wakeups   */
    get_monotonic(&begin, "main:monotonic:begin");

    /* main ptrace loop */
    while (1) {
        /* unblock signals only while waiting */
        sigprocmask(SIG_UNBLOCK, &all_mask, NULL);
        /* non-blocking wait    */
        child = waitpid(-1, &wstatus, WNOHANG);
        /* block signals  again */
        sigprocmask(SIG_BLOCK, &all_mask, NULL);
        /* no events: are we done? */
        if (child == 0) {
	    total = elapsed_nsec(origin, begin);
            /* desired point reached or asynchronous exit: stop the tracees  */
            if ((limit > 0 && total >= limit*1000000000LL) || pstree_stop_now) {
                for (i=0; i < count; i++) {
                    if (!tdone[i])
                        interrupt_tid(tout[i]);
                }
                break;
            }
            /* sleep when no events to process  */
            get_monotonic(&end, "main:monotonic:end");
            sleep_remaining(begin, end, us);
            get_monotonic(&begin, "main:monotonic:begin");
        /* valid stopped child: process stop event    */
        } else if (child > 0 && WIFSTOPPED(wstatus)) {
            if (handle_stop(pout, tout, NULL, tdone, NULL, &count, \
                            child, wstatus, &donecount))
                break;
        /* child exited or terminated   */
        } else if (child > 0 && (WIFEXITED(wstatus) || WIFSIGNALED(wstatus))) {
            if (handle_exit(pout, tout, NULL, tdone, NULL, count, \
                            child, wstatus, &donecount))
                break;
        /* error    */
        } else {
            perror("main:waitpid");
            fprintf(stderr, "error: waitpid returned error\n");
            return EXIT_FAILURE;
        }
    }
    /* finish time */
    get_monotonic(&end, "main:monotonic:complete");
    total = elapsed_nsec(origin, end);

    /* detach from undetached tracees  */
    for (i=0; i < count; i++) {
        if (!tdone[i])
            detach_tid(tout[i], pout[i]);
    }
    /* done */
    fprintf(stdout, "finished running for total: %llu nanoseconds\n", total);
    return EXIT_SUCCESS;
}

