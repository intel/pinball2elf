/*BEGIN_LEGAL 
BSD License 

Copyright (c)2019 Intel Corporation. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
END_LEGAL */
#include "lte_relocation.h"
#include <assert.h>

#define __GNU_COMPATIBLE_UCONTEXT_LAYOUT

// save context code
static lte_uint8_t s_save_ctx[] =
{
#ifdef __GNU_COMPATIBLE_UCONTEXT_LAYOUT
 /*  0*/ 0x9c,                                     //pushfq
 /*  1*/ 0x54,                                     //push %rsp
 /*  2*/ 0x51,                                     //push %rcx
 /*  3*/ 0x50,                                     //push %rax
 /*  4*/ 0x52,                                     //push %rdx
 /*  5*/ 0x48, 0x8b, 0x4c, 0x24, 0x28,             //mov 0x28(%rsp),%rcx
 /*  a*/ 0x48, 0x8b, 0x44, 0x24, 0x20,             //mov 0x20(%rsp),%rax
 /*  f*/ 0x48, 0x89, 0x44, 0x24, 0x28,             //mov %rax,0x28(%rsp)
 /* 14*/ 0x48, 0x89, 0x4c, 0x24, 0x20,             //mov %rcx,0x20(%rsp)
 /* 19*/ 0x53,                                     //push %rbx
 /* 1a*/ 0x55,                                     //push %rbp
 /* 1b*/ 0x56,                                     //push %rsi
 /* 1c*/ 0x57,                                     //push %rdi
 /* 1d*/ 0x41, 0x57,                               //push %r15
 /* 1f*/ 0x41, 0x56,                               //push %r14
 /* 21*/ 0x41, 0x55,                               //push %r13
 /* 23*/ 0x41, 0x54,                               //push %r12
 /* 25*/ 0x41, 0x53,                               //push %r11
 /* 27*/ 0x41, 0x52,                               //push %r10
 /* 29*/ 0x41, 0x51,                               //push %r9
 /* 2b*/ 0x41, 0x50,                               //push %r8   
 /* 2d*/ 0x51,                                     //push %rcx
 /* 2e*/ 0xc3,                                     //retq
#else
 /*  0*/ 0x9c,                                     //pushfq
 /*  1*/ 0x53,                                     //push %rbx
 /*  2*/ 0x48, 0x8b, 0x5c, 0x24, 0x10,             //mov 0x10(%rsp),%rbx
 /*  7*/ 0x48, 0x89, 0x44, 0x24, 0x10,             //mov %rax,0x10(%rsp)
 /*  c*/ 0x51,                                     //push %rcx
 /*  d*/ 0x52,                                     //push %rdx
 /*  e*/ 0x56,                                     //push %rsi
 /*  f*/ 0x57,                                     //push %rdi
 /* 10*/ 0x55,                                     //push %rbp
 /* 11*/ 0x41, 0x50,                               //push %r8
 /* 13*/ 0x41, 0x51,                               //push %r9
 /* 15*/ 0x41, 0x52,                               //push %r10
 /* 17*/ 0x41, 0x53,                               //push %r11
 /* 19*/ 0x41, 0x54,                               //push %r12
 /* 1b*/ 0x41, 0x55,                               //push %r13
 /* 1d*/ 0x41, 0x56,                               //push %r14
 /* 1f*/ 0x41, 0x57,                               //push %r15
 /* 21*/ 0x53,                                     //push %rbx
 /* 22*/ 0xc3,                                     //retq 
#endif
};

