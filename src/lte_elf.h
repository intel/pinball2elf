/*BEGIN_LEGAL 
BSD License 

Copyright (c)2019 Intel Corporation. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
END_LEGAL */
#ifndef _LTE_ELF_H_
#define _LTE_ELF_H_

#include "lte_types.h"
#include "lte_portability.h"
#include "lte_syself.h"
#include "lte_strtab.h"
#include "lte_mem.h"
#include <vector>
#include <map>

/**
 * Linux has a limit on a number of segments inside an application image
 * [NB: the limit is on a TOTAL number of segments, not only LOADable ones]
 *
 * LTE_ELF_MAX_PHDR_SIZE defines maximal total size of program headers in ELF
 */
const lte_uint32_t ELF_MAX_PHDR_SIZE = 0x10000;
const lte_uint32_t ELF_PAGE_SIZE = mem::page::SIZE;

extern unsigned char ELF_ST_INFO(Elf_Class_t e_class, int bind, int type);
extern unsigned char ELF_ST_BIND(Elf_Class_t e_class, int val);
extern unsigned char ELF_ST_TYPE(Elf_Class_t e_class, int val);

class elf_data_t {
   public:
      Elf64_Xword offs;  // offset from the beginning of section
      Elf64_Xword flags;
      elf_data_t* next;
      elf_data_t* head;
   public:
      elf_data_t() : offs(0), flags(0), next(NULL), head(this) {}

      virtual ~elf_data_t() {}

      virtual const Elf_Byte_t* get_data() const = 0;
      virtual Elf64_Xword get_size() const = 0;
      Elf64_Xword get_offs() const { return offs; }
      elf_data_t* get_last();
};

class elf_memdata_t : public elf_data_t {
public:
    const Elf_Byte_t* data;
    Elf64_Xword size;
public:
    elf_memdata_t() : data(NULL), size(0) {}

    const Elf_Byte_t* get_data() const { return data; }
    Elf64_Xword get_size() const { return size; }
};

class elf_mempage_t : public elf_data_t {
   public:
      Elf_Byte_t data[ELF_PAGE_SIZE];

      const Elf_Byte_t* get_data() const { return data;  }
      Elf64_Xword       get_size() const { return sizeof(data); }
};

class elf_t {
   public:
      class strtab : public elf_data_t, public elf_strtab_t {
         public:
            strtab(){}
            const Elf_Byte_t* get_data() const { return (const Elf_Byte_t*)table_ptr(); }
            Elf64_Xword       get_size() const { return table_size(); }
      };

      class datatab : public elf_data_t {
         public:
            typedef lte_uint32_t index_type;
         protected:
            std::vector<Elf_Byte_t> m_table;
            lte_size_t m_entry_size;
            index_type m_entries_num;

         protected:
            template<class T1, class T2> static void set_item(T1& dst, const T2& src) { dst = (T1)src; }

            lte_size_t get_entry_offs(index_type ndx) const { return (ndx * m_entry_size); }
            Elf_Byte_t* get_entry(index_type ndx)
            {
               LTE_ASSERT(get_entry_offs(ndx) < m_table.size());
               return &m_table[get_entry_offs(ndx)];
            }
            const Elf_Byte_t* get_entry(index_type ndx) const
            {
               LTE_ASSERT(get_entry_offs(ndx) < m_table.size());
               return &m_table[get_entry_offs(ndx)];
            }

         public:
            datatab(lte_size_t entry_size) : m_entry_size(entry_size), m_entries_num(0) {}

            const Elf_Byte_t* get_data() const 
            {
               LTE_ASSERT(m_table.size());
               return &m_table[0];
            }
            Elf64_Xword get_size() const { return m_table.size(); }
            index_type get_entries_num() const { return m_entries_num; }
            lte_size_t get_entry_size() const { return m_entry_size; }
      };

      class symtab : public datatab {
         public:
            symtab(lte_size_t symbol_size) : datatab(symbol_size) {}

            virtual index_type get_last_of_bind(unsigned char bind) const = 0;
            virtual Elf64_Word get_st_name(index_type ndx) const = 0;
            virtual void set_st_name(index_type ndx, Elf64_Word name) = 0;
            virtual Elf64_Addr get_st_value(index_type ndx) const = 0;
            virtual void set_st_value(index_type ndx, Elf64_Addr value) = 0;
            virtual Elf64_Xword get_st_size(index_type ndx) const = 0;
            virtual void set_st_size(index_type ndx, Elf64_Xword size) = 0;
            virtual unsigned char get_st_info(index_type ndx) const = 0;
            virtual void set_st_info(index_type ndx, unsigned char info) = 0;
            virtual unsigned char get_st_other(index_type ndx) const = 0;
            virtual void set_st_other(index_type ndx, unsigned char other) = 0;
            virtual Elf64_Section get_st_shndx(index_type ndx) const = 0;
            virtual void set_st_shndx(index_type ndx, Elf64_Section shndx) = 0;
            virtual void set(index_type ndx, Elf64_Word name, Elf64_Addr value, Elf64_Xword size, unsigned char info, unsigned char other, Elf64_Section shndx) = 0;

