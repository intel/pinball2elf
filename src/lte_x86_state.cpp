/*BEGIN_LEGAL 
BSD License 

Copyright (c)2019 Intel Corporation. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
END_LEGAL */
#include "lte_x86_state.h"
#include "lte_reg_enum.h"

static void lte_x86_state_init_seg_sel_4G(lte_ldt_entry_t* d, lte_uint32_t num, lte_uint32_t rx_only, lte_uint32_t type)
{
    memset(d, 0, sizeof(*d));

    d->entry_number   = num;
    d->limit          = 0xfffff;
    d->seg_32bit      = 1;
    d->contents       = type & 3;
    d->read_exec_only = rx_only & 1;
    d->limit_in_pages = 1;
    d->useable        = 1;
}

void lte_x86_state_init_state(lte_x86_state_t* p)
{
    lte_x86_state_zero_state(p);

    p->xstate.fx.fcw        = 0x037f;
    p->xstate.fx.ftw        = 0x0000; // abridged tag
    p->xstate.fx.mxcsr      = 0x1f80;
    p->xstate.fx.mxcsr_mask = 0xffff;

    // set to be NULL selectors
    p->srstate.gs.sel.v = MAKE_SEG_SEL(0, 0, 3);
    p->srstate.fs.sel.v = MAKE_SEG_SEL(0, 0, 3);
    p->srstate.es.sel.v = MAKE_SEG_SEL(0, 0, 3);
    p->srstate.ds.sel.v = MAKE_SEG_SEL(0, 0, 3);
    p->srstate.cs.sel.v = MAKE_SEG_SEL(0, 0, 3);
    p->srstate.ss.sel.v = MAKE_SEG_SEL(0, 0, 3);

    lte_x86_state_init_seg_sel_4G(&p->segdesc[LTE_REG_GS-LTE_REG_SR_FIRST], LDT_ENTRY(LTE_REG_GS), 0, SD_CONTENT_DATA);
    lte_x86_state_init_seg_sel_4G(&p->segdesc[LTE_REG_FS-LTE_REG_SR_FIRST], LDT_ENTRY(LTE_REG_FS), 0, SD_CONTENT_DATA);
    lte_x86_state_init_seg_sel_4G(&p->segdesc[LTE_REG_ES-LTE_REG_SR_FIRST], LDT_ENTRY(LTE_REG_ES), 0, SD_CONTENT_DATA);
    lte_x86_state_init_seg_sel_4G(&p->segdesc[LTE_REG_DS-LTE_REG_SR_FIRST], LDT_ENTRY(LTE_REG_DS), 0, SD_CONTENT_DATA);
    lte_x86_state_init_seg_sel_4G(&p->segdesc[LTE_REG_CS-LTE_REG_SR_FIRST], LDT_ENTRY(LTE_REG_CS), 1, SD_CONTENT_CODE);
    lte_x86_state_init_seg_sel_4G(&p->segdesc[LTE_REG_SS-LTE_REG_SR_FIRST], LDT_ENTRY(LTE_REG_SS), 0, SD_CONTENT_STACK);
}

lte_uint16_t lte_fxstate_get_abridged_ftw(lte_uint16_t ftw_hw)
{
   lte_uint16_t ftw_fx = 0x00ff;

   for(lte_uint16_t mask_hw = 3, mask_fx = 1; mask_hw; mask_hw <<= 2, mask_fx <<= 1)
   {
      if((ftw_hw & mask_hw) == mask_hw)
      {
         ftw_fx ^= mask_fx;
      }
   }

   return ftw_fx;
}
