/*BEGIN_LEGAL 
BSD License 

Copyright (c)2019 Intel Corporation. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
END_LEGAL */
#include "lte_pinball.h"
#include "lte_utils.h"
#include "lte_x86_xstate.h"
#include "lte_string.h"
#include "lte_portability.h"

#include <stdlib.h>
#include <string.h>
#include <algorithm>

#include <iostream>
#include <iomanip>

#define print_hex(v, w) std::hex<<std::setfill('0')<<std::setw(w)<<(v)<<std::setfill(' ')<<std::dec
#define print_dec(v, w) std::dec<<std::setfill(' ')<<std::setw(w)<<(v)<<std::setfill(' ')<<std::dec

static bool strntogpr(const char* str, uint64_t* v)
{
   char* end;
   *v = lte_strtoull(str, &end, 16);
   return (*str && !*end);
}

pinball_arch_state_t::pinball_arch_state_t(const char* fname)
   : m_arch(ELFCLASSNONE)
   , m_vdso_lower(0)
   , m_vdso_upper(0)
   , m_num_static_threads(0)
   , m_num_dynamic_threads(0)
   , m_num_threads_started(0)
   , m_text_compressed(0)
{
   if(fname != NULL)
      load_arch_desc(fname);
}

bool pinball_arch_state_t::get_reg_value(lte_reg_enum_t id, lte_uint32_t size, const char* str, lte_x86_state_t* state)
{
   bool ok = true;
   lte_gpr64_t regval;

   if(LTE_REG_FLAGS_FIRST <= id && id <= LTE_REG_FLAGS_LAST)
   {
      if((ok = strntogpr(str, &regval)))
         lte_gpr_state_set_reg(&state->gprstate, id, regval);
   }
   else if(LTE_REG_GPR64_FIRST <= id && id <= LTE_REG_GPR64_LAST)
   {
      if((ok = strntogpr(str, &regval)))
         lte_gpr_state_set_reg(&state->gprstate, id, regval);
   }
   else if (LTE_REG_GPR32_FIRST <= id && id <= LTE_REG_GPR32_LAST)
   {
      if((ok = strntogpr(str, &regval)))
         lte_gpr_state_set_reg(&state->gprstate, id, regval);
   }
   else if (LTE_REG_GPR16_FIRST <= id && id <= LTE_REG_GPR16_LAST)
   {
      if((ok = strntogpr(str, &regval)))
         lte_gpr_state_set_reg(&state->gprstate, id, regval);
   }
   else if (LTE_REG_GPR8_FIRST <= id && id <= LTE_REG_GPR8_LAST)
   {
      if((ok = strntogpr(str, &regval)))
         lte_gpr_state_set_reg(&state->gprstate, id, regval);
   }
   else if (LTE_REG_GPR8H_FIRST <= id && id <= LTE_REG_GPR8H_LAST)
   {
      if((ok = strntogpr(str, &regval)))
         lte_gpr_state_set_reg(&state->gprstate, id, regval);
   }
   else if (LTE_REG_IP_FIRST <= id && id <= LTE_REG_IP_LAST)
   {
      if((ok = strntogpr(str, &regval)))
         state->rip = regval;
   }
   else if (LTE_REG_MASK_FIRST <= id && id <= LTE_REG_MASK_LAST)
   {
      if((ok = strntogpr(str, &regval)))
      {
         state->xstate.ext5.k[id - LTE_REG_MASK_FIRST] = regval;
         state->xstate.xhdr.xstate_bv |= LTE_XFEATURE_MASK_OPMASK;
      }
   }
   else if (LTE_REG_MMX_FIRST <= id && id <= LTE_REG_MMX_LAST)
   {
      lte_mm_reg_t* mm = &state->xstate.fx.st[id - LTE_REG_MMX_FIRST].mm;
      if((ok = lte_strtovec(str, mm->qw, LTE_ARRAY_SIZE(mm->qw))))
         state->xstate.xhdr.xstate_bv |= LTE_XFEATURE_MASK_X87;
   }
   else if (LTE_REG_MXCSR_FIRST <= id && id <= LTE_REG_MXCSR_LAST)
   {
      if((ok = strntogpr(str, &regval)))
      {
         state->xstate.xhdr.xstate_bv |= LTE_XFEATURE_MASK_SSE;
         state->xstate.fx.mxcsr = (lte_uint32_t)regval;
      }
   }
   else if (LTE_REG_PSEUDOX87_FIRST <= id && id <= LTE_REG_PSEUDOX87_LAST)
   {
      if((ok = strntogpr(str, &regval)))
      {
         switch(id)
         {
            case LTE_REG_FCW:
               state->xstate.xhdr.xstate_bv |= LTE_XFEATURE_MASK_X87;
               state->xstate.fx.fcw = (lte_uint16_t)regval;
               break;
            case LTE_REG_FSW:
               state->xstate.xhdr.xstate_bv |= LTE_XFEATURE_MASK_X87;
               state->xstate.fx.fsw = (lte_uint16_t)regval;
               break;
            case LTE_REG_FTW:
               state->xstate.xhdr.xstate_bv |= LTE_XFEATURE_MASK_X87;
               state->xstate.fx.ftw = (lte_uint16_t)regval;
               break;
            case LTE_REG_FOP:
               state->xstate.xhdr.xstate_bv |= LTE_XFEATURE_MASK_X87;
               state->xstate.fx.fop = (lte_uint16_t)regval;
               break;
            case LTE_REG_X87CS:
               state->xstate.xhdr.xstate_bv |= LTE_XFEATURE_MASK_X87;
               state->xstate.fx.fcs = (lte_uint16_t)regval;
               break;
            case LTE_REG_FPUIP:
               state->xstate.xhdr.xstate_bv |= LTE_XFEATURE_MASK_X87;
               state->xstate.fx.fip = (lte_uint32_t)regval;
               break;
            case LTE_REG_X87DS:
               state->xstate.xhdr.xstate_bv |= LTE_XFEATURE_MASK_X87;
               state->xstate.fx.fos = (lte_uint16_t)regval;
               break;
            case LTE_REG_FPUDP:
               state->xstate.xhdr.xstate_bv |= LTE_XFEATURE_MASK_X87;
               state->xstate.fx.foo = (lte_uint32_t)regval;
               break;
            default:;
         }
      }
   }
   else if (LTE_REG_X87_FIRST <= id && id <= LTE_REG_X87_LAST)
   {
      lte_x87_st_reg_t* st = &state->xstate.fx.st[id - LTE_REG_X87_FIRST];
      if((ok = lte_strtovec(str, st->qw, LTE_ARRAY_SIZE(st->qw))))
         state->xstate.xhdr.xstate_bv |= LTE_XFEATURE_MASK_X87;
   }
   else if (LTE_REG_XMM_FIRST <= id && id <= LTE_REG_XMM_LAST)
   {
      lte_xmm_reg_t* xmm = (id < LTE_REG_XMM16) ? &state->xstate.fx.xmm[id - LTE_REG_XMM_FIRST] :
                                                   &state->xstate.ext7.zmm[id - LTE_REG_XMM16].xmm[0];
      if((ok = lte_strtovec(str, xmm->qw, LTE_ARRAY_SIZE(xmm->qw))))
         state->xstate.xhdr.xstate_bv |= LTE_XFEATURE_MASK_SSE;
   }
   else if (LTE_REG_YMM_FIRST <= id && id <= LTE_REG_YMM_LAST)
   {
      lte_ymm_reg_t ymm;
      if(ok = lte_strtovec(str, ymm.qw, LTE_ARRAY_SIZE(ymm.qw)))
      {
         if(id < LTE_REG_YMM16)
         {
            state->xstate.xhdr.xstate_bv |= (lte_uint64_t) LTE_XFEATURE_MASK_YMM; // cast will put 0s in top 32 bits
            state->xstate.fx.xmm[id - LTE_REG_YMM_FIRST] = ymm.xmm[0];
            state->xstate.ext2.ymmhi[id - LTE_REG_YMM_FIRST] = ymm.xmm[1];
         }
         else
         {
            state->xstate.xhdr.xstate_bv |= (lte_uint64_t) LTE_XFEATURE_MASK_HI16_ZMM; // cast will put 0s in top 32 bits
            state->xstate.ext7.zmm[id - LTE_REG_YMM16].ymm[0] = ymm;
         }
      }
   }
   else if (LTE_REG_ZMM_FIRST <= id && id <= LTE_REG_ZMM_LAST)
   {
      lte_zmm_reg_t zmm;
      if(ok = lte_strtovec(str, zmm.qw, LTE_ARRAY_SIZE(zmm.qw)))
      {
         if(id < LTE_REG_ZMM16)
         {
            state->xstate.xhdr.xstate_bv |= (lte_uint64_t) LTE_XFEATURE_MASK_ZMM_HI256; // cast will put 0s in top 32 bits
            state->xstate.fx.xmm[id - LTE_REG_ZMM_FIRST] = zmm.xmm[0];
            state->xstate.ext2.ymmhi[id - LTE_REG_ZMM_FIRST] = zmm.xmm[1];
            state->xstate.ext6.zmmhi[id - LTE_REG_ZMM_FIRST] = zmm.ymm[1];
         } 
         else
         {
            state->xstate.xhdr.xstate_bv |= (lte_uint64_t) LTE_XFEATURE_MASK_HI16_ZMM; // cast will put 0s in top 32 bits
            state->xstate.ext7.zmm[id - LTE_REG_ZMM16] = zmm;
         }
      }
   }
   else if (LTE_REG_BOUND_FIRST <= id && id <= LTE_REG_BOUND_LAST)
   {
      lte_mpx_bndreg_t* bndreg = &state->xstate.ext3.bnd[id - LTE_REG_BOUND_FIRST];
      if((ok = lte_strtovec(str, bndreg->qw, LTE_ARRAY_SIZE(bndreg->qw))))
         state->xstate.xhdr.xstate_bv |= (lte_uint64_t) LTE_XFEATURE_MASK_BNDREGS; // cast will put 0s in top 32 bits
   }
   else if(id == LTE_REG_BNDCFGU)
   {
      if((ok = strntogpr(str, &state->xstate.ext4.bndcsr.bndcfgu)))
         state->xstate.xhdr.xstate_bv |= (lte_uint64_t) LTE_XFEATURE_MASK_BNDCSR; // cast will put 0s in top 32 bits
   }
   else if(id == LTE_REG_BNDSTATUS)
   {
      if((ok = strntogpr(str, &state->xstate.ext4.bndcsr.bndstatus)))
         state->xstate.xhdr.xstate_bv |= (lte_uint64_t) LTE_XFEATURE_MASK_BNDCSR; // cast will put 0s in top 32 bits
   }
   else if(id == LTE_REG_XCR0)
   {
      if((ok = strntogpr(str, &regval)))
         state->xcr0 = regval;
   }
   else if (LTE_REG_SEGBASE_FIRST <= id && id <= LTE_REG_SEGBASE_LAST)
   {
      if((ok = strntogpr(str, &regval)))
         state->srstate.base[id - LTE_REG_SEGBASE_FIRST] = regval;
   }
   else if (LTE_REG_SR_FIRST <= id && id <= LTE_REG_SR_LAST)
   {
      if((ok = strntogpr(str, &regval)))
      {
         state->srstate.sr[id - LTE_REG_SR_FIRST].sel.v = (lte_uint32_t)regval;
      }
   }
   else
   {
      const char* reg_name = lte_reg_enum_t2str(id);
      if((strcmp(reg_name,"XINIT_BV")==0) || (strcmp(reg_name,"XMODIFIED_BV")==0))
      {
        // Ignore "XINIT_BV" and "XMODIFIED_BV"
        ok = true;
      }
      else
      {
        LTE_WARN("%s not supported, (%s:%s)", reg_name, reg_name, str);
        ok = false;
      }
   }

   return ok;
}