            void push_back(Elf64_Word name, Elf64_Addr value, Elf64_Xword size, unsigned char info, unsigned char other, Elf64_Section shndx)
            {
               index_type ndx = m_entries_num;
               resize(ndx);
               set(ndx, name, value, size, info, other, shndx);
            }

            void resize(index_type symbols_num)
            {
               index_type entries_num = m_entries_num;
               m_table.resize(get_entry_offs(m_entries_num = symbols_num + 1));
               //undefined section (must be the first item according to TIS ELF)
               if(!entries_num)
                  set(0, 0, 0, 0, 0, 0, SHN_UNDEF);
            }
      };

      class phdrstab : public datatab {
         public:
            phdrstab(lte_size_t phdr_size) : datatab(phdr_size) {}

            void resize(index_type phdrs_num)
            {
               m_table.resize(get_entry_offs(m_entries_num = phdrs_num));
            }

            virtual Elf64_Word get_p_type(index_type ndx) const = 0;
            virtual void set_p_type(index_type ndx, Elf64_Word type) = 0;
            virtual Elf64_Word get_p_flags(index_type ndx) const = 0;
            virtual void set_p_flags(index_type ndx, Elf64_Word flags) = 0;
            virtual Elf64_Off get_p_offset(index_type ndx) const = 0;
            virtual void set_p_offset(index_type ndx, Elf64_Off offset) = 0;
            virtual Elf64_Addr get_p_vaddr(index_type ndx) const = 0;
            virtual void set_p_vaddr(index_type ndx, Elf64_Addr vaddr) = 0;
            virtual Elf64_Addr get_p_paddr(index_type ndx) const = 0;
            virtual void set_p_paddr(index_type ndx, Elf64_Addr paddr) = 0;
            virtual Elf64_Xword get_p_filesz(index_type ndx) const = 0;
            virtual void set_p_filesz(index_type ndx, Elf64_Xword filesz) = 0;
            virtual Elf64_Xword get_p_memsz(index_type ndx) const = 0;
            virtual void set_p_memsz(index_type ndx, Elf64_Xword memsz) = 0;
            virtual Elf64_Xword get_p_align(index_type ndx) const = 0;
            virtual void set_p_align(index_type ndx, Elf64_Xword align) = 0;
      };

      class relatab : public datatab {
         public:
            relatab(lte_size_t rela_size) : datatab(rela_size) {}

            void resize(index_type rela_num)
            {
               m_table.resize(get_entry_offs(m_entries_num = rela_num));
            }

            virtual Elf64_Addr get_r_offset(index_type ndx) const = 0;
            virtual void set_r_offset(index_type ndx, Elf64_Addr offset) = 0;
            virtual Elf64_Xword get_r_info(index_type ndx) const = 0;
            virtual void set_r_info(index_type ndx, Elf32_Word sym, Elf32_Word type) = 0;
            virtual Elf64_Sxword get_r_addend(index_type ndx) const = 0;
            virtual void set_r_addend(index_type ndx, Elf64_Sxword addend) = 0;

            void push_back(Elf64_Addr offset, Elf32_Word sym, Elf32_Word type, Elf64_Sxword addend)
            {
               index_type index = m_entries_num;
               resize(index + 1);
               set_r_offset(index, offset);
               set_r_info(index, sym, type);
               set_r_addend(index, addend);
            }
      };

      class section {
         protected:
            friend class elf_t;
            template<class T1, class T2> static void set_item(T1& dst, const T2& src) { dst = (T1)src; }
         protected:
            elf_t* m_elf;
            Elf64_Section m_sh_index;
            elf_memdata_t m_data;
            relatab* m_relatab = { nullptr };
         public:
            section(elf_t* elf, Elf64_Section index);
            virtual ~section(){ if(m_relatab) delete m_relatab; }

            Elf64_Section get_index() const
            {
               return m_sh_index;
            }
            const char* get_name() const
            {
               LTE_ASSERT(m_elf != NULL);
               return m_elf->shstrtab()[0] + get_sh_name();//[m_sh_index];
            }
            void set_name(const char* name)
            {
               LTE_ASSERT(m_elf != NULL);
               m_elf->shstrtab().set(m_elf->shstrtab().find(get_sh_name()), name);
            }
            const elf_data_t* get_data() const { return &m_data; }
            elf_data_t* get_data() { return &m_data; }
            void set_data(elf_data_t* data);
            void set_data(const Elf_Byte_t* data, Elf64_Xword size);