// rstor context code
static lte_uint8_t s_rstor_ctx[] =
{
#ifdef __GNU_COMPATIBLE_UCONTEXT_LAYOUT
 /*  0*/ 0x59,                                     //pop %rcx
 /*  1*/ 0x48, 0x8d, 0x14, 0x0f,                   //lea (%rdi,%rcx,1),%rdx
 /*  5*/ 0x48, 0x85, 0xc0,                         //test %rax,%rax
 /*  8*/ 0x48, 0x0f, 0x44, 0xca,                   //cmove %rdx,%rcx
 /*  c*/ 0x41, 0x58,                               //pop %r8
 /*  e*/ 0x41, 0x59,                               //pop %r9
 /* 10*/ 0x41, 0x5a,                               //pop %r10
 /* 12*/ 0x41, 0x5b,                               //pop %r11
 /* 14*/ 0x41, 0x5c,                               //pop %r12
 /* 16*/ 0x41, 0x5d,                               //pop %r13
 /* 18*/ 0x41, 0x5e,                               //pop %r14
 /* 1a*/ 0x41, 0x5f,                               //pop %r15
 /* 1c*/ 0x5f,                                     //pop %rdi
 /* 1d*/ 0x5e,                                     //pop %rsi
 /* 1e*/ 0x5d,                                     //pop %rbp
 /* 1f*/ 0x5b,                                     //pop %rbx
 /* 20*/ 0x5a,                                     //pop %rdx
 /* 21*/ 0x48, 0x8b, 0x44, 0x24, 0x20,             //mov 0x20(%rsp),%rax
 /* 26*/ 0x48, 0x89, 0x44, 0x24, 0x10,             //mov %rax,0x10(%rsp)
 /* 2b*/ 0x48, 0x89, 0x4c, 0x24, 0x18,             //mov %rcx,0x18(%rsp)
 /* 30*/ 0x58,                                     //pop %rax
 /* 31*/ 0x59,                                     //pop %rcx
 /* 32*/ 0x9d,                                     //popfq 
 /* 33*/ 0xc2, 0x08, 0x00,                         //retq $0x8

#else
 /*  0*/ 0x5b,                                     //pop %rbx
 /*  1*/ 0x48, 0x85, 0xc0,                         //test %rax,%rax
 /*  4*/ 0x75, 0x03,                               //jne <.rstor_ctx.l1>
 /*  6*/ 0x48, 0x01, 0xfb,                         //add %rdi,%rbx
//<.rstor_ctx.l1>:
 /*  9*/ 0x41, 0x5f,                               //pop %r15
 /*  b*/ 0x41, 0x5e,                               //pop %r14
 /*  d*/ 0x41, 0x5d,                               //pop %r13
 /*  f*/ 0x41, 0x5c,                               //pop %r12
 /* 11*/ 0x41, 0x5b,                               //pop %r11
 /* 13*/ 0x41, 0x5a,                               //pop %r10
 /* 15*/ 0x41, 0x59,                               //pop %r9
 /* 17*/ 0x41, 0x58,                               //pop %r8
 /* 19*/ 0x5d,                                     //pop %rbp
 /* 1a*/ 0x5f,                                     //pop %rdi
 /* 1b*/ 0x5e,                                     //pop %rsi
 /* 1c*/ 0x5a,                                     //pop %rdx
 /* 1d*/ 0x59,                                     //pop %rcx
 /* 1e*/ 0x48, 0x8b, 0x44, 0x24, 0x10,             //mov 0x10(%rsp),%rax
 /* 23*/ 0x48, 0x89, 0x5c, 0x24, 0x10,             //mov %rbx,0x10(%rsp)
 /* 28*/ 0x5b,                                     //pop %rbx
 /* 29*/ 0x9d,                                     //popfq
 /* 2a*/ 0xc3,                                     //retq
#endif
};

static lte_uint32_t set_rstor_ctx_arg(lte_uint8_t* p, lte_uint32_t arg)
{
   //mov $0x0,%rdi
   p[0] = 0x48;
   p[1] = 0xc7;
   p[2] = 0xc7;
   *(lte_uint32_t*)(p+3) = arg;
   return 7;
}


lte_uint8_t* relocation::get_save_ctx_code()
{
   return s_save_ctx;
}

lte_size_t relocation::get_save_ctx_size()
{
   return sizeof(s_save_ctx);
}

lte_uint8_t* relocation::get_rstor_ctx_code()
{
   return s_rstor_ctx;
}

lte_size_t relocation::get_rstor_ctx_size()
{
   return sizeof(s_rstor_ctx);
}


static inline bool is_offset8(lte_ssize_t offset)
{
   return (-128 <= offset && offset < 128);
}

static inline bool is_offset32(lte_ssize_t offset)
{
   return (-2147483648 <= offset && offset <= 2147483647);
}

static inline lte_ssize_t get_disp8(lte_uint8_t* code, lte_size_t offset)
{
   return *(lte_int8_t*)(code + offset);
}

static inline lte_ssize_t get_disp32(lte_uint8_t* code, lte_size_t offset)
{
   return *(lte_int32_t*)(code + offset);
}

static inline void set_disp8(lte_uint8_t* code, lte_size_t offset, lte_ssize_t disp)
{
   *(lte_int8_t*)(code + offset) = disp;
}

static inline void set_disp32(lte_uint8_t* code, lte_size_t offset, lte_ssize_t disp)
{
   *(lte_int32_t*)(code + offset) = disp;
}

// NOTE: displacement relavite to the jump instruction, not to the next instruction 
static inline lte_size_t insert_jmp_disp(lte_uint8_t* p, lte_ssize_t displacement)
{
   if(is_offset8(displacement))
   {
      p[0] = 0xeb; // jump with 8-bit displacement
      set_disp8(p, 1, displacement - 2);
      return 2;
   }
   else if(is_offset32(displacement))
   {
      p[0] = 0xe9; // jump with 32-bit displacement
      set_disp32(p, 1, displacement - 5);
      return 5;
   }
   return 0;
}

