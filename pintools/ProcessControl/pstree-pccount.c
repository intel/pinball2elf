#include "pstree.h"

int main(int argc, char *argv[])
{
    pid_t pid, tid, child;
    pid_t pout[MAXPROCS], tout[MAXPROCS];
    unsigned long tdone[MAXPROCS]={0}, donecount = 0;
    unsigned long count, i;
    int wstatus, pfd;
    unsigned long long limit, pc;

    if (argc != 5) {
        fprintf(stderr, "usage: %s <pid> <tid> <pc> <limit>\n", argv[0]);
        fprintf(stderr, "stop a process tree at a given thread after <limit> occurrences of an instruction at <pc>\n");
        fprintf(stderr, "<pid>    :     pid of the root of a SIGSTOPPED pstree\n");
        fprintf(stderr, "<tid>    :     tid of the target thread\n");
        fprintf(stderr, "<pc>     :     instruction address of the target instruction\n");
        fprintf(stderr, "<limit>  :     no. of occurrences of <pc> after which to stop\n");
        return EXIT_FAILURE;
    }

    errno = 0;
    pid = parse_long(argv[1], "parse_long: Invalid PID");
    tid = parse_long(argv[2], "parse_long: Invalid TID");
    pc = parse_ull(argv[3], "parse_ull: Invalid instruction address");
    limit = parse_ull(argv[4], "parse_ull: Invalid count");

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

    /* setup pc/count for the target thread */
    for (i=0; i < count; i++)
        if (tout[i] == tid)
            break;
    if (i < count) {
        pfd = setup_pccount(tout[i], (void *)pc, limit);
    } else {
        fprintf(stderr, "unable to find TID: %d in pstree at %d\n", pid, tid);
        return EXIT_FAILURE;
    }


    /* restart tracees  */
    for (i=0; i < count; i++)
        ptrace_cmd(PTRACE_CONT, tout[i], 0, 0, 1, "main:restart");

    /* main ptrace loop */
    while (1) {
        /* blocking wait    */
        child = waitpid(-1, &wstatus, 0);
        /* SIGIO from the desired thread */
        if (child == tid && WIFSTOPPED(wstatus) && WSTOPSIG(wstatus) == SIGIO) {
#if VERBOSE > 1
            fprintf(stdout, "SIGIO stop at TID %d with status 0x%x\n", child, wstatus);
#endif
            /* desired point reached: stop the tracees  */
            for (i=0; i < count; i++) {
                if (!tdone[i])
                    ptrace_cmd(PTRACE_INTERRUPT, tout[i], 0, 0, 1, "main:ptrace_interrupt");
            }
            /* output stats */
            fprintf (stdout, "paused pstree (root PID: %d) at TID: %d , IP: 0x%llx, after %llu occurrences\n", \
                     pid, tid, pc, limit);
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

    /* detach from undetached tracees  */
    for (i=0; i < count; i++) {
        if (!tdone[i])
            ptrace_cmd(PTRACE_DETACH, tout[i], 0, 0, 0, "main:ptrace_detach");
    }

    return EXIT_SUCCESS;
}