            virtual const void* get_shdr() const = 0;
            virtual Elf64_Half get_shdr_size() const = 0;

            relatab* get_relatab() { return m_relatab; }
            void add_relatab_entry(Elf64_Addr offset, Elf32_Word sym, Elf32_Word type, Elf64_Sxword addend);

            virtual Elf64_Word get_sh_name() const = 0;
            virtual void set_sh_name(Elf64_Word name) = 0;
            virtual Elf64_Word get_sh_type() const = 0;
            virtual void set_sh_type(Elf64_Word type) = 0;
            virtual Elf64_Xword get_sh_flags() const = 0;
            virtual void set_sh_flags(Elf64_Xword flags) = 0;
            virtual Elf64_Addr get_sh_addr() const = 0;
            virtual void set_sh_addr(Elf64_Addr addr) = 0;
            virtual Elf64_Off get_sh_offset() const = 0;
            virtual void set_sh_offset(Elf64_Off offset) = 0;
            virtual Elf64_Xword get_sh_size() const = 0;
            virtual void set_sh_size(Elf64_Xword size) = 0;
            virtual Elf64_Word get_sh_link() const = 0;
            virtual void set_sh_link(Elf64_Word link) = 0;
            virtual Elf64_Word get_sh_info() const = 0;
            virtual void set_sh_info(Elf64_Word info) = 0;
            virtual Elf64_Xword get_sh_addralign() const = 0;
            virtual void set_sh_addralign(Elf64_Xword addralign) = 0;
            virtual Elf64_Xword get_sh_entsize() const = 0;
            virtual void set_sh_entsize(Elf64_Xword entsize) = 0;

            Elf64_Xword set_sh_size();
      };

   protected:
      std::map<std::string, section*> m_sections_map;
      std::vector<section*> m_sections;
      std::vector<char*> m_sections_data;
      strtab m_shstrtab;
      lte_size_t m_ehdr_size;
      lte_size_t m_max_phnum;;

   public:
      typedef std::vector<section*>::iterator section_iterator;

   protected:
      template<class T1, class T2> static void set_item(T1& dst, const T2& src) { dst = (T1)src; }

      virtual section* create_section(Elf64_Section index, Elf64_Word name, Elf64_Word type, Elf64_Word flags) = 0;
      virtual void     create_pheaders(lte_uint_t phdrs_num) = 0;

      void create_null_section();
      void create_shstrtab();

      Elf64_Off do_layout(int* pfd);

      virtual const void* get_ehdr() const = 0;
      virtual phdrstab& get_phdrs() = 0;
      virtual const phdrstab& get_phdrs() const = 0;

      virtual void set_e_phoff(Elf64_Off phoff) = 0;
      virtual void set_e_shoff(Elf64_Off shoff) = 0;
      virtual void set_e_shnum(Elf64_Half shnum) = 0;
      virtual void set_e_shstrndx(Elf64_Half shstrndx) = 0;

   public:
      elf_t();
      virtual ~elf_t();

      static elf_t* create(Elf_Class_t elf_class = ELFCLASS32, Elf64_Half elf_type = ET_REL);
      static elf_t* create(const char* fname, bool only_headers = false);
      virtual symtab* create_symtab() = 0;
      virtual relatab* create_relatab() = 0;

      section_iterator section_begin() { return m_sections.begin(); }
      section_iterator section_end() { return m_sections.end(); }

      void clear(bool no_null_section = false);
      Elf64_Off layout();
      Elf64_Off write(int fd);
      Elf64_Off write(const char* fname);
      virtual Elf64_Off read(int fd) = 0;
      virtual bool read_headers(int fd) = 0;

      section* create_section(const char* name, Elf64_Word type, Elf64_Word flags = 0);
      section* get_section(const char* name);
      section* get_section(Elf64_Addr addr, Elf64_Xword flag);
      section* get_section(Elf64_Section index) { return m_sections[index-1]; }

      bool rename_section(const char* name, const char* new_name);

      const strtab& shstrtab() const { return m_shstrtab; }
      strtab& shstrtab() { return m_shstrtab; }      
      lte_size_t get_ehdr_size() const { return m_ehdr_size; }
      Elf64_Half get_max_phnum() const { return m_max_phnum; }

