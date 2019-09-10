/*BEGIN_LEGAL 
BSD License 

Copyright (c)2019 Intel Corporation. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
END_LEGAL */
#include "lte_utils.h"
#include <stdarg.h>
#include <stdlib.h>
#include <stdio.h>

static char error_title[] = "ERROR: ";
static char assert_title[] = "ASSERT: ";
static char warning_title[] = "WARNING: ";

static void lte_vprint_errmsg(const char* title, const char* fmt, va_list va)
{
    if(title != NULL)
        fprintf(stderr, "%s", title);
    vfprintf(stderr, fmt, va);
    fprintf(stderr, "\n");
}

extern "C" void lte_verr_msg(const char* fmt, va_list va)
{
    lte_vprint_errmsg(error_title, fmt, va);
}

extern "C" void lte_err_msg(const char* fmt, ...)
{
    va_list va;
    va_start(va, fmt);
    lte_vprint_errmsg(error_title, fmt, va);
    va_end(va);
}

extern "C" void lte_vwarn_msg(const char* fmt, va_list va)
{
    lte_vprint_errmsg(warning_title, fmt, va);
}

extern "C" void lte_warn_msg(const char* fmt, ...)
{
    va_list va;
    va_start(va, fmt);
    lte_vprint_errmsg(warning_title, fmt, va);
    va_end(va);
}

extern "C" void lte_assert_title(const char* fmt, ...)
{
    va_list va;
    va_start(va, fmt);
    lte_vprint_errmsg(assert_title, fmt, va);
    va_end(va);
}

extern "C" void lte_assert(const char* expr, const char* msg, const char* file, int line)
{
    lte_assert_title(expr);
    if(msg != NULL)
        fprintf(stderr, "%s\n", msg);
    fprintf(stderr," at %s:%d\n", file, line);
    exit(1);
}

extern "C" void lte_errx(int err, const char* fmt, ...)
{
    va_list va;
    va_start(va, fmt);
    if(fmt)
       lte_vprint_errmsg(error_title, fmt, va);
    va_end(va);
    exit(err);
}

extern "C" void lte_trace(const char* file, int line, const char* fmt, ...)
{
    va_list va;
    if(fmt != NULL)
    {
        fprintf(stderr,"%s, %d:", file, line);
    }
    va_start(va, fmt);
    vfprintf(stderr, fmt, va);
    va_end(va);
}
