/*BEGIN_LEGAL 
BSD License 

Copyright (c)2019 Intel Corporation. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
END_LEGAL */
#ifndef _LTE_TYPES_H_
#define _LTE_TYPES_H_

#include "lte_defs.h"

#ifdef __cplusplus
extern "C" {
#endif

typedef char               lte_char_t;
typedef unsigned char      lte_uchar_t;
typedef short              lte_short_t;
typedef unsigned short     lte_ushort_t;
typedef int                lte_int_t;
typedef unsigned int       lte_uint_t;
typedef long               lte_long_t;
typedef unsigned long      lte_ulong_t;
typedef long long          lte_llong_t;
typedef unsigned long long lte_ullong_t;

typedef bool               lte_bool_t;
#define LTE_TRUE           true
#define LTE_FALSE          false

#if ((defined(__STDC_VERSION__)) && (__STDC_VERSION__ >= 199901L)) || \
     (defined(__LTE_GNUC__))

#include <stdint.h>

#elif (defined(__LTE_MSVC__) && defined(__LTE_WIN32__))

typedef __int8             int8_t;
typedef unsigned __int8    uint8_t;
typedef __int16            int16_t;
typedef unsigned __int16   uint16_t;
typedef __int32            int32_t;
typedef unsigned __int32   uint32_t;
typedef __int64            int64_t;
typedef unsigned __int64   uint64_t;

#else

typedef lte_char_t         int8_t;
typedef lte_uchar_t        uint8_t;
typedef lte_short_t        int16_t;
typedef lte_ushort_t       uint16_t;
typedef lte_int_t          int32_t;
typedef lte_uint_t         uint32_t;
typedef lte_llong_t        int64_t;
typedef lte_ullong_t       uint64_t;

#endif

#include <sys/types.h>

typedef int8_t             lte_int8_t;
typedef uint8_t            lte_uint8_t;
typedef int16_t            lte_int16_t;
typedef uint16_t           lte_uint16_t;
typedef int32_t            lte_int32_t;
typedef uint32_t           lte_uint32_t;
typedef int64_t            lte_int64_t;
typedef uint64_t           lte_uint64_t;

typedef lte_uint32_t       lte_addr32_t;
typedef lte_uint64_t       lte_addr64_t;

typedef lte_uint32_t       lte_size32_t;
typedef lte_uint64_t       lte_size64_t;
typedef size_t             lte_size_t;
#if defined(__LTE_LINUX64__)
typedef ssize_t            lte_ssize_t;
#elif defined(__LTE_WIN64__)
typedef lte_int64_t        lte_ssize_t;
#else
typedef lte_int_t          lte_ssize_t;
#endif

typedef lte_addr64_t       lte_addr_t;

#define LTE_ALLONES(type)  (((type)0)-((type)1))

#define LTE_MAX_SIZE32     LTE_ALLONES(lte_size32_t)
#define LTE_MAX_SIZE64     LTE_ALLONES(lte_size64_t)
#define LTE_MAX_SIZE       LTE_ALLONES(lte_size_t)
#define LTE_MAX_ADDR       LTE_ALLONES(lte_addr_t)
#define LTE_MAX_ADDR32     LTE_ALLONES(lte_addr32_t)
#define LTE_MAX_ADDR64     LTE_ALLONES(lte_addr64_t)
#define LTE_UINT_MAX       LTE_ALLONES(lte_uint_t)

#define LTE_MAXVAL(type)   LTE_ALLONES(type)

#define LTE_MAXTHREADS   10000 // Max 10 thousand threads supported

#ifdef __cplusplus
}
#endif

#endif /*_LTE_TYPES_H_*/