      virtual const unsigned char* get_e_ident() const = 0;
      virtual Elf64_Half get_e_type() const = 0;
      virtual void set_e_type(Elf64_Half type) = 0;
      virtual Elf64_Half get_e_machine() const = 0;
      virtual void set_e_machine(Elf64_Half machine) = 0;
      virtual Elf64_Word get_e_version() const = 0;
      virtual void set_e_version(Elf64_Word version) = 0;
      virtual Elf64_Addr get_e_entry() const = 0;
      virtual void set_e_entry(Elf64_Addr entry) = 0;
      virtual Elf64_Off get_e_phoff() const = 0;
      virtual Elf64_Off get_e_shoff() const = 0;
      virtual Elf64_Word get_e_flags() const = 0;
      virtual void set_e_flags(Elf64_Word flags) = 0;
      virtual Elf64_Half get_e_ehsize() const = 0;
      virtual Elf64_Half get_e_phentsize() const = 0;
      virtual Elf64_Half get_e_phnum() const = 0;
      virtual Elf64_Half get_e_shentsize() const = 0;
      virtual Elf64_Half get_e_shnum() const = 0;
      virtual Elf64_Half get_e_shstrndx() const = 0;

      unsigned char get_e_class() const { return get_e_ident()[EI_CLASS]; }
};

class elf64_t : public elf_t {
   public:
      class section64 : public section {
         protected:
            Elf64_Shdr m_shdr;
         protected:
            const void* get_shdr() const { return &m_shdr; }
            Elf64_Half get_shdr_size() const { return sizeof(m_shdr); }
         public:
            section64(elf_t* elf, Elf64_Section index, Elf64_Word name, Elf64_Word type = 0, Elf64_Word flags = 0);


            Elf64_Word get_sh_name() const { return m_shdr.sh_name; }
            void set_sh_name(Elf64_Word name) { set_item(m_shdr.sh_name, name); }
            Elf64_Word get_sh_type() const { return m_shdr.sh_type; }
            void set_sh_type(Elf64_Word type) { set_item(m_shdr.sh_type, type); }
            Elf64_Xword get_sh_flags() const { return m_shdr.sh_flags; }
            void set_sh_flags(Elf64_Xword flags) { set_item(m_shdr.sh_flags, flags); }
            Elf64_Addr get_sh_addr() const { return m_shdr.sh_addr; }
            void set_sh_addr(Elf64_Addr addr) { set_item(m_shdr.sh_addr, addr); }
            Elf64_Off get_sh_offset() const { return m_shdr.sh_offset; }
            void set_sh_offset(Elf64_Off offset) { set_item(m_shdr.sh_offset, offset); }
            Elf64_Xword get_sh_size() const { return m_shdr.sh_size; }
            void set_sh_size(Elf64_Xword size) { set_item(m_shdr.sh_size, size); }
            Elf64_Word get_sh_link() const { return m_shdr.sh_link; }
            void set_sh_link(Elf64_Word link) { set_item(m_shdr.sh_link, link); }
            Elf64_Word get_sh_info() const { return m_shdr.sh_info; }
            void set_sh_info(Elf64_Word info) { set_item(m_shdr.sh_info, info); }
            Elf64_Xword get_sh_addralign() const { return m_shdr.sh_addralign; }
            void set_sh_addralign(Elf64_Xword addralign) { set_item(m_shdr.sh_addralign, addralign); }
            Elf64_Xword get_sh_entsize() const { return m_shdr.sh_entsize; }
            void set_sh_entsize(Elf64_Xword entsize) { set_item(m_shdr.sh_entsize, entsize); }
      };

      class symtab64 : public symtab {
         public:
            symtab64(index_type symbols_num = 0) : symtab(sizeof(Elf64_Sym)) { resize(symbols_num); }

            Elf64_Sym* get(index_type ndx) { return LTE_RCAST(Elf64_Sym*, get_entry(ndx)); }
            const Elf64_Sym* get(index_type ndx) const { return LTE_RCAST(const Elf64_Sym*, get_entry(ndx)); }

            index_type get_last_of_bind(unsigned char bind) const;
            Elf64_Word get_st_name(index_type ndx) const { return get(ndx)->st_name; }
            void set_st_name(index_type ndx, Elf64_Word name) { set_item(get(ndx)->st_name, name); }
            Elf64_Addr get_st_value(index_type ndx) const { return get(ndx)->st_value; }
            void set_st_value(index_type ndx, Elf64_Addr value) { set_item(get(ndx)->st_value, value); }
            Elf64_Xword get_st_size(index_type ndx) const { return get(ndx)->st_size; }
            void set_st_size(index_type ndx, Elf64_Xword size) { set_item(get(ndx)->st_size, size); }
            unsigned char get_st_info(index_type ndx) const { return get(ndx)->st_info; }
            void set_st_info(index_type ndx, unsigned char info) { set_item(get(ndx)->st_info, info); }
            unsigned char get_st_other(index_type ndx) const { return get(ndx)->st_other; }
            void set_st_other(index_type ndx, unsigned char other) { set_item(get(ndx)->st_other, other); }
            Elf64_Section get_st_shndx(index_type ndx) const { return get(ndx)->st_shndx; }
            void set_st_shndx(index_type ndx, Elf64_Section shndx) { set_item(get(ndx)->st_shndx, shndx); }

