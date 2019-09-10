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
.include "litstart32_defs.s"

.text
.globl _start
_start:
    mov      $cpu_state,%esp
    fxrstor  (%esp)
    add      $state.fs_desc_offs,%esp
    mov      $0x7b,%eax
    mov      $0x1,%ebx
    mov      %esp,%ecx
    mov      $state.desc_size,%edx
    int      $0x80
    test     %eax,%eax
    jne      _exit
    mov      state.fs_offs-state.fs_desc_offs(%esp),%fs
    mov      $0x7b,%eax
    mov      $0x1,%ebx
    lea      state.gs_desc_offs-state.fs_desc_offs(%esp),%ecx
    mov      $state.desc_size,%edx
    int      $0x80
    test     %eax,%eax
    jne      _exit
    mov      state.gs_offs-state.fs_desc_offs(%esp),%gs
    add      $state.gpr_state_offs-state.fs_desc_offs,%esp
    popf
    popa
    mov      -0x14(%esp),%esp
    jmp      _lit_start
_exit:
    mov      $0x0,%ebx
    mov      $0x1,%eax
    int      $0x80
