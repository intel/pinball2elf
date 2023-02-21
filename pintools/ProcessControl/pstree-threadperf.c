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
    pid_t pid, tid, child;
    pid_t pout[MAXPROCS], tout[MAXPROCS];
    unsigned long tdone[MAXPROCS]={0}, donecount = 0;
    unsigned long count, i;
    int wstatus;
    unsigned long long limit, pc;
    int pfds[4];
    /* measure userspace icount, cycles, branch-misses and cache-misses */
    unsigned long long cfgs[4] = {PERF_COUNT_HW_INSTRUCTIONS, PERF_COUNT_HW_CPU_CYCLES, PERF_COUNT_HW_BRANCH_MISSES, PERF_COUNT_HW_CACHE_MISSES};
    unsigned long long vals[4];

    if (argc != 4) {
        fprintf(stderr, "usage: %s <pid> <tid> <limit>\n", argv[0]);
        fprintf(stderr, "stop a process tree at a given thread after <limit> userspace instructions and measure performance\n");
        fprintf(stderr, "<pid>    :     pid of the root of a SIGSTOPPED pstree\n");
        fprintf(stderr, "<tid>    :     tid of the target thread\n");
        fprintf(stderr, "<limit>  :     no. of userspace instructions after which to stop (0 for completion)\n");
        return EXIT_FAILURE;
    }

    errno = 0;
    pid = parse_long(argv[1], "parse_long: Invalid PID");
    tid = parse_long(argv[2], "parse_long: Invalid TID");
    limit = parse_ull(argv[3], "parse_ull: Invalid count");

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

    /* setup perfcounters for the target thread */
    for (i=0; i < count; i++)
        if (tout[i] == tid)
            break;
    if (i < count) {
        setup_perfcounters_group(tout[i], limit, pfds, cfgs, 4);
    } else {
        fprintf(stderr, "unable to find TID: %d in pstree at %d\n", pid, tid);
        return EXIT_FAILURE;
    }

    /* restart tracees  */
    for (i=0; i < count; i++)
        continue_tid(tout[i], pout[i]);

    /* main ptrace loop */
    while (1) {
        /* blocking wait    */
        child = waitpid(-1, &wstatus, 0);
        /* SIGIO from the desired thread */
        if (child == tid && WIFSTOPPED(wstatus) && WSTOPSIG(wstatus) == SIGIO) {
#if VERBOSE > 1
            fprintf(stdout, "SIGIO stop at TID %d with status 0x%x\n", child, wstatus);
#endif
            fprintf (stdout, "paused pstree (root PID: %d) at TID: %d\n", pid, tid);
            /* desired point reached: stop the tracees  */
            for (i=0; i < count; i++) {
                if (!tdone[i])
                    interrupt_tid(tout[i]);
            }
            break;
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
    /* measure performance  */
    read_perfcounters_group(pfds, vals, 4);

    /* detach from undetached tracees  */
    for (i=0; i < count; i++) {
        if (!tdone[i])
            detach_tid(tout[i], pout[i]);
    }

    /* output stats */
    fprintf (stdout, "perf counter stats below:\n");
    fprintf (stdout, "userspace instructions:\t%llu\n", vals[0]);
    fprintf (stdout, "cycles:\t%llu\n", vals[1]);
    fprintf (stdout, "branch-misses:\t%llu\n", vals[2]);
    fprintf (stdout, "cache-misses:\t%llu\n", vals[3]);
    return EXIT_SUCCESS;
}

