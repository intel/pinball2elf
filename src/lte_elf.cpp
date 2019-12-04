/*BEGIN_LEGAL 
BSD License 

Copyright (c)2019 Intel Corporation. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
END_LEGAL */
#include <sys/types.h>
#include <unistd.h>
#include <sys/mman.h>
#include "lte_elf.h"

//#define DEBUG_ELF
#ifdef DEBUG_ELF
#include <iostream>
#include <iomanip>
#define print_hexw(v, w) std::hex<<std::setfill('0')<<std::setw(w)<<(v)<<std::setfill(' ')<<std::dec
#define print_hex(v)     std::hex<<(v)<<std::dec
#endif


#define EHDR_DEFAULT  { {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},0,0,0,0,0,0,0,0,0,0,0,0,0 }
#define SHDR_DEFAULT  { 0,SHT_NULL,0,0,0,0,SHN_UNDEF,0,0,0 }
#define PHDR_DEFAULT  { PT_NULL,0,0,0,0,0,0,ELF_PAGE_SIZE }

static Elf32_Ehdr ehdr32_default_init = EHDR_DEFAULT;
static Elf64_Ehdr ehdr64_default_init = EHDR_DEFAULT;
static Elf32_Shdr shdr32_default_init = SHDR_DEFAULT;
static Elf64_Shdr shdr64_default_init = SHDR_DEFAULT;
static Elf32_Phdr phdr32_default_init = PHDR_DEFAULT;
static Elf64_Phdr phdr64_default_init = PHDR_DEFAULT;

#ifdef DEBUG_ELF

static const char* shtype2str(Elf64_Xword type)
{
   #define SHTYPE2STR(type) case (type): return #type
   switch(type)
   {
      SHTYPE2STR(SHT_NULL);
      SHTYPE2STR(SHT_PROGBITS);
      SHTYPE2STR(SHT_SYMTAB);
      SHTYPE2STR(SHT_STRTAB);
      SHTYPE2STR(SHT_RELA);
      SHTYPE2STR(SHT_HASH);
      SHTYPE2STR(SHT_DYNAMIC);
      SHTYPE2STR(SHT_NOTE);
      SHTYPE2STR(SHT_NOBITS);
      SHTYPE2STR(SHT_REL);
      SHTYPE2STR(SHT_SHLIB);
      SHTYPE2STR(SHT_DYNSYM);
      SHTYPE2STR(SHT_INIT_ARRAY);
      SHTYPE2STR(SHT_FINI_ARRAY);
      SHTYPE2STR(SHT_PREINIT_ARRAY);
      SHTYPE2STR(SHT_GROUP);
      SHTYPE2STR(SHT_SYMTAB_SHNDX);
      SHTYPE2STR(SHT_NUM);
      SHTYPE2STR(SHT_LOOS);
      SHTYPE2STR(SHT_GNU_ATTRIBUTES);
      SHTYPE2STR(SHT_GNU_HASH);
      SHTYPE2STR(SHT_GNU_LIBLIST);
      SHTYPE2STR(SHT_CHECKSUM);
      SHTYPE2STR(SHT_LOSUNW);
      SHTYPE2STR(SHT_SUNW_COMDAT);
      SHTYPE2STR(SHT_SUNW_syminfo);
      SHTYPE2STR(SHT_GNU_verdef);
      SHTYPE2STR(SHT_GNU_verneed);
      SHTYPE2STR(SHT_GNU_versym);
      SHTYPE2STR(SHT_LOPROC);
      SHTYPE2STR(SHT_HIPROC);
      SHTYPE2STR(SHT_LOUSER);
      SHTYPE2STR(SHT_HIUSER);
      default:;
   }
   return "unknown";
}

