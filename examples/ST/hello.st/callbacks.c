#include <stdio.h>
#include <unistd.h>
#include <sys/syscall.h>
#include <errno.h>
#include <stdlib.h>
#include <string.h>
#include <sys/wait.h>
#include <linux/futex.h>
#include <sys/time.h>
#include "lte_perf.h"
#include <sys/mman.h>
#include <sched.h>


__lte_static char s_pid[] = " pid: ";
__lte_static char s_tid[] = " tid: ";
__lte_static char s_rip[] = " rip: ";
__lte_static char strp[] = "on_start: num_threads=";
__lte_static char strb[] = "on_exit\n";
__lte_static char sep[] = "------------------------------------------------\n";


static void on_brk(lte_td_t td, int signum, siginfo_t* info, void* ucontext)
{
   ucontext_t* context = (ucontext_t*)ucontext;
   uint64_t rip = context->uc_mcontext.gregs[16]-1;//REG_RIP];

   pid_t pid = lte_getpid();
   pid_t tid = lte_gettid();

   lte_write(1, sep, sizeof(sep)-1);
   lte_write(1, strb, sizeof(strb)-1);
   lte_write(1, s_pid, sizeof(s_pid)-1); lte_xiprintfe(1, pid, '\n');
   lte_write(1, s_tid, sizeof(s_tid)-1); lte_xiprintfe(1, tid, '\n');
   lte_write(1, s_rip, sizeof(s_rip)-1); lte_xiprintfe(1, rip, '\n');
   lte_write(1, sep, sizeof(sep)-1);
   lte_fsync(1);

   lte_exit_group(0);
}

void on_start(uint64_t num_threads, void* context)
{
   pid_t pid = lte_getpid();
   pid_t tid = lte_gettid();

   lte_write(1, sep, sizeof(sep)-1);
   lte_write(1, strp, sizeof(strp)-1); lte_diprintfe(1, num_threads, '\n');
   lte_write(1, s_pid, sizeof(s_pid)-1); lte_xiprintfe(1, pid, '\n');
   lte_write(1, s_tid, sizeof(s_tid)-1); lte_xiprintfe(1, tid, '\n');
   lte_write(1, sep, sizeof(sep)-1);
   lte_fsync(1);

   lte_pe_init(num_threads, 0, NULL);
   lte_pe_set_breakpoint_action(0, &on_brk);
}

void __stack_chk_fail() {}
