/*BEGIN_LEGAL 
BSD License 

Copyright (c)2019 Intel Corporation. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
END_LEGAL */
#include "lte_config.h"
#include "lte_pinball.h"
#include "lte_elf.h"
#include "lte_arch_state.h"
#include "lte_entry_point.h"
#include "lte_strtab.h"

#include <sys/types.h>
#include <sys/wait.h>
#include <unistd.h>
#define __STDC_FORMAT_MACROS
#include <inttypes.h>


#include <memory>

#include <iostream>
#include <iomanip>
#define print_hex(v, w) std::hex<<std::setfill('0')<<std::setw(w)<<(v)<<std::setfill(' ')<<std::dec


static char CommentSecn[] = "pinball2elf 1.0";
static char DataSegName[] = ".pbdata";
static char TextSegName[] = ".pbtext";
static char DmapSegName[] = ".pbdmap";
static char StckSegName[] = ".pbstck";
static char RelaTextSegName[] = ".rela.pbtext";
static char SymtabSegName[] = ".symtab";


typedef elf_t::symtab::index_type lte_symtab_index_t;

static void litelfIsAddressInImage(lte_memimg_t& memimg, lte_addr_t va, const char* vatype = "address", bool warning = false)
{
   lte_mempage_t* pg = memimg.get_page(va);

   if(pg)
   {
      if(get_config().is_verbose())
         fprintf(stdout, "%s %" PRIx64 " found in %s [%" PRIx64 " - %" PRIx64 "]\n",
                 vatype, va, get_config().get_mem_image_file_name(), pg->va, pg->va + pg->region_size);
   }
   else
   {
      static char* fmt_add_not_found = "%s %" PRIx64 " not found in %s";
      if(warning)
         LTE_WARN(fmt_add_not_found, vatype, va, get_config().get_mem_image_file_name());
      else
         LTE_ERRX(fmt_add_not_found, vatype, va, get_config().get_mem_image_file_name());
   }
}

static lte_addr_t litelfMarkDynallocPages(lte_memimg_t& memimg, lte_x86_arch_state_t& arch_state, elf_table_t& dynpages)
{
   std::map<lte_addr_t, lte_mempage_t*> pages;

   dynpages.clear();

   if(!get_config().no_stack_remap())
   {
      for(lte_size_t i = 0; i < arch_state.get_threads_num_max(); ++i)
      {
         lte_mempage_t* pg_rsp = memimg.get_page(arch_state.get_thread_state(i).gprstate.rsp);

         if(pg_rsp)
         {
            lte_addr_t stack_start;
            lte_addr_t stack_end;
            lte_mempage_t* pg;

            pg = pg_rsp;
            do
            {
               pg->flags |= SHF_DYNALLOC | SHF_STACK;
               stack_start = pg->va;
               if(i < arch_state.get_threads_num())
                  pages[pg->va] = pg;
               pg = memimg.get_page(stack_start - memimg.page_size);
            } while(pg);

            pg = pg_rsp;
            do
            {
               pg->flags |= SHF_DYNALLOC | SHF_STACK;
               stack_end = pg->va + memimg.page_size;
               if(i < arch_state.get_threads_num())
                  pages[pg->va] = pg;
               pg = memimg.get_page(stack_end);
            } while(pg);
         }
      }

      if(get_config().is_verbose())
      {
         if(pages.size())
         {
            fprintf(stdout, "\n---------------- STACK --------------\n");
            for(std::map<lte_addr_t, lte_mempage_t*>::iterator it = pages.begin(); it != pages.end(); ++it)
            {
               lte_uint64_t va = it->second->va;
               if(arch_state.get_arch() == ELFCLASS64)
                  fprintf(stdout,   " %016" PRIx64 " - %016" PRIx64 "\n", va, va + memimg.page_size);
               else
                  fprintf(stdout, " %08"  PRIx64 " - %08"  PRIx64 "\n", va, va + memimg.page_size);
            }
            fprintf(stdout, "-------------------------------------\n\n");
         }
         else
         {
            fprintf(stdout, "\nNO STACK PAGES in %s\n\n", get_config().get_mem_image_file_name());
         }
      }
   }

   lte_addr_t remap_limit = get_config().get_remap_limit();

   if(remap_limit < (LTE_MAXVAL(lte_addr_t)-memimg.page_size))
   {
      for(lte_memimg_t::iterator it = memimg.begin(); it != memimg.end(); ++it)
      {
         if(((it->first + memimg.page_size) > remap_limit) && (pages.count(it->first) == 0))
         {
            it->second.flags |= SHF_DYNALLOC;
            pages[it->first] = &it->second;
         }
      }
   }

   size_t va_size = (arch_state.get_arch() == ELFCLASS64) ? sizeof(lte_uint64_t) : sizeof(lte_uint32_t);
   for(std::map<lte_addr_t, lte_mempage_t*>::iterator it = pages.begin(); it != pages.end(); ++it)
   {
      lte_uint64_t va = it->second->va;
      dynpages.push_back(&va, va_size);
   }

   return pages.size() ? pages.begin()->first : LTE_MAXVAL(lte_addr_t);
}

