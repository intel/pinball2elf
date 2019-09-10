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
.include "litstart32mt_defs.s"

.set CLONE_VM,0x100
.set CLONE_FS,0x200
.set CLONE_FILES,0x400
.set CLONE_SIGHAND,0x800
.set CLONE_PARENT,0x8000
.set CLONE_THREAD,0x10000
.set CLONE_IO,0x80000000
.set CLONE_FLAGS,CLONE_VM|CLONE_FS|CLONE_FILES|CLONE_SIGHAND|CLONE_PARENT|CLONE_THREAD|CLONE_IO
.set SYS_exit,0x01
.set SYS_clone,0x78
.set SYS_modify_ldt,0x7b

.text
.globl _start
_start:
    mov      $1,%ebp
    mov      $cpu_state,%esp
.create_thread:
    dec      %ebp
    jz       .thread_start
    mov      $CLONE_FLAGS,%ebx
    mov      %esp,%ecx
    mov      $SYS_clone,%eax
    int      $0x80
    test     %eax,%eax
    jz       .thread_start
    add      $state_size,%esp
    jmp      .create_thread
.exit:
    mov      $0x0,%ebx
    mov      $SYS_exit,%eax
    int      $0x80
.thread_start:
    fxrstor  (%esp)
    add      $state.fs_desc_offs,%esp
    mov      $SYS_modify_ldt,%eax
    mov      $0x1,%ebx
    mov      %esp,%ecx
    mov      $state.desc_size,%edx
    int      $0x80
    test     %eax,%eax
    jne      .exit
    mov      state.fs_offs-state.fs_desc_offs(%esp),%fs
    mov      $SYS_modify_ldt,%eax
    mov      $0x1,%ebx
    lea      state.gs_desc_offs-state.fs_desc_offs(%esp),%ecx
    mov      $state.desc_size,%edx
    int      $0x80
    test     %eax,%eax
    jne      .exit
    mov      state.gs_offs-state.fs_desc_offs(%esp),%gs
    add      $state.gpr_state_offs-state.fs_desc_offs,%esp
    popa
    popf
    ret
.tst.t0:
    pop      %esp
    jmp      .t0.start
.tst.t1:
    pop      %esp
    jmp      .t1.start
.tst.end:
