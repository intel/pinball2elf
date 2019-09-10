/*BEGIN_LEGAL 
BSD License 

Copyright (c)2019 Intel Corporation. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
END_LEGAL */
#ifndef _LTE_PORTABILITY_H_
#define _LTE_PORTABILITY_H_

#ifndef _LARGEFILE64_SOURCE
#define _LARGEFILE64_SOURCE 1
#endif

#include "lte_types.h"
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sstream>

#define __STDC_FORMAT_MACROS
#include <inttypes.h>

#if defined(__LTE_LINUX__)
  #include <unistd.h>
  #define LTE_O_RDONLY O_RDONLY
  #define LTE_O_BINARY 0
  #define LTE_O_CREAT  O_CREAT
  #define LTE_O_WRONLY O_WRONLY
  #define LTE_O_TRUNC  O_TRUNC

  typedef struct stat  lte_stat_t;

#endif

#ifdef __cplusplus
extern "C" {
#endif

int lte_vsnprintf(char* buf, lte_size_t max_count, const char* fmt, va_list arg_list);
int lte_snprintf(char* buf, lte_size_t max_count, const char* fmt, ...);

typedef FILE*        lte_hfile_t;
typedef int          lte_fd_t;

static __LTE_INLINE
lte_fd_t __LTE_DECL lte_open(const char * filename, lte_int_t oflags, int mode)
{
    return open(filename, oflags, mode);
}

static __LTE_INLINE
lte_int_t __LTE_DECL lte_read(lte_fd_t fd, void* buf, lte_uint_t maxcnt)
{
    return read(fd, buf, maxcnt);
}

static __LTE_INLINE
lte_int_t __LTE_DECL lte_write(lte_fd_t fd, const void* buf, lte_uint_t maxcnt)
{
    return write(fd, buf, maxcnt);
}

static __LTE_INLINE
lte_int_t __LTE_DECL lte_close(lte_fd_t fd)
{
    return close(fd);
}

static __LTE_INLINE
lte_int_t __LTE_DECL lte_fstat(lte_fd_t fd, lte_stat_t *buf)
{
    return fstat(fd, buf);
}

static __LTE_INLINE
lte_hfile_t __LTE_DECL lte_fopen(const char* file, const char* mode)
{
    return fopen(file, mode);
}

static __LTE_INLINE
lte_int_t __LTE_DECL lte_fclose(lte_hfile_t hfile)
{
    return fclose(hfile);
}

static __LTE_INLINE
char* __LTE_DECL lte_fgets(char* str, lte_int_t n, lte_hfile_t hfile)
{
    return fgets(str, n, hfile);
}

static __LTE_INLINE
int __LTE_DECL lte_vfprintf(lte_hfile_t hfile, const char* fmt, va_list arg_list)
{
    return vfprintf(hfile, fmt, arg_list);
}

int __LTE_DECL lte_fprintf(lte_hfile_t hfile, const char* fmt, ...);

lte_bool_t __LTE_DECL lte_preadq(lte_fd_t fd, void* buf, lte_size64_t ntoread, lte_size64_t* pnread = NULL);

lte_bool_t __LTE_DECL lte_pwriteq(lte_fd_t fd, const void* buf, lte_size64_t ntowrite, lte_size64_t* pnwritten = NULL);

lte_bool_t __LTE_DECL lte_pread(lte_fd_t fd, void* buf, lte_size_t ntoread, lte_size_t* pnread = NULL);

lte_bool_t __LTE_DECL lte_pwrite(lte_fd_t fd, const void* buf, lte_size_t ntowrite, lte_size_t* pnwritten = NULL);

static __LTE_INLINE
lte_uint32_t __LTE_DECL lte_strtoul(const char* str, char** end, int radix)
{
    return strtoul(str, end, radix);
}

static __LTE_INLINE
lte_uint64_t __LTE_DECL lte_strtoull(const char* str, char** end, int radix)
{
    return strtoull(str, end, radix);
}

#if defined(__LTE_LINUX__)
static __LTE_INLINE
int __LTE_DECL lte_stricmp(const char* s1, const char* s2)
{
    return strcasecmp(s1, s2);
}
static __LTE_INLINE
int __LTE_DECL lte_strnicmp(const char* s1, const char* s2, lte_size_t n)
{
    return strncasecmp(s1, s2, n);
}
#else
static __LTE_INLINE
int __LTE_DECL lte_stricmp(const char* s1, const char* s2)
{
    return stricmp(s1, s2);
}
static __LTE_INLINE
int __LTE_DECL lte_strnicmp(const char* s1, const char* s2, lte_size_t n)
{
    return strnicmp(s1, s2, n);
}
#endif
static __LTE_INLINE
lte_size_t __LTE_DECL lte_strlen(const char* s)
{
    return strlen(s);
}

static __LTE_INLINE
char* __LTE_DECL lte_strchr(char* str, int c)
{
    return strchr(str, c);
}

static __LTE_INLINE
char*  __LTE_DECL lte_strncpy(char* destination, const char* source, lte_size_t n)
{
    return strncpy(destination, source, n);
}


#ifdef __cplusplus
}
#endif

#ifdef __cplusplus

template<class T>
inline T __lte_offset(T v, lte_size_t align) { return v & (((T)0)+(align-1)) ; }

template<class T>
inline lte_size_t __lte_offset(T* v, lte_size_t align) { return LTE_PTR2OFFS(v) & (align-1); }

template<class T>
inline T __lte_align(T v, lte_size_t align) { return v & ~LTE_PTR2OFFS(LTE_OFFS2PTR(align-1)); }

template<class T>
inline T* __lte_align(T* v, lte_size_t align) { return LTE_OFFS2PTR(__lte_align(LTE_PTR2OFFS(v), align)); }

template<class T>
inline T __lte_align_up(T v, lte_size_t align) { return (v+(align-1)) & ~LTE_PTR2OFFS(LTE_OFFS2PTR(align-1)); }

template<class T>
inline T* __lte_align_up(T* v, lte_size_t align) { return LTE_OFFS2PTR(__lte_align_up(LTE_PTR2OFFS(v), align)); }

#include <string>

void lte_format_string_va(std::string& s, const char *fmt, va_list arg_list);

void lte_format_string(std::string& s, const char *fmt, ...);

std::string& lte_addr2str(std::string& s, lte_addr_t addr);

std::string& lte_addr2STR(std::string& s, lte_addr_t addr);

std::string& lte_addr2str_fix(std::string& s, lte_addr_t addr);

std::string& lte_addr2STR_fix(std::string& s, lte_addr_t addr);

static __LTE_INLINE const char* lte_addr2cstr(std::string& s, lte_addr_t addr)
{
    return lte_addr2str(s, addr).c_str();
}

static __LTE_INLINE const char* lte_addr2CSTR(std::string& s, lte_addr_t addr)
{
    return lte_addr2STR(s, addr).c_str();
}

static __LTE_INLINE const char* lte_addr2cstr_fix(std::string& s, lte_addr_t addr)
{
    return lte_addr2str_fix(s, addr).c_str();
}

static __LTE_INLINE const char* lte_addr2CSTR_fix(std::string& s, lte_addr_t addr)
{
    return lte_addr2STR_fix(s, addr).c_str();
}

#endif

#endif /*_LTE_PORTABILITY_H_*/