static bool is_ic_mark(lte_strlist_t& line)
{
   return (line.str_count() == 3 && !strcmp(line[0], "ic") && line[1][0] == ';');
}

static bool is_mark(lte_strlist_t& line)
{
   return (line.find(';') != NULL);
}

static bool is_end_mark(lte_strlist_t& line)
{
   return (line.str_count() >= 1 && !strcmp(line[0], "end_marker"));
}

bool pinball_arch_state_t::load_arch_state(const char* fname, lte_x86_state_t* state, lte_uint64_t* state_icount, lte_uint32_t* state_items_num)
{
   pinball_ifstream_t f(fname);

   if(!f)
      return false;

   lte_x86_state_init_state(state);
   char buffer[256];
   lte_uint32_t items_num = 0;
   lte_uint64_t icount = 0;

   for(lte_strlist_t line; f.getline(line);)
   {
      if(is_ic_mark(line))
      {
         for(bool parse_reg = true; f.getline(line);)
         {
            if((line.str_count() == 2) && !(is_end_mark(line)))
            {
               if(!parse_reg)
                  continue;

               char* end;
               lte_uint32_t index = lte_strtoul(line[0], &end, 10);
               if(*end && !isspace(*end))
               {
                  LTE_WARN("wrong format [%s:%d]", fname, f.getlinesread());
                  continue;
               }
               if(index > m_regs_info.size())
               {
                  LTE_WARN("wrong register index [%s:%d]", fname, f.getlinesread());
                  continue;
               }

               lte_strrvrs(line[1], line.length(1), buffer, sizeof(buffer));
               if(!get_reg_value(m_regs_info[index].id, m_regs_info[index].size, buffer, state))
               {
                  LTE_WARN("wrong register value [%s:%d]", fname, f.getlinesread());
                  continue;
               }
               ++items_num;
            }
            else if(is_end_mark(line))
            {
               char* end;
               icount = lte_strtoull(line[1], &end, 10);
               if(*end && !isspace(*end))
               {
                  LTE_WARN("wrong format [%s:%d]", fname, f.getlinesread());
               }
               break;
            }
            else if(is_mark(line))
            {
               parse_reg = false;
            }
         }
         break;
      }
   }

   state->xstate.xhdr.xstate_bv |= (lte_uint64_t) LTE_XFEATURE_MASK_X87; // must always be set // cast will put 0s in top 32 bits

   if(state_items_num)
      *state_items_num = items_num;

   if(state_icount)
      *state_icount = icount;

   return true;
}