static void litelfAddSymbol(elf_t::symtab& symtab, elf_t::strtab& strtab, const char* name,
                     Elf64_Addr st_value, Elf64_Xword st_size, unsigned char st_info,
                     unsigned char st_other, Elf64_Section st_shndx)
{
   Elf64_Word st_name = name ? (Elf64_Word)strtab.push_back(name) : 0;
   symtab.push_back(st_name, st_value, st_size, st_info, st_other, st_shndx);
}

static void litelfInitSymtabAndStrtab(elf_t& elf, elf_t::symtab& symtab, elf_t::strtab& strtab)
{
   // empty string should be the first element in STRTAB
   strtab.push_back("");
   // name of the source file must be the second item in STRTAB according to TIS ELF)
   litelfAddSymbol(symtab, strtab, get_config().get_mem_image_file_name(),
                   0, 0, ELF_ST_INFO(elf.get_e_class(), STB_LOCAL, STT_FILE), 0, SHN_ABS);
}

static void litelfCreateMemImageSections(elf_t& elf, elf_t::symtab& symtab, lte_memimg_t& img)
{
   Elf32_Word text_flags = get_config().get_text_seg_flags();
   Elf32_Word data_flags = get_config().get_data_seg_flags();
   char name_buffer[256];

   for(lte_mempage_t* region = img.get_first_page(); region; region = region->region_next)
   {
      Elf64_Word region_flags;
      elf_t::section* section;
      const char* name;
      Elf32_Word flags;

      if((region_flags = region->flags) & SHF_EXECINSTR)
      {
         name = TextSegName;
         flags = text_flags;
      }
      else
      {
         name = DataSegName;
         flags = data_flags;
      }

      flags = SHF_ALLOC | (region_flags & (SHF_EXECINSTR|SHF_WRITE));

      if(!(region_flags & SHF_ENTRYPOINT))
      {
         if(region_flags & SHF_DYNALLOC)
         {
            flags &= SHF_EXECINSTR|SHF_WRITE;
            name =  (region_flags & SHF_STACK) ? StckSegName : DmapSegName;
         }

         snprintf(name_buffer, sizeof(name_buffer), "%s.%" PRIx64 "", name , (lte_uint64_t)region->va);
         name = name_buffer;
      }

      section = elf.create_section(name, SHT_PROGBITS, flags);
      if(section)
      {
        section->set_sh_addr(region->va);
        section->set_sh_addralign(0x1000);
        section->set_data(region);
        if(section->get_sh_size() != region->region_size)
          section->set_sh_size(region->region_size);
        symtab.push_back(0, 0, 0, ELF_ST_INFO(elf.get_e_class(), STB_LOCAL, STT_SECTION), 0, section->get_index());
      }
      else
      {
        LTE_ASSERT(section);
      }
   }
}

static void litelfCreateCommentSection(elf_t& elf, elf_t::symtab& symtab)
{
   elf_t::section* section = elf.create_section(".comment", SHT_PROGBITS);
   if(section)
   {
    section->set_sh_addr(0);
    section->set_sh_addralign(0);
    section->set_sh_size(sizeof(CommentSecn));
    section->set_data((const lte_uint8_t*)CommentSecn, sizeof(CommentSecn));
    symtab.push_back(0, 0, 0, ELF_ST_INFO(elf.get_e_class(), STB_LOCAL, STT_SECTION), 0, section->get_index());
   }
   else
   {
    LTE_ASSERT(section);
   }
}

static void litelfPrintNonZeroData(FILE* fh, lte_uint64_t v, const char* type)
{
   fprintf(fh, "\t.%s\t%s%-" PRIx64 "\n", type, (v ? "0x" : ""), v);
}

static void litelfPrintZeroData(FILE* fh, lte_uint64_t n)
{
   fprintf(fh, "\t.zero\t%" PRIu64 "\n", n);
}

template<class T>
static const lte_uint8_t* litelfPrintData(FILE* fh, const T* data, lte_size_t data_size, const char* type)
{
   lte_size_t offs = 0;
   lte_size_t zero_offs = 0;

   for(lte_size_t size = data_size & ~(lte_size_t)(sizeof(T)-1); offs < size; offs += sizeof(T), ++data)
   {
      lte_uint64_t v = *data;
      if(v)
      {
         if(zero_offs < offs)
            litelfPrintZeroData(fh, offs - zero_offs);
         litelfPrintNonZeroData(fh, v, type);
         zero_offs = offs + sizeof(T);
      }
   }
   if(zero_offs < offs)
      litelfPrintZeroData(fh, offs - zero_offs);

   return (const lte_uint8_t*)data;
}

