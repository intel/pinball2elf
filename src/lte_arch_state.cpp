/*BEGIN_LEGAL 
BSD License 

Copyright (c)2019 Intel Corporation. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
END_LEGAL */
#include "lte_arch_state.h"
#include "lte_pinball.h"
#include "lte_config.h"

lte_x86_arch_state_t::lte_x86_arch_state_t(int entry_num)
{
   thread_state = NULL;
   threads_num = 0;
   threads_num_max = 0;
   arch = ELFCLASSNONE;
   text_compressed = false;
}

lte_x86_arch_state_t::~lte_x86_arch_state_t()
{
   clear();
}

void lte_x86_arch_state_t::print(void)
{
   return;
}

static std::string get_pinball_basename(const std::string& fname, const std::string& ext)
{
   if(fname.length() > ext.length())
   {
      size_t basename_length = fname.length() - ext.length();
      if(fname.compare(basename_length, ext.length(), ext) == 0 && fname.c_str()[basename_length-1] != '/')
         return fname.substr(0, basename_length);
   }
   return fname;
}

static std::string get_pinball_reg_file_name(const std::string& fname, size_t i, const std::string& ext)
{
   std::stringstream ss;
   ss << fname << '.' << i << ext;
   return ss.str();
}

void lte_x86_arch_state_t::clear()
{
   if(thread_state)
   {
      delete thread_state;
      thread_state = NULL;
   }
}

static lte_thread_state_t* load_arch_state(config_t& cfg, const char* state_fname, pinball_arch_state_t& p,
                                           lte_thread_state_t* state, lte_size_t& threads_num_max)
{
   lte_uint32_t state_items_num = 0;

   lte_x86_state_init_state(state);
   state->icount = 0;

   if(!p.load(state_fname, state, &state->icount, &state_items_num))
      return NULL;

   if(state_items_num > 0)
   {
      if(p.get_arch() == ELFCLASS32)
      {
         if(state->srstate.fs.sel.v > 3)
         {
            state->srstate.fs.sel.ti = 1;
            state->segdesc[LTE_REG_FS-LTE_REG_SR_FIRST].entry_number = state->srstate.fs.sel.index;
            state->segdesc[LTE_REG_FS-LTE_REG_SR_FIRST].base_addr = state->srstate.fs_base;
         }
         if(state->srstate.gs.sel.v > 3)
         {
            state->srstate.gs.sel.ti = 1;
            state->segdesc[LTE_REG_GS-LTE_REG_SR_FIRST].entry_number = state->srstate.gs.sel.index;
            state->segdesc[LTE_REG_GS-LTE_REG_SR_FIRST].base_addr = state->srstate.gs_base;
         }
      }
      else if(!cfg.no_modify_ldt(p.get_arch()))
      {
         if(state->srstate.fs.sel.v > 3)
         {
            state->srstate.fs.sel.ti = 1;
            state->segdesc[LTE_REG_FS-LTE_REG_SR_FIRST].entry_number = state->srstate.fs.sel.index;
         }
         if(state->srstate.gs.sel.v > 3)
         {
            state->srstate.gs.sel.ti = 1;
            state->segdesc[LTE_REG_GS-LTE_REG_SR_FIRST].entry_number = state->srstate.gs.sel.index;
         }
      }

      if(state->icount < cfg.get_thread_min_icount())
      {
         if(get_config().is_verbose())
            fprintf(stdout, "Skip thread with low icount = %" PRIx64 ", file %s\n", state->icount, state_fname);
         LTE_ERRAX(!--threads_num_max, "no threads to start");
      }
      else
      {
         ++state;
      }
   }
   else
   {
      LTE_WARN("ignoring empty arch state file %s", state_fname);
      LTE_ERRAX(!--threads_num_max, "all arch state files are empty, no threads to start");
   }

   return state;
}

bool lte_x86_arch_state_t::load(config_t& cfg)
{
   const char* state_desc_fname = cfg.get_arch_desc_file_name();

   LTE_ASSERT(state_desc_fname);

   pinball_arch_state_t p(state_desc_fname);

   if(p.get_arch() == ELFCLASSNONE)
      return false;

   LTE_ERRAX(!p.get_num_dynamic_threads(), "no threads number information in \"%s\"", state_desc_fname);

   clear();

   // limiting max number of static threads to LTE_MAXVAL(lte_short_t)
   LTE_ERRAX(p.get_num_static_threads()  > LTE_MAXTHREADS, "number of static threads \"%d\" too large (max \"%d\") in \"%s\"", p.get_num_static_threads(),  LTE_MAXTHREADS,  state_desc_fname);

   threads_num = p.get_num_dynamic_threads();
   threads_num_max = p.get_num_static_threads();
   text_compressed = p.get_text_compressed();
   thread_state = new lte_thread_state_t[threads_num_max];
   arch = p.get_arch();

   const char* state_fname = cfg.get_arch_state_file_name();

   static std::string ext(".global.log");
   std::string state_desc_basename = get_pinball_basename(state_desc_fname, ext);

   if(threads_num_max == 1 && state_fname)
   {
      if(access(state_fname, R_OK) != 0)
         return false;
      return (load_arch_state(cfg, state_fname, p, &thread_state[0], threads_num_max) != NULL);
   }

   lte_thread_state_t* state = thread_state;
   size_t nthreads = threads_num_max;

   for(size_t tid = 0; tid < nthreads; ++tid)
   {
      std::string fname = get_pinball_reg_file_name(state_desc_basename, tid, ".reg");
      if(nthreads == 1 && access(fname.c_str(), R_OK) != 0)
      {
         fname = state_desc_basename;
         fname += ".reg";
      }
      state = load_arch_state(cfg, fname.c_str(), p, state, threads_num_max);
      if(state == NULL)
         return false;
   }

   if(threads_num > threads_num_max)
      threads_num = threads_num_max;

   return true;
}