static lte_size_t insert_jmp_indirect(lte_uint8_t* p, lte_addr_t target)
{
   p[0] = 0xff; // jmp *0(%rip)
   p[1] = 0x25;
   set_disp32(p, 2, 0);
   *(lte_addr_t*)(p + 6) = target;
   return 14;
}

lte_size_t text_rinfo_t::get_rcode_size(lte_size_t rmem_size)
{
   inst_rinfo_t* ri = info;
   lte_size_t rcode_size = 0;
   if(rmem_size > size)
      rmem_size = size;
   for(lte_uint_t i = 0; i < count && rcode_size < rmem_size; rcode_size += ri->inst_size(), ++ri, ++i);
   return rcode_size;
}

std::pair<lte_ssize_t, lte_ssize_t> text_rinfo_t::get_disp_range(lte_uint8_t* mem, lte_size_t mem_size, bool memop_only)
{
   inst_rinfo_t* ri = info;
   lte_size_t inst_offs = 0;
   lte_ssize_t disp_lo = 0;
   lte_ssize_t disp_hi = 0;

   mem_size = std::min(mem_size, size);

   for(lte_uint_t i = 0; i < count && inst_offs < mem_size; inst_offs += ri->inst_size(), ++ri, ++i)
   {
      if((ri->disp_width() == 0) || (memop_only && ri->is_branch()))
        continue;

      lte_ssize_t disp = ((ri->disp_width() == 1) ? get_disp8(mem, ri->r_offset) : get_disp32(mem, ri->r_offset));

      disp += inst_offs + ri->inst_size();

      if(disp < disp_lo)
         disp_lo = disp;
      if(disp > disp_hi)
         disp_hi = disp;
   }
   return std::make_pair(disp_lo, disp_hi);
}

static bool is_relb_disp8(lte_addr_t addr, lte_addr_t target)
{
   lte_size_t disp = target - addr;
   return (disp <= (0x7f + BR_REL_DISP8_SIZE) || disp >= (0xffffffffffffff80UL + BR_REL_DISP8_SIZE));
}

static bool is_relb_disp32(lte_addr_t addr, lte_addr_t target)
{
   lte_size_t disp = target - addr;
   return (disp <= (0x7fffffffUL + BR_REL_DISP32_SIZE) || disp >= (0xffffffff80000000UL + BR_REL_DISP32_SIZE));
}

static lte_size_t insert_jmp(lte_uint8_t* p, lte_addr_t addr, lte_addr_t target)
{
   lte_size_t disp = target - addr;

   if(is_relb_disp8(addr, target))
   {
      p[0] = 0xeb;
      set_disp8(p, 1, (lte_ssize_t)target - (lte_ssize_t)addr - BR_REL_DISP8_SIZE);
      return BR_REL_DISP8_SIZE;
   }
   else if(is_relb_disp32(addr, target))
   {
      p[0] = 0xe9;
      set_disp32(p, 1, (lte_ssize_t)target - (lte_ssize_t)addr - BR_REL_DISP32_SIZE);
      return BR_REL_DISP32_SIZE;
   }

   p[0] = 0xff;
   p[1] = 0x25;
   set_disp32(p, 2, 0);
   *(lte_addr_t*)(p + 6) = target;

   return BR_IDIR_ABS64_SIZE;
}

static lte_size_t insert_call_idir_rax(lte_uint8_t* p, lte_addr_t target, lte_size_t* target_offset = nullptr)
{
   p[0] = 0x48;
   p[1] = 0xb8;
   if(target_offset)
      *target_offset = 2;
   *(lte_addr_t*)&p[2] = target;
   p[10] = 0xff;
   p[11] = 0xd0;

   return CALL_IDIR_RAX_SIZE;
}

static lte_size_t insert_call(lte_uint8_t* p, lte_addr_t addr, lte_addr_t target)
{
   lte_size_t disp = target - addr;

   if(is_relb_disp32(addr, target))
   {
      p[0] = 0xe8;
      set_disp32(p, 1, (lte_ssize_t)target - (lte_ssize_t)addr - CALL_REL_DISP32_SIZE);
      return CALL_REL_DISP32_SIZE;
   }
   return insert_call_idir_rax(p, target);
}

static lte_size_t insert_cb_call(lte_uint8_t* p, lte_addr_t target, lte_size_t* target_offset = nullptr)
{
   lte_size_t mov_rsp_rdi_size = 3;
   // mov %rsp,%rdi
   p[0] = 0x48;
   p[1] = 0x89;
   p[2] = 0xe7;

   lte_size_t call_idir_rax_size = insert_call_idir_rax(p + mov_rsp_rdi_size, target, target_offset);
   *target_offset += mov_rsp_rdi_size;
   return call_idir_rax_size + mov_rsp_rdi_size;
}