bool parse_item(const char* item, lte_strlist_t& line, lte_uint32_t required_params_count)
{
   if(line.str_count() && !strcmp(item, line[0]) && ((line.str_count()-1) == required_params_count))
   {
      return true;
   }
   return false;
}

bool pinball_arch_state_t::load_arch_desc(const char* fname)
{
   pinball_ifstream_t f(fname);

   if(!f)
      return false;

   lte_uint32_t num_reg_descs  = 0;
   lte_int32_t last_index = -1;

   m_regs_info.clear();

   for(lte_strlist_t line; f.getline(line);)
   {
      if(num_reg_descs)
      {
         LTE_ERRAX(line.find(':'), "required %d register descriptions, but only %d found", m_regs_info.size(), (m_regs_info.size() - num_reg_descs));

         if(line.str_count() == 3)
         {
            char* end;
            lte_uint32_t index = lte_strtoul(line[1], &end, 10);
            if(*end)
            {
               LTE_WARN("wrong format [%s:%d]", fname, f.getlinesread());
               continue;
            }

            lte_int32_t delta = index - (last_index + 1);
            LTE_ERRAX((delta < 0), " input register indices are not in increasing order last_index: %d index %d\n   line: %s %s %s", last_index, index, line[0], line[1], line[2]);
            if(delta > 0)
            {
              LTE_WARN("discontiguous register index %s for %s last_index %d", line[1], line[0], last_index);
               m_regs_info.resize(m_regs_info.size()+delta);
            }
            last_index = (lte_int32_t)index;
            if(index > m_regs_info.size())
               m_regs_info.resize(index);


            if(m_regs_info[index].size && m_regs_info[index].index != index)
            {
               LTE_WARN("duplication for %s [%s:%d]", line[0], fname, f.getlinesread());
               continue;
            }

            lte_uint32_t size = lte_strtoul(line[2], &end, 10);
            if(*end)
            {
               LTE_WARN("wrong format [%s:%d]", fname, f.getlinesread());
               continue;
            }
            if(!size)
            {
               LTE_WARN("wrong size %s of %s: %s:%d", line[0], line[2], fname, f.getlinesread());
               continue;
            }

            lte_reg_enum_t regname = LTE_REG_INVALID;
            regname= str2lte_reg_enum_t(line.to_upper(0));
            if(regname == LTE_REG_INVALID)
            {
               LTE_WARN("Unhandled register %s");
               continue;
            }
            m_regs_info[index].id = str2lte_reg_enum_t(line.to_upper(0));
            m_regs_info[index].index = index;
            m_regs_info[index].size = size;
            --num_reg_descs;
         }
         else
         {
            if(line.str_count() > 0)
               LTE_WARN("wrong format [%s:%d]", fname, f.getlinesread());
            continue;
         }
      }
      else if(!line.str_count())
      {
         continue;
      }
      else if(parse_item("arch:", line, 1))
      {
         if(strcmp(line[1], "x86_64") == 0)
         {
            m_arch = ELFCLASS64;
         }
         else if(strcmp(line[1], "x86_32") == 0)
         {
            m_arch = ELFCLASS32;
            LTE_ERRX("%s architecture is not supported [%s:%d]", line[1], fname, f.getlinesread());
         }
         else
         {
            LTE_WARN("wrong architecrute '%s' [%s:%d]", line[1], fname, f.getlinesread());
         }
      }
      else if(parse_item("num_reg_descs:", line, 1))
      {
         char* end;
         num_reg_descs = lte_strtoul(line[1], &end, 10);
         if(*end)
         {
            LTE_WARN("wrong format [%s:%d]", fname, f.getlinesread());
            continue;
         }

         if(num_reg_descs)
         {
            if(m_regs_info.size())
               LTE_WARN("register descriptions already loaded");
            m_regs_info.resize(num_reg_descs);
         }
      }
      else if(parse_item("vdso_address:", line, 2))
      {
         char* end;

         lte_addr_t vdso_lower = lte_strtoull(line[1], &end, 16);
         if(*end)
         {
            LTE_WARN("wrong format [%s:%d]", fname, f.getlinesread());
            continue;
         }

         lte_addr_t vdso_upper = lte_strtoull(line[2], &end, 16);
         if(*end)
         {
            LTE_WARN("wrong format [%s:%d]", fname, f.getlinesread());
            continue;
         }

         m_vdso_lower = vdso_lower;
         m_vdso_upper = vdso_upper;
      }
      else if(parse_item("num_static_threads:", line, 1))
      {
         char* end;
         lte_uint32_t n = lte_strtoul(line[1], &end, 10);
         if(*end)
         {
            LTE_WARN("wrong format [%s:%d]", fname, f.getlinesread());
            continue;
         }
         m_num_static_threads = n;
      }
      else if(parse_item("num_dynamic_threads:", line, 1))
      {
         char* end;
         lte_uint32_t n = lte_strtoul(line[1], &end, 10);
         if(*end)
         {
            LTE_WARN("wrong format [%s:%d]", fname, f.getlinesread());
            continue;
         }
         m_num_dynamic_threads = n;
      }
      else if(parse_item("num_threads_started:", line, 1))
      {
         char* end;
         lte_uint32_t n = lte_strtoul(line[1], &end, 10);
         if(*end)
         {
            LTE_WARN("wrong format [%s:%d]", fname, f.getlinesread());
            continue;
         }
         m_num_threads_started = n;
      }
      else if(!strcmp("app-command-line:", line[0]))
      {
         if(line.str_count() > 1)
            m_app_name = line[1];
      }
      // There are two lines beginning with 'log'
      // log creation date/time: Fri Apr  6 19:24:04 2018
      // log format version: 2.9
      // we want the one with 3 items
      else if(parse_item("log", line, 3))
      {
         char* end;
         const std::string delimiter = ".";
         std::string version = line[3];
         // get major
         std::string::size_type last_pos = 
            version.find_first_not_of(delimiter, 0);
         std::string::size_type pos = 
              version.find_first_of(delimiter, last_pos);
         std::string num = version.substr(last_pos, pos - last_pos);
         lte_uint32_t major = lte_strtoul(num.c_str(), &end, 10);
         if(*end)
         {
           LTE_WARN("wrong format [%s:%d]", fname, f.getlinesread());
         }      

         // get minor
         last_pos = version.find_first_not_of(delimiter, pos);
         pos = version.find_first_of(delimiter, last_pos);
         num = version.substr(last_pos, pos - last_pos);
         lte_uint32_t minor = lte_strtoul(num.c_str(), &end, 10);
         if(*end)
         {
            LTE_WARN("wrong format [%s:%d]", fname, f.getlinesread());
         }     
         if ( (major > 2) || ((major==2) && (minor >=9)) )
            m_text_compressed = true;
         else
            m_text_compressed = false;
         continue;
      } 
   }

   return true;
}

