/*BEGIN_LEGAL 
BSD License 

Copyright (c)2019 Intel Corporation. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
END_LEGAL */
#ifndef _LTE_UTILS_H_
#define _LTE_UTILS_H_

#include "lte_types.h"
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdarg.h>
#include <string.h>
#include <unistd.h>
#include <paths.h>

#ifndef __cplusplus
  #define __LTE_NO_EXCEPTIONS__
#endif

#ifdef __LTE_NO_EXCEPTIONS__
  #define LTE_TRY_BEGIN    {
  #define LTE_CATCH(x)     } if(0) {
  #define LTE_CATCH_ALL    } if(0) {
  #define LTE_TRY_END      }
  #define LTE_RAISE(x)
  #define LTE_RERAISE
#else /*__LTE_NO_EXCEPTIONS__*/
  #define LTE_TRY_BEGIN    try {
  #define LTE_CATCH(x)     } catch (x) {
  #define LTE_CATCH_ALL    } catch (...) {
  #define LTE_TRY_END      }
  #define LTE_RAISE(x)     throw x
  #define LTE_RERAISE      throw
#endif /*__LTE_NO_EXCEPTIONS__*/

#ifdef NDEBUG
  #define LTE_TRY(op, msg) \
    LTE_TRY_BEGIN \
      op; \
    LTE_CATCH_ALL \
    LTE_ERRX("%s", msg); \
    LTE_TRY_END
#else
  #define LTE_TRY(op, msg) \
    LTE_TRY_BEGIN \
      op; \
    LTE_CATCH_ALL \
    LTE_ERRX("%s (%d): %s", __FILE__, __LINE__, msg); \
    LTE_TRY_END
#endif

#ifdef __cplusplus
extern "C" {
#endif

#ifdef NDEBUG
#define LTE_ASSERT(x)  ((void)(0))
#define LTE_TRACE(...) ((void)(0))
#else
#define LTE_ASSERT(x)  \
    ((!(x))?lte_assert(#x, 0, __FILE__, __LINE__),((void)(0)):((void)(0)))
#define LTE_TRACE(...) \
    do{lte_trace(__FILE__, __LINE__, __VA_ARGS__);}while(0)
#endif

#define LTE_DOWNCVT(type, v) \
    (LTE_ASSERT((v)==(type)(v)),((type)(v)))

#define LTE_ERRAX(x, ...)  do { if((x)) lte_errx(-1, __VA_ARGS__); } while(0)
#define LTE_ERRX(...)      lte_errx(-1, __VA_ARGS__)
#define LTE_WARN(...)      lte_warn_msg(__VA_ARGS__)

void lte_assert(const char* expr, const char* msg, const char* file, int line);
void lte_errx(int err, const char* fmt, ...);
void lte_err_msg(const char* fmt, ...);
void lte_verr_msg(const char* fmt, va_list va);
void lte_warn_msg(const char* fmt, ...);
void lte_vwarn_msg(const char* fmt, va_list va);
void lte_trace(const char* file, int line, const char* fmt, ...);

#ifdef __cplusplus
}
#endif

#ifdef __cplusplus
#include <string>
#include <regex>

#include <sys/types.h>
#include <dirent.h>

static inline bool lte_dir_exists(const char* name)
{
   DIR* d = opendir(name);
   closedir(d);
   return (d != nullptr);
}

class mktemp_template {
   protected:
      std::string m_path;

   public:
      mktemp_template(const char* temp_base = nullptr, const char* temp_path = nullptr)
      {
         temp_path = temp_path ? temp_path : _PATH_TMP;
         temp_base = temp_base ? temp_base : "XXXXXX";
         std::regex e("/+");
         m_path = std::regex_replace(std::string(temp_path) + "/" + std::string(temp_base), e, "/");
      }
      const std::string& str() const { return m_path; }
      operator const std::string& () const { return m_path; }
};

class mktemp_tempfile {
   protected:
      std::string m_fname;

   public:
      mktemp_tempfile() = default;
      mktemp_tempfile(const std::string& tmpl) { create(tmpl); }
      ~mktemp_tempfile() { clear(); }

      const char* create(const std::string& tmpl)
      {
         if(m_fname.empty())
         {
            std::unique_ptr<char[]> fname = std::make_unique<char[]>(tmpl.length() + 1);
            memcpy(fname.get(), tmpl.c_str(), tmpl.size() + 1) ;

            int fd = mkstemp(fname.get());
            if(fd != -1)
            {
               close(fd);
               m_fname = fname.get();
               return m_fname.c_str();
            }
         }
         return nullptr;
      }
      void clear()
      {
         if(!m_fname.empty())
         {
            unlink(m_fname.c_str());
            m_fname = std::string();
         }
      }

      const std::string& name() const { return m_fname; }
      operator const std::string& () const { return m_fname; }
};

#endif

#endif /*_LTE_UTILS_H_*/
