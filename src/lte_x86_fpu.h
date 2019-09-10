/*BEGIN_LEGAL 
BSD License 

Copyright (c)2019 Intel Corporation. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
END_LEGAL */
#ifndef LTE_X86_FPU_H
#define LTE_X86_FPU_H

#include "lte_types.h"

typedef union {
   lte_uint64_t  qw[1];
   lte_uint32_t  dw[2];
} __lte_packed lte_mm_reg_t;

typedef union {
   struct {
      lte_uint64_t  sgnf;
      lte_uint16_t  sexp;
   };
   lte_mm_reg_t     mm;
   lte_uint64_t     qw[2];
} __lte_packed  lte_x87_st_reg_t;

typedef union {
   lte_uint64_t   qw[2];
   lte_uint32_t   dw[4];
} __lte_packed lte_xmm_reg_t;

typedef union {
   lte_xmm_reg_t  xmm[2];
   lte_uint64_t   qw[4];
   lte_uint32_t   dw[8];
} __lte_packed lte_ymm_reg_t;

typedef union {
   lte_ymm_reg_t  ymm[2];
   lte_xmm_reg_t  xmm[4];
   lte_uint64_t   qw[8];
   lte_uint32_t   dw[16];
} __lte_packed lte_zmm_reg_t;

typedef lte_uint64_t  lte_opmask_reg_t;

#endif /*LTE_X86_FPU_H*/