static const char* phtype2str(Elf64_Xword type)
{
   #define PTYPE2STR(type) case (type): return #type
   switch(type)
   {
      PTYPE2STR(PT_NULL);
      PTYPE2STR(PT_LOAD);
      PTYPE2STR(PT_DYNAMIC);
      PTYPE2STR(PT_INTERP);
      PTYPE2STR(PT_NOTE);
      PTYPE2STR(PT_PHDR);
      PTYPE2STR(PT_TLS);
      PTYPE2STR(PT_NUM);
      PTYPE2STR(PT_LOOS);
      PTYPE2STR(PT_GNU_EH_FRAME);
      PTYPE2STR(PT_GNU_STACK);
      PTYPE2STR(PT_GNU_RELRO);
      PTYPE2STR(PT_SUNWSTACK);
      PTYPE2STR(PT_LOPROC);
      PTYPE2STR(PT_HIPROC);
   }
   return "unknown";
}

void print_shdr(Elf64_Shdr& shdr)
{
   std::cout<<"   type:    "<<shtype2str(shdr.sh_type)<<'\n'
            <<"   flags:   "<<print_hex(shdr.sh_flags)<<'\n'
            <<"   addr:    "<<print_hex(shdr.sh_addr)<<'\n'
            <<"   offs:    "<<print_hex(shdr.sh_offset)<<'\n'
            <<"   size:    "<<shdr.sh_size<<'\n'
            <<"   link:    "<<shdr.sh_link<<'\n'
            <<"   info:    "<<shdr.sh_info<<'\n'
            <<"   align:   "<<shdr.sh_addralign<<'\n'
            <<"   entsize: "<<shdr.sh_entsize<<'\n';
}

void print_phdr(Elf64_Phdr& phdr)
{
   std::cout<<"   type:    "<<phtype2str(phdr.p_type)<<'\n'
            <<"   flags:   "<<print_hex(phdr.p_flags)<<'\n'
            <<"   offs:    "<<print_hex(phdr.p_offset)<<'\n'
            <<"   vaddr:   "<<print_hex(phdr.p_vaddr)<<'\n'
            <<"   paddr:   "<<print_hex(phdr.p_paddr)<<'\n'
            <<"   filesz:  "<<phdr.p_filesz<<'\n'
            <<"   memsz:   "<<phdr.p_memsz<<'\n'
            <<"   align:   "<<phdr.p_align<<'\n';
}
#endif 

unsigned char ELF_ST_INFO(Elf_Class_t e_class, int bind, int type)
{
   switch(e_class)
   {
      case ELFCLASS32:
         return (unsigned char)ELF32_ST_INFO(bind, type);
      case ELFCLASS64:
         return (unsigned char)ELF64_ST_INFO(bind, type);
      default:
         LTE_ASSERT(false);
   }
   return (unsigned char)0;
}

unsigned char ELF_ST_BIND(Elf_Class_t e_class, int val)
{
   switch(e_class)
   {
      case ELFCLASS32:
         return ELF32_ST_BIND(val);
      case ELFCLASS64:
         return ELF64_ST_BIND(val);
      default:
         LTE_ASSERT(false);
   }
   return 0;
}

unsigned char ELF_ST_TYPE(Elf_Class_t e_class, int val)
{
   switch(e_class)
   {
      case ELFCLASS32:
         return (unsigned char)ELF32_ST_TYPE(val);
      case ELFCLASS64:
         return (unsigned char)ELF64_ST_TYPE(val);
      default:
         LTE_ASSERT(false);
   }
   return 0;
}

elf_data_t* elf_data_t::get_last()
{
   elf_data_t* p;
   for(p = this; p->next; p = p->next);
   return p;
}

Elf64_Xword elf_t::section::set_sh_size()
{
   elf_data_t* data_last = m_data.get_last();
   Elf64_Xword size = data_last->get_offs() + data_last->get_size();
   set_sh_size(size);
   return size;
}

void elf_t::section::set_data(elf_data_t* data)
{
   if((data == &m_data) || (data == m_data.next))
      return;

   m_data.size = 0;
   // m_data.offs must be 0 (it is expected to be 0 in write())
   m_data.offs = 0;

   if(data)
   {
      elf_data_t* data_last = data->get_last();
      set_sh_size(data_last->get_offs() + data_last->get_size());
      m_data.next = data;
   }
   else
   {
      set_sh_size(0);
      m_data.next = NULL;
      m_data.data = NULL;
   }
}