            void set(index_type ndx, Elf64_Word name, Elf64_Addr value, Elf64_Xword size, unsigned char info, unsigned char other, Elf64_Section shndx)
            {
               Elf64_Sym* sym = get(ndx);
               set_item(sym->st_name, name);
               set_item(sym->st_info, info);
               set_item(sym->st_other, other);
               set_item(sym->st_shndx, shndx);
               set_item(sym->st_value, value);
               set_item(sym->st_size, size);
            }
      };

      class phdrstab64 : public phdrstab {
         public:
            phdrstab64(lte_uint_t phdrs_num = 0) : phdrstab(sizeof(Elf64_Phdr)) { resize(phdrs_num); }

            Elf64_Phdr* get(index_type ndx) { return LTE_RCAST(Elf64_Phdr*, get_entry(ndx)); }
            const Elf64_Phdr* get(index_type ndx) const { return LTE_RCAST(const Elf64_Phdr*, get_entry(ndx)); }

            Elf64_Word get_p_type(index_type ndx) const { return get(ndx)->p_type; }
            void set_p_type(index_type ndx, Elf64_Word type) { set_item(get(ndx)->p_type, type); }
            Elf64_Word get_p_flags(index_type ndx) const { return get(ndx)->p_flags; }
            void set_p_flags(index_type ndx, Elf64_Word flags) { set_item(get(ndx)->p_flags, flags); }
            Elf64_Off get_p_offset(index_type ndx) const { return get(ndx)->p_offset; }
            void set_p_offset(index_type ndx, Elf64_Off offset) { set_item(get(ndx)->p_offset, offset); }
            Elf64_Addr get_p_vaddr(index_type ndx) const { return get(ndx)->p_vaddr; }
            void set_p_vaddr(index_type ndx, Elf64_Addr vaddr) { set_item(get(ndx)->p_vaddr, vaddr); }
            Elf64_Addr get_p_paddr(index_type ndx) const { return get(ndx)->p_paddr; }
            void set_p_paddr(index_type ndx, Elf64_Addr paddr) { set_item(get(ndx)->p_paddr, paddr); }
            Elf64_Xword get_p_filesz(index_type ndx) const { return get(ndx)->p_filesz; }
            void set_p_filesz(index_type ndx, Elf64_Xword filesz) { set_item(get(ndx)->p_filesz, filesz); }
            Elf64_Xword get_p_memsz(index_type ndx) const { return get(ndx)->p_memsz; }
            void set_p_memsz(index_type ndx, Elf64_Xword memsz) { set_item(get(ndx)->p_memsz, memsz); }
            Elf64_Xword get_p_align(index_type ndx) const { return get(ndx)->p_align; }
            void set_p_align(index_type ndx, Elf64_Xword align) { set_item(get(ndx)->p_align, align); }
      };

      class relatab64 : public relatab {
         public:
            relatab64(lte_uint_t rela_num = 0) : relatab(sizeof(Elf64_Rela)) { resize(rela_num); }

            Elf64_Rela* get(index_type ndx) { return LTE_RCAST(Elf64_Rela*, get_entry(ndx)); }
            const Elf64_Rela* get(index_type ndx) const { return LTE_RCAST(const Elf64_Rela*, get_entry(ndx)); }

            Elf64_Addr get_r_offset(index_type ndx) const { return get(ndx)->r_offset; }
            void set_r_offset(index_type ndx, Elf64_Addr offset) { set_item(get(ndx)->r_offset, offset); }
            Elf64_Xword get_r_info(index_type ndx) const { return get(ndx)->r_info; }
            void set_r_info(index_type ndx, Elf32_Word sym, Elf32_Word type) { set_item(get(ndx)->r_info, ELF64_R_INFO(sym,type)); }
            Elf64_Sxword get_r_addend(index_type ndx) const { return get(ndx)->r_addend; }
            void set_r_addend(index_type ndx, Elf64_Sxword addend) { set_item(get(ndx)->r_addend, addend); }
      };

   protected:
      Elf64_Ehdr  m_ehdr;
      phdrstab64  m_phdr;

