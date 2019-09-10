/*BEGIN_LEGAL 
BSD License 

Copyright (c)2019 Intel Corporation. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
END_LEGAL */
#ifndef LTE_X86_CR_H
#define LTE_X86_CR_H

#include "lte_types.h"

typedef union {
   struct {
      lte_uint64_t pe    :1;
      lte_uint64_t mp    :1;
      lte_uint64_t em    :1;
      lte_uint64_t ts    :1;
      lte_uint64_t et    :1;
      lte_uint64_t ne    :1;
      lte_uint64_t rsvd0 :10;
      lte_uint64_t wp    :1;
      lte_uint64_t rsvd1 :1;
      lte_uint64_t am    :1;
      lte_uint64_t rsvd2 :10;
      lte_uint64_t nw    :1;
      lte_uint64_t cd    :1;
      lte_uint64_t pg    :1;
      lte_uint64_t rsvd3 :32;
   } bits;
   lte_uint64_t flat;
} lte_cr0_t;

typedef union {
    lte_uint64_t flat;
} lte_cr2_t;

typedef union {
   struct {
      lte_uint64_t rsvd0   :3;
      lte_uint64_t pwt     :1;
      lte_uint64_t pcd     :1;
      lte_uint64_t rsvd1   :7;
      lte_uint64_t page_directory_base :20;
   } no_pae; // 32b nonPAE
   struct {
      lte_uint64_t rsvd0   :3;
      lte_uint64_t pwt     :1;
      lte_uint64_t pcd     :1;
      lte_uint64_t page_directory_pointer_base :27;
   } pae; // 32b PAE
   struct {
      lte_uint64_t rsvd0   :3;
      lte_uint64_t pwt     :1;
      lte_uint64_t pcd     :1;
      lte_uint64_t rsvd1   :7;
      lte_uint64_t page_map4_base :40;
      lte_uint64_t rsvd2   :12;
   } long_mode; // 64b mode
  lte_uint64_t flat;
} lte_cr3_t;

typedef union {
   struct {
      lte_uint64_t vme :1;
      lte_uint64_t pvi :1;
      lte_uint64_t tsd :1;
      lte_uint64_t de  :1;

      lte_uint64_t pse :1;
      lte_uint64_t pae :1;
      lte_uint64_t mce :1;
      lte_uint64_t pge :1;

      lte_uint64_t pce :1;
      lte_uint64_t osfxsr :1;
      lte_uint64_t osxmmexcpt :1;

      lte_uint64_t must_be_zero :2;
      lte_uint64_t vmxe    :1;
      lte_uint64_t smxe    :1;
      lte_uint64_t rsdv0   :2;
      lte_uint64_t pcide   :1;
      lte_uint64_t osxsave :1;
      lte_uint64_t rsvd1   :1;
      lte_uint64_t smep    :1;
      lte_uint64_t rsvd2   :43;
   } bits;
   lte_uint64_t flat;
} lte_cr4_t;

typedef union {
   struct
   {
      lte_uint64_t sce   :1; ///< syscall enable
      lte_uint64_t rsvd0 :7;
      lte_uint64_t lme   :1; ///< long mode enable
      lte_uint64_t rsvd1 :1;
      lte_uint64_t lma   :1; ///< long mode active
      lte_uint64_t nxe   :1; ///< execute disable bit enable
      lte_uint64_t rsvd2 :52;
   } bits;
   lte_uint64_t flat;
} lte_msr_efer_t;

#endif /*LTE_X86_CR_H*/
