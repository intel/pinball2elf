/*BEGIN_LEGAL 
BSD License 

Copyright (c)2019 Intel Corporation. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
END_LEGAL */
#ifndef LTE_ENTRY_POINT_H
#define LTE_ENTRY_POINT_H

#include "lte_x86_state.h"
#include "lte_syself.h"
#include "lte_strtab.h"
#include <vector>

struct lte_thread_state_t : lte_x86_state_t {
   lte_uint64_t icount;
};

enum {
   E32_GFUNC = ELF32_ST_INFO(STB_GLOBAL, STT_FUNC),
   E64_GFUNC = ELF64_ST_INFO(STB_GLOBAL, STT_FUNC),
   E32_LOBJECT = ELF32_ST_INFO(STB_LOCAL, STT_OBJECT),
   E64_LOBJECT = ELF64_ST_INFO(STB_LOCAL, STT_OBJECT),
};

class entry_point_t {
public:
   typedef Elf_SymInfo_t sym;
   typedef Elf_Rela_t rela;

protected:
   elf_table_t       m_state;
   std::vector<sym>  m_code_symbols;
   std::vector<sym>  m_data_symbols;
   std::vector<rela> m_code_rela;
   std::vector<rela> m_data_rela;
   lte_uint8_t*      m_entry;
   lte_uint8_t*      m_entry_buffer;
   lte_addr_t        m_entry_va;
   lte_addr_t        m_entry_data_va;
   lte_size_t        m_entry_size;
   lte_addr_t        m_start_offs;
   lte_addr_t        m_start_size;
   lte_uint32_t      m_threads_num;
   lte_size_t        m_thread_state_offs;
   lte_size_t        m_thread_state_size;
   lte_size_t        m_thread_state_align;
   lte_size_t        m_thread_ip_offs;
   lte_size_t        m_dmap_offs;
   lte_uint32_t      m_dmap_pages_num;
   lte_size_t        m_pstart_cbk_sym;
   lte_size_t        m_pexit_cbk_sym;
   lte_size_t        m_tstart_cbk_sym;

protected:
   template<typename T> void add(const T& sym_data);
   template<typename T> void add(lte_uint32_t tid, const T& sym_data, const char* sym_name, unsigned char sym_info);
   void add(lte_uint32_t tid, const void* sym_data, lte_size_t sym_data_size, const char* sym_name, unsigned char sym_info);
   void add(const void* sym_data, lte_size_t sym_data_size, const char* sym_name, unsigned char sym_info);
   void add_padding(lte_size_t size, int c = 0) { m_state.push_back(NULL, size, c); }

   void clear_initial_state();

public:
   entry_point_t();
   virtual ~entry_point_t();

   static entry_point_t* create_entry_point(Elf_Class_t e_class = ELFCLASS32, lte_uint32_t threads_num = 0);
   static entry_point_t* create_entry_point(Elf_Class_t e_class, void* ptr, lte_size_t size);

   virtual void setup(lte_uint32_t threads_num, lte_thread_state_t* states, void* dmap_pages, lte_uint32_t dmap_pages_num) = 0;
   virtual void relocate_code(lte_addr_t va) = 0;
   virtual void relocate_data(lte_addr_t va) = 0;
   virtual void relocate_dmap_data(lte_uint64_t offs) = 0;
   virtual void enable_modify_ldt(bool enable) = 0;
   virtual void set_proc_start_callback(const char* name) = 0;
   virtual void set_proc_exit_callback(const char* name) = 0;
   virtual void set_thread_start_callback(const char* name) = 0;
   virtual void set_callback_stack_size(lte_uint32_t size) = 0;
   virtual void set_roi_mark_thread(lte_uint32_t tid) = 0;
   virtual void set_start_roi_mark(lte_uint32_t tag, lte_uint32_t type) = 0;
   virtual void set_magic2_tag(lte_uint32_t tag, lte_uint32_t type) = 0;

   lte_addr_t get_start_va() const
   {
      return get_code_va() + m_start_offs;
   }

   lte_addr_t get_code_va() const
   {
      return m_entry_va;
   }
   lte_size_t get_code_size() const
   {
      return m_entry_size;
   }
   const lte_uint8_t* get_code_bytes() const
   {
      return m_entry;
   }

   lte_addr_t get_data_va() const
   {
      return m_entry_data_va;
   }
   lte_size_t get_data_size() const
   {
      return m_state.table_size();
   }
   const lte_uint8_t* get_data_bytes() const
   {
      return (const lte_uint8_t*)m_state.table_ptr();
   }

   const sym* get_code_sym_first() const
   {
      return m_code_symbols.size() ? &m_code_symbols[0] : NULL;
   }
   const sym* get_code_sym_end() const
   {
      return m_code_symbols.size() ? (&m_code_symbols[0] + m_code_symbols.size()): NULL;
   }
   lte_size_t get_code_syms_count() const
   {
      return m_code_symbols.size();
   }

   const sym* get_data_sym_first() const
   {
      return m_data_symbols.size() ? &m_data_symbols[0] : NULL;
   }
   const sym* get_data_sym_end() const
   {
      return m_data_symbols.size() ? (&m_data_symbols[0] + m_data_symbols.size()): NULL;
   }
   lte_size_t get_data_syms_count() const
   {
      return m_data_symbols.size();
   }
};

class entry_point32_t : public entry_point_t {
protected:
   void setup_initial_state(lte_uint32_t threads_num, lte_thread_state_t* states, void* dmap_pages, lte_uint32_t dmap_pages_num);

public:
   entry_point32_t(lte_uint32_t threads_num);
   entry_point32_t(void* ptr, lte_size_t size);
   ~entry_point32_t();

   void setup(lte_uint32_t threads_num, lte_thread_state_t* states, void* dmap_pages, lte_uint32_t dmap_pages_num);
   void relocate_code(lte_addr_t va);
   void relocate_data(lte_addr_t va);
   void relocate_dmap_data(lte_uint64_t offs);
   void enable_modify_ldt(bool enable);
   void set_proc_start_callback(const char* name);
   void set_proc_exit_callback(const char* name);
   void set_thread_start_callback(const char* name);
   void set_callback_stack_size(lte_uint32_t size);
   void set_roi_mark_thread(lte_uint32_t tid);
   void set_start_roi_mark(lte_uint32_t tag, lte_uint32_t type);
   void set_magic2_tag(lte_uint32_t tag, lte_uint32_t type);
};

class entry_point64_t : public entry_point_t {
protected:
   void setup_initial_state(lte_uint32_t threads_num, lte_thread_state_t* states, void* dmap_pages, lte_uint32_t dmap_pages_num);

public:
   entry_point64_t(lte_uint32_t threads_num);
   entry_point64_t(void* ptr, lte_size_t size);
   ~entry_point64_t();

   void setup(lte_uint32_t threads_num, lte_thread_state_t* states, void* dmap_pages, lte_uint32_t dmap_pages_num);
   void relocate_code(lte_addr_t va);
   void relocate_data(lte_addr_t va);
   void relocate_dmap_data(lte_uint64_t offs);
   void enable_modify_ldt(bool enable);
   void set_proc_start_callback(const char* name);
   void set_proc_exit_callback(const char* name);
   void set_thread_start_callback(const char* name);
   void set_callback_stack_size(lte_uint32_t size);
   void set_roi_mark_thread(lte_uint32_t tid);
   void set_start_roi_mark(lte_uint32_t tag, lte_uint32_t type);
   void set_magic2_tag(lte_uint32_t tag, lte_uint32_t type);
};

#endif    /* LTE_ENTRY_POINT_H */
