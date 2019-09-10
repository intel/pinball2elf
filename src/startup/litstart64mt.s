#BEGIN_LEGAL 
#BSD License 
#
#Copyright (c)2019 Intel Corporation. All rights reserved.
#
#Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
#
#1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
#
#2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
#
#3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.
#
#THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#END_LEGAL
.equ REMAP_STACK,1
.equ CLOSE_EXECFD,1
.equ CALLBACKS,1
.equ SYNC_THREADS,1
.equ ROI,1
.equ MONITOR_THREAD,1
.equ ENABLE_PERF,1
.equ PARSE_OPT,1

.include "litstart64mt_defs.s"

.set O_RDONLY,0x0
.set PROT_READ,0x1
.set PROT_WRITE,0x2
.set PROT_EXEC,0x4
.set PROT_FLAGS,PROT_READ|PROT_WRITE|PROT_EXEC
.set MAP_PRIVATE,0x2
.set MAP_FIXED,0x10
.set MAP_ANONYMOUS,0x20
.set MAP_GROWSDOWN,0x100
.set MAP_FLAGS,MAP_PRIVATE|MAP_FIXED
.set MAP_STACK_FLAGS,MAP_PRIVATE|MAP_ANONYMOUS|MAP_GROWSDOWN
.set SIGCHLD,17
.set CLONE_VM,0x100
.set CLONE_FS,0x200
.set CLONE_FILES,0x400
.set CLONE_SIGHAND,0x800
.set CLONE_PARENT,0x8000
.set CLONE_THREAD,0x10000
.set CLONE_SYSVSEM,0x00040000
.set CLONE_IO,0x80000000
#.set CLONE_FLAGS,CLONE_VM|CLONE_FS|CLONE_FILES|CLONE_SIGHAND|CLONE_IO|SIGCHLD
#.set CLONE_THREAD_FLAGS,CLONE_VM|CLONE_FS|CLONE_FILES|CLONE_SIGHAND|CLONE_PARENT|CLONE_THREAD|CLONE_IO|SIGCHLD
.set CLONE_FLAGS,CLONE_VM|CLONE_FS|CLONE_FILES|CLONE_SIGHAND|CLONE_SYSVSEM|SIGCHLD
.set CLONE_THREAD_FLAGS,CLONE_VM|CLONE_FS|CLONE_FILES|CLONE_SIGHAND|CLONE_SYSVSEM|SIGCHLD|CLONE_THREAD
.set FUTEX_WAIT,0
.set FUTEX_WAKE,1
.set FUTEX_PRIVATE_FLAG,128
.set FUTEX_WAIT_FLAGS,FUTEX_WAIT|FUTEX_PRIVATE_FLAG
.set FUTEX_WAKE_FLAGS,FUTEX_WAKE|FUTEX_PRIVATE_FLAG
.set PERF_EVENT_IOC_RESET,2403
.set PERF_EVENT_IOC_REFRESH,2402
.set PERF_EVENT_IOC_ENABLE,2400
.set PERF_IOC_FLAG_GROUP,1
.set SYS_open,2
.set SYS_close,3
.set SYS_mmap,9
.set SYS_munmap,11
.set SYS_clone,56
.set SYS_exit,60
.set SYS_wait4,61
.set SYS_futex,202

##############################################################################
#   0: threads counter
#   4: futex 1
#   8: control mask (from argv)
#  16: futex 2
# ...: padding
# -16: thread icount
#  -8: stack place holder (aligned to 8 byte boundary)
#   0: cpu_state(s) (aligned to 64 byte boundary)
##############################################################################

.set nthreads,0
.set futex1,4
.set cntrl_mask,8
.set futex2,16

##############################################################################
#  callbacks
##############################################################################
.text
.ifdef CALLBACKS
pbs.cbk_on_start:
    movabs    $elfie_on_start,%r12
    jmp       pbs.cbk
