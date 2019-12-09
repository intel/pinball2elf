#BEGIN_LEGAL 
#BSD License 
#
#Copyright (c)2019 isaev.alexander@gmail.com. All rights reserved.
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
.text
.globl lte_warmup
lte_warmup:
        test        %rsi, %rsi
        jz          .ret
        xor         %ecx, %ecx
.l1.loop:
        movntdqa    (%rdi), %xmm0
.l2.loop:
        movq        %xmm0, %rax
        testb       $1, %al
        jne         .l2.wr
        movb        (%rax), %al
.l2.next:
        xor         $1, %ecx
        je          .l1.next
        pshufd      $0xe, %xmm0, %xmm0
        jmp         .l2.loop
.l1.next:
        addq        $16, %rdi
        sub         $1, %rsi
        jne         .l1.loop
.ret:
        ret
.l2.wr:
        movb        %al, (%rax)
        jmp         .l2.next