static void litelfPrintData(FILE* fh, lte_size_t data_size, const lte_uint8_t* data)
{
   const lte_uint8_t* p;

   p = litelfPrintData(fh, (const lte_uint64_t*)data, data_size, "quad");
   p = litelfPrintData(fh, (const lte_uint32_t*)p, data_size - (p - data), "long");
   p = litelfPrintData(fh, (const lte_uint16_t*)p, data_size - (p - data), "word");
   p = litelfPrintData(fh, p, data_size - (p - data), "byte");
}

static void litelfCreateArchStateFile(const char* fname, const lte_uint8_t* state, lte_size_t size, const Elf_SymInfo_t* sym, const Elf_SymInfo_t* sym_end)
{
   FILE* fh = fopen(fname, "w");
   LTE_ERRAX(fh == NULL, "failed to open \"%s\"", fname);

   fprintf(fh, ".globl\tcpu_state\n\t.data\n\t.align 64\n\t.type\tcpu_state, @object\n\t.size\tcpu_state, %" PRId64 "\ncpu_state:\n", size);

   std::map<Elf64_Addr, const Elf_SymInfo_t*> m;

   for(; sym != sym_end; ++sym)
      if(sym->info == E32_LOBJECT || sym->info == E64_LOBJECT)
         m[sym->offs] = sym;

   lte_size_t offs, pad_offs;

   for(offs = 0, pad_offs = 0; offs < size;)
   {
      if(m.count(offs))
      {
         if(pad_offs < offs)
            litelfPrintData(fh, offs - pad_offs, state + pad_offs);

         const Elf_SymInfo_t* s = m[offs];
         fprintf(fh, "%s:\n", s->name);
         litelfPrintData(fh, s->size, state + offs);

         offs += s->size;
         pad_offs = offs;
      }
      else
      {
         ++offs;
      }
   }

   if(pad_offs < offs)
      litelfPrintData(fh, offs - pad_offs, state + pad_offs);

   fclose(fh);
}

static void litelfAddThreadStartSymbol(elf_t& elf, elf_t::symtab& symtab,
                                              elf_t::strtab& strtab, lte_uint32_t tid, lte_addr_t thread_start_va)
{
   elf_t::section* section = elf.get_section(thread_start_va, SHF_ALLOC);

   if(section)
   {
      char name[256];
      sprintf(name, "t%d.start", tid);

      lte_addr_t addr = thread_start_va - section->get_sh_addr();
      Elf64_Xword size = section->get_sh_size() - addr;
      symtab.push_back((Elf64_Word)strtab.push_back(name), addr, size, ELF_ST_INFO(elf.get_e_class(), STB_GLOBAL, STT_FUNC), 0, section->get_index());
   }
}

static elf_t::section* litelfCreateSymtabSection(elf_t& elf, elf_t::symtab& symtab)
{
   elf_t::section* section = elf.create_section(SymtabSegName, SHT_SYMTAB, 0);

   // according (TIS ELF) sh_info should be one greater than
   // the symbol table index of the last STB_LOCAL symbol
   if(section != NULL)
   {
    section->set_sh_info(symtab.get_last_of_bind(STB_LOCAL) + 1);
    section->set_sh_entsize(symtab.get_entry_size());
    section->set_data(&symtab);
   }
   else
   {
    LTE_ASSERT(section != NULL);
   }
   return section;
}

static elf_t::section* litelfCreateStrtabSection(elf_t& elf, elf_t::strtab& strtab)
{
   elf_t::section* section = elf.create_section(".strtab", SHT_STRTAB, SHF_STRINGS);
   LTE_ASSERT(section != NULL);
   section->set_data(&strtab);
   return section;
}

