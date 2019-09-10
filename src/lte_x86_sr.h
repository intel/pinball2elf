/*BEGIN_LEGAL 
BSD License 

Copyright (c)2019 Intel Corporation. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
END_LEGAL */
#ifndef LTE_X86_SR_H
#define LTE_X86_SR_H

#include "lte_x86_ldt.h"
#include "lte_reg_enum.h"

#define MAKE_SEG_SEL(ind, ti, rpl) \
  ((((ind)&0x1fff)<<3)|(((ti)&1)<<2)|((rpl)&3))

// Segment selectors
typedef union {
   struct {
      lte_uint32_t  rpl:2;    // requested privilege level
      lte_uint32_t  ti:1;     // table indicator (0 - GDT, 1 - LDT)
      lte_uint32_t  index:13; // index
      lte_uint32_t  rsvd:16;
   };
   lte_uint32_t v;
} lte_seg_sel_t;

// Segment descriptors
typedef enum {
    SD_BASE_16_23_MASK   = 0x000000ff,
    SD_BASE_16_23_OFFS   = 0,
    SD_SEGTYPE_MASK      = 0x00000f00,
    SD_SEGTYPE_OFFS      = 8,
    SD_STYPE_A_MASK      = 0x00000100,
    SD_STYPE_A_OFFS      = 8,
    SD_STYPE_W_MASK      = 0x00000200,
    SD_STYPE_W_OFFS      = 9,
    SD_STYPE_E_MASK      = 0x00000400,
    SD_STYPE_E_OFFS      = 10,
    SD_STYPE_CODE_MASK   = 0x00000800,
    SD_STYPE_CODE_OFFS   = 11,
    SD_DTYPE_MASK        = 0x00001000,
    SD_DTYPE_OFFS        = 12,
    SD_DPL_MASK          = 0x00006000,
    SD_DPL_OFFS          = 13,
    SD_PRESENT_MASK      = 0x00008000,
    SD_PRESENT_OFFS      = 15,
    SD_LIMIT_16_19_MASK  = 0x000f0000,
    SD_LIMIT_16_19_OFFS  = 16,
    SD_AVL_MASK          = 0x00100000,
    SD_AVL_OFFS          = 20,
    SD_L_MASK            = 0x00200000,
    SD_L_OFFS            = 21,
    SD_DB_MASK           = 0x00400000,
    SD_DB_OFFS           = 22,
    SD_G_MASK            = 0x00800000,
    SD_G_OFFS            = 23,
    SD_BASE_24_31_MASK   = 0xff000000,
    SD_BASE_24_31_OFFS   = 24,
    SD_LIMIT_00_15_MASK  = 0x0000ffff,
    SD_LIMIT_00_15_OFFS  = 0,
    SD_BASE_00_15_MASK   = 0xffff0000,
    SD_BASE_00_15_OFFS   = 16,
    SD_STYPE_A           = (SD_STYPE_A_MASK>>SD_STYPE_A_OFFS),
    SD_STYPE_W           = (SD_STYPE_W_MASK>>SD_STYPE_W_OFFS),
    SD_STYPE_E           = (SD_STYPE_E_MASK>>SD_STYPE_E_OFFS),
    SD_STYPE_CODE        = (SD_STYPE_CODE_MASK>>SD_STYPE_CODE_OFFS),
    SD_CONTENT_DATA      = MODIFY_LDT_CONTENTS_DATA,
    SD_CONTENT_STACK     = MODIFY_LDT_CONTENTS_STACK,
    SD_CONTENT_CODE      = MODIFY_LDT_CONTENTS_CODE,
} lte_seg_desc_enum_t;


typedef union {
   struct {
      lte_uint32_t  base_16_23:8;  // segment base address, bits 16:23
      lte_uint32_t  stype:4;       // segment type
      lte_uint32_t  dtype:1;       // descriptor type (0 - system, 1 - code or data)
      lte_uint32_t  dpl:2;         // DPL - descriptor privilege level
      lte_uint32_t  present:1;     // segment present
      lte_uint32_t  limit_16_19:4; // segment limit, bits 16:19
      lte_uint32_t  avl:1;         // AVL - available for use by system SW
      lte_uint32_t  l_flag:1;      // 64-bit code segment
      lte_uint32_t  db_flag:1;     // default operation size (0 - 16-bit, 1 - 32-bit)
      lte_uint32_t  granularity:1; // seg limit granularity (0 - in bytes, 1 - in pages)
      lte_uint32_t  base_24_31:8;  // segment base address, bits 24:31
      lte_uint32_t  limit_0_15:16; // segment limit, bits 0:15
      lte_uint32_t  base_0_15:16;  // segment base address, bits 0:15
   };
   lte_uint64_t qw;
   lte_uint64_t dw[2];
} __lte_packed lte_seg_desc_t;


// Segment registers
typedef struct {
   lte_seg_sel_t   sel;
   lte_seg_desc_t  hidden;
} lte_seg_reg_t;

// seg:offs pointers
typedef struct {
   lte_uint32_t   offs;
   lte_seg_sel_t  seg;
} lte_farptr32_t;

typedef struct {
   lte_uint64_t   offs;
   lte_seg_sel_t  seg;
} lte_farptr64_t;

// SR state
typedef struct {
   union {
      struct {
         lte_seg_reg_t  cs;
         lte_seg_reg_t  ds;
         lte_seg_reg_t  es;
         lte_seg_reg_t  ss;
         lte_seg_reg_t  fs;
         lte_seg_reg_t  gs;
      } __lte_packed;
      lte_seg_reg_t  sr[6];
   } __lte_packed;
   union {
      struct {
         lte_uint64_t   fs_base;
         lte_uint64_t   gs_base;
      } __lte_packed;
      lte_uint64_t  base[2];
   } __lte_packed;
} __lte_packed lte_sr_state_t;

// Interface functions
static __LTE_INLINE lte_uint32_t seg_desc_get_seg_base_addr(lte_seg_desc_t* p)
{
   return p->base_0_15 | (p->base_16_23<<16) | (p->base_24_31<<24);
}

static __LTE_INLINE void seg_desc_set_seg_base_addr(lte_seg_desc_t* p, lte_uint32_t base)
{
   p->base_0_15 = base & 0xffff;
   p->base_16_23 = (base >> 16) & 0xff;
   p->base_24_31 = (base >> 24) & 0xff;;
}

static __LTE_INLINE lte_uint32_t seg_desc_get_seg_limit(lte_seg_desc_t* p) 
{
   return p->limit_0_15 | (p->limit_16_19<<16);
}

static __LTE_INLINE void seg_desc_set_seg_limit(lte_seg_desc_t* p, lte_uint32_t limit) 
{
   p->limit_0_15 = limit & 0xffff;
   p->limit_16_19 = (limit >> 16) & 0xf;
}

static __LTE_INLINE lte_uint32_t seg_desc_get_seg_type(lte_seg_desc_t* p) 
{
   return p->stype;
}

static __LTE_INLINE lte_uint32_t seg_desc_is_code_seg(lte_seg_desc_t* p)
{
   return (p->dw[0] & SD_STYPE_CODE_MASK) >> SD_STYPE_CODE_OFFS;
}

#endif /*LTE_X86_SR_H*/
