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
.globl	cpu_state
	.data
	.align 64
	.type	cpu_state, @object
	.size	cpu_state, 3072
cpu_state:
.ifdef CALLBACKS
	.zero	64
.endif
t0.fcw:
	.word	0x37f
t0.fsw:
	.zero	2
t0.ftw:
	.zero	2
t0.fop:
	.zero	2
t0.fpuip:
	.zero	8
t0.fpudp:
	.zero	8
t0.mxcsr:
	.long	0x1f80
t0.mxcsr_mask:
	.long	0xffff
t0.st:
	.zero	128
t0.xmm:
	.zero	256
	.zero	96
t0.xhdr:
	.quad	0x1
	.zero	56
t0.ext_area2:
	.zero	384
t0.ext_area3:
	.zero	64
t0.ext_area4:
	.zero	64
t0.ext_area5:
	.zero	64
t0.ext_area6:
	.zero	512
t0.ext_area7:
	.zero	1024
t0.ext_area8:
	.zero	104
t0.ext_area9:
	.zero	8
	.quad	0x1002
	.quad	0x51000fffff
t0.fs.sel.v:
	.long	0x801f
t0.fs_base:
	.zero	8
	.quad	0x1005
	.quad	0x51000fffff
t0.gs.sel.v:
	.long	0x802f
t0.gs_base:
	.zero	8
t0.rflags:
	.zero	8
t0.rdi:
	.zero	8
t0.rsi:
	.zero	8
t0.rbp:
	.zero	8
t0.rbx:
	.zero	8
t0.rdx:
	.zero	8
t0.rcx:
	.zero	8
t0.rax:
	.zero	8
t0.r8:
	.zero	8
t0.r9:
	.zero	8
t0.r10:
	.zero	8
t0.r11:
	.zero	8
t0.r12:
	.zero	8
t0.r13:
	.zero	8
t0.r14:
	.zero	8
t0.r15:
	.zero	8
t0.tst.rip:
	.quad	0xd7
t0.rsp:
	.zero	8
	.zero	8