bool pinball_memimg_t::load_compressed(const char* fname, 
    lte_addr_t addr_max)
{
   const char   delta_marker_char         = ';';
   const char   repeat_marker_char        = ':';

   pinball_ifstream_t f(fname);
   if(!f)
      return false;

   char* end;

   if(!addr_max)
      addr_max = ~(lte_addr_t)0;

   lte_strlist_t line;
   while(true)
   {
      lte_addr_t page_addr = 0;
      lte_uint32_t page_offs = 0;
      lte_mempage_t* page = NULL;
      if(!f.getline(line)) break;

      lte_uint32_t count = line.str_count();
      if(!strncmp(line[0], "/0x", 3))
      {
         page_addr = lte_strtoull(line[0] + 3, &end, 16);
      }
      else
      {
         LTE_ERRAX(1, "page address format error [%s:%d]", fname, f.getlinesread());
      }
      lte_uint32_t i = 0;
      lte_uint32_t buffered_repeat_count = 0;
      lte_addr_t buffered_load_value = 0;
      lte_uint8_t tmp_content[page_size];
      lte_addr_t *value = (lte_addr_t *)tmp_content;
      while(true)
      {
          // The buffered_load_value should be used again
          if (buffered_repeat_count)
          {
            buffered_repeat_count--;
            *value = buffered_load_value;
            i++;
            if (  i == page_size / sizeof(lte_addr_t) ) break;
          }
          // Read the text file
          else
          {
            if (!f.getline(line))
            {
              LTE_ERRAX(1, "Unexpected end of file [%s:%d]", fname, f.getlinesread());
            }
            lte_uint32_t count = line.str_count();
            if(!count)  // empty line
            {
              LTE_ERRAX(1, "Unexpected empty line [%s:%d]", fname, f.getlinesread());
            }
            if(count == 3)  // new page
            {
              LTE_ERRAX(1, "Unexpected page record[%s:%d]", fname, f.getlinesread());
            }
            // Check markers
            if (line[0][0] == repeat_marker_char)
            { // this is a repeat count, the buffered_load_value should remain the
              // same for buffered_repeat_count times
              // read as a decimal number
              buffered_repeat_count = lte_strtoull(line[0]+1, &end, 10);
              LTE_ERRAX(*end, "invalid repeat_marker '%s' in mem image file [%s:%d]", line[0], fname, f.getlinesread());
              buffered_repeat_count--;
              *value = buffered_load_value;
              i++;
              if (  i == page_size / sizeof(lte_addr_t) ) break;
            }
            else if (line[0][0] == delta_marker_char)
            {   // This is delta marker
              // read as a decimal number
              lte_int64_t delta_value = 
              lte_strtoull(line[0]+1, &end, 10);
              LTE_ERRAX(*end, "invalid delta_marker '%s' in mem image file [%s:%d]", line[0], fname, f.getlinesread());
              buffered_load_value += delta_value;
              *value = buffered_load_value;
              i++;
              if (  i == page_size / sizeof(lte_addr_t) ) break;
            }
            else
            {   // Just read value entry
              lte_int64_t tmp_value = 
                  lte_strtoull(line[0], &end, 16);
              buffered_load_value = *value = tmp_value;
              i++;
              if (  i == page_size / sizeof(lte_addr_t) ) break;
            }
          }
          value++;
      }
      page_offs = page_addr & (lte_addr_t)(page_size-1);
      LTE_ERRAX(page_offs, "Non-zero page_offset 0x%x for page_addr 0x%x", page_offs, page_addr);
      page_addr &= ~(lte_addr_t)(page_size-1);

      page = &m_mem[page_addr];
      page->va = page_addr;
      lte_uint32_t rest = page->set(page_offs, &tmp_content[0], page_size);
      LTE_ERRAX(rest, "Error copying text page at 0x%x", page_addr);
   }

   compact();

   return true;
}

