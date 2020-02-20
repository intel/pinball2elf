#include "lte_perf.h"

__lte_static char s_pid[] = " pid: ";
__lte_static char s_tid[] = " tid: ";
__lte_static char s_rip[] = " rip: ";
__lte_static char strp[] = "on_start:\n num_threads: ";
__lte_static char strb[] = "on_exit:\n";
__lte_static char sep[] = "------------------------------------------------\n";

__lte_static uint64_t s_num_threads;
__lte_static uint64_t bpcount = 1; // Will be changed by the calling script

static void on_brk(lte_td_t td, int signum, siginfo_t* info, void* ucontext)
{
   ucontext_t* context = (ucontext_t*)ucontext;
   uint64_t rip = context->uc_mcontext.gregs[REG_RIP]-1;

   pid_t pid = lte_getpid();
   pid_t tid = lte_gettid();

   uint64_t num_running = __sync_sub_and_fetch(&s_num_threads, 1);
   uint64_t mybpcount = __sync_sub_and_fetch(&bpcount, 1);

   if(mybpcount == 0)
   {
    lte_write(1, sep, sizeof(sep)-1);
    lte_write(1, strb, sizeof(strb)-1);
    lte_write(1, s_pid, sizeof(s_pid)-1); lte_xiprintfe(1, pid, '\n');
    lte_write(1, s_tid, sizeof(s_tid)-1); lte_xiprintfe(1, tid, '\n');
    lte_write(1, s_rip, sizeof(s_rip)-1); lte_xiprintfe(1, rip, '\n');
    lte_write(1, sep, sizeof(sep)-1);
    lte_fsync(1);

    lte_exit_group(0);
   }
}

void on_start(uint64_t num_threads, void* context)
{
   pid_t pid = lte_getpid();

   lte_write(1, sep, sizeof(sep)-1);
   lte_write(1, strp, sizeof(strp)-1); lte_diprintfe(1, num_threads, '\n');
   lte_write(1, s_pid, sizeof(s_pid)-1); lte_xiprintfe(1, pid, '\n');
   lte_write(1, sep, sizeof(sep)-1);
   lte_fsync(1);

   __sync_lock_test_and_set(&s_num_threads, num_threads);

   lte_pe_init(num_threads, 0, NULL);
}

lte_td_t on_thread_start(uint64_t tnum, void* context, uint64_t icount)
{
   lte_pe_set_breakpoint_action(tnum, &on_brk);
   return lte_pe_get_thread_desc(tnum);
}

void __stack_chk_fail() {}
