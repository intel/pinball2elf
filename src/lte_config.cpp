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
#include <vector>
#include <iostream>
#include <string.h>

const lte_addr_t default_user_space_limit_32 = 0xffffffff;
const lte_addr_t default_user_space_limit_64 = 0;//unlimited
const lte_addr_t default_remap_limit = LTE_MAXVAL(lte_addr_t);
const  lte_uint32_t default_cbk_stack_size = 0x400000; // 4MB

void config_t::usage(const char* exe_name) const
{
   std::cout << "Usage: " << (exe_name ? exe_name : m_executable) << " [options] [FILES]\n";
}

config_t::config_t()
{
   m_no_startup = false;
   m_user_space_limit = 0;
   m_remap_limit = default_remap_limit;
   m_cbk_stack_size = default_cbk_stack_size;
   m_dseg_flags = SHF_ALLOC | SHF_WRITE;
   m_tseg_flags = SHF_ALLOC | SHF_EXECINSTR;
   m_verbose = false;
   m_no_stack_remap = false;

   m_roi_start_tag[ROI_TYPE_SNIPER] = 1;
   m_roi_start_tag[ROI_TYPE_SSC] = 1;
   m_roi_start_tag[ROI_TYPE_SIMICS] = 0x14711;

   m_magic2_tag[ROI_TYPE_SNIPER] = 2;
   m_magic2_tag[ROI_TYPE_SSC] = 2;
   m_magic2_tag[ROI_TYPE_SIMICS] = 0x14712;

   m_roi_start_mask = 0;
   m_magic2_mask = 0;
   m_roi_thread_id = 0;
   m_exe_file = NULL;
   m_user_space_limit_set = false;
   m_nonopt_argc = 0;
   m_no_modify_ldt = true;
   m_nonopt_argv = NULL;
   m_arch_state_out_file = NULL;
   m_thread_min_icount = 1;
   m_no_monitor_thread = true;
   m_tstart_cbk = NULL;
   m_no_modify_ldt_set = false;
   m_ld_script_file = NULL;
   m_mem_layout_file = NULL;
   m_arch_desc_file = NULL;
   m_pstart_cbk = NULL;
   m_pexit_cbk = NULL;
   m_executable = NULL;
   m_no_futexes = false;
   m_arch_state_file = NULL;
   m_obj_file = NULL;
   m_mem_image_file = NULL;
}

void config_t::help_msg(const char* exe_name) const
{
   usage(exe_name);
   std::cout << "Options:\n"
             << "  -d FILE, --arch-desc  FILE       architecture description file\n"
             << "  -s FILE, --arch-state FILE       architectural state file\n"
             << "  -m FILE, --mem FILE              memory image file\n"
             << "  -r FILE, --mem-layout FILE       list of memory regions with attributes\n"
             << "  -x FILE                          executable file name\n"
             << "  -o FILE                          object file name\n"
             << "  -S FILE                          architectural state converted to assembly\n"
             << "  -T FILE, --ld-script FILE        linker script\n"
             << "  -D FLAGS, --data-seg-flags FLAGS set data sections flags, combination of A,W,X\n"
             << "  -C FLAGS, --text-seg-flags FLAGS set text sections flags, combination of A,W,X\n"
             << "  -u ADDR, --usr-space-top ADDR    top address of the user space, hex number or 'unlimited'\n"
             << "  -l ADDR, --ld-break-addr ADDR    prevent loading of pages above this address by the ELF-loader\n"
             << "  -i NUM, --thread-min-icount NUM  exclude threads with incstruction counter less than NUM\n"
             << "  -p FUNC, --process-cbk FUNC      name of process start callback\n"
             << "  -e FUNC, --process-exit-cbk FUNC name of process exit callback\n"
             << "  -t FUNC, --thread-cbk FUNC       name of thread start callback\n"
             << "  --cbk-stack-size NUM             callback stack size\n"
             << "  --[no-]stack-remap               enable(DEFAULT)/disable stack related pages remapping\n"
             << "  --[no-]startup                   enable(DEFAULT)/disable the startup code injection\n" 
             << "  --[no-]modify-ldt                enable(DEFAULT32)/disable(DEFAULT64) modify_ldt syscall in the startup code\n"
             << "  --[no-]futexes                   enable(DEFAULT)/disable futexes for threads synchronization\n"
             << "  --[no-]monitor-thread            enable/disable(DEFAULT) creation of the monitor thread waiting for all others\n"
             << "  --roi-start [TYPE:]TAG           defines type (sniper, ssc or simics) and tag for ROI start marker\n"
             << "  --magic2 [TYPE:]TAG              defines type (sniper, ssc or simics) and tag for 2nd magic instruction\n"
             << "  --data-seg-name NAME             set data sections name\n"
             << "  --text-seg-name NAME             set text sections name\n"
             //<< "  --roi-thread TID                 defines ID of thread for which ROI start marker should be executed\n"
             << "  -Wl,<options>                    pass comma-separated <options> on to the linker\n"
             << "  -V, --verbose                    output additional information\n"
             << "  -h, --help                       print option help\n";
};