pbs.cbk_on_exit:
    movabs    $elfie_on_exit,%r12
    jmp       pbs.cbk
pbs.cbk_on_thread_start:
    movabs    $elfie_on_thread_start,%r12
pbs.cbk:
    mov       %rsp,%r14
    mov       $0x400000,%ebp
    xor       %edi,%edi
    mov       %ebp,%esi
    mov       $PROT_FLAGS,%edx
    mov       $MAP_STACK_FLAGS,%r10d
    mov       $SYS_mmap,%eax
    syscall
    lea       (%rbp,%rax),%rsp
    mov       %rbx,%rdi                # thread id / number of threads
    lea       8(%r14),%rsi             # thread context
    mov       -8(%r14),%rdx            # thread icount
    callq     *%r12
    mov       %rax,%r12
    mov       %rsp,%rdi
    mov       %ebp,%esi
    sub       %rbp,%rdi
    mov       $SYS_munmap,%eax
    syscall
    mov       %r14,%rsp
    ret
.endif
##############################################################################


##############################################################################
#  monitor thread
##############################################################################
.globl _start
_start:
.ifdef MONITOR_THREAD
    mov       $CLONE_FLAGS,%edi
    mov       %rsp,%rsi
    mov       $SYS_clone,%eax
    syscall
    test      %rax,%rax
    jz        pbs.start_threads
    mov       %eax,%edi
    xor       %esi,%esi
    mov       $0,%edx #$SIGCHLD,%edx
    xor       %r10,%r10
    mov       $SYS_wait4,%eax
    syscall
.ifdef CALLBACKS
    call      pbs.cbk_on_exit          #.byte 0xe9,0,0,0,0
.endif
    jmp       pbs.exit
pbs.start_threads:
.endif
##############################################################################

.ifdef PARSE_OPT
    call      pbs.parse_args
.endif

##############################################################################
#  stack remapping
##############################################################################
.ifdef REMAP_STACK
    mov       8(%rsp),%rdi             # executable name
    xor       %esi,%esi                # O_RDONLY
    mov       $SYS_open,%eax
    syscall
    mov       %rax,%r12
    movabs    $0xffffffffffffffff,%rbp # array of addresses of stack pages
    movabs    $0xffffffffffffffff,%r14 # offset of stack pages in ELFie
    mov       $0xffffffff,%ebx         # number of stack pages
pbs.remap_page:
    mov       (%rbp),%rdi
    mov       $0x1000,%esi
    mov       $SYS_munmap,%eax
    syscall
    mov       (%rbp),%rdi
    mov       $0x1000,%esi
    mov       $PROT_FLAGS,%edx
    mov       $MAP_FLAGS,%r10d
    mov       %r12,%r8
    mov       %r14,%r9
    mov       $SYS_mmap,%eax
    syscall
    add       $0x1000,%r14
    add       $8,%rbp
    sub       $1,%ebx
    jnz       pbs.remap_page
.ifdef CLOSE_EXECFD
    mov       %r12,%rdi
    mov       $SYS_close,%eax
    syscall
.endif
.endif
##############################################################################

##############################################################################
#  thread creation
##############################################################################
pbs.start:
    mov       $1,%ebx
    movabs    $cpu_state,%rsp
.ifdef SYNC_THREADS
    lea       -1(%rsp),%r15
.endif
.ifdef CALLBACKS
    call      pbs.cbk_on_start         #.byte 0xe9,0,0,0,0
.endif
pbs.create_thread:
    dec       %ebx
    jz        pbs.init_thread
    mov       $CLONE_THREAD_FLAGS,%edi
    mov       %rsp,%rsi
    mov       $SYS_clone,%eax
    syscall
    test      %rax,%rax
    jz        pbs.init_thread
    add       $state_size,%rsp
    jmp       pbs.create_thread
pbs.exit:
    xor       %edi,%edi
    mov       $SYS_exit,%eax
    syscall
##############################################################################

