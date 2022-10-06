/*BEGIN_LEGAL 
BSD License 

Copyright (c)2019 Intel Corporation. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
END_LEGAL */
#ifndef LTE_LC_H
#define LTE_LC_H

#include <stdint.h>
#include <unistd.h>
#include <fcntl.h>
#include <signal.h>
#include <sys/ioctl.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/mman.h>
#include <linux/perf_event.h>
#ifdef PINCRT
//#include "__sigset_t.h"
#endif

#ifdef __cplusplus
extern "C" {
#endif

typedef sigset_t lte_sigset_t;

#ifndef  __sigmask
/* Return a mask that includes the bit for SIG only.  */
# define __sigmask(sig) \
  (((unsigned long int) 1) << (((sig) - 1) % (8 * sizeof (unsigned long int))))
#endif

#ifndef  __sigword
/* Return the word index for SIG.  */
# define __sigword(sig) (((sig) - 1) / (8 * sizeof (unsigned long int)))
#endif


#ifdef PINCRT
#  define lte_sigaddset(set, signum) sigaddset(set, signum)
#  define lte_sigdelset(set, signum) sigdelset(set, signum)
#  define lte_sigismember(set, signum) sigismember(set, signum)

#  define lte_sigemptyset(set) \
     sigemptyset(set)

#  define lte_sigfillset(set) \
     sigemptyset(set)
#else
#ifndef  __sigemptyset
#  define __sigemptyset(set) \
  (__extension__ ({ int __cnt = _SIGSET_NWORDS;             \
        sigset_t *__set = (set);              \
        while (--__cnt >= 0) __set->__val[__cnt] = 0;       \
        0; }))
#endif
#ifndef  __sigfillset
#  define __sigfillset(set) \
  (__extension__ ({ int __cnt = _SIGSET_NWORDS;             \
        sigset_t *__set = (set);              \
        while (--__cnt >= 0) __set->__val[__cnt] = ~0UL;        \
        0; }))
#endif



#if defined(__sigword) && defined(__sigmask)
#  define lte_sigaddset(set, signum) \
     (__extension__ ({(set)->__val[__sigword(signum)] |= __sigmask(signum); 0;}))
#  define lte_sigdelset(set, signum) \
     (__extension__ ({(set)->__val[__sigword(signum)] &= ~__sigmask(signum); 0;}))
#  define lte_sigismember(set, signum) \
     ((set)->__val[__sigword(signum)] & __sigmask(signum))
#else
#  error "__sigword/__sigmask are not defined"
#endif

#ifdef __sigemptyset
#  define lte_sigemptyset(set) \
     __sigemptyset(set)
#else
#  error "__sigemptyset is not defined"
#endif

#ifdef __sigfillset
#  define lte_sigfillset(set) \
     __sigemptyset(set)
#else
#  error "__sigfillset is not defined"
#endif
#endif // ifdef PINCRT


pid_t lte_getpid(void);
pid_t lte_gettid(void);

int lte_open(const char *pathname, int flags, mode_t mode);
int lte_close(int fd);

ssize_t lte_read(int fd, void *buf, size_t count);
ssize_t lte_write(int fd, const void *buf, size_t count);

int lte_fsync(int fd);

void lte_exit(int status);
void lte_exit_group(int status);
int lte_atexit(void (*fn)(void));

int lte_fcntl(int fd, int cmd, ...);
int lte_ioctl(int fd, unsigned long request, ...);

int lte_perf_event_open(struct perf_event_attr *attr, pid_t pid, int cpu, int group_fd, unsigned long flags);

int lte_sigaction(int signum, const struct sigaction *act, struct sigaction *oldact);
int lte_sigaltstack(const stack_t *ss, stack_t *old_ss);

void* lte_mmap(void *addr, size_t length, int prot, int flags, int fd, off_t offset);
int lte_munmap(void *addr, size_t length);

void* lte_alloc(size_t length);
void lte_free(void *p);

int lte_waitid(idtype_t idtype, id_t id, siginfo_t *infop, int options);
pid_t lte_wait4(pid_t pid, int *status, int options, struct rusage *rusage);
static __inline__
pid_t lte_waitpid(pid_t pid, int *status, int options) { return lte_wait4(pid, status, options, NULL); }

void lte_xiprintfe(int fd,  uint64_t v, char endl);
void lte_diprintfe(int fd,  uint64_t v, char endl);
void lte_iprintfe(int fd,  uint64_t v, int radix, char endl);
void lte_xiprintf(int fd,  uint64_t v);
void lte_diprintf(int fd,  uint64_t v);
void lte_iprintf(int fd,  uint64_t v, int radix);
int lte_puts(int fd, const char* s);
int lte_putc(int fd, char c);

uint64_t lte_syscall(uint64_t nr_syscall, uint64_t arg0, uint64_t arg1, uint64_t arg2, uint64_t arg3, uint64_t arg4, uint64_t arg5);

void* lte_memset(void* ptr, int value, size_t size);
void* lte_memcpy(void* dst, const void* src, size_t size);
int lte_strcmp(const char* s1, const char* s2);
size_t lte_strlen(const char* s);

#ifdef __cplusplus
}
#endif

#endif //LTE_LC_H