static void litelfCreateLdScript(const char* fname, elf_t* e1, elf_t* e2)
{
   LTE_ASSERT(fname != NULL);

   std::map<lte_addr_t, elf_t::section*> sections;
   lte_mem_layout_t mem_layout;

   for(elf_t::section_iterator it = e1->section_begin(), end = e1->section_end(); it != end; ++it)
   {
      elf_t::section* s = *it;
      if((s->get_sh_type() == SHT_PROGBITS) && (s->get_sh_flags() & (SHF_ALLOC|SHF_EXECINSTR|SHF_WRITE)))
      {
         lte_addr_t va = mem_layout.insert(s->get_sh_addr(), s->get_sh_size());
         LTE_ASSERT(va == s->get_sh_addr());
         sections[va] = s;
      }
   }

   lte_uint64_t size_of_nonpb_sections = 0;
   if(e2)
   {
      for(elf_t::section_iterator it = e2->section_begin(), end = e2->section_end(); it != end; ++it)
      {
         elf_t::section* s = *it;
         if(s->get_sh_flags() & SHF_ALLOC)
         {
            if(!e1->get_section(s->get_name()))
            {
               lte_addr_t va = mem_layout.insert(s->get_sh_size());
               LTE_ASSERT(va != LTE_MAX_ADDR);
               s->set_sh_addr(va);
               sections[va] = s;
               size_of_nonpb_sections += s->get_sh_size();
            }
         }
      }
   }

   std::multimap<lte_uint64_t,lte_addr_t> memregions;
   lte_mem_layout_t::iterator it = mem_layout.begin();
   if(it != mem_layout.end())
   {
      lte_mem_layout_t::iterator previt = it;
      for(++it; it != mem_layout.end(); previt = it++)
         if(it->second.vastart > previt->second.vaend)
            memregions.insert(std::make_pair(it->second.vastart - previt->second.vaend, previt->second.vaend));

      if(memregions.rbegin() == memregions.rend() || memregions.rbegin()->first < size_of_nonpb_sections)
         memregions.insert(std::make_pair(LTE_MAX_ADDR - previt->second.vaend, previt->second.vaend));
   }
   else
   {
      memregions.insert(std::make_pair(LTE_MAXVAL(lte_uint64_t), 0));
   }

   FILE* fh = fopen(fname, "w");
   LTE_ERRAX(fh == NULL, "failed to open \"%s\"", fname);

   fprintf(fh, "MEMORY\n{\n  /*free memory regions*/\n");
   lte_uint32_t memreg_idx = 0;
   for(std::multimap<lte_uint64_t,lte_addr_t>::reverse_iterator it = memregions.rbegin(); it != memregions.rend(); ++it, ++memreg_idx)
   {
      fprintf(fh, "  mem%d (WXA) : o = 0x%" PRIx64 ", l = %" PRIu64 "\n", memreg_idx, it->second, it->first);
   }
   fprintf(fh, "\n  /*memory regions reserved for the pinball & startup*/\n");
   for(std::map<lte_addr_t, elf_t::section*>::iterator it = sections.begin(), end = sections.end(); it != end; ++it, ++memreg_idx)
   {
      elf_t::section* s = it->second;
      fprintf(fh, "  pbm%d : o = 0x%" PRIx64 ", l = %" PRId64 "\n", memreg_idx, s->get_sh_addr(), s->get_sh_size());
   }
   fprintf(fh, "}\nSECTIONS\n{\n");
   for(std::map<lte_addr_t, elf_t::section*>::iterator it = sections.begin(), end = sections.end(); it != end; ++it)
   {
      elf_t::section* s = it->second;
      const char* name = s->get_name();
      fprintf(fh, "  %s 0x%" PRIx64 ": { *(%s) }\n", name, s->get_sh_addr(), name);
   }
   fprintf(fh, "}\n");
   fclose(fh);
}

static void litelfCreateObj(const char* fname, elf_t* elf)
{
   assert(fname);
   elf->write(fname);
}

static void litelfRelToExec(elf_t& elf, elf_t::symtab& symtab)
{
   elf.set_e_type(ET_EXEC);
   for(lte_symtab_index_t i = 0; i < symtab.get_entries_num(); ++i)
   {
      lte_uint32_t type = ELF_ST_TYPE(elf.get_e_class(), symtab.get_st_info(i));
      if(type == STT_FUNC || type == STT_OBJECT)
      {
         elf_t::section* s = elf.get_section(symtab.get_st_shndx(i));
         symtab.set_st_value(i, symtab.get_st_value(i) + s->get_sh_addr());
      }
      else if(type == STT_SECTION)
      {
         elf_t::section* s = elf.get_section(symtab.get_st_shndx(i));
         symtab.set_st_value(i, s->get_sh_addr());
      }
   }
}

static void litelfRelocateRemapPages(elf_t* elf, lte_addr_t entry_va, lte_addr_t entry_data_va, lte_addr_t remap_va)
{
   if(remap_va != LTE_MAXVAL(lte_addr_t))
   {
      elf_t::section* startup = elf->get_section(entry_va, SHF_WRITE|SHF_EXECINSTR);
      if(startup)
      {
        elf_t::section* remap = elf->get_section(remap_va, SHF_WRITE|SHF_EXECINSTR);
        if(remap)
        {
          lte_uint64_t offs = entry_va - startup->get_sh_addr();
          // WARNING: here we expect that startup->get_data() is a single memory region (not a list of blocks)
          entry_point_t* entry = entry_point_t::create_entry_point(elf->get_e_class(), ((char*)startup->get_data()->get_data()) + offs,
                               startup->get_data()->get_size() - offs);
          if(entry)
          {
            entry->relocate_dmap_data(remap->get_sh_offset());
            delete entry;
          }
          else
          {
            LTE_ASSERT(entry);
          }
        }
        else
        {
          LTE_ASSERT(remap);
        }
      }
      else
      {
        LTE_ASSERT(startup);
      }
   }
}

