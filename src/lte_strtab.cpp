/*BEGIN_LEGAL 
BSD License 

Copyright (c)2019 Intel Corporation. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
END_LEGAL */
#include "lte_strtab.h"
#include <stdarg.h>

lte_size_t elf_table_t::pad(lte_size_t size)
{
   lte_size_t offs = table.size();

   if(size)
   {
      table.resize(offs + size);
      index.push_back(offs);
   }

   return offs;
}

lte_size_t elf_table_t::push_back(const void* p, lte_size_t size, int c)
{
   lte_size_t offs = table.size();

   if(size)
   {
      table.resize(offs + size);
      index.push_back(offs);
      if(p)
         memcpy(ptr() + offs, p, size);
      else
         memset(ptr() + offs, c, size);
   }

   return offs;
}

void elf_table_t::pop_back(lte_size_t n)
{
   if(n < 1)
      return;

   lte_size_t size = count();
   if(n < size)
   {
      size -= n;
      table.resize(index[size]);
      index.resize(size);
   }
   else
   {
      clear();
   }
}

lte_size_t elf_strtab_t::push_back_strtab(const char* strtable, lte_size_t size)
{
   if(!size)
      return 0;

   lte_size_t offs = table.size();
   table.resize(offs + size);

   char* pstr = ptr();
   if(pstr)
   {
    pstr = pstr + offs;
    memcpy(pstr, strtable, size);

    for(char* pend = pstr + size; pstr != pend;)
    {
      char* p = pstr;
      for(; (p != pend) && *p; ++p);
      index.push_back(pstr - ptr());
      pstr = *p ? p : ++p;
    }
   }
   else
   {
    LTE_ASSERT(pstr);
   }

   offs = table.size();
   char * tmp = ptr();
    
   if(tmp)
   {
    if(!tmp[offs-1])
    {
     table.resize(offs+1);
     tmp[offs] = 0;
    }
   }
   else
   {
    LTE_ASSERT(tmp);
   }

   return table.size();
}

lte_size_t elf_strtab_t::push_back_fmt(const char* fmt, ...)
{
   va_list args;
   int len;
   lte_size_t offs = table.size();

   va_start(args, fmt);
   len = lte_vsnprintf(ptr()+offs, 0, fmt, args);
   va_end(args);

   len++;
   table.resize(table.size() + len);
   index.push_back(offs);

   va_start(args, fmt);
   len = lte_vsnprintf(ptr()+offs, len, fmt, args);
   va_end(args);

   return offs;
}