static Elf32_Word str_to_seg_type(const char* str_flags, const char* opt)
{
   Elf32_Word flags = 0;

   LTE_ASSERT(str_flags != NULL);

   for(; *str_flags; ++str_flags)
   {
      char c = *str_flags;
      if(c == 'a' || c == 'A')
      {
         flags |= SHF_ALLOC;
      }
      else if(c == 'w' || c == 'W')
      {
         flags |= SHF_WRITE;
      }
      else if(c == 'x' || c == 'X')
      {
         flags |= SHF_EXECINSTR;
      }
      else
      {
         LTE_ERRX("Invalid flag %c in '%s %s'. Only 'AWX' allowed\n", c, opt, str_flags);
      }
   }
   return flags;
}

static int is_opt(const char* s1, const char* s2) 
{
   return (strcmp(s1, s2) == 0);
}

static int is_opt_Wl(const char* opt)
{
   return (opt[0] == '-' && opt[1] == 'W' && opt[2] == 'l' && opt[3] == ',');
}

static int get_opt_arg_ind_or_die(int argi, int argc, const char* arg)
{
   LTE_ERRAX(++argi >= argc, "%s: %s\n", arg, "invalig argument");
   return argi;
}

static const char* get_basename(const char* path, char delim)
{
   LTE_ASSERT(path != NULL);
   for(const char* p = path; *p;)
      if(delim == *p++)
         path = p;
   return path;
}

static lte_uint64_t get_opt_str2ull(const char* str, char** endptr, lte_uint64_t default_val)
{
   lte_uint64_t val;
   char* end;

   val = lte_strtoull(str, &end, 10);
   if(*end)
   {
      val = lte_strtoull(str, &end, 16);
      if(*end)
         val = default_val;
   }

   if(endptr != NULL)
      *endptr = end;

   return val;
}

static void verify_magic_instruction_tag(lte_uint32_t type, lte_uint32_t tag, int magic_id)
{
   if((type == ROI_TYPE_SIMICS) && ((tag == 14) || (tag == 0) || (tag > 0xffff)))
      LTE_WARN("simics %s should be in range 0x0001 - 0xffff, and not equal to 0x0e", ((magic_id == 1) ? "ROI tag" : "MAGIC2"));
}

static void get_magic_instr_tag(const char* arg, lte_uint32_t* tags, lte_uint32_t* mask, int magic_id)
{
   lte_uint32_t type = ROI_TYPE_SNIPER;
   lte_uint32_t type_end = ROI_TYPE_SIZE;

   const char* tagstr = strchr(arg, ':');
   if(tagstr)
   {
      int len = tagstr - arg;

      if((len == 3) && !strncasecmp(arg, "ssc", len))
      {
         type = ROI_TYPE_SSC;
      }
      else if((len == 6) && !strncasecmp(arg, "simics", len))
      {
         type = ROI_TYPE_SIMICS;
      }
      else if((len != 6) || strncasecmp(arg, "sniper", len))
      {
         LTE_ERRX("wrong ROI type '%s'", arg);
      }
      type_end = type + 1;
      ++tagstr;
   }
   else
   {
      tagstr = arg;
      type = 0;
   }

   if(magic_id == 2)
   {
      if(tagstr != arg && type != ROI_TYPE_SIMICS)
      {
         LTE_WARN("sniper&ssc types are not supported for MAGIC2 yet");
      }
      type = ROI_TYPE_SIMICS;
   }

   char* end;
   lte_uint32_t tag = (lte_uint32_t)lte_strtoull(tagstr, &end, 0);

   for(; type < type_end; ++type)
   {
      verify_magic_instruction_tag(type, tag, magic_id);
      tags[type] = tag;
      mask[0] |= (1 << type);
   }
}