   protected:
      section* create_section(Elf64_Section index, Elf64_Word name, Elf64_Word type, Elf64_Word flags) 
      {
         return new section64(this, index, name, type, flags);
      }
      void create_pheaders(lte_uint_t phdrs_num);

      const void* get_ehdr() const { return &m_ehdr; }
      phdrstab& get_phdrs() { return m_phdr; }
      const phdrstab& get_phdrs() const { return m_phdr; }

      void set_e_phoff(Elf64_Off phoff) { set_item(m_ehdr.e_phoff, phoff); }
      void set_e_shoff(Elf64_Off shoff) { set_item(m_ehdr.e_shoff, shoff); }
      void set_e_shnum(Elf64_Half shnum) { set_item(m_ehdr.e_shnum, shnum); }
      void set_e_shstrndx(Elf64_Half shstrndx) { set_item(m_ehdr.e_shstrndx, shstrndx); }

   public:
      elf64_t(Elf64_Half e_type = ET_REL);

      symtab*  create_symtab() { return new symtab64(); }
      relatab* create_relatab() { return new relatab64(); }

      Elf64_Off read(int fd);
      bool read_headers(int fd);

      const unsigned char* get_e_ident() const { return m_ehdr.e_ident; }
      Elf64_Half get_e_type() const { return m_ehdr.e_type; }
      void set_e_type(Elf64_Half type) { set_item(m_ehdr.e_type, type); }
      Elf64_Half get_e_machine() const { return m_ehdr.e_machine; }
      void set_e_machine(Elf64_Half machine) { set_item(m_ehdr.e_machine, machine); }
      Elf64_Word get_e_version() const { return m_ehdr.e_version; }
      void set_e_version(Elf64_Word version) { set_item(m_ehdr.e_version, version); }
      Elf64_Addr get_e_entry() const { return m_ehdr.e_entry; }
      void set_e_entry(Elf64_Addr entry)  { set_item(m_ehdr.e_entry, entry); }
      Elf64_Off get_e_phoff() const { return m_ehdr.e_phoff; }
      Elf64_Off get_e_shoff() const { return m_ehdr.e_shoff; }
      Elf64_Word get_e_flags() const { return m_ehdr.e_flags; }
      void set_e_flags(Elf64_Word flags)  { set_item(m_ehdr.e_flags, flags); }
      Elf64_Half get_e_ehsize() const { return m_ehdr.e_ehsize; }
      Elf64_Half get_e_phentsize() const { return m_ehdr.e_phentsize; }
      Elf64_Half get_e_phnum() const { return m_ehdr.e_phnum; }
      Elf64_Half get_e_shentsize() const { return m_ehdr.e_shentsize; }
      Elf64_Half get_e_shnum() const { return m_ehdr.e_shnum; }
      Elf64_Half get_e_shstrndx() const { return m_ehdr.e_shstrndx; }

};

class elf32_t : public elf_t {
   public:
      class section32 : public section {
         protected:
            Elf32_Shdr m_shdr;
         protected:
            const void* get_shdr() const { return &m_shdr; }
            Elf64_Half get_shdr_size() const { return sizeof(m_shdr); }
         public:
            section32(elf_t* elf, Elf64_Section index, Elf64_Word name, Elf64_Word type = 0, Elf64_Word flags = 0);

            Elf64_Word get_sh_name() const { return m_shdr.sh_name; }
            void set_sh_name(Elf64_Word name) { set_item(m_shdr.sh_name, name); }
            Elf64_Word get_sh_type() const { return m_shdr.sh_type; }
            void set_sh_type(Elf64_Word type) { set_item(m_shdr.sh_type, type); }
            Elf64_Xword get_sh_flags() const { return m_shdr.sh_flags; }
            void set_sh_flags(Elf64_Xword flags) { set_item(m_shdr.sh_flags, flags); }
            Elf64_Addr get_sh_addr() const { return m_shdr.sh_addr; }
            void set_sh_addr(Elf64_Addr addr) { set_item(m_shdr.sh_addr, addr); }
            Elf64_Off get_sh_offset() const { return m_shdr.sh_offset; }
            void set_sh_offset(Elf64_Off offset) { set_item(m_shdr.sh_offset, offset); }
            Elf64_Xword get_sh_size() const { return m_shdr.sh_size; }
            void set_sh_size(Elf64_Xword size) { set_item(m_shdr.sh_size, size); }
            Elf64_Word get_sh_link() const { return m_shdr.sh_link; }
            void set_sh_link(Elf64_Word link) { set_item(m_shdr.sh_link, link); }
            Elf64_Word get_sh_info() const { return m_shdr.sh_info; }
            void set_sh_info(Elf64_Word info) { set_item(m_shdr.sh_info, info); }
            Elf64_Xword get_sh_addralign() const { return m_shdr.sh_addralign; }
            void set_sh_addralign(Elf64_Xword addralign) { set_item(m_shdr.sh_addralign, addralign); }
            Elf64_Xword get_sh_entsize() const { return m_shdr.sh_entsize; }
            void set_sh_entsize(Elf64_Xword entsize) { set_item(m_shdr.sh_entsize, entsize); }
      };