##############################################################################
#  parse args
##############################################################################
.ifdef PARSE_OPT
pbs.parse_args:
    mov       8(%rsp),%r14             # argc
    mov       16(%rsp),%rdi            # argv
    xor       %r13, %r13
    jmp       pbs.argloop.enter
pbs.argloop:
    dec       %r14
    jz        pbs.argloop.exit
pbs.argloop.opt1:
.ifdef PARSE_OPT_ARGC_GT_2
    mov       %rdi,%r12
.endif
    call      pbs.argcmp.opt1
.ifdef PARSE_OPT_ARGC_GT_2
    jnz       pbs.argloop.opt2
.else
    jnz       pbs.argloop.next
.endif
    or        $1,%r13
    jmp       pbs.argloop
.ifdef PARSE_OPT_ARGC_GT_2
pbs.argloop.opt2:
    mov       %r12,%rdi
    call      pbs.argcmp.opt2
    jnz       pbs.argloop.next
    or        $2,%r13
    jmp       pbs.argloop
.endif
pbs.argloop.next:
    test      %eax,%eax
    jz        pbs.argloop
pbs.argloop.enter:
    movzbl    (%rdi),%eax
    inc       %rdi
    jmp       pbs.argloop.next
pbs.argloop.exit:
    movabs    $cpu_state,%rdi
    xchg      %r13,(%rdi)
    ret
pbs.str.opt1:
    .string   "-futex"
pbs.argcmp.opt1:
    lea        pbs.str.opt1(%rip),%rsi
pbs.argcmp:
    movzbl    (%rdi),%eax
    movzbl    (%rsi),%edx
    inc       %rdi
    inc       %rsi
    sub       %eax,%edx
    jnz       pbs.argcmp.exit
    test      %eax,%eax
    jnz       pbs.argcmp
pbs.argcmp.exit:
    ret
.endif
##############################################################################

##############################################################################
#  thread initialization
##############################################################################
pbs.init_thread:
.ifdef CALLBACKS
    call      pbs.cbk_on_thread_start  #.byte 0xe9,0,0,0,0
    mov       %r12,%r13
.endif
    mov       $0x03,%eax               # xfeatures_lo_dword mask
    mov       $0x00,%edx               # xfeatures_hi_dword mask
    xrstor    (%rsp)
    add       $state.fs_desc_offs,%rsp
    mov       $0x9a,%eax
    mov       $0x1,%edi
    mov       %rsp,%rsi
    mov       $state.desc_size,%edx
    syscall
    test      %rax,%rax
    jnz       pbs.exit
    mov       state.fs_offs-state.fs_desc_offs(%rsp),%fs
    mov       $0x9e,%eax
    mov       $0x1002,%edi
    mov       state.fs_base_offs-state.fs_desc_offs(%rsp),%rsi
    syscall
    test      %rax,%rax
    jnz       pbs.exit
    mov       $0x9a,%eax
    mov       $0x1,%edi
    lea       state.gs_desc_offs-state.fs_desc_offs(%rsp),%rsi
    mov       $state.desc_size,%edx
    syscall
    test      %rax,%rax
    jnz       pbs.exit
    mov       state.gs_offs-state.fs_desc_offs(%rsp),%gs
    mov       $0x9e,%eax
    mov       $0x1001,%edi
    mov       state.gs_base_offs-state.fs_desc_offs(%rsp),%rsi
    syscall
    test      %rax,%rax
    jnz       pbs.exit
    add       $state.gpr_state_offs-state.fs_desc_offs,%rsp

##############################################################################
#  thread synchronization
##############################################################################
.ifdef SYNC_THREADS
    testl     $1,cntrl_mask(%r15)
    jz        pbs.spinloop_barrier
    test      %ebx,%ebx
    jz        pbs.sync_master_threads
    lock subl $1,nthreads(%r15)        # num_threads
    jnz       pbs.wait                 # if (num_threads != 0)
    lea       futex1(%r15),%rdi        # futex_addr
    call      pbs.sys_futex_wake
