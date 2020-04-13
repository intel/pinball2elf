/*BEGIN_LEGAL 
BSD License 

Copyright (c)2019 Intel Corporation. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
END_LEGAL */
#ifndef LTE_MEMIMG_H
#define LTE_MEMIMG_H

#include "lte_types.h"
#include "lte_syself.h"
#include "lte_elf.h"
#include <map>

#include "lte_mem.h"

enum lte_memsec_flags_enum_t {
   SHF_TEXT       = (SHF_ALLOC|SHF_EXECINSTR),
   SHF_DATA       = (SHF_ALLOC|SHF_WRITE),
   SHF_TYPEMASK   = (SHF_TEXT|SHF_DATA),
   SHF_RELPROBE   = (1 << 28), // reusing
   SHF_STACK      = (1 << 29), // reusing
   SHF_DYNALLOC   = (1 << 30), // reusing
   SHF_ENTRYPOINT = (1 << 31), // reusing
};

class lte_mempage_t : public elf_mempage_t, public mem::page {
   public:
      lte_mempage_t*  region_next;
      lte_uint64_t    region_size;
      lte_addr_t      va;
      lte_addr_t      pa;
      lte_uint32_t    offs_start;
      lte_uint32_t    offs_end;

      lte_mempage_t();
      lte_uint32_t get(lte_uint8_t* p, lte_uint32_t offs, lte_uint32_t size);
      lte_uint32_t set(lte_uint32_t offs, const lte_uint8_t* p, lte_uint32_t size);
      bool is_free(lte_uint32_t offs, lte_uint32_t length);
      std::pair<lte_uint32_t,bool> find_free_block(lte_uint32_t length);
      bool empty() const { return offs_end <= offs_start; }
      void reserve(lte_uint32_t offs, lte_uint32_t length);
      bool contains(lte_addr_t addr) { return (addr - va) < get_size(); }

      lte_addr_t data_addr() const { return va + offs_start; }
      lte_addr_t data_end_addr() const { return va + offs_end; }
      lte_addr_t data_size() const { return offs_end - offs_start; }
};

class lte_memimg_t {
   public:
      static const lte_uint32_t page_size = ELF_PAGE_SIZE;

   protected:
      std::map<lte_addr_t, lte_mempage_t> m_mem;

   public:
      typedef std::map<lte_addr_t, lte_mempage_t>::iterator iterator;

   public:
      lte_memimg_t() {}

      virtual bool load(const char* fname, lte_addr_t addr_max, lte_bool_t text_compressed) = 0;

      lte_addr_t find_free_block(lte_size_t size, lte_uint32_t shflags);
      std::pair<lte_addr_t, bool> find_free_block(lte_addr_t addr, lte_addr_t addr_lo, lte_addr_t addr_hi, lte_size_t size, lte_uint32_t shflags);
      lte_mempage_t* get_first_page() { return m_mem.size() ? &m_mem.begin()->second : NULL; }
      lte_mempage_t* get_page(lte_addr_t addr);
      lte_mempage_t* get_last_page() { return m_mem.size() ? &m_mem.rbegin()->second : NULL; }
      lte_uint64_t get_regions_number(lte_uint64_t flags);
      void add_missing_page(lte_addr_t missing_page_addr, lte_uint8_t *page_content);
      lte_uint64_t compact(lte_uint64_t regions_max = 0);
      lte_uint64_t memcopy(lte_addr_t addr, const lte_uint8_t* p, lte_uint64_t size);
      lte_uint64_t memcopy(lte_uint8_t* p, lte_addr_t addr, lte_uint64_t size);
      lte_addr_t insert(const lte_uint8_t* p, lte_uint64_t size, lte_uint32_t shflags, bool reserve = false);
      bool insert(lte_addr_t addr, const lte_uint8_t* p, lte_uint64_t size, lte_uint32_t shflags, bool reserve = false);
      bool is_free(lte_addr_t addr, lte_uint64_t size);
      iterator begin() { return m_mem.begin(); }
      iterator end() { return m_mem.end(); }
      void mark(lte_addr_t vastart, lte_addr_t vaend, lte_uint32_t shflags);
      void print();
};

class lte_mem_layout_t {
   public:
      struct region_t {
         lte_addr_t   vastart;
         lte_addr_t   vaend;
      };

   protected:
      std::map<lte_addr_t, region_t> m_regions;
      lte_size_t m_block_size;

   public:
      typedef std::map<lte_addr_t, region_t>::iterator iterator;

      lte_addr_t get_aligned(lte_addr_t va) { return __lte_align(va, m_block_size); }

   public:
      lte_mem_layout_t(lte_size_t block_size = ELF_PAGE_SIZE) : m_block_size(block_size)  {}

      lte_addr_t insert(lte_addr_t va, lte_uint64_t size);
      lte_addr_t insert(lte_uint64_t size);
      lte_addr_t find_free_block(lte_addr_t va, lte_uint64_t size);
      lte_addr_t find_free_block(lte_uint64_t size);

      iterator begin() { return m_regions.begin(); }
      iterator end() { return m_regions.end(); }

      void print();
};

#endif //LTE_MEMIMAGE_H