void config_t::init(int argc, char* argv[])
{
   m_executable = get_basename(argv[0], '/');
   if(argc < 2)
   {
      usage(argv[0]);
      exit(0);
   }

   m_mem_image_file = NULL;
   m_mem_layout_file = NULL;
   m_ld_script_file = NULL;
   m_arch_desc_file = NULL;
   m_arch_state_file = NULL;
   m_exe_file = NULL;
   m_obj_file = NULL;
   m_arch_state_out_file = NULL;
   m_dseg_flags = SHF_ALLOC | SHF_WRITE;
   m_tseg_flags = SHF_ALLOC | SHF_EXECINSTR;
   m_thread_min_icount = 1;
   m_remap_limit = default_remap_limit;
   m_cbk_stack_size = default_cbk_stack_size;
   m_user_space_limit = 0; // 0 means no limit
   m_user_space_limit_set = false;
   m_no_modify_ldt = true;
   m_no_modify_ldt_set = false;
   m_no_stack_remap = false;
   m_no_startup = false;
   m_no_futexes = false;
   m_no_monitor_thread = true;
   m_verbose = false;
   m_pstart_cbk = NULL;
   m_pexit_cbk = NULL;
   m_tstart_cbk = NULL;
   m_roi_start_tag[ROI_TYPE_SNIPER] = 1;
   m_roi_start_tag[ROI_TYPE_SSC] = 1;
   m_roi_start_tag[ROI_TYPE_SIMICS] = 1;

   int optind __attribute__((unused)) = argc;

   for(int i = 1; i < argc; i++)
   {
      char **argi = &argv[i];

      if(is_opt(argi[0], "-h") || is_opt(argi[0], "--help"))
      {
         help_msg(NULL);
         exit(0);
      }
      else if(is_opt(argi[0], "-r") || is_opt(argi[0], "--mem-layout"))
      {
         optind = i = get_opt_arg_ind_or_die(i, argc, argi[0]);
         m_mem_layout_file = argi[1];
      }
      else if(is_opt(argi[0], "-m") || is_opt(argi[0], "--mem"))
      {
         optind = i = get_opt_arg_ind_or_die(i, argc, argi[0]);
         m_mem_image_file = argi[1];
      }
      else if(is_opt(argi[0], "-T") || is_opt(argi[0], "--ld-script"))
      {
         optind = i = get_opt_arg_ind_or_die(i, argc, argi[0]);
         m_ld_script_file = argi[1];
      }
      else if(is_opt(argi[0], "-s") || is_opt(argi[0], "--arch-state"))
      {
         optind = i = get_opt_arg_ind_or_die(i, argc, argi[0]);
         m_arch_state_file = argi[1];
      }
      else if(is_opt(argi[0], "-d") || is_opt(argi[0], "--arch-desc"))
      {
         optind = i = get_opt_arg_ind_or_die(i, argc, argi[0]);
         m_arch_desc_file = argi[1];
      }
      else if(is_opt(argi[0], "-S"))
      {
         optind = i = get_opt_arg_ind_or_die(i, argc, argi[0]);
         m_arch_state_out_file = argi[1];
      }
      else if(is_opt(argi[0], "-o"))
      {
         optind = i = get_opt_arg_ind_or_die(i, argc, argi[0]);
         m_obj_file = argi[1];
      }
      else if(is_opt(argi[0], "-x"))
      {
         optind = i = get_opt_arg_ind_or_die(i, argc, argi[0]);
         m_exe_file = argi[1];
      }
      else if(is_opt(argi[0], "-u") || is_opt(argi[0], "--usr-space-top"))
      {
         char* end;
         optind = i = get_opt_arg_ind_or_die(i, argc, argi[0]);
         if(lte_stricmp(argi[1], "unlimited")!=0)
         {
            m_user_space_limit = lte_strtoull(argi[1], &end, 16);
         }
         m_user_space_limit_set = true;
      }
      else if(is_opt(argi[0], "-l") || is_opt(argi[0], "--ld-break-addr"))
      {
         char* end;
         optind = i = get_opt_arg_ind_or_die(i, argc, argi[0]);
         m_remap_limit = lte_strtoull(argi[1], &end, 16);
      }
      else if(is_opt(argi[0], "--magic2"))
      {
         optind = i = get_opt_arg_ind_or_die(i, argc, argi[0]);
         get_magic_instr_tag(argi[1], m_magic2_tag, &m_magic2_mask, 2);
      }
      else if(is_opt(argi[0], "--roi-start"))
      {
         optind = i = get_opt_arg_ind_or_die(i, argc, argi[0]);
         get_magic_instr_tag(argi[1], m_roi_start_tag, &m_roi_start_mask, 1);
      }
      //else if(is_opt(argi[0], "--roi-thread"))
      //{
         //optind = i = get_opt_arg_ind_or_die(i, argc, argi[0]);

         //if(!strcasecmp(argi[1], "all"))
         //{
            //m_roi_thread_id = 0xffffffff;
         //}
         //else
         //{
            //char* end;
            //m_roi_thread_id = lte_strtoull(argi[1], &end, 10);
         //}
      //}
      else if(is_opt(argi[0], "-i") || is_opt(argi[0], "--thread-min-icount"))
      {
         char* end;
         optind = i = get_opt_arg_ind_or_die(i, argc, argi[0]);
         m_thread_min_icount = lte_strtoull(argi[1], &end, 10);
      }
      else if(is_opt(argi[0], "-V") || is_opt(argi[0], "--verbose"))
      {
         optind = i;
         m_verbose = true;
      }
      else if(is_opt(argi[0], "--no-modify-ldt"))
      {
         optind = i;
         m_no_modify_ldt_set = true;
         m_no_modify_ldt = true;
      }
      else if(is_opt(argi[0], "--modify-ldt"))
      {
         optind = i;
         m_no_modify_ldt_set = true;
         m_no_modify_ldt = false;
      }
      else if(is_opt(argi[0], "--no-futexes"))
      {
         optind = i;
         m_no_futexes = true;
      }
      else if(is_opt(argi[0], "--futexes"))
      {
         optind = i;
         m_no_futexes = false;
      }
      else if(is_opt(argi[0], "--no-monitor-thread"))
      {
         optind = i;
         m_no_monitor_thread = true;
      }
      else if(is_opt(argi[0], "--monitor-thread"))
      {
         optind = i;
         m_no_monitor_thread = false;
      }
      else if(is_opt(argi[0], "--no-startup"))
      {
         optind = i;
         m_no_startup = true;
      }
      else if(is_opt(argi[0], "--startup"))
      {
         optind = i;
         m_no_startup = false;
      }
      else if(is_opt(argi[0], "--cbk-stack-size"))
      {
         char* end;
         optind = i = get_opt_arg_ind_or_die(i, argc, argi[0]);
         lte_uint64_t stack_size = get_opt_str2ull(argi[1], &end, default_cbk_stack_size);
         // min 8 bytes, max 256MB
         m_cbk_stack_size = (stack_size < 8) ? 8 : ((stack_size > 0x10000000) ? 0x10000000 : stack_size);
      }
      else if(is_opt(argi[0], "--no-stack-remap"))
      {
         optind = i;
         m_no_stack_remap = true;
      }
      else if(is_opt(argi[0], "--stack-remap"))
      {
         optind = i;
         m_no_stack_remap = false;
      }
      else if(is_opt(argi[0], "-D") || is_opt(argi[0], "--data-seg-flags"))
      {
         optind = i = get_opt_arg_ind_or_die(i, argc, argi[0]);
         m_dseg_flags = str_to_seg_type(argi[1], argi[0]);
      }
      else if(is_opt(argi[0], "-C") || is_opt(argi[0], "--text-seg-flags"))
      {
         optind = i = get_opt_arg_ind_or_die(i, argc, argi[0]);
         m_tseg_flags = str_to_seg_type(argi[1], argi[0]);
      }
      else if(is_opt(argi[0], "-p") || is_opt(argi[0], "--process-cbk"))
      {
         optind = i = get_opt_arg_ind_or_die(i, argc, argi[0]);
         m_pstart_cbk = argi[1];
      }
      else if(is_opt(argi[0], "-e") || is_opt(argi[0], "--process-exit-cbk"))
      {
         optind = i = get_opt_arg_ind_or_die(i, argc, argi[0]);
         m_pexit_cbk = argi[1];
      }
      else if(is_opt(argi[0], "-t") || is_opt(argi[0], "--thread-cbk"))
      {
         optind = i = get_opt_arg_ind_or_die(i, argc, argi[0]);
         m_tstart_cbk = argi[1];
      }
      else if(is_opt_Wl(argi[0]))
      {
         for(char *p = argi[0] + 4, *pnext; *p; p = pnext)
         {
            for(pnext = p; *pnext; ++pnext)
            {
               if(*pnext == ',')
               {
                  *pnext++ = 0;
                  break;
               }
            }
            m_nonopt_vec.push_back(p);
         }
      }
      else if(**argi == '-')
      {
         LTE_ERRX("unrecognized option '%s'", *argi);
      }
      else
      {
         m_nonopt_vec.push_back(argi[0]);
      }
   }

   for(lte_uint32_t type = 0, mask = 1; type < ROI_TYPE_SIZE; ++type, mask += mask)
   {
      if(!(m_magic2_mask & mask))
      {
         lte_uint32_t tag = m_roi_start_tag[type] + 1;
         if(type == ROI_TYPE_SIMICS)
         {
            tag &= 0xffff;
         }
         verify_magic_instruction_tag(type, tag, 2);
         m_magic2_tag[type] = tag;
      }
   }

   #if 1
   if(m_nonopt_vec.size())
   {
      m_nonopt_argv = &m_nonopt_vec[0];
      m_nonopt_argc = m_nonopt_vec.size();
   }
   #else
   if(argc > ++optind)
   {
      m_nonopt_argv = argv + optind;
      m_nonopt_argc = argc - optind;
   }
   #endif
   else
   {
      m_nonopt_argv = NULL;
      m_nonopt_argc = 0;
   }

   if(m_pexit_cbk && m_no_monitor_thread)
   {
      LTE_WARN("monitor thread has been enabled as is required for 'on exit' callback");
      m_no_monitor_thread = false;
   }

   LTE_ERRAX(!m_mem_image_file, "no memory image file");
   LTE_ERRAX(!m_arch_desc_file, "no arch description/state file");

   // if no executable, object or ld script file names specified, 
   // generate executable file only
   if(!m_exe_file && !m_ld_script_file && !m_obj_file && !m_arch_state_out_file)
   {
      m_default_exe_file  = m_mem_layout_file ? m_mem_layout_file : "a";
      m_default_exe_file += ".out";
      m_exe_file = m_default_exe_file.c_str();
      LTE_WARN("no output file name, generating executable %s", m_exe_file);
   }
}

lte_addr_t config_t::get_user_space_limit(unsigned char arch_mode) const
{
   return m_user_space_limit_set ? m_user_space_limit : 
                              ((arch_mode == ELFCLASS64) ? default_user_space_limit_64 : default_user_space_limit_32);
}

bool config_t::no_modify_ldt(unsigned char arch_mode) const
{
   return m_no_modify_ldt_set ? m_no_modify_ldt : (arch_mode == ELFCLASS64);
}
