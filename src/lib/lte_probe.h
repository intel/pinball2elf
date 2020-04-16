/*BEGIN_LEGAL 
BSD License 

Copyright (c)2019 Intel Corporation. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
END_LEGAL */
#ifndef LTE_PROBE_H
#define LTE_PROBE_H

#ifndef _GNU_SOURCE
# define _GNU_SOURCE 1
#endif

#include <ucontext.h>
#include "lte_lc.h"
#include "lte_perf.h"

#ifdef __cplusplus
extern "C" {
#endif

#define  RC_SKIP_INSTRUCTION   0
#define  RC_EXEC_INSTRUCTION   1

typedef struct
{
   union {
      struct {
         uint64_t rsvd0[REG_RAX];
         uint64_t rax;
      };
      struct {
         uint64_t rsvd1[REG_RBX];
         uint64_t rbx;
      };
      struct {
         uint64_t rsvd2[REG_RCX];
         uint64_t rcx;
      };
      struct {
         uint64_t rsvd3[REG_RDX];
         uint64_t rdx;
      };
      struct {
         uint64_t rsvd4[REG_RDI];
         uint64_t rdi;
      };
      struct {
         uint64_t rsvd5[REG_RSI];
         uint64_t rsi;
      };
      struct {
         uint64_t rsvd6[REG_RBP];
         uint64_t rbp;
      };
      struct {
         uint64_t rsvd7[REG_RSP];
         uint64_t rsp;
      };
      struct {
         uint64_t rsvd8[REG_R15];
         uint64_t r15;
      };
      struct {
         uint64_t rsvd9[REG_R14];
         uint64_t r14;
      };
      struct {
         uint64_t rsvd10[REG_R13];
         uint64_t r13;
      };
      struct {
         uint64_t rsvd11[REG_R12];
         uint64_t r12;
      };
      struct {
         uint64_t rsvd12[REG_R11];
         uint64_t r11;
      };
      struct {
         uint64_t rsvd13[REG_R10];
         uint64_t r10;
      };
      struct {
         uint64_t rsvd14[REG_R9];
         uint64_t r9;
      };
      struct {
         uint64_t rsvd15[REG_R8];
         uint64_t r8;
      };
      struct {
         uint64_t rsvd16[REG_RIP];
         uint64_t rip;
      };
      struct {
         uint64_t rsvd17[REG_EFL];
         uint64_t efl;
      };
   };
} __attribute__((packed)) lte_gregset_t;

#ifdef __cplusplus
}
#endif

#endif //LTE_PROBE_H
