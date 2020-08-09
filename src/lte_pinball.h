/*BEGIN_LEGAL 
BSD License 

Copyright (c)2019 Intel Corporation. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
END_LEGAL */
#ifndef LTE_PINBALL_H
#define LTE_PINBALL_H

#include "lte_x86_state.h"
#include "lte_memimg.h"
#include "lte_string.h"
#include "lte_relocation.h"
#include <stdio.h>
#include <vector>
#include <string>
#include <map>

class pinball_ifstream_t {
   protected:
      lte_uint64_t m_lines_read;
      FILE* m_fh;

   public:
      pinball_ifstream_t(const char* fname) : m_lines_read(0), m_fh(fopen(fname, "r")) {}

      ~pinball_ifstream_t()
      { 
         if(m_fh != NULL)
            fclose(m_fh);
      }

      char* getline(lte_strlist_t& strlist, char wt = 0)
      {
         char* r = strlist.getline(m_fh, wt);
         ++m_lines_read;
         return r;
      }

      lte_uint64_t getlinesread() const
      {
         return m_lines_read;
      }

      operator bool () const
      {
         return (m_fh != NULL);
      }
};

class pinball_arch_state_t {
   protected:
      struct lte_reg_info_t {
         lte_reg_enum_t id;
         lte_uint32_t index;
         lte_uint32_t size;
      };
      std::vector<lte_reg_info_t> m_regs_info;
      std::string m_app_name;
      unsigned char m_arch;
      lte_addr_t m_vdso_lower;
      lte_addr_t m_vdso_upper;
      lte_uint32_t m_num_static_threads;
      lte_uint32_t m_num_dynamic_threads;
      lte_uint32_t m_num_threads_started;
      lte_bool_t m_text_compressed;

   protected:
      bool load_arch_desc(const char* fname);
      bool load_arch_state(const char* fname, lte_x86_state_t* state, lte_uint64_t* state_icount, lte_uint32_t* state_items_num);
      bool get_reg_value(lte_reg_enum_t id, lte_uint32_t size, const char* str, lte_x86_state_t* state);

   public:
      pinball_arch_state_t(const char* fname = NULL);

      unsigned char get_arch() const { return m_arch; }

      const std::string& get_app_name() { return m_app_name; }

      lte_addr_t get_vdso_lower() { return m_vdso_lower; }

      lte_addr_t get_vdso_upper() { return m_vdso_upper; }

      lte_uint32_t get_num_static_threads() const { return m_num_static_threads; }
      lte_bool_t get_text_compressed() const { return m_text_compressed; }

      lte_uint32_t get_num_dynamic_threads() const { return m_num_dynamic_threads; }

      lte_uint32_t get_num_threads_started() const { return m_num_threads_started; }

      bool load(const char* state_desc_file, const char* state_file, lte_x86_state_t* state)
      {
         return (load_arch_desc(state_desc_file) && load_arch_state(state_file, state, NULL, NULL));
      }

      bool load(const char* state_file, lte_x86_state_t* state, lte_uint64_t* state_icount, lte_uint32_t* state_items_num = NULL)
      {
         return (m_regs_info.size() && load_arch_state(state_file, state, state_icount, state_items_num));
      }
};

class pinball_memimg_t : public lte_memimg_t {
   protected:
      lte_uint32_t m_data_item_size;

      bool load_compressed(const char* fname, lte_addr_t addr_max);
   public:
      pinball_memimg_t(unsigned char arch = ELFCLASS64) : m_data_item_size((arch == ELFCLASS64) ? 8 : 4) {}

      bool load(const char* fname, lte_addr_t addr_max, lte_bool_t text_compressed);
};

class pinball_mem_layout_t {
   public:
      struct region_t {
         lte_addr_t vastart;
         lte_addr_t vaend;
         lte_uint32_t flags;
         lte_uint32_t data;
         region_t() { data = flags = 0; vastart = vaend = 0; }
      };

   protected:
      std::map<lte_addr_t, region_t> m_regions;

   public:
      typedef std::map<lte_addr_t, region_t>::iterator iterator;

   public:
      pinball_mem_layout_t() {}

      bool load(const char* fname, lte_uint32_t text_flags, lte_uint32_t data_flags);

      iterator begin() { return m_regions.begin(); }
      iterator end() { return m_regions.end(); }

      void print();
};

class pinball_rel_t
{
   public:
      struct rel_info_t : text_rinfo_t
      {
         lte_addr_t addr {0};
         lte_size_t rsize {0};
         lte_addr_t cb_addr {0};
         std::string cb_name;
         struct
         {
            lte_uint32_t addr:2;
            lte_uint32_t safe:1;
            lte_uint32_t mem:1;
            lte_uint32_t cb_addr:1;
         } flags {0, 0, 0, 0};

         rel_info_t() = default;
      };
   private:
      std::map<lte_addr_t, rel_info_t> m_rinfo;

   public:
      pinball_rel_t() {}

      bool load(const char* fname);

      auto begin() { return m_rinfo.begin(); }
      auto end() { return m_rinfo.end(); }

      void insert(lte_addr_t addr, const std::string& cb_name, lte_uint64_t inst_info);

      void print();
};

#endif //LTE_PINBALL_H