      class symtab32 : public symtab {
         public:
            symtab32(index_type symbols_num = 0) : symtab(sizeof(Elf32_Sym)) { resize(symbols_num); }

            Elf32_Sym* get(index_type ndx) { return LTE_RCAST(Elf32_Sym*, get_entry(ndx)); }
            const Elf32_Sym* get(index_type ndx) const { return LTE_RCAST(const Elf32_Sym*, get_entry(ndx)); }

            index_type get_last_of_bind(unsigned char bind) const;
            Elf64_Word get_st_name(index_type ndx) const { return get(ndx)->st_name; }
            void set_st_name(index_type ndx, Elf64_Word name) { set_item(get(ndx)->st_name, name); }
            Elf64_Addr get_st_value(index_type ndx) const { return get(ndx)->st_value; }
            void set_st_value(index_type ndx, Elf64_Addr value) { set_item(get(ndx)->st_value, value); }
            Elf64_Xword get_st_size(index_type ndx) const { return get(ndx)->st_size; }
            void set_st_size(index_type ndx, Elf64_Xword size) { set_item(get(ndx)->st_size, size); }
            unsigned char get_st_info(index_type ndx) const { return get(ndx)->st_info; }
            void set_st_info(index_type ndx, unsigned char info) { set_item(get(ndx)->st_info, info); }
            unsigned char get_st_other(index_type ndx) const { return get(ndx)->st_other; }
            void set_st_other(index_type ndx, unsigned char other) { set_item(get(ndx)->st_other, other); }
            Elf64_Section get_st_shndx(index_type ndx) const { return get(ndx)->st_shndx; }
            void set_st_shndx(index_type ndx, Elf64_Section shndx) { set_item(get(ndx)->st_shndx, shndx); }

            void set(index_type ndx, Elf64_Word name, Elf64_Addr value, Elf64_Xword size, unsigned char info, unsigned char other, Elf64_Section shndx)
            {
               Elf32_Sym* sym = get(ndx);
               set_item(sym->st_name, name);
               set_item(sym->st_info, info);
               set_item(sym->st_other, other);
               set_item(sym->st_shndx, shndx);
               set_item(sym->st_value, value);
               set_item(sym->st_size, size);
            }
      };

      class phdrstab32 : public phdrstab {
         public:
            phdrstab32(lte_uint_t phdrs_num = 0) : phdrstab(sizeof(Elf32_Phdr)) { resize(phdrs_num); }

            Elf32_Phdr* get(index_type ndx) { return LTE_RCAST(Elf32_Phdr*, get_entry(ndx)); }
            const Elf32_Phdr* get(index_type ndx) const { return LTE_RCAST(const Elf32_Phdr*, get_entry(ndx)); }

            Elf64_Word get_p_type(index_type ndx) const { return get(ndx)->p_type; }
            void set_p_type(index_type ndx, Elf64_Word type) { set_item(get(ndx)->p_type, type); }
            Elf64_Word get_p_flags(index_type ndx) const { return get(ndx)->p_flags; }
            void set_p_flags(index_type ndx, Elf64_Word flags) { set_item(get(ndx)->p_flags, flags); }
            Elf64_Off get_p_offset(index_type ndx) const { return get(ndx)->p_offset; }
            void set_p_offset(index_type ndx, Elf64_Off offset) { set_item(get(ndx)->p_offset, offset); }
            Elf64_Addr get_p_vaddr(index_type ndx) const { return get(ndx)->p_vaddr; }
            void set_p_vaddr(index_type ndx, Elf64_Addr vaddr) { set_item(get(ndx)->p_vaddr, vaddr); }
            Elf64_Addr get_p_paddr(index_type ndx) const { return get(ndx)->p_paddr; }
            void set_p_paddr(index_type ndx, Elf64_Addr paddr) { set_item(get(ndx)->p_paddr, paddr); }
            Elf64_Xword get_p_filesz(index_type ndx) const { return get(ndx)->p_filesz; }
            void set_p_filesz(index_type ndx, Elf64_Xword filesz) { set_item(get(ndx)->p_filesz, filesz); }
            Elf64_Xword get_p_memsz(index_type ndx) const { return get(ndx)->p_memsz; }
            void set_p_memsz(index_type ndx, Elf64_Xword memsz) { set_item(get(ndx)->p_memsz, memsz); }
            Elf64_Xword get_p_align(index_type ndx) const { return get(ndx)->p_align; }
            void set_p_align(index_type ndx, Elf64_Xword align) { set_item(get(ndx)->p_align, align); }
      };

