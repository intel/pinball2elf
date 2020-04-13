/*BEGIN_LEGAL 
BSD License 

Copyright (c)2019 Intel Corporation. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
END_LEGAL */
#ifndef _LTE_DEFS_H_
#define _LTE_DEFS_H_

#include <stddef.h>


#ifdef __cplusplus
#define LTE_RCAST(type, v) reinterpret_cast<type>(v)
#define LTE_SCAST(type, v) static_cast<type>(v)
#define LTE_CCAST(type, v) const_cast<type>(v)
#else
#define LTE_RCAST(type, v) ((type)(v))
#define LTE_SCAST(type, v) ((type)(v))
#define LTE_CCAST(type, v) ((type)(v))
#endif /* __cplusplus */

#ifdef __cplusplus
extern "C" {
#endif

#if (defined(__LP64__) || defined(__LP64) || \
     defined(_M_X64) || defined(_WIN64))
  #define __LTE_LP64__
#else
  #define __LTE_LP32__
#endif

#if defined(__linux__)
  #define __LTE_LINUX__
  #if defined(__LTE_LP64__)
    #define __LTE_LINUX64__
  #else
    #define __LTE_LINUX32__
  #endif
#else
  #error "Unsupported platform"
#endif

#if defined(_MSC_VER)
  #define __LTE_MSVC__
#elif defined(__GNUC__)
  #define __LTE_GNUC__
#endif

#if defined(__LTE_LINUX__)
  #define __LTE_DECL
  #define __LTE_INLINE           __inline
  #define __LTE_ATTR_PACKED      __attribute__((packed))
  #define __LTE_ATTR_ALIGNED(n)  __attribute__((aligned(n)))
  #define __lte_packed           __LTE_ATTR_PACKED
  #define __lte_aligned(n)       __LTE_ATTR_ALIGNED(n)
#else
  #error "Unsupported platform"
#endif

#if defined(__LTE_BIGENDIAN__)
  #define HIBYTE(v)        ((lte_uint8_t)(lte_uint16_t)(v))
  #define LOBYTE(v)        ((lte_uint8_t)(((lte_uint16_t)(v))>>8))
  #define HIWORD(v)        ((lte_uint16_t)(lte_uint32_t)(v))
  #define LOWORD(v)        ((lte_uint16_t)(((lte_uint32_t)(v))>>16))
  #define HIDWORD(qw)      ((lte_uint32_t)(lte_uint64_t)(qw))
  #define LODWORD(qw)      ((lte_uint32_t)(((lte_uint64_t)(qw))>>32))
  #define MKQWORD(hi, lo)  ((((lte_uint64_t)(lo))<<32)|((lte_uint32_t)(hi)))
  #define QWSETLODW(qw, v) MKQWORD(HIDWORD(qw), v)
  #define QWSETHIDW(qw, v) MKQWORD(v, LODWORD(qw))
#else
  #define HIBYTE(v)        ((lte_uint8_t)(((lte_uint16_t)(v))>>8))
  #define LOBYTE(v)        ((lte_uint8_t)(lte_uint16_t)(v))
  #define HIWORD(v)        ((lte_uint16_t)(((lte_uint32_t)(v))>>16))
  #define LOWORD(v)        ((lte_uint16_t)(lte_uint32_t)(v))
  #define HIDWORD(qw)      ((lte_uint32_t)(((lte_uint64_t)(qw))>>32))
  #define LODWORD(qw)      ((lte_uint32_t)(lte_uint64_t)(qw))
  #define MKQWORD(hi, lo)  ((((lte_uint64_t)(hi))<<32)|((lte_uint32_t)(lo)))
  #define QWSETLODW(qw, v) MKQWORD(HIDWORD(qw), v)
  #define QWSETHIDW(qw, v) MKQWORD(v, LODWORD(qw))
#endif

#define LTE_PTR2OFFS(p)      (LTE_RCAST(char*,p)-LTE_RCAST(char*,0))
#define LTE_OFFS2PTR(o)      (LTE_RCAST(char*,0)+(o))
#define LTE_PTRDIFF(p1, p2)  (LTE_RCAST(char*,p1)-LTE_RCAST(char*,p2))

#define LTE_FIELDOFFS(type, item) LTE_PTR2OFFS(&((type*)0)->item)

/* number of elements in static array */
#define LTE_ARRAY_SIZE(v) (sizeof(v)/sizeof(*(v)))
/* pointer to element after last element of static array */
#define LTE_ARRAY_END(v)  ((v)+LTE_ARRAY_SIZE(v))
/* pointer to last element of static array */
#define LTE_ARRAY_LAST(v) (LTE_ARRAY_END(v)-1)

#ifdef __cplusplus
}
#endif

#endif /*_LTE_DEFS_H_*/