void elf_t::section::set_data(const Elf_Byte_t* data, Elf64_Xword size)
{
   // m_data.offs must be 0 (it is expected to be 0 in write())
   m_data.offs = 0;
   m_data.next = NULL;

   if(data != NULL)
   {
      m_data.data = data;
      m_data.size = size;
      set_sh_size(size);
   }
   else
   {
      m_data.data = NULL;
      m_data.size = size; // if size != 0 the content will be undefined
      set_sh_size(0);
   }
}

elf_t::section::section(elf_t* elf, Elf64_Section index) : m_elf(elf), m_sh_index(index)
{
}

elf_t* elf_t::create(Elf_Class_t elf_class, Elf64_Half elf_type)
{
   switch(elf_class)
   {
      case ELFCLASS32:
         return new elf32_t(elf_type);
      case ELFCLASS64:
         return new elf64_t(elf_type);
      default:
         LTE_ASSERT((elf_class!=ELFCLASS32)&&(elf_class!=ELFCLASS64));
   }
   return NULL;
}

elf_t* elf_t::create(const char* fname, bool only_headers)
{
   lte_uint32_t esignature;
   unsigned char eclass;
   FILE* fh = NULL;

   if(fname == NULL)
      return NULL;

   if(((fh = fopen(fname, "r")) == NULL) ||
      (fread(&esignature, sizeof(esignature), 1, fh) != 1) ||
      (esignature != ELFSIGNATURE) ||
      (fread(&eclass, sizeof(eclass), 1, fh) != 1))
   { 
      fclose(fh); 
      return NULL;
   }

   elf_t* elf = elf_t::create(eclass);
   if(elf)
   {
      fseek(fh, 0, SEEK_SET);
      if(only_headers)
         elf->read_headers(fileno(fh));
      else
         elf->read(fileno(fh));
   }
   else
   {
      LTE_ASSERT(elf);
   }
   fclose(fh);

   return elf;
}

elf_t::elf_t() : m_ehdr_size(0), m_max_phnum(0)
{
}

elf_t::~elf_t()
{
   for(std::vector<section*>::iterator it = m_sections.begin(); it != m_sections.end(); ++it)
      delete *it;
   for(std::vector<char*>::iterator it = m_sections_data.begin(); it != m_sections_data.end(); ++it)
      delete *it;
}

elf_t::section* elf_t::get_section(const char* name)
{
   if(name && *name)
   {
      std::string key = name; 
      if(m_sections_map.count(key))
         return m_sections_map[key];
   }
   return NULL;
}

elf_t::section* elf_t::get_section(Elf64_Addr addr, Elf64_Xword flags)
{
   for(std::vector<section*>::iterator it = m_sections.begin(); it != m_sections.end(); ++it)
   {
      section* p = *it;
      if(p->get_sh_flags() & flags)
      {
         Elf64_Addr start_addr = p->get_sh_addr();
         if((start_addr <= addr) && ((addr - start_addr) < p->get_sh_size()))
            return p;
      }
   }
   return NULL;
}

elf_t::section* elf_t::create_section(const char* name, Elf64_Word type, Elf64_Word flags)
{
   if(!name || !*name)
      return NULL;

   std::string key = name;

   if(m_sections_map.count(key))
      return m_sections_map[key];

   LTE_ASSERT(get_e_shnum() == m_shstrtab.count());

   m_shstrtab.push_back(name);

   Elf64_Half shindex = get_e_shnum();
   section* s = create_section(shindex, m_shstrtab.offset(shindex), type, flags);
   m_sections_map[key] = s;
   m_sections.push_back(s);
   set_e_shnum(m_sections.size()+1);

   return s;
}

/* Creates NULL-section. NULL-section must be the first section
   create_null_section() must be called before creation of any
   other sections, when e_sections is empty.*/
void elf_t::create_null_section()
{
   m_shstrtab.push_back("");
   set_e_shnum(1);
}

void elf_t::create_shstrtab()
{
    section* s = create_section(".shstrtab", SHT_STRTAB);
    if(s)
    {
       set_e_shstrndx(s->get_index());
       s->set_sh_addralign(1);
       s->set_data(&m_shstrtab);
    }
    else
    {
       LTE_ASSERT(s);
    }
}

bool elf_t::rename_section(const char* name, const char* new_name)
{
   assert(name && *name);
   assert(new_name && *new_name);

   if(m_sections_map.find(new_name) != m_sections_map.end())
      return false;

   auto r = m_sections_map.find(name);

   if(r == m_sections_map.end())
      return false;

   section* s = r->second;
   lte_int32_t sh_name_index = m_shstrtab.find(s->get_sh_name());

   if(sh_name_index == -1)
      return false;

   auto offs = m_shstrtab.set(sh_name_index, new_name);

   for(auto it = m_sections_map.begin(); it != m_sections_map.end(); ++it)
   {
      if(it->second->get_sh_name() > s->get_sh_name())
      {
         it->second->set_sh_name(it->second->get_sh_name() + offs);
      }
   }
   m_sections_map[new_name] = s;
   m_sections_map.erase(r);

   return true;
}

void elf_t::clear(bool no_null_section)
{
   for(std::vector<section*>::iterator it = m_sections.begin(); it != m_sections.end(); ++it)
      delete *it;
   for(std::vector<char*>::iterator it = m_sections_data.begin(); it != m_sections_data.end(); ++it)
      delete *it;

   m_sections_data.clear();
   m_sections.clear();
   m_sections_map.clear();
   m_shstrtab.clear();

   if(!no_null_section)
   {
      create_null_section();
      create_shstrtab();
   }
}

static void write_padding(int fd, Elf64_Off size)
{
   static lte_uint8_t buffer[ELF_PAGE_SIZE];

   for(; size >= sizeof(buffer); size -= sizeof(buffer))
      lte_write(fd, buffer, sizeof(buffer));

   if(size > 0)
      lte_write(fd, buffer, size);
}

static Elf64_Half write_null_section_hdr(int fd, lte_uint32_t e_class)
{
   LTE_ASSERT((e_class==ELFCLASS32) || (e_class==ELFCLASS64));

   void* pshdr;
   Elf64_Half shdr_size;

   if(e_class==ELFCLASS64)
   {
      pshdr = &shdr64_default_init;
      shdr_size = sizeof(shdr64_default_init);
   }
   else
   {
      LTE_ASSERT(e_class==ELFCLASS32);

      pshdr = &shdr32_default_init;
      shdr_size = sizeof(shdr32_default_init);
   }

   return lte_write(fd, pshdr, shdr_size);
}

static Elf64_Word shf2pf(Elf64_Xword sflags)
{
   Elf64_Word pflags = PF_R;
   if(sflags & SHF_WRITE)
      pflags |= PF_W;
   if(sflags & SHF_EXECINSTR)
      pflags |= PF_X;
   return pflags;
}

static Elf64_Off write_data(int fd, const elf_data_t* p)
{
   Elf64_Off offset = 0;
   do
   {
      Elf64_Off pad_size = p->get_offs() - offset;
      if(pad_size)
      {
         write_padding(fd, pad_size);
         offset += pad_size;
      }

      Elf64_Off data_size = p->get_size();
      if(data_size)
      {
         const Elf_Byte_t* data = p->get_data();
         if(data)
            lte_pwriteq(fd, data, data_size, NULL);
         else
            write_padding(fd, data_size);
         offset += data_size;
      }
   }
   while((p = p->next) != NULL);

   return offset;
}

static Elf64_Off write_section_data(int fd, elf_t::section* s, Elf64_Off offset)
{
   LTE_ASSERT(offset <= s->get_sh_offset());

   Elf64_Off pad_size = s->get_sh_offset() - offset;
   if(pad_size)
   {
      write_padding(fd, pad_size);
      offset += pad_size;
   }
   LTE_ASSERT(offset == s->get_sh_offset());

   Elf64_Off data_size = write_data(fd, s->get_data());
   LTE_ASSERT(data_size == s->get_sh_size());
   offset += data_size;

   return offset;
}

Elf64_Off elf_t::do_layout(int* pfd)
{
   std::map<Elf64_Addr, section*> sections1;
   std::map<Elf64_Addr, section*> sections2;
   std::map<Elf64_Addr, section*> sections3;
   phdrstab& phdrs = get_phdrs();

   for(std::vector<section*>::iterator it = m_sections.begin(); it != m_sections.end(); ++it)
   {
      section* p = *it;

      p->set_sh_size();

      if(p->get_sh_flags() & SHF_ALLOC)
         sections1[p->get_sh_addr()] = p;
      else if(p->get_sh_flags() & (SHF_WRITE|SHF_EXECINSTR))
         sections2[p->get_sh_addr()] = p;
      else
         sections3[(Elf64_Addr)p->get_index()] = p;
   }

   Elf64_Addr addralign;
   Elf64_Off offset = 0;
   Elf64_Off elf_hdrs_size = 0;
   Elf64_Off elf_data_offset = 0;

   offset += get_e_ehsize();

   if(get_e_type() == ET_EXEC)
   {
      set_e_phoff(offset);
      create_pheaders(sections1.size());
   }
   else
   {
      set_e_phoff(0);
      create_pheaders(0);
   }

   // align sections to PAGE LIMIT
   addralign = ELF_PAGE_SIZE;

   offset += get_e_phentsize() * get_e_phnum();
   elf_hdrs_size = offset;
   offset = __lte_align_up(offset, addralign);
   elf_data_offset = offset;

   lte_uint_t i = 0;
   for(std::map<Elf64_Addr, section*>::iterator it = sections1.begin(); it != sections1.end(); ++it, ++i)
   {
      section* p = it->second;

      Elf64_Addr addr = p->get_sh_addr();
      Elf64_Xword size = p->get_sh_size();

      offset = __lte_align_up(offset, addralign) + __lte_offset(addr, addralign);

      if(i < phdrs.get_entries_num())
      {
         phdrs.set_p_type(i, PT_LOAD);
         phdrs.set_p_paddr(i, addr);
         phdrs.set_p_vaddr(i, addr);
         phdrs.set_p_memsz(i, size);
         phdrs.set_p_filesz(i, size);
         phdrs.set_p_flags(i, PF_R | shf2pf(p->get_sh_flags()));
         phdrs.set_p_align(i, addralign);
         phdrs.set_p_offset(i, offset);
      }
      p->set_sh_offset(offset);
      if(p->get_sh_type() != SHT_NOBITS)
         offset += size;
   }

   for(std::map<Elf64_Addr, section*>::iterator it = sections2.begin(); it != sections2.end(); ++it)
   {
      section* p = it->second;
      offset = __lte_align_up(offset, addralign) + __lte_offset(p->get_sh_addr(), addralign);
      p->set_sh_offset(offset);
      if(p->get_sh_type() != SHT_NOBITS)
         offset += p->get_sh_size();
   }

   for(std::map<Elf64_Addr, section*>::iterator it = sections3.begin(); it != sections3.end(); ++it)
   {
      section* p = it->second;
      addralign = p->get_sh_addralign();
      // check if greater than 1 (can be 0)
      if(addralign > 1)
         offset = __lte_align_up(offset, addralign);
      p->set_sh_offset(offset);
      if(p->get_sh_type() != SHT_NOBITS)
         offset += p->get_sh_size();
   }

   set_e_shoff(offset);

   Elf64_Off elf_size = offset + (get_e_shnum() * get_e_shentsize());

   if(pfd)
   {
      int fd = *pfd;

      lte_write(fd, get_ehdr(), get_e_ehsize());
      if(phdrs.get_entries_num())
         lte_write(fd, phdrs.get_data(), phdrs.get_size());

      write_padding(fd, elf_data_offset - elf_hdrs_size);
      offset = elf_data_offset;

      for(std::map<Elf64_Addr, section*>::iterator it = sections1.begin(); it != sections1.end(); ++it)
      {
         if(it->second->get_sh_type() != SHT_NOBITS)
            offset = write_section_data(fd, it->second, offset);
      }
      for(std::map<Elf64_Addr, section*>::iterator it = sections2.begin(); it != sections2.end(); ++it)
      {
         if(it->second->get_sh_type() != SHT_NOBITS)
            offset = write_section_data(fd, it->second, offset);
      }
      for(std::map<Elf64_Addr, section*>::iterator it = sections3.begin(); it != sections3.end(); ++it)
      {
         if(it->second->get_sh_type() != SHT_NOBITS)
            offset = write_section_data(fd, it->second, offset);
      }

      Elf64_Half shnum = get_e_shnum();
      if(shnum)
      {
         write_null_section_hdr(fd, get_e_class());
         for(std::vector<section*>::iterator it = m_sections.begin(); it != m_sections.end(); ++it)
            lte_write(fd, (*it)->get_shdr(), (*it)->get_shdr_size());
      }
      LTE_ASSERT(elf_size == (Elf64_Off)lseek64(fd, 0, SEEK_END));
   }

   return elf_size;
}

