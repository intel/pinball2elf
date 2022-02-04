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

int main(int argc, char *argv[])
{
    pid_t pid, child;
    pid_t pout[MAXPROCS], tout[MAXPROCS];
    unsigned long tdone[MAXPROCS]={0}, donecount = 0;
    unsigned long us, count, i;
    struct timespec begin, end;
    int wstatus, pfds[MAXPROCS];
    unsigned long long icounts[MAXPROCS]={0}, total = 0, limit;
    unsigned long long prevcounts[MAXPROCS]={0};

    if (argc != 4) {
        fprintf(stderr, "usage: %s <pid> <us> <limit>\n", argv[0]);
        fprintf(stderr, "stop a process tree after a given number of total instructions\n");
        fprintf(stderr, "<pid>    :     pid of the root of a SIGSTOPPED pstree\n");
        fprintf(stderr, "<us>     :     polling time period in microseconds\n");
        fprintf(stderr, "<limit>  :     instruction count beyond which to stop (0 for run to completion)\n");
        return EXIT_FAILURE;
    }

    errno = 0;
    pid = parse_long(argv[1], "parse_long: Invalid PID");
    us = parse_long(argv[2], "parse_long: Invalid time period");
    limit = parse_ull(argv[3], "parse_ull: Invalid instruction count");

    count = get_pstree(pid, pout, tout);
    fprintf (stdout, "pstree size: %lu\n", count);
#if VERBOSE > 0
    fprintf (stdout, "printing PID/TID:\n");
    for (i=0; i < count; i++) {
        fprintf(stdout, "%d/%d\n", pout[i], tout[i]);
    }
#endif

    /* make all tids tracees */
    for (i=0; i < count; i++) {
        ptrace_cmd(PTRACE_SEIZE, tout[i], 0, \
                   (void *)(PTRACE_O_TRACECLONE | \
                   PTRACE_O_TRACEFORK | \
                   PTRACE_O_TRACEVFORK | \
                   PTRACE_O_TRACEEXIT), \
                   1, "main:ptrace_seize");
    }

    /* setup icount for all tracees */
    for (i=0; i < count; i++)
        pfds[i] = setup_icount(tout[i]);

    /* restart tracees  */
    for (i=0; i < count; i++)
        ptrace_cmd(PTRACE_CONT, tout[i], 0, 0, 1, "main:restart");

    /* measure time for periodic wakeups   */
    get_monotonic(&begin, "main:monotonic:begin");

    /* main ptrace loop */
    while (1) {
        /* non-blocking wait    */
        child = waitpid(-1, &wstatus, WNOHANG);
        /* no events: read icounts  */
        if (child == 0) {
            total = read_all_icounts(pfds, tdone, icounts, prevcounts, count);
            copy_ull(prevcounts, icounts, count);
            /* desired point reached: stop the tracees  */
            if (limit > 0 && total > limit) {
                for (i=0; i < count; i++) {
                    if (!tdone[i])
                        ptrace_cmd(PTRACE_INTERRUPT, tout[i], 0, 0, 1, "main:ptrace_interrupt");
                }
                break;
            }
        /* valid stopped child: process stop event    */
        } else if (child > 0 && WIFSTOPPED(wstatus)) {
            if (handle_stop(pout, tout, pfds, tdone, icounts, &count, \
                            child, wstatus, &donecount))
                break;
        /* child exited or terminated   */
        } else if (child > 0 && (WIFEXITED(wstatus) || WIFSIGNALED(wstatus))) {
            if (handle_exit(pout, tout, pfds, tdone, icounts, count, \
                            child, wstatus, &donecount))
                break;
        /* error    */
        } else {
            perror("main:waitpid");
            fprintf(stderr, "error: waitpid returned error\n");
            return EXIT_FAILURE;
        }
        /* sleep when no events to process  */
        if (child == 0) {
            get_monotonic(&end, "main:monotonic:end");
            sleep_remaining(begin, end, us);
            get_monotonic(&begin, "main:monotonic:begin");
        }
    }

    /* detach from undetached tracees  */
    for (i=0; i < count; i++) {
        if (!tdone[i])
            ptrace_cmd(PTRACE_DETACH, tout[i], 0, 0, 0, "main:ptrace_detach");
    }

    /* output stats */
    fprintf (stdout, "printing per-thread icounts:(PID/TID: icount)\n");
    total = 0;
    for (i=0; i < count; i++) {
        fprintf(stdout, "%d/%d: %llu\n", pout[i], tout[i], icounts[i]);
        total += icounts[i];
    }
    fprintf(stdout, "total: %llu instructions\n", total);
    return EXIT_SUCCESS;
}