      class relatab32 : public relatab {
         public:
            relatab32(lte_uint_t rela_num = 0) : relatab(sizeof(Elf32_Rela)) { resize(rela_num); }

            Elf32_Rela* get(index_type ndx) { return LTE_RCAST(Elf32_Rela*, get_entry(ndx)); }
            const Elf32_Rela* get(index_type ndx) const { return LTE_RCAST(const Elf32_Rela*, get_entry(ndx)); }

            Elf64_Addr get_r_offset(index_type ndx) const { return get(ndx)->r_offset; }
            void set_r_offset(index_type ndx, Elf64_Addr offset) { set_item(get(ndx)->r_offset, offset); }
            Elf64_Xword get_r_info(index_type ndx) const { return get(ndx)->r_info; }
            void set_r_info(index_type ndx, Elf32_Word sym, Elf32_Word type) { set_item(get(ndx)->r_info, ELF32_R_INFO(sym,type)); }
            Elf64_Sxword get_r_addend(index_type ndx) const { return get(ndx)->r_addend; }
            void set_r_addend(index_type ndx, Elf64_Sxword addend) { set_item(get(ndx)->r_addend, addend); }
      };

   protected:
      Elf32_Ehdr  m_ehdr;
      phdrstab32  m_phdr;

   protected:
      section* create_section(Elf64_Section index, Elf64_Word name, Elf64_Word type, Elf64_Word flags) 
      {
         return new section32(this, index, name, type, flags);
      }
      void create_pheaders(lte_uint_t phdrs_num);

      const void* get_ehdr() const { return &m_ehdr; }
      phdrstab& get_phdrs() { return m_phdr; }
      const phdrstab& get_phdrs() const { return m_phdr; }

      void set_e_phoff(Elf64_Off phoff) { set_item(m_ehdr.e_phoff, phoff); }
      void set_e_shoff(Elf64_Off shoff) { set_item(m_ehdr.e_shoff, shoff); }
      void set_e_shnum(Elf64_Half shnum) { set_item(m_ehdr.e_shnum, shnum); }
      void set_e_shstrndx(Elf64_Half shstrndx) { set_item(m_ehdr.e_shstrndx, shstrndx); }

   public:
      elf32_t(Elf64_Half e_type = ET_REL);

      symtab*  create_symtab() { return new symtab32(); }
      relatab* create_relatab() { return new relatab32(); }

      Elf64_Off read(int fd);
      bool read_headers(int fd);

      const unsigned char* get_e_ident() const { return m_ehdr.e_ident; }
      Elf64_Half get_e_type() const { return m_ehdr.e_type; }
      void set_e_type(Elf64_Half type) { set_item(m_ehdr.e_type, type); }
      Elf64_Half get_e_machine() const { return m_ehdr.e_machine; }
      void set_e_machine(Elf64_Half machine) { set_item(m_ehdr.e_machine, machine); }
      Elf64_Word get_e_version() const { return m_ehdr.e_version; }
      void set_e_version(Elf64_Word version) { set_item(m_ehdr.e_version, version); }
      Elf64_Addr get_e_entry() const { return m_ehdr.e_entry; }
      void set_e_entry(Elf64_Addr entry)  { set_item(m_ehdr.e_entry, entry); }
      Elf64_Off get_e_phoff() const { return m_ehdr.e_phoff; }
      Elf64_Off get_e_shoff() const { return m_ehdr.e_shoff; }
      Elf64_Word get_e_flags() const { return m_ehdr.e_flags; }
      void set_e_flags(Elf64_Word flags)  { set_item(m_ehdr.e_flags, flags); }
      Elf64_Half get_e_ehsize() const { return m_ehdr.e_ehsize; }
      Elf64_Half get_e_phentsize() const { return m_ehdr.e_phentsize; }
      Elf64_Half get_e_phnum() const { return m_ehdr.e_phnum; }
      Elf64_Half get_e_shentsize() const { return m_ehdr.e_shentsize; }
      Elf64_Half get_e_shnum() const { return m_ehdr.e_shnum; }
      Elf64_Half get_e_shstrndx() const { return m_ehdr.e_shstrndx; }

};

#endif /*_LTE_ELF_H_*/
