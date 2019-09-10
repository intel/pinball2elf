/*BEGIN_LEGAL 
BSD License 

Copyright (c)2019 Intel Corporation. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
END_LEGAL */
#include "lte_portability.h"
#include "lte_string.h"

char* lte_strlist_t::find(char c)
{
   for(char *p = c_str(), *pend = p + m_length; p != pend; ++p)
      if(*p == c)
         return p;
   return NULL;
}

char* lte_strlist_t::to_upper(lte_size_t idx)
{
   char* str = (*this)[idx];
   for(char* p = str; *p; ++p)
      *p = toupper(*p);
   return str;
}

void lte_strlist_t::set_delimiter(char delim)
{
   for(lte_size_t i = 1; i < m_count; ++i)
   {
      m_str[m_index[i]-1] = delim;
   }
}

char* lte_strlist_t::getline(FILE* f, char wt)
{
   if(!m_str.size())
   {
      m_str.push_back(0);
   }
   m_index.clear();
   m_count = 0;

   char buffer[256];
   char* pstr = c_str();;
   char* pdst = pstr;

   for(char prev = 0; fgets(buffer, sizeof(buffer), f) != NULL;)
   {
      if(pdst - pstr + sizeof(buffer) > m_str.size())
      {
         lte_size_t offs = expand(sizeof(buffer));
         pstr = c_str();
         pdst = pstr + offs;
      }

      for(char* psrc = buffer; *psrc; ++psrc)
      {
         if(*psrc == '\n')
         {
            *pdst = 0;
            m_length = pdst - pstr;
            push_end_index(m_length + 1);
            return pstr;
         }

         if(!isspace(*psrc))
         {
            if(prev == ' ')
            {
              *pdst++ = wt;
               push_str_index(pdst - pstr);
            }
            else if(prev == 0)
            {
               push_str_index(pdst - pstr);
            }
            *pdst++ = prev = *psrc;
         }
         else if(prev)
         {
            prev = ' ';
         }
      }
   }

   *pdst = 0;
   m_length = pdst - pstr;
   push_end_index(m_length + 1);

   return m_length ? pstr : NULL;
}



char* lte_strrvrs(char* str, lte_size_t len, char* buffer, lte_size_t size)
{
   if(size <= len)
      str += len - (size - 1);

   lte_uint16_t* psrc = (lte_uint16_t*)(str + len);
   lte_uint16_t* pdst = (lte_uint16_t*)buffer;

   for(; LTE_PTRDIFF(psrc, str) >= 2; *pdst++ = *--psrc);

   if(LTE_PTRDIFF(psrc, str) == 1)
   {
      *pdst++ = (((lte_uint16_t)str[0])<<8) | ((lte_uint16_t)'0');
   }
   *pdst = 0;
   return buffer;
}

char* lte_strrvrshex(char* str, lte_size_t len, char* buffer, lte_size_t size)
{
   lte_size_t offs;

   if(*str == 'x' || *str == 'X')
      offs = 1;
   else if(*str == '0' && (str[1] == 'x' || str[1] == 'X'))
      offs = 2;
   else
      offs = 0;

   return lte_strrvrs(str + offs, len - offs, buffer, size);
}



static __LTE_INLINE lte_uint64_t strntoull(const char* str, char** end, int radix, char* buffer, lte_size_t n)
{
   lte_strncpy(buffer, str, n);
   buffer[n] = 0;
   return lte_strtoull(buffer, end, radix);
}

bool lte_strtovec(const char* str, lte_uint64_t* vec, lte_size_t size)
{
   const lte_size_t width = sizeof(*vec)<<1;

   for(; *str && isspace(*str); ++str); // ltrim

   lte_size_t len = lte_strlen(str);

   if(len > size * width)
      len = size * width;

   for(const char* p = str - 1; len && isspace(p[len]); --len); // rtrim

   char buffer[width+1];
   lte_size_t offs = len & (width-1);
   char* end;

   lte_size_t ind = 0;
   if(len >= width)
   {
      for(lte_size_t pos = len; ind < size && pos > offs; ++ind)
      {
         pos -= width;
         vec[ind] = strntoull(str + pos, &end, 16, buffer, width);
         if(*end)
            return false;
      }
   }

   if(ind < size)
   {
      vec[ind++] = strntoull(str, &end, 16, buffer, offs);
      if(*end)
        return false;
   }

   for(; ind < size; ++ind)
   {
      vec[ind] = 0;
   }

   return true;
}
