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
#include <algorithm>
#include <iostream>
#include <iomanip>

lte_int32_t elf_table_t::find(lte_size_t offset) const
{
   return (offset < table.size()) ? (std::distance(index.begin(), std::upper_bound(index.begin(), index.end(), offset)) - 1) : -1;
}

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

void elf_strtab_t::push_back_strtab(const char* strtable, lte_size_t size)
{
   if(size)
   {
      lte_size_t offs = table.size();
      lte_size_t tz = (strtable[size - 1] ? 1 : 0);
      table.resize(offs + size + tz, 0x72);

      char* pdst = ptr() + offs;
      for(const char *psrc = strtable, *pend = strtable + size; psrc != pend;)
      {
         index.push_back(pdst - ptr());
         while((psrc != pend) && (*pdst++ = *psrc++));
      }
      pdst[tz - 1] = 0;
   }
}

lte_size_t elf_strtab_t::push_back_fmt(const char* fmt, ...)
{
   va_list args;
   int len;
   lte_size_t offs = table.size();

   va_start(args, fmt);
   len = lte_vsnprintf(ptr()+offs, 0, fmt, args);
   va_end(args);

   if(!len)
      return 0;

   table.resize(table.size() + ++len);
   index.push_back(offs);

   va_start(args, fmt);
   len = lte_vsnprintf(ptr()+offs, len, fmt, args);
   va_end(args);

   return offs;
}

lte_ssize_t elf_strtab_t::set(lte_uint32_t ind, const char* src)
{
   if(ind >= count())
      return 0;

   lte_size_t dst_size = size(ind);
   lte_size_t src_size = lte_strlen(src) + 1;
   lte_size_t table_size = table.size(); 
   lte_size_t offs = offset(ind); 

   if(src_size != dst_size)
   {
      if(src_size < dst_size)
      {
         memcpy(&table[offs + src_size], &table[offs + dst_size], table_size - (offs + dst_size));
         table.resize(table_size - (dst_size - src_size));
      }
      else
      {
         table.resize(table_size + (src_size - dst_size));
         memmove(&table[offs + src_size], &table[offs + dst_size], table_size - (offs + dst_size));
      }
      for(lte_uint32_t i = ind + 1; i < index.size(); ++i)
         index[i] += (src_size - dst_size);  
   } 
   memcpy(&table[offs], src, src_size);

   return (src_size - dst_size);
}