bool pinball_memimg_t::load(const char* fname, lte_addr_t addr_max, lte_bool_t text_compressed)
{
   pinball_ifstream_t f(fname);

   if(!f)
      return false;

   if (text_compressed)
   {
      return load_compressed(fname, addr_max);
   }

   lte_bool_t new_page = false;
   lte_addr_t page_addr;
   lte_uint32_t page_offs = 0;
   lte_mempage_t* page = NULL;
   char* end;

   if(!addr_max)
      addr_max = ~(lte_addr_t)0;

   for(lte_strlist_t line; f.getline(line);)
   {
      lte_uint32_t count = line.str_count();

      if(!count)
         continue;

      if(count > 1)
      {
         new_page = false;
         page = NULL;

         LTE_ERRAX(count != 3, "invalid data in mem image file [%s:%d]", fname, f.getlinesread());

         if(!strncmp(line[0], "/0x", 3))
         {
            page_addr = lte_strtoull(line[0] + 3, &end, 16);
            if(!*end && ((page_addr + page_size) <= addr_max))
               new_page = true;
         }
      }
      else if(count == 1)
      {
         if(page || new_page)
         {
            #ifdef MEMIMG_BYTES_REVERSED
            lte_uint64_t data = lte_strtoull(lte_strrvrshex(line[0], line.length(0), buffer, sizeof(buffer)), &end, 16);
            #else
            lte_uint64_t data = lte_strtoull(line[0], &end, 16);
            #endif
            LTE_ERRAX(*end, "invalid data '%s' in mem image file [%s:%d]", line[0], fname, f.getlinesread());

            if(new_page || (page_offs >= page_size))
            {
               page_offs = page_addr & (lte_addr_t)(page_size-1);
               page_addr &= ~(lte_addr_t)(page_size-1);

               page = &m_mem[page_addr];
               page->va = page_addr;
               new_page = false;
            }

            const lte_uint8_t* p = (const lte_uint8_t*)&data;
            lte_uint32_t rest = page->set(page_offs, p, m_data_item_size);

            if(rest)
            {
               page_addr += page_size;
               page_offs = rest;

               page = &m_mem[page_addr];
               page->va = page_addr;
               page->set(0, p + (m_data_item_size - rest), rest);
            }
            else
            {
               page_offs += m_data_item_size;
            }
         }
      }
   }

   compact();

   return true;
}

