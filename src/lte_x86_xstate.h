/*BEGIN_LEGAL 
BSD License 

Copyright (c)2019 Intel Corporation. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
END_LEGAL */
#ifndef LTE_XSAVE_H
#define LTE_XSAVE_H

#include "lte_x86.h"
#include <string.h>

enum xfeature_enum_t {
   LTE_XFEATURE_X87,
   LTE_XFEATURE_SSE,
   LTE_XFEATURE_AVX,
   LTE_XFEATURE_BNDREGS,
   LTE_XFEATURE_BNDCSR,
   LTE_XFEATURE_OPMASK,
   LTE_XFEATURE_ZMM_HI256,
   LTE_XFEATURE_HI16_ZMM,
   LTE_XFEATURE_PT,
   LTE_XFEATURE_PKRU,
   LTE_XFEATURE_LAST,

   LTE_XFEATURE_MASK_X87       = (1 << LTE_XFEATURE_X87),
   LTE_XFEATURE_MASK_SSE       = (1 << LTE_XFEATURE_SSE),
   LTE_XFEATURE_MASK_YMM       = (1 << LTE_XFEATURE_AVX),
   LTE_XFEATURE_MASK_BNDREGS   = (1 << LTE_XFEATURE_BNDREGS),
   LTE_XFEATURE_MASK_BNDCSR    = (1 << LTE_XFEATURE_BNDCSR),
   LTE_XFEATURE_MASK_OPMASK    = (1 << LTE_XFEATURE_OPMASK),
   LTE_XFEATURE_MASK_ZMM_HI256 = (1 << LTE_XFEATURE_ZMM_HI256),
   LTE_XFEATURE_MASK_HI16_ZMM  = (1 << LTE_XFEATURE_HI16_ZMM),
   LTE_XFEATURE_MASK_PT        = (1 << LTE_XFEATURE_PT),
   LTE_XFEATURE_MASK_PKRU      = (1 << LTE_XFEATURE_PKRU),
   LTE_ADDED_TO_FORCE_SIZE      = (0xFFFFFFFFFFFFFFFF)
};

enum xsave_layout_enum_t {
   LTE_XSAVE_FX_OFFSET        = 0,
   LTE_XSAVE_FX_SIZE          = 512,
   LTE_XSAVE_XHDR_OFFSET      = 512,
   LTE_XSAVE_XHDR_SIZE        = 64,
   LTE_XSAVE_YMM_HI256_OFFSET = 576,
   LTE_XSAVE_YMM_HI256_SIZE   = 256,
   LTE_XSAVE_BNDREGS_OFFSET   = 960,
   LTE_XSAVE_BNDREGS_SIZE     = 64,
   LTE_XSAVE_BNDCSR_OFFSET    = 1024,
   LTE_XSAVE_BNDCSR_SIZE      = 64,
   LTE_XSAVE_OPMASK_OFFSET    = 1088,
   LTE_XSAVE_OPMASK_SIZE      = 64,
   LTE_XSAVE_ZMM_HI256_OFFSET = 1152,
   LTE_XSAVE_ZMM_HI256_SIZE   = 512,
   LTE_XSAVE_HI16_ZMM_OFFSET  = 1664,
   LTE_XSAVE_HI16_ZMM_SIZE    = 1024,
};

// MPX support
typedef union {
   struct {
      lte_uint64_t  lb; // lower bound;
      lte_uint64_t  ub; // upper bound;
   };
   lte_uint64_t     qw[2];
} __lte_packed lte_mpx_bndreg_t;

typedef struct {
   lte_uint64_t  bndcfgu;
   lte_uint64_t  bndstatus;
} __lte_packed lte_mpx_bndcsr_t;


// XSAVE header
typedef struct {
   lte_uint64_t xstate_bv;
   lte_uint64_t xcomp_bv;
   lte_uint64_t rsvd[6];
} __lte_packed lte_xstate_hdr_t;


// The legacy SSE/MMX/X87 state format (FXSAVE/FXRSTOR instructions).
typedef struct {
   lte_uint16_t        fcw;
   lte_uint16_t        fsw;
   lte_uint16_t        ftw;
   lte_uint16_t        fop;
   union {
      lte_uint64_t     fpuip;  // Instruction Pointer
      struct {
         lte_uint32_t  fip;    // FPU IP Offset
         lte_uint16_t  fcs;    // FPU IP Selector
         lte_uint16_t  rsdv0;
      } __lte_packed;
   } __lte_packed;
   union {
      lte_uint64_t     fpudp;  // Data Pointer
      struct {
         lte_uint32_t  foo;    // FPU Operand Offset
         lte_uint16_t  fos;    // FPU Operand Selector
         lte_uint16_t  rsdv1;
      } __lte_packed;
   } __lte_packed;
   lte_uint32_t        mxcsr;
   lte_uint32_t        mxcsr_mask;
   lte_x87_st_reg_t    st[8];
   lte_xmm_reg_t       xmm[16];
   lte_xmm_reg_t       rsvd[6];
} __lte_packed __lte_aligned(16) lte_fxstate_t;