static void litelfRelocateRemapPages(const char* foname, const char* finame, lte_addr_t entry_va, lte_addr_t entry_data_va, lte_addr_t remap_va)
{
   elf_t* elf = elf_t::create(finame);
   if(elf)
   {
    elf->layout();
    litelfRelocateRemapPages(elf, entry_va, entry_data_va, remap_va);
    elf->write(foname);
    delete elf;
   }
   else
   {
    LTE_ASSERT(elf);
   }
}

static int litelfLink(unsigned char e_class, const char* foname, const char* fsname, const char* finame, const char* const* flibs, int flibs_num, lte_addr_t entry_va)
{
   LTE_ASSERT(foname);

   pid_t pid = fork();
   if(pid == 0)
   {
      std::vector<const char*> argv;

      char buffer[96];

      argv.push_back("/usr/bin/ld");
      argv.push_back("-static");
      argv.push_back("-m");
      argv.push_back((e_class == ELFCLASS64) ? "elf_x86_64" : "elf_i386");
      if(entry_va)
      {
        argv.push_back("--entry");
        argv.push_back(buffer);
        sprintf(buffer, "0x%" PRIx64, entry_va);
      }
      if(fsname)
      {
         argv.push_back("-T");
         argv.push_back(fsname);
      }
      argv.push_back("-o");
      argv.push_back(foname);
      if(finame)
         argv.push_back(finame);
      for(int i = 0; i < flibs_num; ++i)
         argv.push_back(flibs[i]);
      argv.push_back(NULL);

      #define DEBUG_LD
      #ifdef DEBUG_LD
      for(int i = 0; argv[i]; ++i)
         std::cout<<argv[i]<<' ';
      std::cout<<'\n';
      #endif

      execv(argv[0], const_cast<char* const*>(&argv[0]));
      exit(127);
   }
   else
   {
      int status;
      waitpid(pid, &status, 0);
      if(!WIFEXITED(status) || WEXITSTATUS(status))
      {
         return -1;
      }
   }
   return 0;
}

static void litelfUnLinkFiles(tempfile_t* tmp_files, int tmp_files_num)
{
   for(int i = 0; i < tmp_files_num; ++i)
      tmp_files[i].clear();
}

static void litelfLinkError(tempfile_t* tmp_files, int tmp_files_num)
{
   litelfUnLinkFiles(tmp_files, tmp_files_num);
   LTE_ERRX("ld failed");
}

static bool litelfCreateCbkCallStub(const char* fname, unsigned char e_class, entry_point_t* entry)
{
   elf_t* elf = elf_t::create(e_class);
   if( !elf)
   {
    LTE_ASSERT(elf);
    return false; // will not execute
   }
   elf_t::symtab* symtab = elf->create_symtab();
   elf_t::relatab* relatab = elf->create_relatab();
   elf_t::strtab strtab;

   elf_t::section* sec_text = elf->create_section(".text", SHT_PROGBITS, SHF_EXECINSTR|SHF_ALLOC);
   if(sec_text)
   {
    sec_text->set_sh_addralign(0x1000);
    sec_text->set_data(entry->get_code_bytes(), entry->get_code_size());
    litelfAddSymbol(*symtab, strtab, "", 0, 0, ELF_ST_INFO(e_class, STB_LOCAL, STT_FILE), 0, SHN_ABS);
    litelfAddSymbol(*symtab, strtab, "_start", 0, 0, ELF_ST_INFO(e_class, STB_GLOBAL, STT_FUNC), 0, sec_text->get_index());
   }
   else
   {
    LTE_ASSERT(sec_text);
   }

   for(const Elf_SymInfo_t *sym = entry->get_code_sym_first(), *sym_end = entry->get_code_sym_end(); sym != sym_end; ++sym)
   {
      if(sym && sym->name && sym->rela)
      {
         lte_symtab_index_t index = symtab->get_entries_num();
         litelfAddSymbol(*symtab, strtab, sym->name, sym->offs, sym->size, sym->info, 0, STN_UNDEF);
         relatab->push_back(sym->rela->r_offset, index, ELF_R_TYPE(sym->rela->r_info), sym->rela->r_addend);
      }
   }

   elf_t::section* sec_strtab = litelfCreateStrtabSection(*elf, strtab);
   elf_t::section* sec_symtab = litelfCreateSymtabSection(*elf, *symtab);
   if(sec_strtab && sec_symtab && sec_text)
   {
      sec_symtab->set_sh_link(sec_strtab->get_index());

      elf_t::section* rela_text = elf->create_section(".rela.text", SHT_RELA, 0);
      if(rela_text)
      {
        rela_text->set_data(relatab);
        rela_text->set_sh_entsize(relatab->get_entry_size());
        rela_text->set_sh_link(sec_symtab->get_index());
        rela_text->set_sh_info(sec_text->get_index());
      }
      else
      {
        LTE_ASSERT(rela_text);
      }
   }
   else
   {
    LTE_ASSERT(sec_strtab && sec_symtab && sec_text);
   }

   elf->write(fname);

   delete elf;
   delete relatab;
   delete symtab;

   return true;
}

int main(int argc, char** argv)
{
   elf_t* elf;
   elf_t::strtab strtab;
   elf_t::symtab* symtab;
   elf_t::relatab* relatab;
   entry_point_t* entry;
   elf_table_t dynpages;
   lte_addr_t entry_va, entry_data_va, remap_va;
   entry_va =  entry_data_va =  remap_va = 0;

   get_config().init(argc, argv);

   lte_x86_arch_state_t arch_state;
   LTE_ERRAX(!arch_state.load(get_config()), "couldn't load arch state from %s%s%s", get_config().get_arch_desc_file_name(),
                                                                                    (get_config().get_arch_state_file_name() ? " and " : ""),
                                                                                    (get_config().get_arch_state_file_name() ? get_config().get_arch_state_file_name() : ""));

   pinball_memimg_t img(arch_state.get_arch());
   LTE_ERRAX(!img.load(get_config().get_mem_image_file_name(), get_config().get_user_space_limit(arch_state.get_arch()), arch_state.get_text_compressed()),
             "couldn't load memory image from %s", get_config().get_mem_image_file_name());

   // limiting max number of threads to LTE_MAXVAL(lte_short_t)
   LTE_ERRAX( ( (lte_short_t)arch_state.get_threads_num()  > LTE_MAXTHREADS) , "number of threads \"%d\" too large (max \"%d\") in \"%s\"", arch_state.get_threads_num(), LTE_MAXTHREADS,  get_config().get_mem_image_file_name());

   // check if trace start address and stack pointer are covered by mem image
   for(lte_size_t i = 0; i < arch_state.get_threads_num(); ++i)
   {
      lte_x86_state_t& state = arch_state.get_thread_state(i);
      litelfIsAddressInImage(img, state.rip, "entry point");
      litelfIsAddressInImage(img, state.gprstate.rsp, "stack pointer", true);
   }

   if(get_config().get_mem_layout_file_name())
   {
      pinball_mem_layout_t  memlayout;
      LTE_ERRAX(!memlayout.load(get_config().get_mem_layout_file_name(), get_config().get_text_seg_flags(), get_config().get_data_seg_flags()),
                "couldn't load list of executable regions from (%s)", get_config().get_mem_layout_file_name());

      for(pinball_mem_layout_t::iterator it = memlayout.begin(); it != memlayout.end(); ++it)
      {
         img.mark(it->second.vastart, it->second.vaend, it->second.flags);
      }
   }
   else
   {
      for(lte_size_t i = 0; i < arch_state.get_threads_num(); ++i)
      {
         lte_x86_state_t& state = arch_state.get_thread_state(i);
         lte_mempage_t* pg = img.get_page(state.rip);
         if(pg)
            pg->flags |= (Elf64_Xword)SHF_TEXT; // ok to have 0's in higher 32 bits after typecast
      }
   }

   elf = elf_t::create(arch_state.get_arch());
   if(elf == NULL)
   {
    LTE_ASSERT(elf);
    return 1;
   }

   if(!get_config().no_startup_code())
   {
      remap_va = litelfMarkDynallocPages(img, arch_state, dynpages);

      entry = entry_point_t::create_entry_point(arch_state.get_arch(), arch_state.get_threads_num());
      if(entry)
      {
        entry->setup(arch_state.get_threads_num(), &arch_state.get_thread_state(0), dynpages.table_ptr(), dynpages.count());
        entry->enable_modify_ldt(!get_config().no_modify_ldt(arch_state.get_arch()));

        entry_va = img.insert(NULL, entry->get_code_size(), SHF_TEXT|SHF_ENTRYPOINT);
        LTE_ERRAX(!entry_va, "no space for entry point code");

        entry_data_va = img.insert(NULL, entry->get_data_size(), SHF_DATA|SHF_ENTRYPOINT);
        LTE_ERRAX(!entry_data_va, "no space for entry point data");

        entry->relocate_code(entry_va); // should be before copying to image
        entry->relocate_data(entry_data_va); // should be before copying to image
  
        elf->set_e_entry(entry->get_start_va()); // address of _start symbol

        entry->set_proc_start_callback(get_config().get_process_cbk_name());
        entry->set_proc_exit_callback(get_config().get_process_exit_cbk_name());
        entry->set_thread_start_callback(get_config().get_thread_cbk_name());
        entry->set_callback_stack_size(get_config().get_cbk_stack_size());

        entry->set_start_roi_mark(get_config().get_roi_start_tag(ROI_TYPE_SNIPER), ROI_TYPE_SNIPER);
        entry->set_start_roi_mark(get_config().get_roi_start_tag(ROI_TYPE_SSC), ROI_TYPE_SSC);
        entry->set_start_roi_mark(get_config().get_roi_start_tag(ROI_TYPE_SIMICS), ROI_TYPE_SIMICS);
        entry->set_magic2_tag(get_config().get_magic2_tag(ROI_TYPE_SIMICS), ROI_TYPE_SIMICS);
        entry->set_roi_mark_thread(get_config().get_roi_thread_id());
      }
      else
      {
        LTE_ASSERT(entry);
      }
   }
   else
   {
      remap_va = LTE_MAXVAL(lte_addr_t);
      entry = NULL;
      entry_va = arch_state.get_thread_state(0).rip;
      entry_data_va = 0;
   }

   /**
    * Linux has a limit on a number of segments inside an application image
    * [NB: the limit is on a TOTAL number of segments, not only LOADable ones]
    *
    * Hence, we start by coalescing contiguous sections to remove redundant
    * segmentation and continue by coalescing discontiguous sections by means
    * of INT3-filled spacers until this constraint is fulfilled.
    *
    * As we also will create NULL, .text, .data, .shstrtab, .strtab, .symtab
    * and .comment sections, the maximal number of sections containing memory
    * image data should be less than (elf->get_max_phnum() - 8)
   */
   lte_uint64_t regions_num_max = elf->get_max_phnum() - 8;
   lte_uint64_t regions_num = img.compact(regions_num_max);

   symtab = elf->create_symtab();
   // size of symtab: number of startup symbols + number of memory regions + 1 (.comment section)
   litelfInitSymtabAndStrtab(*elf, *symtab, strtab);
   // create sections with trace code/data
   litelfCreateMemImageSections(*elf, *symtab, img);
   // create comment section
   litelfCreateCommentSection(*elf, *symtab);

   relatab = elf->create_relatab();

   if(!get_config().no_startup_code())
   {
      const Elf_SymInfo_t* sym;
      const Elf_SymInfo_t* sym_end;
      elf_t::section* section;

      for(section = elf->get_section(DataSegName), sym = entry->get_data_sym_first(), sym_end = entry->get_data_sym_end(); sym != sym_end; ++sym)
      {
         if( section && sym && sym->name)
         {
            lte_symtab_index_t index = symtab->get_entries_num();
            litelfAddSymbol(*symtab, strtab, sym->name, sym->offs, sym->size, sym->info, 0, section->get_index());
            if(sym->rela)
            {
               relatab->push_back(sym->rela->r_offset, index, ELF_R_TYPE(sym->rela->r_info), sym->rela->r_addend);
               symtab->set_st_shndx(index, STN_UNDEF);
            }
         }
      }

      for(section = elf->get_section(TextSegName), sym = entry->get_code_sym_first(), sym_end = entry->get_code_sym_end(); sym != sym_end; ++sym)
      {
         if(section && sym && sym->name)
         {
            lte_symtab_index_t index = symtab->get_entries_num();
            litelfAddSymbol(*symtab, strtab, sym->name, sym->offs, sym->size, sym->info, 0, section->get_index());
            if(sym->rela)
            {
               relatab->push_back(sym->rela->r_offset, index, ELF_R_TYPE(sym->rela->r_info), sym->rela->r_addend);
               symtab->set_st_shndx(index, STN_UNDEF);
            }
         }
      }

      if(get_config().get_arch_state_out_file_name())
         litelfCreateArchStateFile(get_config().get_arch_state_out_file_name(), entry->get_data_bytes(), entry->get_data_size(),
                                    entry->get_data_sym_first(), entry->get_data_sym_end());
   }

   for(lte_size_t i = 0; i < arch_state.get_threads_num(); ++i)
      litelfAddThreadStartSymbol(*elf, *symtab, strtab, i, arch_state.get_thread_state(i).rip);

   // create symtab and strtab sections, link strtab to symtab
   elf_t::section *symtab_sec = litelfCreateSymtabSection(*elf, *symtab);
   if(symtab_sec)
   {
    elf_t::section* strtab_sec = litelfCreateStrtabSection(*elf, strtab);
    if(strtab_sec)
    {
      symtab_sec->set_sh_link(strtab_sec->get_index());
    }
    else
    {
      LTE_ASSERT(strtab_sec);
    }
   }
   else
   {
    LTE_ASSERT(symtab_sec);
   }

   if(relatab->get_entries_num())
   {
      LTE_ERRAX(elf->get_e_class() != ELFCLASS64, "callbacks are not supported for 32bit pinballs yet");

      elf_t::section* rela_text = elf->create_section(RelaTextSegName, SHT_RELA, 0);
      if(rela_text)
      {
          rela_text->set_data(relatab);
          rela_text->set_sh_entsize(relatab->get_entry_size());
          elf_t::section * sec1 =  (elf->get_section(SymtabSegName));
          if(sec1)
          {
            rela_text->set_sh_link(sec1->get_index());
          }
          else
          {
            LTE_ASSERT(sec1);
          }
          elf_t::section * sec2 =  (elf->get_section(TextSegName));
          if(sec2)
          {
          rela_text->set_sh_info(sec2->get_index());
          }
          else
          {
            LTE_ASSERT(sec2);
          }
          symtab->push_back(rela_text->get_sh_name(), 0, 0, ELF_ST_INFO(elf->get_e_class(), STB_LOCAL, STT_SECTION), 0, rela_text->get_index());
      }
      else
      {
        LTE_ASSERT(rela_text);
      }
   }

   // After this point we don't add any sections/data into ELF !!!

   const char* fldscript = get_config().get_ld_script_file_name();
   const char* fobjname = get_config().get_obj_file_name();
   const char* fexename = get_config().get_exe_file_name();
   if(entry == NULL)
   {
    LTE_ASSERT(entry);
    delete elf;// will not execute
    return 1; // will not execute
   }

   if(fldscript || fobjname || fexename)
      elf->layout();

   if(fldscript)
      litelfCreateLdScript(fldscript, elf, NULL);

   if(fobjname || fexename)
   {
      if(entry && !(get_config().no_startup_code()))
      {
         if(remap_va != LTE_MAXVAL(lte_addr_t))
         {
            elf_t::section* section = elf->get_section(remap_va, SHF_WRITE|SHF_EXECINSTR);
            if(section)
            {
              entry->relocate_dmap_data(section->get_sh_offset());
            }
            else
            {
              LTE_ASSERT(section);
            }
         }
         img.memcopy(entry_va, entry->get_code_bytes(), entry->get_code_size());
         img.memcopy(entry_data_va, entry->get_data_bytes(), entry->get_data_size());
      }
   }

   if(fobjname)
      litelfCreateObj(fobjname, elf);

   if(fexename)
   {
      if(relatab->get_entries_num())
      {
         mktemp_template_t tmp;
         tempfile_t tmpfiles[3];

         if(!fobjname)
         {
            fobjname = tmpfiles[0].create(tmp);
            if(fobjname)
            {
              litelfCreateObj(fobjname, elf);
            }
            else
            {
              LTE_ASSERT(fobjname);
            }
         }

         //#define FULL_LINK
         #ifdef FULL_LINK
         const char* ftmpname = tmpfiles[1].create(tmp);
         if(litelfLink(elf->get_e_class(), ftmpname, NULL, fobjname, get_config().get_nonopt_argv(), get_config().get_nonopt_argc(), elf->get_e_entry()))
         {
            litelfLinkError(tmpfiles, LTE_ARRAY_SIZE(tmpfiles));
         }

         elf_t* elftmp = elf_t::create(ftmpname, true);
         fldscript = tmpfiles[2].create(tmp);
         litelfCreateLdScript(fldscript, elf, elftmp);
         delete elftmp;
         #else
         const char* ftmpname = tmpfiles[1].create(tmp);
         if(ftmpname)
         {
          litelfCreateCbkCallStub(ftmpname, elf->get_e_class(), entry);
         }
         else
         {
           LTE_ASSERT(ftmpname);
         }
         if(litelfLink(elf->get_e_class(), fexename, NULL, ftmpname, get_config().get_nonopt_argv(), get_config().get_nonopt_argc(), 0))
         {
            litelfLinkError(tmpfiles, LTE_ARRAY_SIZE(tmpfiles));
         }

         elf_t* elftmp = elf_t::create(fexename, true);
         fldscript = tmpfiles[2].create(tmp);
         if(fldscript)
         {
          litelfCreateLdScript(fldscript, elf, elftmp);
         }
         else
         {
          LTE_ASSERT(fldscript);
         }
         delete elftmp;
         #endif
         if(litelfLink(elf->get_e_class(), ftmpname, fldscript, fobjname, get_config().get_nonopt_argv(), get_config().get_nonopt_argc(), elf->get_e_entry()))
         {
            litelfLinkError(tmpfiles, LTE_ARRAY_SIZE(tmpfiles));
         }

         litelfRelocateRemapPages(get_config().get_exe_file_name(), ftmpname, entry_va, entry_data_va, remap_va);
      }
      else
      {
         if(regions_num > regions_num_max)
            LTE_WARN("executable \"%s\" contains too many segments", fexename);
         litelfRelToExec(*elf, *symtab);
         elf->write(get_config().get_exe_file_name());
      }
   }

   delete elf;
   delete relatab;
   delete symtab;
   delete entry;

   return 0;
}
