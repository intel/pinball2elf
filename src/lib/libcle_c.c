/*BEGIN_LEGAL 
BSD License 

Copyright (c)2019 Intel Corporation. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
END_LEGAL */
#include <lte_lc.h>
#include <limits.h>
#include <unistd.h>

#ifndef __ASSEMBLY__
# define __ASSEMBLY__
# define __lte_assembly_defined__
#endif
#include <asm/signal.h>
#ifdef __lte_assembly_defined__
# undef __ASSEMBLY__
#endif

void __lte_restore_rt(void);
asm(".text\n" ".align 16\n"
    "__lte_restore_rt:"
    "movq $15, %rax\n" "syscall\n");

int lte_sigaction(int signum, const struct sigaction* act, struct sigaction* oact)
{
   // Hacky implementation of sigaction.
   struct lte_k_sigaction
   {
      #ifdef __USE_POSIX199309
      union
      {
         void (*k_sa_handler)(int);
         void (*k_sa_sigaction)(int, siginfo_t*, void*);
      };
      #else
      void (*k_sa_handler)(int);
      #endif
      int k_sa_flags;
      #ifdef SA_RESTORER
      void (*k_sa_restorer)(void);
      #endif
      sigset_t k_sa_mask;
   };

   struct lte_k_sigaction ksa, oksa;
   struct lte_k_sigaction* kact = NULL;
   struct lte_k_sigaction* koact = oact ? &oksa : NULL;
   int r;

   if(act)
   {
      kact = &ksa;
      kact->k_sa_handler = act->sa_handler;
      #ifdef __USE_POSIX199309
      kact->k_sa_sigaction = act->sa_sigaction;
      #endif
      kact->k_sa_flags = act->sa_flags;
      #ifdef SA_RESTORER
      kact->k_sa_flags |= SA_RESTORER;
      kact->k_sa_restorer = &__lte_restore_rt;
      #endif
      lte_memcpy(&kact->k_sa_mask, &act->sa_mask, sizeof(kact->k_sa_mask));
   }

   extern int lte_rt_sigaction(int, const struct lte_k_sigaction*, struct lte_k_sigaction*, size_t);
   r = lte_rt_sigaction(signum, kact, koact, _NSIG/8);
   if(oact && r >= 0)
   {
      oact->sa_handler = koact->k_sa_handler;
      #ifdef __USE_POSIX199309
      oact->sa_sigaction = koact->k_sa_sigaction;
      #endif
      oact->sa_flags = koact->k_sa_flags;
      #ifdef SA_RESTORER
      oact->sa_restorer = koact->k_sa_restorer;
      #endif
      lte_memcpy(&oact->sa_mask, &koact->k_sa_mask, sizeof(kact->k_sa_mask));
   }
   return r;
}

#ifndef ATEXIT_MAX
#  ifdef _SC_ATEXIT_MAX
#    define ATEXIT_MAX _SC_ATEXIT_MAX
#  else
#    define ATEXIT_MAX 256
#  endif
#endif

typedef void (*exit_callback_fn)(void);
static exit_callback_fn  exit_callbacks[ATEXIT_MAX];
static exit_callback_fn* exit_callbacks_end = exit_callbacks;

int lte_atexit(void (*fn)(void))
{
   if(fn)
   {
      exit_callback_fn* current_callback;
      exit_callback_fn* next_callback;
      do
      {
         current_callback = exit_callbacks_end;
         next_callback = current_callback + 1;
         if(current_callback == &exit_callbacks[ATEXIT_MAX])
            return -1;
      }
      while(!__sync_bool_compare_and_swap(&exit_callbacks_end, current_callback, next_callback));
      current_callback[0] = fn;
   }
   return 0;
}

extern void lte_sys_exit(int status);

void lte_exit(int status)
{
   if (!exit_callbacks_end) {
      exit_callbacks_end = exit_callbacks;
   }
   exit_callback_fn* callback = __sync_lock_test_and_set(&exit_callbacks_end, &exit_callbacks[0]);
   while(callback != &exit_callbacks[0])
      (*--callback)();
   lte_sys_exit(status);
}

void* lte_alloc(size_t size)
{
   size =+ sizeof(size_t);
   size_t* p = (size_t*)lte_mmap(0, size, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0);
   if(p)
      *p++ = size;
   return p;
}

void lte_free(void *p)
{
   if(p)
   {
      size_t* mem = ((size_t*)p) - 1;
      lte_munmap(mem, *mem);
   }
}

void* lte_memset(void* ptr, int value, size_t size)
{
   size_t i;
   for(i = 0; i < size; ++i)
      ((char*)ptr)[i] = (char)value;
   return ptr;
}

void* lte_memcpy(void* dst, const void* src, size_t size)
{
   size_t i;
   for(i = 0; i < size; ++i)
      ((char*)dst)[i] = ((const char*)src)[i];
   return dst;
}