pbs.wait:
    lea       futex2(%r15),%rdi        # futex_addr
    call      pbs.sys_futex_wait
    jmp       pbs.exit_barrier
pbs.sys_futex_wait:
    mov       $FUTEX_WAIT_FLAGS,%esi   # futex_op
    xor       %edx,%edx                # futex_val
    jmp       pbs.sys_futex
pbs.sys_futex_wake:
    mov       $FUTEX_WAKE_FLAGS,%esi   # futex_op
    mov       $0xffffffff,%edx         # futex_val
    lock or   %esi,(%rdi)              # set futex
pbs.sys_futex:
    xor       %r10,%r10                # timeout
    xor       %r8,%r8                  # uaddr2
    xor       %r9,%r9                  # val3
    mov       $SYS_futex,%eax
    syscall
    ret
pbs.sync_master_threads:
    lock subl $1,nthreads(%r15)        # num_threads
    jz        pbs.wake                 # if (num_threads == 0)
    lea       futex1(%r15),%rdi        # futex_addr
    call      pbs.sys_futex_wait
pbs.wake:
    lea       futex2(%r15),%rdi        # futex_addr
    mov       $0x24711,%eax            # simics magic1
    cpuid                              # simics magic1
    call      pbs.sys_futex_wake
    jmp       pbs.exit_barrier
pbs.spinloop_barrier:
    xor       %ebp,%ebp
    not       %ebp
    lock add  %ebp,nthreads(%r15)      # num_threads
    test      %ebx,%ebx
    jz        pbs.wait_threads
pbs.barrier_loop:
    test      %ebp,futex1(%r15)        # futex
    jnz       pbs.exit_barrier
    pause
    jmp       pbs.barrier_loop
pbs.wait_threads:
    test      %ebp,nthreads(%r15)      # num_threads
    pause
    jnz       pbs.wait_threads
    mov       $0x24711,%eax            # simics magic1
    cpuid                              # simics magic1
    lock or   %ebp,futex1(%r15)        # set futex
pbs.exit_barrier:
.endif
##############################################################################
#  enable perf
##############################################################################
.ifdef ENABLE_PERF
    test      %r13,%r13
    jz        pbs.perf.end
    mov       (%r13),%ebx              # thread info ptr
pbs.perf.reset:
    mov       %ebx,%edi
    mov       $0x2403,%esi
    mov       $0x1,%edx
    mov       $16,%eax
    syscall
pbs.perf.enable:
    mov       %ebx,%edi
    mov       $0x2400,%esi
    mov       $0x1,%edx
    mov       $16,%eax
    syscall
pbs.perf.refresh:
    mov       %ebx,%edi
    mov       $0x2402,%esi
    mov       $0x1,%edx
    mov       $16,%eax
    syscall
pbs.perf.end:
.endif
##############################################################################
    pop       %rdi
    pop       %rsi
    pop       %rbp
    pop       %r8
    pop       %r9
    pop       %r10
    pop       %r11
    pop       %r12
    pop       %r13
    pop       %r14
    pop       %r15
##############################################################################
#  ROI marks
##############################################################################
.ifdef ROI
    test      %ebx,%ebx
    jnz       pbs.mark_end
pbs.mark:
    mov       $1,%eax                  # sniper magic
    xchg      %bx,%bx                  # sniper magic
    mov       $1,%ebx                  # ssc
    fs addr32 nop                      # ssc
    mov       $0x14711, %eax           # simics magic2
    cpuid                              # simics magic2
pbs.mark_end:
.endif
##############################################################################
    pop       %rdx
    pop       %rcx
    pop       %rbx
    pop       %rax
    popfq
    ret
pbs.tst.start:
    pop       %rsp
    jmpq      *(%rip)
    .quad     trace.start
pbs.tst.end:
