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
.include "litstart64_defs.s"

.text
.globl _start
_start:
    movabs   $cpu_state,%rsp
    mov      $0x03,%eax               # xfeatures_lo_dword mask
    mov      $0x00,%edx               # xfeatures_hi_dword mask
    xrstor   (%rsp)
    add      $state.fs_desc_offs,%rsp
    mov      $0x9a,%rax
    mov      $0x1,%rdi
    mov      %rsp,%rsi
    mov      $state.desc_size,%rdx
    syscall
    test     %rax,%rax
    jnz      pbs.exit
    mov      state.fs_offs-state.fs_desc_offs(%rsp),%fs
    mov      $0x9e,%rax
    mov      $0x1002,%rdi
    mov      state.fs_base_offs-state.fs_desc_offs(%rsp),%rsi
    syscall
    test     %rax,%rax
    jnz      pbs.exit
    mov      $0x9a,%rax
    mov      $0x1,%rdi
    lea      state.gs_desc_offs-state.fs_desc_offs(%rsp),%rsi
    mov      $state.desc_size,%rdx
    syscall
    test     %rax,%rax
    jnz      pbs.exit
    mov      state.gs_offs-state.fs_desc_offs(%rsp),%gs
    mov      $0x9e,%rax
    mov      $0x1001,%rdi
    mov      state.gs_base_offs-state.fs_desc_offs(%rsp),%rsi
    syscall
    test     %rax,%rax
    jnz      pbs.exit
    add      $state.gpr_state_offs-state.fs_desc_offs,%rsp
    popfq
    pop      %rdi
    pop      %rsi
    pop      %rbp
    pop      %rbx
    pop      %rdx
    pop      %rcx
    pop      %rax
    pop      %r8
    pop      %r9
    pop      %r10
    pop      %r11
    pop      %r12
    pop      %r13
    pop      %r14
    pop      %r15
    pop      %rsp
    jmpq     *pbs.trace.start(%rip)
.text
.globl pbs.trace.start
pbs.trace.start:
    .quad trace.start
.text
.globl pbs.exit
pbs.exit:
    mov $0x0,%rdi
    mov $0x3c,%rax
    syscall
