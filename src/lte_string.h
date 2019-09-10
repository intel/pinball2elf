/*BEGIN_LEGAL 
BSD License 

Copyright (c)2019 Intel Corporation. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
END_LEGAL */
#ifndef LTE_STRING_H
#define LTE_STRING_H

#include "lte_types.h"
#include <stdio.h>
#include <vector>

class lte_strlist_t {
   protected:
      std::vector<lte_size_t> m_index;
      std::vector<char> m_str;
      lte_size_t m_length;
      lte_size_t m_count;

      void   push_str_index(lte_size_t idx) { m_index.push_back(idx); ++m_count; }
      void   push_end_index(lte_size_t idx) { m_index.push_back(idx); }
      lte_size_t expand(lte_size_t delta) { lte_size_t sz = m_str.size(); m_str.resize(sz + delta); return sz; }

   public:
      lte_strlist_t() : m_length(0), m_count(0) {}

      char* getline(FILE* f, char wt = 0);

      char*  c_str() { return &m_str[0]; }
      lte_size_t length() const { return m_length; }

      char*  c_str(lte_size_t idx) { return &m_str[m_index[idx]]; }
      lte_size_t length(lte_size_t idx) const { return m_index[idx+1] - m_index[idx] - 1; }
      char*  operator[] (lte_size_t idx) { return &m_str[m_index[idx]]; }

      lte_size_t str_count() const { return m_count; }

      char* find(char c);
      char* to_upper(lte_size_t idx);
      void  set_delimiter(char delim);
};

char* lte_strrvrs(char* str, lte_size_t len, char* buffer, lte_size_t size);

char* lte_strrvrshex(char* str, lte_size_t len, char* buffer, lte_size_t size);

bool lte_strtovec(const char* str, lte_uint64_t* vec, lte_size_t size);

#endif //LTE_DTRING_H