Elf64_Off elf_t::layout()
{
   return do_layout(NULL);
}

Elf64_Off elf_t::write(int fd)
{
   return do_layout(&fd);
}

Elf64_Off elf_t::write(const char* fname)
{
   int fd = open(fname, LTE_O_CREAT|LTE_O_WRONLY|LTE_O_TRUNC|LTE_O_BINARY, (get_e_type() == ET_EXEC) ? 0777 : 0666);
   LTE_ERRAX(fd < 0, "failed to open \"%s\"", fname);
   Elf64_Off rval = write(fd);
   close(fd);
   return rval;
}

elf64_t::elf64_t(Elf64_Half e_type)
{
   m_ehdr_size = sizeof(m_ehdr);
   m_max_phnum = ELF_MAX_PHDR_SIZE / sizeof(Elf64_Phdr);

   m_ehdr = ehdr64_default_init;

   m_ehdr.e_ident[EI_MAG0]    = ELFMAG0;
   m_ehdr.e_ident[EI_MAG1]    = ELFMAG1;
   m_ehdr.e_ident[EI_MAG2]    = ELFMAG2;
   m_ehdr.e_ident[EI_MAG3]    = ELFMAG3;
   m_ehdr.e_ident[EI_CLASS]   = ELFCLASS64;
   m_ehdr.e_ident[EI_DATA]    = ELFDATA2LSB;
   m_ehdr.e_ident[EI_VERSION] = EV_CURRENT;
   m_ehdr.e_type              = e_type;
   m_ehdr.e_machine           = EM_X86_64;
   m_ehdr.e_ehsize            = sizeof(m_ehdr);
   m_ehdr.e_shentsize         = sizeof(Elf64_Shdr);
   m_ehdr.e_version           = EV_CURRENT;

   create_null_section();
   create_shstrtab();
}

void elf64_t::create_pheaders(lte_uint_t phdrs_num)
{
   m_phdr.resize(phdrs_num);
   if(phdrs_num)
   {
      Elf64_Phdr phdr = phdr64_default_init;

      phdr.p_align = ELF_PAGE_SIZE;
      for(lte_uint32_t i = 0; i < m_phdr.get_entries_num(); ++i)
         *m_phdr.get(i) = phdr;
      m_ehdr.e_phentsize = m_phdr.get_entry_size();
      m_ehdr.e_phnum = m_phdr.get_entries_num();
   }
   else
   {
      m_ehdr.e_phentsize = 0;
      m_ehdr.e_phnum = 0;
   }
}

elf64_t::section64::section64(elf_t* elf, Elf64_Section index, Elf64_Word name, Elf64_Word type, Elf64_Word flags)
                   :elf_t::section(elf, index)
{
   m_shdr = shdr64_default_init;
   m_shdr.sh_name = name;
   m_shdr.sh_type = type;
   m_shdr.sh_flags = flags;
   m_shdr.sh_addralign = 4;
}

elf_t::symtab::index_type elf64_t::symtab64::get_last_of_bind(unsigned char bind) const
{
   lte_int_t index = get_entries_num();
   while(index)
   {
      const Elf64_Sym* s = get(--index);
      if(ELF64_ST_BIND(s->st_info) == bind)
         break;
   }
   return index;
}