lte_uint16_t lte_fxstate_get_abridged_ftw(lte_uint16_t ftw_hw);

// Extended XSAVE area: subleaf 2 (YMM0-YMM15 Hi128)
typedef union {
    lte_xmm_reg_t  ymmhi[16];
} __lte_packed lte_xstate_ext_ymm_hi128_t;

// Extended XSAVE area: subleaf 3
typedef union {
    lte_mpx_bndreg_t  bnd[4];
} __lte_packed lte_xstate_ext_bndregs_t;

// Extended XSAVE area: subleaf 4
typedef union {
    lte_mpx_bndcsr_t  bndcsr;
    lte_uint8_t       pad[LTE_XSAVE_BNDCSR_SIZE];
} __lte_packed lte_xstate_ext_bndcsr_t;

// Extended XSAVE area: subleaf 5
typedef union {
    lte_opmask_reg_t  k[8];
} __lte_packed lte_xstate_ext_opmask_t;

// Extended XSAVE area: subleaf 6 (ZMM0-ZMM15 Hi256)
typedef union {
    lte_ymm_reg_t  zmmhi[16];
} __lte_packed lte_xstate_ext_zmm_hi256_t;

// Extended XSAVE area: subleaf 7  (ZMM16-ZMM31)
typedef struct {
    lte_zmm_reg_t  zmm[16];
} __lte_packed lte_xstate_ext_hi16_zmm_t;

// Extended XSAVE area: subleaf 8 (PT)
typedef struct {
   lte_uint64_t  msr[13];
} __lte_packed lte_xstate_ext_pt_t;

// Extended XSAVE area: subleaf 8 (PKRU)
typedef struct {
   lte_uint32_t  pkru;
   lte_uint32_t  pad;
} __lte_packed lte_xstate_ext_pkru_t;

typedef struct  {
   lte_fxstate_t                  fx;
   lte_xstate_hdr_t               xhdr;
   union {
      lte_xstate_ext_ymm_hi128_t  ext2;
      lte_uint8_t                 ext_area2[LTE_XSAVE_BNDREGS_OFFSET-LTE_XSAVE_YMM_HI256_OFFSET];
   } __lte_packed;
   union {
      lte_xstate_ext_bndregs_t    ext3;
      lte_uint8_t                 ext_area3[LTE_XSAVE_BNDCSR_OFFSET-LTE_XSAVE_BNDREGS_OFFSET];
   } __lte_packed;
   union {
      lte_xstate_ext_bndcsr_t     ext4;
      lte_uint8_t                 ext_area4[LTE_XSAVE_OPMASK_OFFSET-LTE_XSAVE_BNDCSR_OFFSET];
   } __lte_packed;
   union {
      lte_xstate_ext_opmask_t     ext5;
      lte_uint8_t                 ext_area5[LTE_XSAVE_ZMM_HI256_OFFSET-LTE_XSAVE_OPMASK_OFFSET];
   } __lte_packed;
   union {
      lte_xstate_ext_zmm_hi256_t  ext6;
      lte_uint8_t                 ext_area6[LTE_XSAVE_HI16_ZMM_OFFSET-LTE_XSAVE_ZMM_HI256_OFFSET];
   } __lte_packed;
   union {
      lte_xstate_ext_hi16_zmm_t   ext7;
      lte_uint8_t                 ext_area7[sizeof(ext7)];
   } __lte_packed;
   union {
      lte_xstate_ext_pt_t         ext8;
      lte_uint8_t                 ext_area8[sizeof(ext8)];
   } __lte_packed;
   union {
      lte_xstate_ext_pkru_t       ext9;
      lte_uint8_t                 ext_area9[sizeof(ext9)];
   } __lte_packed;
} __lte_packed __lte_aligned(64) lte_xstate_t;


static __LTE_INLINE void lte_x86_xstate_zero_state(lte_xstate_t* p)
{
   memset(p, 0, sizeof(*p));
}

#endif /*LTE_XSAVE_H*/
