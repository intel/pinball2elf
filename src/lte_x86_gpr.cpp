/*BEGIN_LEGAL 
BSD License 

Copyright (c)2019 Intel Corporation. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
END_LEGAL */
#include "lte_x86_gpr.h"
#include "lte_utils.h"
#include <string.h>

typedef enum {
    LTE_IND_RFLAGS = 0,
    LTE_IND_RDI = 1,
    LTE_IND_RSI = 2,
    LTE_IND_RBP = 3,
    LTE_IND_RSP = 4,
    LTE_IND_RBX = 5,
    LTE_IND_RDX = 6,
    LTE_IND_RCX = 7,
    LTE_IND_RAX = 8,
    LTE_IND_R8  = 9,
    LTE_IND_R9  = 10,
    LTE_IND_R10 = 11,
    LTE_IND_R11 = 12,
    LTE_IND_R12 = 13,
    LTE_IND_R13 = 14,
    LTE_IND_R14 = 15,
    LTE_IND_R15 = 16,
    LTE_IND_RIP = 17,

    LTE_IND_EFLAGS = LTE_IND_RFLAGS,
    LTE_IND_EDI = LTE_IND_RDI,
    LTE_IND_ESI = LTE_IND_RSI,
    LTE_IND_EBP = LTE_IND_RBP,
    LTE_IND_ESP = LTE_IND_RSP,
    LTE_IND_EBX = LTE_IND_RBX,
    LTE_IND_EDX = LTE_IND_RDX,
    LTE_IND_ECX = LTE_IND_RCX,
    LTE_IND_EAX = LTE_IND_RAX,
    LTE_IND_EIP = LTE_IND_RIP,
} lte_gpr_index_enum_t;


static lte_gpr_index_enum_t gr_indices[] =
{
   LTE_IND_RAX, LTE_IND_RCX, LTE_IND_RDX, LTE_IND_RBX, LTE_IND_RSP, LTE_IND_RBP, LTE_IND_RSI, LTE_IND_RDI,
   LTE_IND_R8,  LTE_IND_R9,  LTE_IND_R10, LTE_IND_R11, LTE_IND_R12, LTE_IND_R13, LTE_IND_R14, LTE_IND_R15,
};

#define REG(regtype, regarray, regid, reghalf)   (((regtype*)(((lte_uint64_t*)(regarray)) + gr_indices[regid]))[reghalf])
#define R64(regarray, regid)   REG(lte_gpr64_t, regarray, (regid-LTE_REG_GPR64_FIRST), 0)
#define R32(regarray, regid)   REG(lte_gpr32_t, regarray, (regid-LTE_REG_GPR32_FIRST), 0)
#define R16(regarray, regid)   REG(lte_gpr16_t, regarray, (regid-LTE_REG_GPR16_FIRST), 0)
#define R8L(regarray, regid)   REG(lte_gpr8_t,  regarray, (regid-LTE_REG_GPR8_FIRST),  0)
#define R8H(regarray, regid)   REG(lte_gpr8_t,  regarray, (regid-LTE_REG_GPR8H_FIRST), 1)

void lte_gpr_state_set_reg(lte_gpr_state_t* state, const lte_reg_enum_t reg, lte_gpr64_t v)
{
   if(LTE_REG_GPR64_FIRST <= reg && reg <= LTE_REG_GPR64_LAST)
   {
      R64(state->r, reg) = v;
   }
   else if (LTE_REG_GPR32_FIRST <= reg && reg <= LTE_REG_GPR32_LAST)
   {
      R32(state->r, reg) = (lte_gpr32_t)v;
   }
   else if (LTE_REG_GPR16_FIRST <= reg && reg <= LTE_REG_GPR16_LAST)
   {
      R16(state->r, reg) = (lte_gpr16_t)v;
   }
   else if (LTE_REG_GPR8_FIRST <= reg && reg <= LTE_REG_GPR8_LAST)
   {
      R8L(state->r, reg) = (lte_gpr8_t)v;
   }
   else if (LTE_REG_GPR8H_FIRST <= reg && reg <= LTE_REG_GPR8H_LAST)
   {
      R8H(state->r, reg) = (lte_gpr8_t)v;
   }
   else if(LTE_REG_FLAGS_FIRST <= reg && reg <= LTE_REG_FLAGS_LAST)
   {
      state->r[LTE_IND_RFLAGS] = v;
   }
   else
   {
      LTE_ASSERT(false);
   }
}

void lte_gpr_state_init(lte_gpr_state_t* state)
{
   memset(state->r, 0, sizeof(state->r));
}