static lte_size_t lte_fsize(lte_fd_t fd)
{
   lte_stat_t fstat;
   lte_fstat(fd, &fstat);
   return fstat.st_size;
}

Elf64_Off elf64_t::read(int fd)
{
   lte_size_t elf_size = lte_fsize(fd);
   char* elf = (char*)mmap(0, elf_size, PROT_READ, MAP_PRIVATE, fd, 0);

   if(elf == MAP_FAILED)
      return 0;

   clear(true); // clear and don't create null section

   m_ehdr = *(Elf64_Ehdr*)elf;

   if(m_ehdr.e_phentsize && m_ehdr.e_phnum)
   {
      LTE_ASSERT(m_ehdr.e_phentsize == sizeof(Elf64_Phdr));

      create_pheaders(m_ehdr.e_phnum);
      memcpy((void*)get_phdrs().get_data(), elf + m_ehdr.e_phoff, m_ehdr.e_phnum * m_ehdr.e_phentsize);
   }

   LTE_ASSERT(m_ehdr.e_shentsize == sizeof(Elf64_Shdr));

   Elf64_Shdr* shdrtab = (Elf64_Shdr*)(elf + m_ehdr.e_shoff);
   m_shstrtab.push_back_strtab(elf + shdrtab[m_ehdr.e_shstrndx].sh_offset, shdrtab[m_ehdr.e_shstrndx].sh_size);


   for(Elf64_Half shindex = 1; shindex < m_ehdr.e_shnum; ++shindex)
   {
      Elf64_Shdr& shdr = shdrtab[shindex];
      section* s = create_section(shindex, /*m_shstrtab.offset(shindex)*/shdr.sh_name, shdr.sh_type, shdr.sh_flags);

      const char* name = s->get_name();
      m_sections_map[name] = s;
      m_sections.push_back(s);

      s->set_sh_addr(shdr.sh_addr);
      s->set_sh_offset(shdr.sh_offset);
      s->set_sh_size(shdr.sh_size);
      s->set_sh_link(shdr.sh_link);
      s->set_sh_info(shdr.sh_info);
      s->set_sh_addralign(shdr.sh_addralign);
      s->set_sh_entsize(shdr.sh_entsize);

      if(shindex == m_ehdr.e_shstrndx)
      {
         s->set_data(m_shstrtab.get_data(), m_shstrtab.get_size());
      }
      else if(shdr.sh_type != SHT_NOBITS)
      {
         char* data = new char [shdr.sh_size];
         m_sections_data.push_back(data);
         memcpy(data, elf + shdr.sh_offset, shdr.sh_size);
         s->set_data((Elf_Byte_t*)data, shdr.sh_size);
      }
      else
      {
         s->set_data(NULL, shdr.sh_size);
      }
   }
   set_e_shnum(m_sections.size()+1);

   munmap(elf, elf_size);

   return 0;
}

template<class T>
class mmap_ptr_t {
   protected:
      T*     m_ptr;
      size_t m_size;
      off_t  m_offset;      
      int    m_fd;
   public:
      mmap_ptr_t() : m_ptr(NULL), m_size(0), m_offset(0), m_fd(-1) {}
      mmap_ptr_t(int fd, size_t size, off_t offset) : m_ptr(NULL), m_size(0), m_offset(0), m_fd(-1)
      {
         void* p = mmap(0, size, PROT_READ, MAP_PRIVATE, fd, offset);
         if(p != MAP_FAILED)
         {
            m_ptr = (T*)p;
            m_size = size;
            m_offset = offset;
            m_fd = fd;
         }
      }
      ~mmap_ptr_t()
      {
         if(m_ptr)
            munmap(m_ptr, m_size);
      }

      size_t size() const { return m_size; }

      operator T* () const { return m_ptr; }
      T* operator->() const { return m_ptr; }
      T& operator*() const { return *m_ptr; }
      T& operator[](size_t i) const { return m_ptr[i]; }
};


