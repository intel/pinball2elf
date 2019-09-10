/*BEGIN_LEGAL 
BSD License 

Copyright (c)2019 Intel Corporation. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
END_LEGAL */
#include "lte_reg_enum.h"
#include <string.h>

struct str2lte_reg_t {
  lte_reg_enum_t id;
  const char* name;
};

#define DEFINE_STR2LTE_REG_ENUM(NAME) \
  {LTE_REG_ID(NAME), #NAME},

#define LTE_STR2LTE_REG_ENUM_MAPPING \
   LTE_REGISTERS_LIST(DEFINE_STR2LTE_REG_ENUM) \
   {LTE_REG_LAST, NULL}

static str2lte_reg_t map[] = {
   LTE_STR2LTE_REG_ENUM_MAPPING
};

lte_reg_enum_t str2lte_reg_enum_t(const char* s)
{
   if(!strcmp(s, "FS-BASE"))
      return LTE_REG_FSBASE;
   else if(!strcmp(s, "GS-BASE"))
      return LTE_REG_GSBASE;

   for(const str2lte_reg_t* p = map; p->name; ++p)
      if(!strcmp(p->name, s))
         return p->id;
   return LTE_REG_INVALID;
}

const char* lte_reg_enum_t2str(const lte_reg_enum_t v)
{
   return (v < LTE_REG_LAST) ? map[v].name : NULL;
}
