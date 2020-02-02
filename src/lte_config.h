/*BEGIN_LEGAL 
BSD License 

Copyright (c)2019 Intel Corporation. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
END_LEGAL */
#ifndef _LTE_CONFIG_H_
#define _LTE_CONFIG_H_

#include "lte_types.h"
#include "lte_utils.h"
#include "lte_elf.h"
#include <string>

enum roi_type_t {
   ROI_TYPE_SNIPER,
   ROI_TYPE_SSC,
   ROI_TYPE_SIMICS,
   ROI_TYPE_SIZE,
};

class config_t {
   private:
      const char* m_executable;     // base name of executable (argv[0])
      const char* m_mem_image_file;
      const char* m_mem_layout_file;
      const char* m_ld_script_file;
      const char* m_arch_desc_file;
      const char* m_arch_state_file;
      const char* m_exe_file;
      const char* m_obj_file;
      const char* m_arch_state_out_file;
      std::string m_default_exe_file;
      Elf32_Word m_dseg_flags;
      Elf32_Word m_tseg_flags;
      lte_uint64_t m_thread_min_icount;
      lte_addr_t m_remap_limit;
      lte_addr_t m_user_space_limit;
      lte_uint32_t m_cbk_stack_size;
      bool m_user_space_limit_set;
      bool m_no_modify_ldt;
      bool m_no_modify_ldt_set;
      bool m_no_stack_remap;
      bool m_no_startup;
      bool m_no_futexes;
      bool m_no_monitor_thread;
      bool m_verbose;
      const char* m_pstart_cbk;
      const char* m_pexit_cbk;
      const char* m_tstart_cbk;
      lte_uint32_t m_roi_start_tag[ROI_TYPE_SIZE];
      lte_uint32_t m_roi_start_mask;
      lte_uint32_t m_roi_thread_id;
      lte_uint32_t m_magic2_tag[ROI_TYPE_SIZE];
      lte_uint32_t m_magic2_mask;
      std::vector<const char*> m_nonopt_vec;
      char const* const* m_nonopt_argv;
      int m_nonopt_argc;
      std::vector<uint64_t> m_break_points;

   public:
      config_t();

      config_t(int argc, char* argv[])
      {
         init(argc, argv);
      }

      void init(int argc, char* argv[]);

      void usage(const char* exe_name) const;

      void help_msg(const char* exe_name) const;

      const char* get_mem_image_file_name() const
      {
         return m_mem_image_file;
      }
      const char* get_mem_layout_file_name() const
      {
         return m_mem_layout_file;
      }
      const char* get_arch_state_file_name() const
      {
         return m_arch_state_file;
      }
      const char* get_arch_desc_file_name() const
      {
         return m_arch_desc_file;
      }
      const char* get_arch_state_out_file_name() const
      {
         return m_arch_state_out_file;
      }
      const char* get_ld_script_file_name() const
      {
         return m_ld_script_file;
      }
      const char* get_exe_file_name() const
      {
         return m_exe_file;
      }
      const char* get_obj_file_name() const
      {
         return m_obj_file;
      }
      char const* const* get_nonopt_argv() const
      {
         return m_nonopt_argv;
      }
      int get_nonopt_argc() const
      {
         return m_nonopt_argc;
      }
      const char* get_process_cbk_name() const
      {
         return m_pstart_cbk;
      }
      const char* get_process_exit_cbk_name() const
      {
         return m_pexit_cbk;
      }
      const char* get_thread_cbk_name() const
      {
         return m_tstart_cbk;
      }
      lte_uint64_t get_thread_min_icount() const
      {
         return m_thread_min_icount;
      }
      lte_addr_t get_remap_limit() const
      {
         return m_remap_limit;
      }
      lte_uint32_t get_cbk_stack_size() const
      {
         return m_cbk_stack_size;
      }
      Elf32_Word get_data_seg_flags() const
      {
         return m_dseg_flags;
      }
      Elf32_Word get_text_seg_flags() const
      {
         return m_tseg_flags;
      }
      bool no_startup_code() const
      {
         return m_no_startup;
      }
      bool no_stack_remap() const
      {
         return m_no_stack_remap;
      }
      bool no_futexes() const
      {
         return m_no_futexes;
      }
      bool no_monitor_thread() const
      {
         return m_no_monitor_thread;
      }
      bool is_verbose() const
      {
         return m_verbose;
      }
      lte_uint32_t get_roi_start_tag(roi_type_t type) const
      {
         return m_roi_start_tag[type];
      }
      lte_uint32_t get_magic2_tag(roi_type_t type) const
      {
         return m_magic2_tag[type];
      }
      lte_uint32_t get_roi_thread_id() const
      {
         return m_roi_thread_id;
      }
      bool no_modify_ldt(unsigned char arch_mode) const;

      lte_addr_t get_user_space_limit(unsigned char arch_mode) const;

      auto& get_break_points()
      {
         return m_break_points;
      }
};

inline config_t& get_config()
{
   static config_t cfg;
   return cfg;
}

#endif /*_LTE_CONFIG_H_*/