bool elf64_t::read_headers(int fd)
{
   clear(true); // clear and don't create null section

   mmap_ptr_t<char> elf(fd, lte_fsize(fd), 0);
   if(!elf)
      return false;

   Elf64_Ehdr* ehdr = (Elf64_Ehdr*)&elf[0];

   LTE_ASSERT(ehdr->e_shentsize == sizeof(Elf64_Shdr));
   m_ehdr = *ehdr;

   Elf64_Shdr* shdrtab = (Elf64_Shdr*)(elf + m_ehdr.e_shoff);
   m_shstrtab.push_back_strtab(elf + shdrtab[m_ehdr.e_shstrndx].sh_offset, shdrtab[m_ehdr.e_shstrndx].sh_size);

   for(Elf64_Half shindex = 1; shindex < m_ehdr.e_shnum; ++shindex)
   {
      Elf64_Shdr& shdr = shdrtab[shindex];
      section* s = create_section(shindex, shdr.sh_name, shdr.sh_type, shdr.sh_flags);

      const char* name = s->get_name();
      m_sections_map[name] = s;
      m_sections.push_back(s);

      s->set_sh_addr(shdr.sh_addr);
      s->set_sh_offset(shdr.sh_offset);
      s->set_sh_size(shdr.sh_size);
      s->set_sh_link(shdr.sh_link);
      s->set_sh_info(shdr.sh_info);
      s->set_sh_addralign(shdr.sh_addralign);
      s->set_sh_entsize(shdr.sh_entsize);
   }
   set_e_shnum(m_sections.size()+1);

   return true;
}


elf32_t::elf32_t(Elf64_Half e_type)
{
   m_ehdr_size = sizeof(m_ehdr);
   m_max_phnum = ELF_MAX_PHDR_SIZE / sizeof(Elf32_Phdr);

   m_ehdr = ehdr32_default_init;

   m_ehdr.e_ident[EI_MAG0]    = ELFMAG0;
   m_ehdr.e_ident[EI_MAG1]    = ELFMAG1;
   m_ehdr.e_ident[EI_MAG2]    = ELFMAG2;
   m_ehdr.e_ident[EI_MAG3]    = ELFMAG3;
   m_ehdr.e_ident[EI_CLASS]   = ELFCLASS32;
   m_ehdr.e_ident[EI_DATA]    = ELFDATA2LSB;
   m_ehdr.e_ident[EI_VERSION] = EV_CURRENT;
   m_ehdr.e_type              = e_type;
   m_ehdr.e_machine           = EM_386;
   m_ehdr.e_ehsize            = sizeof(m_ehdr);
   m_ehdr.e_shentsize         = sizeof(Elf32_Shdr);
   m_ehdr.e_version           = EV_CURRENT;

   create_null_section();
   create_shstrtab();
}

void elf32_t::create_pheaders(lte_uint_t phdrs_num)
{
   m_phdr.resize(phdrs_num);
   if(phdrs_num)
   {
      Elf32_Phdr phdr = phdr32_default_init;

      phdr.p_align = ELF_PAGE_SIZE;
      for(lte_uint32_t i = 0; i < m_phdr.get_entries_num(); ++i)
         *m_phdr.get(i) = phdr;
      m_ehdr.e_phentsize = m_phdr.get_entry_size();
      m_ehdr.e_phnum = m_phdr.get_entries_num();
   }
   else
   {
      m_ehdr.e_phentsize = 0;
      m_ehdr.e_phnum = 0;
   }
}

elf32_t::section32::section32(elf_t* elf, Elf64_Section index, Elf64_Word name, Elf64_Word type, Elf64_Word flags)
                   :elf_t::section(elf, index)
{
   m_shdr = shdr32_default_init;
   m_shdr.sh_name = name;
   m_shdr.sh_type = type;
   m_shdr.sh_flags = flags;
   m_shdr.sh_addralign = 4;
}

elf_t::symtab::index_type elf32_t::symtab32::get_last_of_bind(unsigned char bind) const
{
   lte_int_t index = get_entries_num();
   while(index)
   {
      const Elf32_Sym* s = get(--index);
      if(ELF32_ST_BIND(s->st_info) == bind)
         break;
   }
   return index;
}

Elf64_Off elf32_t::read(int fd)
{
   return 0;
}

bool elf32_t::read_headers(int fd)
{
   return false;
}
