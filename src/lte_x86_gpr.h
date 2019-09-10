/*BEGIN_LEGAL 
BSD License 

Copyright (c)2019 Intel Corporation. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
END_LEGAL */
#ifndef LTE_X86_GPR_H
#define LTE_X86_GPR_H

#include "lte_types.h"
#include "lte_reg_enum.h"

// GPRs
typedef lte_uint8_t   lte_gpr8_t;
typedef lte_uint16_t  lte_gpr16_t;
typedef lte_uint32_t  lte_gpr32_t;
typedef lte_uint64_t  lte_gpr64_t;

// GPR state
typedef union {
   struct {
      union {
         lte_gpr64_t  rflags;
         lte_gpr32_t  eflags;
      };
      union {
         lte_gpr64_t  rdi;
         lte_gpr32_t  edi;
      };
      union {
         lte_gpr64_t  rsi;
         lte_gpr32_t  esi;
      };
      union {
         lte_gpr64_t  rbp;
         lte_gpr32_t  ebp;
      };
      union {
         lte_gpr64_t  rsp;
         lte_gpr32_t  esp;
      };
      union {
         lte_gpr64_t  rbx;
         lte_gpr32_t  ebx;
      };
      union {
         lte_gpr64_t  rdx;
         lte_gpr32_t  edx;
      };
      union {
         lte_gpr64_t  rcx;
         lte_gpr32_t  ecx;
      };
      union {
         lte_gpr64_t  rax;
         lte_gpr32_t  eax;
      };
      union {
         lte_gpr64_t  r8;
         lte_gpr32_t  r8d;
      };
      union {
         lte_gpr64_t  r9;
         lte_gpr32_t  r9d;
      };
      union {
         lte_gpr64_t  r10;
         lte_gpr32_t  r10d;
      };
      union {
         lte_gpr64_t  r11;
         lte_gpr32_t  r11d;
      };
      union {
         lte_gpr64_t  r12;
         lte_gpr32_t  r12d;
      };
      union {
         lte_gpr64_t  r13;
         lte_gpr32_t  r13d;
      };
      union {
         lte_gpr64_t  r14;
         lte_gpr32_t  r14d;
      };
      union {
         lte_gpr64_t  r15;
         lte_gpr32_t  r15d;
      };
   };
   lte_gpr64_t r[17];
} __lte_packed lte_gpr_state_t;


void lte_gpr_state_init(lte_gpr_state_t* state);

void lte_gpr_state_set_reg(lte_gpr_state_t* state, const lte_reg_enum_t reg, lte_gpr64_t v);

#endif /*LTE_X86_GPR_H*/
