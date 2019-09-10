/*BEGIN_LEGAL 
BSD License 

Copyright (c)2019 Intel Corporation. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
END_LEGAL */
#ifndef _LTE_SYSELF_H_
#define _LTE_SYSELF_H_

#include "lte_defs.h"
#include "lte_types.h"

#include <elf.h>

#ifdef __LTE_BIGENDIAN__
   #define ELFSIGNATURE \
      (((lte_uint32_t)ELFMAG3)|(((lte_uint32_t)ELFMAG2)<<8)|(((lte_uint32_t)ELFMAG1)<<16)|(((lte_uint32_t)ELFMAG0)<<24))
#else
   #define ELFSIGNATURE \
      (((lte_uint32_t)ELFMAG0)|(((lte_uint32_t)ELFMAG1)<<8)|(((lte_uint32_t)ELFMAG2)<<16)|(((lte_uint32_t)ELFMAG3)<<24))
#endif

typedef Elf64_Rela Elf_Rela_t;

inline Elf32_Word ELF_R_SYM(Elf64_Xword i) { return (Elf32_Word)(i >> 32); }
inline Elf32_Word ELF_R_TYPE(Elf64_Xword i) { return (Elf32_Word)(i); }
inline Elf64_Xword ELF_R_INFO(Elf32_Word sym, Elf32_Word type) { return (((Elf64_Xword)sym) << 32) | type; }

typedef struct {
    const char*   name;
    Elf64_Addr    offs;
    Elf64_Xword   size;
    unsigned char info;
    Elf_Rela_t*   rela;
} Elf_SymInfo_t;

typedef lte_uint8_t   Elf_Byte_t;
typedef lte_size_t    Elf_Size_t;
typedef unsigned char Elf_Class_t;

#endif /*_LTE_SYSELF_H_*/