bool pinball_mem_layout_t::load(const char* fname, lte_uint32_t text_flags, lte_uint32_t data_flags)
{
   pinball_ifstream_t f(fname);

   if(!f)
      return false;

   for(lte_strlist_t line; f.getline(line);)
   {
      if(line.str_count() == 4)
      {
         region_t rgn;
         char* end;

         rgn.vastart = lte_strtoull(line[0], &end, 16);
         if(*end)
         {
            LTE_WARN("wrong format [%s:%d]", fname, f.getlinesread());
            continue;
         }

         rgn.vaend = lte_strtoull(line[1], &end, 16);
         if(*end)
         {
            LTE_WARN("wrong format [%s:%d]", fname, f.getlinesread());
            continue;
         }

         if(!strcmp(line[2], "text"))
         {
            rgn.flags = text_flags;//SHF_ALLOC | SHF_EXECINSTR;
         }
         else if(!strcmp(line[2], "data"))
         {
            rgn.flags = data_flags;//SHF_ALLOC | SHF_WRITE;
         }
         else
         {
            LTE_WARN("wrong format [%s:%d]", fname, f.getlinesread());
            continue;
         }

         rgn.data = lte_strtoull(line[1], &end, 10);
         m_regions[rgn.vastart] = rgn;
      }
      else
      {
         LTE_WARN("wrong format [%s:%d]", fname, f.getlinesread());
      }
   }

   return true;
}

void pinball_mem_layout_t::print()
{
   for(std::map<lte_addr_t, region_t>::iterator it = m_regions.begin(); it != m_regions.end(); ++it)
   {
      region_t& rgn = it->second;
      std::cout << print_hex(rgn.vastart, 12) << " - " << print_hex(rgn.vaend, 12)
                << ' ' << ((rgn.flags & SHF_EXECINSTR) ? "text" : ((rgn.flags & SHF_WRITE) ? "data" : "????" ))
                << ' ' << rgn.data << '\n';
   }
}
