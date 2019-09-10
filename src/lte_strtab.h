/*BEGIN_LEGAL 
BSD License 

Copyright (c)2019 Intel Corporation. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
END_LEGAL */
#pragma once
#ifndef _LTE_STRTAB_H_
#define _LTE_STRTAB_H_

#include "lte_types.h"
#include "lte_utils.h"
#include "lte_portability.h"
#include <vector>

class elf_table_t {
protected:
    std::vector<char>       table;
    std::vector<lte_size_t> index;

protected:
    const char* ptr() const { return table.size() ? &(table[0]) : NULL; }
          char* ptr()       { return table.size() ? &(table[0]) : NULL; }

public:
    elf_table_t(){}
    ~elf_table_t(){}

public:
    lte_size_t push_back(const void* p, lte_size_t size, int c = 0);
    void pop_back(lte_size_t n = 1);

    template<typename T> T& get(lte_size_t offs)
    {
        LTE_ASSERT((offs + sizeof(T)) < table_size());
        return *(T*)&table[offs];
    }
    template<typename T> void set(lte_size_t offs, const T& v)
    {
        get<T>(offs) = v;
    }

    lte_uint8_t&  byte(lte_size_t offs) { return get<lte_uint8_t>(offs); }
    lte_uint16_t& word(lte_size_t offs) { return get<lte_uint16_t>(offs); }
    lte_uint32_t& dword(lte_size_t offs) { return get<lte_uint32_t>(offs); }
    lte_uint64_t& qword(lte_size_t offs) { return get<lte_uint64_t>(offs); }

    const char* table_ptr() const
    {
        return ptr();
    }

    char* table_ptr()
    {
        return ptr();
    }

    lte_size_t table_size() const
    {
        return table.size();
    }

    lte_size_t offset(lte_uint32_t i) const
    {
        LTE_ASSERT(i < count());
        return index[i];
    }

    lte_size_t size(lte_uint32_t i) const
    {
        lte_uint32_t inext = i + 1;
        return ((inext == count()) ? table.size() : offset(inext)) - offset(i);
    }

    lte_size_t count() const
    {
        return index.size();
    }

    void clear()
    {
        table.clear();
        index.clear();
    }

    lte_size_t pad(lte_size_t size);

    const char* operator [] (lte_uint32_t i) const
    {
        return ptr() + offset(i);
    }
};


class elf_strtab_t : public elf_table_t {
public:
    elf_strtab_t(){}
    ~elf_strtab_t(){}

public:
    lte_size_t push_back_strtab(const char* strtable, lte_size_t size);
    lte_size_t push_back_fmt(const char* fmt, ...);
    lte_size_t push_back(const char* str)
    {
        return elf_table_t::push_back(str, str ? (lte_strlen(str) + 1) : 0);
    }
    elf_strtab_t& operator << (const char* str)
    {
        push_back(str);
        return *this;
    }
};


template<class T>
inline elf_table_t& operator << (elf_table_t& t, const T& v)
{
    t.push_back(&v, sizeof(*&v));
    return t;
}

#endif /*_LTE_STRTAB_H_*/
