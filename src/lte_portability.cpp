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
#include "lte_utils.h"
#include <stdarg.h>
#include <stdio.h>
#include <vector>

#define BLK_SZ 0x40000000

lte_bool_t __LTE_DECL lte_pread(lte_fd_t fd, void* buf, lte_size_t ntoread, lte_size_t* pnread)
{
    lte_size64_t nread64;
    lte_bool_t   r = lte_preadq(fd, buf, ntoread, &nread64);
    if(pnread)
    {
        *pnread = LTE_DOWNCVT(lte_size_t, nread64);
    }
    return r;
}

lte_bool_t __LTE_DECL lte_pwrite(lte_fd_t fd, const void* buf, lte_size64_t ntowrite, lte_size64_t* pnwritten)
{
    lte_size64_t nwritten64;
    lte_bool_t   r = lte_pwriteq(fd, buf, ntowrite, &nwritten64);
    if(pnwritten)
    {
        *pnwritten = LTE_DOWNCVT(lte_size_t, nwritten64);
    }
    return r;
}

lte_bool_t __LTE_DECL lte_preadq(lte_fd_t fd, void* buf, lte_size64_t ntoread, lte_size64_t* pnread)
{
    lte_size64_t nread;
    lte_size32_t ntoread_lo;
    lte_int_t    n;

    if(!pnread)
        pnread = &nread;
    *pnread = 0;

    for(;ntoread > BLK_SZ; ntoread -= BLK_SZ)
    {
        if((n = lte_read(fd, buf, BLK_SZ)) <= 0)
        {
            return LTE_FALSE;
        }
        *pnread += n;
        buf = ((char*)buf) + n;
    }

    if((ntoread_lo = (lte_size32_t)ntoread) > 0)
    {
        if((n = lte_read(fd, buf, ntoread_lo)) <= 0)
        {
            return LTE_FALSE;
        }
        *pnread += n;
    }

    return LTE_TRUE;
}

lte_bool_t __LTE_DECL lte_pwriteq(lte_fd_t fd, const void* buf, lte_size64_t ntowrite, lte_size64_t* pnwritten)
{
    lte_size64_t nwritten;
    lte_size32_t ntowrite_lo;
    lte_int_t    n;

    if(!pnwritten)
        pnwritten = &nwritten;
    *pnwritten = 0;

    for(;ntowrite > BLK_SZ; ntowrite -= BLK_SZ)
    {
        if((n = lte_write(fd, buf, BLK_SZ)) <= 0)
        {
            return LTE_FALSE;
        }
        *pnwritten += n;
        buf = ((const char*)buf) + n;
    }

    if((ntowrite_lo = (lte_size32_t)ntowrite) > 0)
    {
        if((n = lte_write(fd, buf, ntowrite_lo)) <= 0)
        {
            return LTE_FALSE;
        }
        *pnwritten += n;
    }

    return LTE_TRUE;
}



extern "C" int lte_vsnprintf(char* buf, lte_size_t max_count, const char* fmt, va_list arg_list)
{
#if defined(__LTE_MSVC__)
    int len = (buf && max_count) ? vsnprintf(buf, max_count, fmt, arg_list) : -1;

    if(len < 0)
    {
        std::vector<char> dbuf(max_count, 0);
        do 
        {
            dbuf.resize(dbuf.size() * 2);
            len = vsnprintf(&dbuf[0], dbuf.size(), fmt, arg_list);
        } while(len < 0);
    }
    return len;
#else
    return vsnprintf(buf, max_count, fmt, arg_list);
#endif
}

extern "C" int lte_snprintf(char* buf, lte_size_t max_count, const char* fmt, ...)
{
    va_list args;
    int len;
    va_start(args, fmt);
    len = lte_vsnprintf(buf, max_count, fmt, args);
    va_end(args);
    return len;
}

extern "C" int lte_fprintf(lte_hfile_t hfile, const char *fmt, ... )
{
    int res; 
    va_list args;
    va_start(args, fmt);
    res = vfprintf(hfile, fmt, args);
    va_end(args);
    return res;
}

void lte_format_string_va(std::string& s, const char *fmt, va_list arg_list)
{
    if(!fmt)
    {
        s = "";
    }
    else
    {
#if defined(__LTE_MSVC__)
        char sbuf[256];
        int len = vsnprintf(sbuf, sizeof(sbuf), fmt, arg_list);
        if(len == -1)
        {
            std::vector<char> dbuf;
            while(len == -1)
            {
                dbuf.resize(dbuf.size() * 2);
                len = vsnprintf(&dbuf[0], dbuf.size(), fmt, arg_list);
            }
            s = &dbuf[0];
        }
        else
        {
            s = sbuf;
        }
#else
        char sbuf[256];
        int len = vsnprintf(sbuf, sizeof(sbuf), fmt, arg_list);
        if(len >= (int)sizeof(sbuf))
        {
            std::vector<char> dbuf;
            dbuf.resize(len + 1);
            vsnprintf(&dbuf[0], dbuf.size(), fmt, arg_list);
            s = &dbuf[0];
        }
        else
        {
            s = sbuf;
        }
#endif
    }
}

void lte_format_string(std::string& s, const char *fmt, ...)
{
    va_list args;
    va_start(args, fmt);
    lte_format_string_va(s, fmt, args);
    va_end(args);
}

static std::string& lte_addr2str(std::string& s, lte_addr_t addr, const char* fmt1, const char* fmt2)
{
#if defined(__LTE_ADDR32__)
    lte_format_string(s, fmt1, addr);
#else
    lte_addr32_t addrhi = HIDWORD(addr);
    lte_addr32_t addrlo = LODWORD(addr);
    if(addrhi)
    {
       lte_format_string(s, fmt2, addrhi, addrlo);
    }
    else
    {
       lte_format_string(s, fmt1, addrlo);
    }
#endif
    return s;
}

std::string& lte_addr2str(std::string& s, lte_addr_t addr)
{
    return lte_addr2str(s, addr, "%x", "%x%08x");
}

std::string& lte_addr2STR(std::string& s, lte_addr_t addr)
{
    return lte_addr2str(s, addr, "%X", "%X%08X");
}

std::string& lte_addr2str_fix(std::string& s, lte_addr_t addr)
{
    return lte_addr2str(s, addr, "%08x", "%08x%08x");
}

std::string& lte_addr2STR_fix(std::string& s, lte_addr_t addr)
{
    return lte_addr2str(s, addr, "%08X", "%08X%08X");
}
