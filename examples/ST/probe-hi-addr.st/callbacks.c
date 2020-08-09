#include "lte_perf.h"
#include "lte_probe.h"

__lte_static char s_pid[] = " pid : ";
__lte_static char s_tid[] = " tid : ";
__lte_static char s_rip[] = " rip : ";
__lte_static char strp[] = "on_start: num_threads=";
__lte_static char strb[] = "on_exit\n";
__lte_static char stri1[] = "on_4003d5\n";
__lte_static char stri2[] = "on_4003e6\n";
__lte_static char sep[] = "------------------------------------------------\n";
__lte_static char hw[] = "Hello, World! (from on4003d5)\n";


#define print_reg(regset, reg) \
   do {__lte_static char s_reg[] = " " #reg ": "; \
       lte_write(1, s_reg, sizeof(s_reg)-1); \
       lte_xiprintfe(1, regset->reg, '\n');}while(0)

int on4003d5(void* ctx)
{
   pid_t pid = lte_getpid();
   pid_t tid = lte_gettid();

   lte_gregset_t* gregs = (lte_gregset_t*)ctx;

   lte_write(1, sep, sizeof(sep)-1);
   lte_write(1, stri1, sizeof(stri1)-1);
   lte_write(1, s_pid, sizeof(s_pid)-1); lte_xiprintfe(1, pid, '\n');
   lte_write(1, s_tid, sizeof(s_tid)-1); lte_xiprintfe(1, tid, '\n');

   print_reg(gregs, rax);
   print_reg(gregs, rsi);
   print_reg(gregs, rdi);
   print_reg(gregs, rdx);

   // Set syscall first arguments
   gregs->rsi = (uint64_t)hw;

   lte_write(1, sep, sizeof(sep)-1);
   lte_fsync(1);

   // return value:
   //   RC_SKIP_INSTRUCTION - skip intercepted instruction
   //   RC_EXEC_INSTRUCTION - execute intercepted instruction
   return RC_SKIP_INSTRUCTION; // skip instruction
}

int on3ff000(void* ctx)
{
   return RC_SKIP_INSTRUCTION;
}

int on4003e6(void* ctx)
{
   pid_t pid = lte_getpid();
   pid_t tid = lte_gettid();

   lte_gregset_t* gregs = (lte_gregset_t*)ctx;

   lte_write(1, sep, sizeof(sep)-1);
   lte_write(1, stri2, sizeof(stri2)-1);
   lte_write(1, s_pid, sizeof(s_pid)-1); lte_xiprintfe(1, pid, '\n');
   lte_write(1, s_tid, sizeof(s_tid)-1); lte_xiprintfe(1, tid, '\n');

   print_reg(gregs, rax);
   print_reg(gregs, rsi);
   print_reg(gregs, rdi);
   print_reg(gregs, rdx);

   // Change syscall second arguments
   gregs->rdx = sizeof(hw)-1;

   lte_write(1, sep, sizeof(sep)-1);
   lte_fsync(1);

   // return value:
   //   RC_SKIP_INSTRUCTION - skip intercepted instruction
   //   RC_EXEC_INSTRUCTION - execute intercepted instruction
   return RC_EXEC_INSTRUCTION; // let syscall to execute
}

static void on_brk(lte_td_t td, int signum, siginfo_t* info, void* ucontext)
{
   ucontext_t* context = (ucontext_t*)ucontext;
   uint64_t rip = context->uc_mcontext.gregs[REG_RIP]-1;

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