static lte_size_t init_prologue(lte_uint8_t* p, lte_addr_t addr, lte_uint32_t first_inst_size, lte_ssize_t save_ctx_addr, lte_ssize_t rstor_ctx_addr, lte_addr_t cb_addr, lte_size_t* cb_offset)
{
   assert(cb_offset);

   lte_size_t size = 0;

   memset(p, 0, REL_PROLOGUE_SIZE);
   size += insert_call(p + size, addr + size, save_ctx_addr);

   auto cb_size = insert_cb_call(p + size, cb_addr, cb_offset);
   *cb_offset += size;
   size += cb_size;

   size += set_rstor_ctx_arg(p + size, first_inst_size);
   size += insert_call(p + size, addr + size, rstor_ctx_addr);

   return size;
}

static lte_size_t init_epilogue(lte_uint8_t* p, lte_addr_t addr, lte_addr_t target)
{
   return insert_jmp(p, addr, target);
}


lte_size_t relocation::get_code_max_size(lte_uint8_t* code, lte_size_t size, text_rinfo_t* rinfo)
{
   inst_rinfo_t* ri = rinfo->info;
   lte_size_t code_size = rinfo->get_rcode_size(size);

   code_size += 3 * CALL_IDIR_RAX_SIZE; // max prologue size
   code_size += CALL_IDIR_RAX_SIZE;     // max epilogue size

   for(lte_size_t inst_offset = 0; inst_offset < code_size; inst_offset += ri->inst_size(), ++ri)
   {
      if(ri->is_branch())
      {
         code_size += BR_IDIR_ABS64_SIZE;
      }
   }
   return code_size;
}


lte_size_t relocation::init(lte_addr_t addr, lte_ssize_t offset, lte_uint8_t* code, lte_size_t size, text_rinfo_t* rinfo,
                            lte_addr_t save_ctx_addr, lte_addr_t rstor_ctx_addr, lte_addr_t cb_addr)
{
   assert(size <= rinfo->size);

   lte_size_t rcode_size = rinfo->get_rcode_size(size);
   lte_size_t ctlt_size = 0;

   _pro_size = init_prologue(get_code(), addr + offset, rinfo->info[0].inst_size(), save_ctx_addr, rstor_ctx_addr, cb_addr, &_cb_offset);
   _epi_size = init_epilogue(get_rcode() + rcode_size, addr + offset + _pro_size + rcode_size, addr + rcode_size);

   memcpy(get_rcode(), code, rcode_size);

   inst_rinfo_t* ri = rinfo->info;
   lte_uint8_t* ctlt;

   code = get_rcode();
   ctlt = code + rcode_size + _epi_size;

   lte_ssize_t rcode_addr = addr + offset + _pro_size;
   lte_ssize_t ctlt_addr = rcode_addr + rcode_size + _epi_size;

   // no need need to check rinfo->count as long as rinfo->get_rcode_size(size) already's checked it 
   for(lte_size_t inst_offset = 0; inst_offset < rcode_size; inst_offset += ri->inst_size(), ++ri)
   {
      if(ri->is_branch())
      {
         if(ri->disp_width() == 1)
         {
            lte_ssize_t disp = get_disp8(code, ri->r_offset);

            if(is_relb_disp8(offset + _pro_size, disp))
            {
               set_disp8(code, ri->r_offset, disp - (offset + _pro_size));
            }
            else
            {
               set_disp8(code, ri->r_offset, rcode_size - (inst_offset + ri->inst_size()) + _epi_size + ctlt_size);
               ctlt_size += insert_jmp(ctlt, ctlt_addr + ctlt_size, addr + inst_offset + ri->inst_size() + disp);
            }
         }
         else
         {
            LTE_ASSERT(ri->disp_width() == 4);

            lte_ssize_t disp = get_disp32(code, ri->r_offset);

            if(is_relb_disp32(offset + _pro_size, disp))
            {
               set_disp32(code, ri->r_offset, disp - (offset + _pro_size));
            }
            else
            {
               set_disp32(code, ri->r_offset, rcode_size - (inst_offset + ri->inst_size()) + _epi_size + ctlt_size);
               ctlt_size += insert_jmp(ctlt, ctlt_addr + ctlt_size, addr + inst_offset + ri->inst_size() + disp);
            }
         }
      }
      else if(ri->disp_width() != 0)
      {
         LTE_ASSERT(ri->disp_width() == 4);

         lte_ssize_t disp = get_disp32(code, ri->r_offset);
         if(is_relb_disp32(offset + _pro_size, disp))
         {
            set_disp32(code, ri->r_offset, disp - (offset + _pro_size));
         }
         else
         {
            _rcode_size = 0;
            _pro_size = 0;
            _epi_size = 0;
            _ctlt_size = 0;

            LTE_ASSERT(false);
            return 0;
         }
      }
   }

   _rcode_size = rcode_size;
   _ctlt_size = ctlt_size;

   return get_code_size();
}
