#include "lte_perf.h"

__lte_static char s_pid[] = " pid: ";
__lte_static char s_tid[] = " tid: ";
__lte_static char s_rip[] = " rip: ";
__lte_static char strp[] = "on_start: num_threads=";
__lte_static char strb[] = "on_exit\n";
__lte_static char sep[] = "------------------------------------------------\n";


void on_exit(ucontext_t* context)
{
   // gregs[REG_RIP] points to byte next to INT3
   uint64_t rip = context->uc_mcontext.gregs[REG_RIP] - 1; // address of breakpoint

   pid_t pid = lte_getpid();
   pid_t tid = lte_gettid();

   lte_write(1, sep, sizeof(sep)-1);
   lte_write(1, strb, sizeof(strb)-1);
   lte_write(1, s_pid, sizeof(s_pid)-1); lte_xiprintfe(1, pid, '\n');
   lte_write(1, s_tid, sizeof(s_tid)-1); lte_xiprintfe(1, tid, '\n');
   lte_write(1, s_rip, sizeof(s_rip)-1); lte_xiprintfe(1, rip, '\n');
   lte_write(1, sep, sizeof(sep)-1);
   lte_fsync(1);

   // Note that instruction at which breakpoint is set won't be executed
   lte_exit_group(0);
}

void on_syscall(ucontext_t* context)
{
   __lte_static char str_hello[] = "Hello from syscall handler!\n";


   // x86-64 syscall ABI:
   //
   // system call # passed through rax
   //
   // arg1  arg2  arg3  arg4  arg5  arg6
   // ──────────────────────────────────
   // rdi   rsi   rdx   r10   r8    r9
   //
   // ret vals:  rax or rax/rdx

   // Obtain syscall arguments
   int fd = context->uc_mcontext.gregs[REG_RDI];
   const void* buf = (const void*)context->uc_mcontext.gregs[REG_RSI];
   size_t count = context->uc_mcontext.gregs[REG_RDX];
   int rc;
   // Handle intercepted syscall. As an example we firstly write original string
   // following additional string str_hello
   rc = lte_write(fd, buf, count);
   rc = lte_write(fd, str_hello, lte_strlen(str_hello));
   // Set syscall ret code
   context->uc_mcontext.gregs[REG_RAX] = rc;

   // Set rip to point to instruction next to syscall
   //   gregs[REG_RIP] points to byte next to INT3
   //   SYSCALL instruction is 2 byte in length
   //   INT3 instruction is 1 byte in length
   context->uc_mcontext.gregs[REG_RIP] += (2 - 1);
}

static void on_brk(lte_td_t td, int signum, siginfo_t* info, void* ucontext)
{
   ucontext_t* context = (ucontext_t*)ucontext;

   // gregs[REG_RIP] points to byte next to INT3
   // INT3 instruction is 1 byte in length
   uint64_t bp_addr = context->uc_mcontext.gregs[REG_RIP] - 1; // address of breakpoint

   switch(bp_addr)
   {
      case 0x4003f2: // address of trace end
      {
         on_exit(context);
      }
      case 0x4003eb: // address of write syscall
      {
         on_syscall(context);
      }
   }
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