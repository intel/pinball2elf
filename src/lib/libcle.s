.set LIBCLE_DEBUG,1

.set SYS_read,0
.set SYS_write,1
.set SYS_open,2
.set SYS_close,3
.set SYS_mmap,9
.set SYS_munmap,11
.set SYS_rt_sigaction,13
.set SYS_ioctl,16
.set SYS_getpid,39
.set SYS_clone,56
.set SYS_exit,60
.set SYS_wait4,61
.set SYS_fcntl,72
.set SYS_fsync,74
.set SYS_sigaltstack,131
.set SYS_gettid,186
.set SYS_exit_group,231
.set SYS_waitid,247
.set SYS_perf_event_open,298

# call:    %rdi, %rsi, %rdx, %rcx, %r8, %r9
# syscall: %rdi, %rsi, %rdx, %r10, %r8, %r9

.text
.globl lte_syscall
lte_syscall:
    mov      %edi,%eax
    mov      %rsi,%rdi
    mov      %rdx,%rsi
    mov      %rcx,%rdx
    mov      %r8,%r10
    mov      %r9,%r8
    mov      8(%rsp),%r9
    syscall
    ret

.text
.globl lte_mmap
lte_mmap:
    mov      %rcx,%r10
    mov      $SYS_mmap,%eax
    syscall
    ret

.text
.globl lte_munmap
lte_munmap:
    mov      $SYS_munmap,%eax
    syscall
    ret

.text
.globl lte_waitid
lte_waitid:
    mov      %rcx,%r10
    mov      $SYS_waitid,%eax
    syscall
    ret

.text
.globl lte_wait4
lte_wait4:
    mov      %rcx,%r10
    mov      $SYS_wait4,%eax
    syscall
    ret

.text
.globl lte_read
lte_read:
    mov      $SYS_read,%eax
    syscall
    ret

.text
.globl lte_write
lte_write:
    mov      $SYS_write,%eax
    syscall
    ret

.text
.globl lte_close
lte_close:
    mov      $SYS_close,%eax
    syscall
    ret

.text
.globl lte_open
lte_open:
    mov      $SYS_open,%eax
    syscall
    ret

.text
.globl lte_fsync
lte_fsync:
    mov      $SYS_fsync,%eax
    ret

.text
.globl lte_sys_exit
lte_sys_exit:
    mov      $SYS_exit,%eax
    syscall
    ret

.text
.globl lte_exit_group
lte_exit_group:
    mov      $SYS_exit_group,%eax
    syscall
    ret

.text
.globl lte_rt_sigaction
lte_rt_sigaction:
    mov      %rcx,%r10
    mov      $SYS_rt_sigaction,%eax
    syscall
    ret

.text
.globl lte_sigaltstack
lte_sigaltstack:
    mov      $SYS_sigaltstack,%eax
    syscall
    ret

.text
.globl lte_fcntl
lte_fcntl:
    mov      $SYS_fcntl,%eax
    syscall
    ret

.text
.globl lte_ioctl
lte_ioctl:
    mov      $SYS_ioctl,%eax
    syscall
    ret

.text
.globl lte_perf_event_open
lte_perf_event_open:
    mov      %rcx,%r10
    mov      $SYS_perf_event_open,%eax
    syscall
    ret

.text
.globl lte_getpid
lte_getpid:
    mov      $SYS_getpid,%eax
    syscall
    ret

.text
.globl lte_gettid
lte_gettid:
    mov      $SYS_gettid,%eax
    syscall
    ret

.text
.globl lte_strlen
lte_strlen:
        mov     %rdi,%rax
        test    %rdi,%rdi
        je      .strlen.exit
.strlen.loop:
        movzbl  (%rax),%ecx
        add     $0x1,%rax
        test    %cl,%cl
        jne     .strlen.loop
        sub     %rdi,%rax
.strlen.exit:
        retq

.text
.globl lte_strcmp
lte_strcmp:
        movzbl  (%rdi),%eax
        movzbl  (%rsi),%edx
        inc     %rdi
        inc     %rsi
        sub     %edx,%eax
        jnz     .strcmp.exit
        test    %edx,%edx
        jnz     lte_strcmp
.strcmp.exit:
        ret

.ifdef LIBCLE_DEBUG
.text
.globl lte_xiprintfe
lte_xiprintfe:
        mov     %rdx,%rcx
        mov     $16,%rdx
        jmp     lte_iprintfe
.text
.globl lte_diprintfe
lte_diprintfe:
        mov     %rdx,%rcx
        mov     $10,%rdx
.text
.globl lte_iprintfe
lte_iprintfe:
        push    %r13
        push    %r14
        push    %rbx
        xor     %ebx,%ebx     # str length
        and     $0xff,%ecx
        jz      .printf.enter
        mov     $1,%ebx       # str length
        push    %rcx          # new line
        jmp     .printf.enter

.text
.globl lte_xiprintf
lte_xiprintf:
        mov     $16, %rdx
        jmp     lte_iprintf
.text
.globl lte_diprintf
lte_diprintf:
        mov     $10, %rdx
.text
.globl lte_iprintf
lte_iprintf:
        push    %r13
        push    %r14
        push    %rbx
        mov     $1,%rbx       # str length
        pushq   $0x0a         # new line
.printf.enter:
        mov     %rdi, %r13
        mov     %rdx, %r14
        mov     %rsi, %rax
.itostr:
        mov     $0, %rdx
        mov     %r14, %rcx
        div     %rcx
        cmp     $9, %rdx
        jle     .pushc
        add     $39, %rdx
.pushc:
        add     $48, %rdx
        push    %rdx
        inc     %rbx
        cmp     $0, %rax
        jnz     .itostr
.printc:
        cmp     $0, %rbx
        jz      .iprintf.exit
        dec     %rbx
        mov     $1, %rax
        mov     %r13, %rdi
        mov     %rsp, %rsi
        mov     $1, %rdx
        syscall
        add     $8, %rsp
        jmp     .printc
.iprintf.exit:
        pop     %rbx
        pop     %r14
        pop     %r13
        ret
.endif

.text
.globl lte_puts
lte_puts:
        mov     %rdi,%r8
        mov     %rsi,%rdi
        call    lte_strlen
        mov     %r8,%rdi
        mov     %rax,%rdx
        call    lte_write
        ret

.text
.globl lte_putc
lte_putc:
        push    %rsi
        mov     $1,%rax
        mov     %rsp,%rsi
        mov     $1,%rdx
        syscall
        add     $8,%rsp
        ret
