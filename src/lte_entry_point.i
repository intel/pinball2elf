# 1 "lte_entry_point.cpp"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "lte_entry_point.cpp"
# 1 "lte_entry_point.h" 1
# 14 "lte_entry_point.h"
# 1 "lte_x86_state.h" 1



# 1 "lte_x86_xstate.h" 1



# 1 "lte_x86.h" 1



# 1 "lte_x86_gpr.h" 1
# 14 "lte_x86_gpr.h"
# 1 "lte_types.h" 1
# 14 "lte_types.h"
# 1 "lte_defs.h" 1
# 14 "lte_defs.h"
# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/lib64/gcc/x86_64-suse-linux/4.9.2/include/stddef.h" 1 3 4
# 147 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/lib64/gcc/x86_64-suse-linux/4.9.2/include/stddef.h" 3 4
typedef long int ptrdiff_t;
# 212 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/lib64/gcc/x86_64-suse-linux/4.9.2/include/stddef.h" 3 4
typedef long unsigned int size_t;
# 15 "lte_defs.h" 2
# 28 "lte_defs.h"
extern "C" {
# 109 "lte_defs.h"
}
# 15 "lte_types.h" 2


extern "C" {


typedef char lte_char_t;
typedef unsigned char lte_uchar_t;
typedef short lte_short_t;
typedef unsigned short lte_ushort_t;
typedef int lte_int_t;
typedef unsigned int lte_uint_t;
typedef long lte_long_t;
typedef unsigned long lte_ulong_t;
typedef long long lte_llong_t;
typedef unsigned long long lte_ullong_t;

typedef bool lte_bool_t;






# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/lib64/gcc/x86_64-suse-linux/4.9.2/include/stdint.h" 1 3 4
# 9 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/lib64/gcc/x86_64-suse-linux/4.9.2/include/stdint.h" 3 4
# 1 "/usr/include/stdint.h" 1 3 4
# 26 "/usr/include/stdint.h" 3 4
# 1 "/usr/include/features.h" 1 3 4
# 347 "/usr/include/features.h" 3 4
# 1 "/usr/include/sys/cdefs.h" 1 3 4
# 353 "/usr/include/sys/cdefs.h" 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 354 "/usr/include/sys/cdefs.h" 2 3 4
# 348 "/usr/include/features.h" 2 3 4
# 371 "/usr/include/features.h" 3 4
# 1 "/usr/include/gnu/stubs.h" 1 3 4



# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 5 "/usr/include/gnu/stubs.h" 2 3 4




# 1 "/usr/include/gnu/stubs-64.h" 1 3 4
# 10 "/usr/include/gnu/stubs.h" 2 3 4
# 372 "/usr/include/features.h" 2 3 4
# 27 "/usr/include/stdint.h" 2 3 4
# 1 "/usr/include/bits/wchar.h" 1 3 4
# 28 "/usr/include/stdint.h" 2 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 29 "/usr/include/stdint.h" 2 3 4
# 37 "/usr/include/stdint.h" 3 4
typedef signed char int8_t;
typedef short int int16_t;
typedef int int32_t;

typedef long int int64_t;







typedef unsigned char uint8_t;
typedef unsigned short int uint16_t;

typedef unsigned int uint32_t;



typedef unsigned long int uint64_t;
# 66 "/usr/include/stdint.h" 3 4
typedef signed char int_least8_t;
typedef short int int_least16_t;
typedef int int_least32_t;

typedef long int int_least64_t;






typedef unsigned char uint_least8_t;
typedef unsigned short int uint_least16_t;
typedef unsigned int uint_least32_t;

typedef unsigned long int uint_least64_t;
# 91 "/usr/include/stdint.h" 3 4
typedef signed char int_fast8_t;

typedef long int int_fast16_t;
typedef long int int_fast32_t;
typedef long int int_fast64_t;
# 104 "/usr/include/stdint.h" 3 4
typedef unsigned char uint_fast8_t;

typedef unsigned long int uint_fast16_t;
typedef unsigned long int uint_fast32_t;
typedef unsigned long int uint_fast64_t;
# 120 "/usr/include/stdint.h" 3 4
typedef long int intptr_t;


typedef unsigned long int uintptr_t;
# 135 "/usr/include/stdint.h" 3 4
typedef long int intmax_t;
typedef unsigned long int uintmax_t;
# 10 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/lib64/gcc/x86_64-suse-linux/4.9.2/include/stdint.h" 2 3 4
# 39 "lte_types.h" 2
# 64 "lte_types.h"
# 1 "/usr/include/sys/types.h" 1 3 4
# 29 "/usr/include/sys/types.h" 3 4
extern "C" {

# 1 "/usr/include/bits/types.h" 1 3 4
# 28 "/usr/include/bits/types.h" 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 29 "/usr/include/bits/types.h" 2 3 4


typedef unsigned char __u_char;
typedef unsigned short int __u_short;
typedef unsigned int __u_int;
typedef unsigned long int __u_long;


typedef signed char __int8_t;
typedef unsigned char __uint8_t;
typedef signed short int __int16_t;
typedef unsigned short int __uint16_t;
typedef signed int __int32_t;
typedef unsigned int __uint32_t;

typedef signed long int __int64_t;
typedef unsigned long int __uint64_t;







typedef long int __quad_t;
typedef unsigned long int __u_quad_t;
# 131 "/usr/include/bits/types.h" 3 4
# 1 "/usr/include/bits/typesizes.h" 1 3 4
# 132 "/usr/include/bits/types.h" 2 3 4


typedef unsigned long int __dev_t;
typedef unsigned int __uid_t;
typedef unsigned int __gid_t;
typedef unsigned long int __ino_t;
typedef unsigned long int __ino64_t;
typedef unsigned int __mode_t;
typedef unsigned long int __nlink_t;
typedef long int __off_t;
typedef long int __off64_t;
typedef int __pid_t;
typedef struct { int __val[2]; } __fsid_t;
typedef long int __clock_t;
typedef unsigned long int __rlim_t;
typedef unsigned long int __rlim64_t;
typedef unsigned int __id_t;
typedef long int __time_t;
typedef unsigned int __useconds_t;
typedef long int __suseconds_t;

typedef int __daddr_t;
typedef long int __swblk_t;
typedef int __key_t;


typedef int __clockid_t;


typedef void * __timer_t;


typedef long int __blksize_t;




typedef long int __blkcnt_t;
typedef long int __blkcnt64_t;


typedef unsigned long int __fsblkcnt_t;
typedef unsigned long int __fsblkcnt64_t;


typedef unsigned long int __fsfilcnt_t;
typedef unsigned long int __fsfilcnt64_t;

typedef long int __ssize_t;



typedef __off64_t __loff_t;
typedef __quad_t *__qaddr_t;
typedef char *__caddr_t;


typedef long int __intptr_t;


typedef unsigned int __socklen_t;
# 32 "/usr/include/sys/types.h" 2 3 4



typedef __u_char u_char;
typedef __u_short u_short;
typedef __u_int u_int;
typedef __u_long u_long;
typedef __quad_t quad_t;
typedef __u_quad_t u_quad_t;
typedef __fsid_t fsid_t;




typedef __loff_t loff_t;



typedef __ino_t ino_t;






typedef __ino64_t ino64_t;




typedef __dev_t dev_t;




typedef __gid_t gid_t;




typedef __mode_t mode_t;




typedef __nlink_t nlink_t;




typedef __uid_t uid_t;





typedef __off_t off_t;






typedef __off64_t off64_t;




typedef __pid_t pid_t;




typedef __id_t id_t;




typedef __ssize_t ssize_t;





typedef __daddr_t daddr_t;
typedef __caddr_t caddr_t;





typedef __key_t key_t;
# 133 "/usr/include/sys/types.h" 3 4
# 1 "/usr/include/time.h" 1 3 4
# 58 "/usr/include/time.h" 3 4


typedef __clock_t clock_t;



# 74 "/usr/include/time.h" 3 4


typedef __time_t time_t;



# 92 "/usr/include/time.h" 3 4
typedef __clockid_t clockid_t;
# 104 "/usr/include/time.h" 3 4
typedef __timer_t timer_t;
# 134 "/usr/include/sys/types.h" 2 3 4



typedef __useconds_t useconds_t;



typedef __suseconds_t suseconds_t;





# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/lib64/gcc/x86_64-suse-linux/4.9.2/include/stddef.h" 1 3 4
# 148 "/usr/include/sys/types.h" 2 3 4



typedef unsigned long int ulong;
typedef unsigned short int ushort;
typedef unsigned int uint;
# 201 "/usr/include/sys/types.h" 3 4
typedef unsigned int u_int8_t __attribute__ ((__mode__ (__QI__)));
typedef unsigned int u_int16_t __attribute__ ((__mode__ (__HI__)));
typedef unsigned int u_int32_t __attribute__ ((__mode__ (__SI__)));
typedef unsigned int u_int64_t __attribute__ ((__mode__ (__DI__)));

typedef int register_t __attribute__ ((__mode__ (__word__)));
# 217 "/usr/include/sys/types.h" 3 4
# 1 "/usr/include/endian.h" 1 3 4
# 37 "/usr/include/endian.h" 3 4
# 1 "/usr/include/bits/endian.h" 1 3 4
# 38 "/usr/include/endian.h" 2 3 4
# 61 "/usr/include/endian.h" 3 4
# 1 "/usr/include/bits/byteswap.h" 1 3 4
# 28 "/usr/include/bits/byteswap.h" 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 29 "/usr/include/bits/byteswap.h" 2 3 4
# 62 "/usr/include/endian.h" 2 3 4
# 218 "/usr/include/sys/types.h" 2 3 4


# 1 "/usr/include/sys/select.h" 1 3 4
# 31 "/usr/include/sys/select.h" 3 4
# 1 "/usr/include/bits/select.h" 1 3 4
# 23 "/usr/include/bits/select.h" 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 24 "/usr/include/bits/select.h" 2 3 4
# 32 "/usr/include/sys/select.h" 2 3 4


# 1 "/usr/include/bits/sigset.h" 1 3 4
# 24 "/usr/include/bits/sigset.h" 3 4
typedef int __sig_atomic_t;




typedef struct
  {
    unsigned long int __val[(1024 / (8 * sizeof (unsigned long int)))];
  } __sigset_t;
# 35 "/usr/include/sys/select.h" 2 3 4



typedef __sigset_t sigset_t;





# 1 "/usr/include/time.h" 1 3 4
# 120 "/usr/include/time.h" 3 4
struct timespec
  {
    __time_t tv_sec;
    long int tv_nsec;
  };
# 45 "/usr/include/sys/select.h" 2 3 4

# 1 "/usr/include/bits/time.h" 1 3 4
# 69 "/usr/include/bits/time.h" 3 4
struct timeval
  {
    __time_t tv_sec;
    __suseconds_t tv_usec;
  };
# 47 "/usr/include/sys/select.h" 2 3 4
# 55 "/usr/include/sys/select.h" 3 4
typedef long int __fd_mask;
# 67 "/usr/include/sys/select.h" 3 4
typedef struct
  {



    __fd_mask fds_bits[1024 / (8 * (int) sizeof (__fd_mask))];





  } fd_set;






typedef __fd_mask fd_mask;
# 99 "/usr/include/sys/select.h" 3 4
extern "C" {
# 109 "/usr/include/sys/select.h" 3 4
extern int select (int __nfds, fd_set *__restrict __readfds,
     fd_set *__restrict __writefds,
     fd_set *__restrict __exceptfds,
     struct timeval *__restrict __timeout);
# 121 "/usr/include/sys/select.h" 3 4
extern int pselect (int __nfds, fd_set *__restrict __readfds,
      fd_set *__restrict __writefds,
      fd_set *__restrict __exceptfds,
      const struct timespec *__restrict __timeout,
      const __sigset_t *__restrict __sigmask);


}
# 221 "/usr/include/sys/types.h" 2 3 4


# 1 "/usr/include/sys/sysmacros.h" 1 3 4
# 30 "/usr/include/sys/sysmacros.h" 3 4
__extension__
extern unsigned int gnu_dev_major (unsigned long long int __dev)
     throw ();
__extension__
extern unsigned int gnu_dev_minor (unsigned long long int __dev)
     throw ();
__extension__
extern unsigned long long int gnu_dev_makedev (unsigned int __major,
            unsigned int __minor)
     throw ();
# 224 "/usr/include/sys/types.h" 2 3 4




typedef __blksize_t blksize_t;






typedef __blkcnt_t blkcnt_t;



typedef __fsblkcnt_t fsblkcnt_t;



typedef __fsfilcnt_t fsfilcnt_t;
# 262 "/usr/include/sys/types.h" 3 4
typedef __blkcnt64_t blkcnt64_t;
typedef __fsblkcnt64_t fsblkcnt64_t;
typedef __fsfilcnt64_t fsfilcnt64_t;





# 1 "/usr/include/bits/pthreadtypes.h" 1 3 4
# 23 "/usr/include/bits/pthreadtypes.h" 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 24 "/usr/include/bits/pthreadtypes.h" 2 3 4
# 50 "/usr/include/bits/pthreadtypes.h" 3 4
typedef unsigned long int pthread_t;


typedef union
{
  char __size[56];
  long int __align;
} pthread_attr_t;



typedef struct __pthread_internal_list
{
  struct __pthread_internal_list *__prev;
  struct __pthread_internal_list *__next;
} __pthread_list_t;
# 76 "/usr/include/bits/pthreadtypes.h" 3 4
typedef union
{
  struct __pthread_mutex_s
  {
    int __lock;
    unsigned int __count;
    int __owner;

    unsigned int __nusers;



    int __kind;

    int __spins;
    __pthread_list_t __list;
# 101 "/usr/include/bits/pthreadtypes.h" 3 4
  } __data;
  char __size[40];
  long int __align;
} pthread_mutex_t;

typedef union
{
  char __size[4];
  int __align;
} pthread_mutexattr_t;




typedef union
{
  struct
  {
    int __lock;
    unsigned int __futex;
    __extension__ unsigned long long int __total_seq;
    __extension__ unsigned long long int __wakeup_seq;
    __extension__ unsigned long long int __woken_seq;
    void *__mutex;
    unsigned int __nwaiters;
    unsigned int __broadcast_seq;
  } __data;
  char __size[48];
  __extension__ long long int __align;
} pthread_cond_t;

typedef union
{
  char __size[4];
  int __align;
} pthread_condattr_t;



typedef unsigned int pthread_key_t;



typedef int pthread_once_t;





typedef union
{

  struct
  {
    int __lock;
    unsigned int __nr_readers;
    unsigned int __readers_wakeup;
    unsigned int __writer_wakeup;
    unsigned int __nr_readers_queued;
    unsigned int __nr_writers_queued;
    int __writer;
    int __shared;
    unsigned long int __pad1;
    unsigned long int __pad2;


    unsigned int __flags;
  } __data;
# 187 "/usr/include/bits/pthreadtypes.h" 3 4
  char __size[56];
  long int __align;
} pthread_rwlock_t;

typedef union
{
  char __size[8];
  long int __align;
} pthread_rwlockattr_t;





typedef volatile int pthread_spinlock_t;




typedef union
{
  char __size[32];
  long int __align;
} pthread_barrier_t;

typedef union
{
  char __size[4];
  int __align;
} pthread_barrierattr_t;
# 271 "/usr/include/sys/types.h" 2 3 4


}
# 65 "lte_types.h" 2

typedef int8_t lte_int8_t;
typedef uint8_t lte_uint8_t;
typedef int16_t lte_int16_t;
typedef uint16_t lte_uint16_t;
typedef int32_t lte_int32_t;
typedef uint32_t lte_uint32_t;
typedef int64_t lte_int64_t;
typedef uint64_t lte_uint64_t;

typedef lte_uint32_t lte_addr32_t;
typedef lte_uint64_t lte_addr64_t;

typedef lte_uint32_t lte_size32_t;
typedef lte_uint64_t lte_size64_t;
typedef size_t lte_size_t;





typedef lte_int_t lte_ssize_t;


typedef lte_addr64_t lte_addr_t;
# 106 "lte_types.h"
}
# 15 "lte_x86_gpr.h" 2
# 1 "lte_reg_enum.h" 1
# 302 "lte_reg_enum.h"
enum lte_reg_enum_t {
   LTE_REG_INVALID, LTE_REG_BNDCFGU, LTE_REG_BNDSTATUS, LTE_REG_B0, LTE_REG_B1, LTE_REG_B2, LTE_REG_B3, LTE_REG_CR0, LTE_REG_CR1, LTE_REG_CR2, LTE_REG_CR3, LTE_REG_CR4, LTE_REG_CR5, LTE_REG_CR6, LTE_REG_CR7, LTE_REG_CR8, LTE_REG_CR9, LTE_REG_CR10, LTE_REG_CR11, LTE_REG_CR12, LTE_REG_CR13, LTE_REG_CR14, LTE_REG_CR15, LTE_REG_DR0, LTE_REG_DR1, LTE_REG_DR2, LTE_REG_DR3, LTE_REG_DR4, LTE_REG_DR5, LTE_REG_DR6, LTE_REG_DR7, LTE_REG_DR8, LTE_REG_DR9, LTE_REG_DR10, LTE_REG_DR11, LTE_REG_DR12, LTE_REG_DR13, LTE_REG_DR14, LTE_REG_DR15, LTE_REG_FLAGS, LTE_REG_EFLAGS, LTE_REG_RFLAGS, LTE_REG_AX, LTE_REG_CX, LTE_REG_DX, LTE_REG_BX, LTE_REG_SP, LTE_REG_BP, LTE_REG_SI, LTE_REG_DI, LTE_REG_R8W, LTE_REG_R9W, LTE_REG_R10W, LTE_REG_R11W, LTE_REG_R12W, LTE_REG_R13W, LTE_REG_R14W, LTE_REG_R15W, LTE_REG_EAX, LTE_REG_ECX, LTE_REG_EDX, LTE_REG_EBX, LTE_REG_ESP, LTE_REG_EBP, LTE_REG_ESI, LTE_REG_EDI, LTE_REG_R8D, LTE_REG_R9D, LTE_REG_R10D, LTE_REG_R11D, LTE_REG_R12D, LTE_REG_R13D, LTE_REG_R14D, LTE_REG_R15D, LTE_REG_RAX, LTE_REG_RCX, LTE_REG_RDX, LTE_REG_RBX, LTE_REG_RSP, LTE_REG_RBP, LTE_REG_RSI, LTE_REG_RDI, LTE_REG_R8, LTE_REG_R9, LTE_REG_R10, LTE_REG_R11, LTE_REG_R12, LTE_REG_R13, LTE_REG_R14, LTE_REG_R15, LTE_REG_AL, LTE_REG_CL, LTE_REG_DL, LTE_REG_BL, LTE_REG_SPL, LTE_REG_BPL, LTE_REG_SIL, LTE_REG_DIL, LTE_REG_R8B, LTE_REG_R9B, LTE_REG_R10B, LTE_REG_R11B, LTE_REG_R12B, LTE_REG_R13B, LTE_REG_R14B, LTE_REG_R15B, LTE_REG_AH, LTE_REG_CH, LTE_REG_DH, LTE_REG_BH, LTE_REG_RIP, LTE_REG_EIP, LTE_REG_IP, LTE_REG_K0, LTE_REG_K1, LTE_REG_K2, LTE_REG_K3, LTE_REG_K4, LTE_REG_K5, LTE_REG_K6, LTE_REG_K7, LTE_REG_MMX0, LTE_REG_MMX1, LTE_REG_MMX2, LTE_REG_MMX3, LTE_REG_MMX4, LTE_REG_MMX5, LTE_REG_MMX6, LTE_REG_MMX7, LTE_REG_MXCSR, LTE_REG_STACKPUSH, LTE_REG_STACKPOP, LTE_REG_GDTR, LTE_REG_LDTR, LTE_REG_IDTR, LTE_REG_TR, LTE_REG_TSC, LTE_REG_TSCAUX, LTE_REG_MSRS, LTE_REG_FSBASE, LTE_REG_GSBASE, LTE_REG_FCW, LTE_REG_FSW, LTE_REG_FTW, LTE_REG_X87PUSH, LTE_REG_X87POP, LTE_REG_X87POP2, LTE_REG_FOP, LTE_REG_X87CS, LTE_REG_FPUIP, LTE_REG_X87DS, LTE_REG_FPUDP, LTE_REG_CS, LTE_REG_DS, LTE_REG_ES, LTE_REG_SS, LTE_REG_FS, LTE_REG_GS, LTE_REG_TMP0, LTE_REG_TMP1, LTE_REG_TMP2, LTE_REG_TMP3, LTE_REG_TMP4, LTE_REG_TMP5, LTE_REG_TMP6, LTE_REG_TMP7, LTE_REG_TMP8, LTE_REG_TMP9, LTE_REG_TMP10, LTE_REG_TMP11, LTE_REG_TMP12, LTE_REG_TMP13, LTE_REG_TMP14, LTE_REG_TMP15, LTE_REG_ST0, LTE_REG_ST1, LTE_REG_ST2, LTE_REG_ST3, LTE_REG_ST4, LTE_REG_ST5, LTE_REG_ST6, LTE_REG_ST7, LTE_REG_XCR0, LTE_REG_XMM0, LTE_REG_XMM1, LTE_REG_XMM2, LTE_REG_XMM3, LTE_REG_XMM4, LTE_REG_XMM5, LTE_REG_XMM6, LTE_REG_XMM7, LTE_REG_XMM8, LTE_REG_XMM9, LTE_REG_XMM10, LTE_REG_XMM11, LTE_REG_XMM12, LTE_REG_XMM13, LTE_REG_XMM14, LTE_REG_XMM15, LTE_REG_XMM16, LTE_REG_XMM17, LTE_REG_XMM18, LTE_REG_XMM19, LTE_REG_XMM20, LTE_REG_XMM21, LTE_REG_XMM22, LTE_REG_XMM23, LTE_REG_XMM24, LTE_REG_XMM25, LTE_REG_XMM26, LTE_REG_XMM27, LTE_REG_XMM28, LTE_REG_XMM29, LTE_REG_XMM30, LTE_REG_XMM31, LTE_REG_YMM0, LTE_REG_YMM1, LTE_REG_YMM2, LTE_REG_YMM3, LTE_REG_YMM4, LTE_REG_YMM5, LTE_REG_YMM6, LTE_REG_YMM7, LTE_REG_YMM8, LTE_REG_YMM9, LTE_REG_YMM10, LTE_REG_YMM11, LTE_REG_YMM12, LTE_REG_YMM13, LTE_REG_YMM14, LTE_REG_YMM15, LTE_REG_YMM16, LTE_REG_YMM17, LTE_REG_YMM18, LTE_REG_YMM19, LTE_REG_YMM20, LTE_REG_YMM21, LTE_REG_YMM22, LTE_REG_YMM23, LTE_REG_YMM24, LTE_REG_YMM25, LTE_REG_YMM26, LTE_REG_YMM27, LTE_REG_YMM28, LTE_REG_YMM29, LTE_REG_YMM30, LTE_REG_YMM31, LTE_REG_ZMM0, LTE_REG_ZMM1, LTE_REG_ZMM2, LTE_REG_ZMM3, LTE_REG_ZMM4, LTE_REG_ZMM5, LTE_REG_ZMM6, LTE_REG_ZMM7, LTE_REG_ZMM8, LTE_REG_ZMM9, LTE_REG_ZMM10, LTE_REG_ZMM11, LTE_REG_ZMM12, LTE_REG_ZMM13, LTE_REG_ZMM14, LTE_REG_ZMM15, LTE_REG_ZMM16, LTE_REG_ZMM17, LTE_REG_ZMM18, LTE_REG_ZMM19, LTE_REG_ZMM20, LTE_REG_ZMM21, LTE_REG_ZMM22, LTE_REG_ZMM23, LTE_REG_ZMM24, LTE_REG_ZMM25, LTE_REG_ZMM26, LTE_REG_ZMM27, LTE_REG_ZMM28, LTE_REG_ZMM29, LTE_REG_ZMM30, LTE_REG_ZMM31, LTE_REG_LAST,


   LTE_REG_BND0 = LTE_REG_B0,
   LTE_REG_BND1 = LTE_REG_B1,
   LTE_REG_BND2 = LTE_REG_B2,
   LTE_REG_BND3 = LTE_REG_B3,
   LTE_REG_X87CONTROL = LTE_REG_FCW,
   LTE_REG_X87STATUS = LTE_REG_FSW,
   LTE_REG_X87TAG = LTE_REG_FTW,
   LTE_REG_X87OPCODE = LTE_REG_FOP,
   LTE_REG_X87LASTCS = LTE_REG_X87CS,
   LTE_REG_X87LASTIP = LTE_REG_FPUIP,
   LTE_REG_X87LASTDS = LTE_REG_X87DS,
   LTE_REG_X87LASTDP = LTE_REG_FPUDP,


   LTE_REG_BNDCFG_FIRST = LTE_REG_BNDCFGU,
   LTE_REG_BNDCFG_LAST = LTE_REG_BNDCFGU,
   LTE_REG_BNDSTAT_FIRST = LTE_REG_BNDSTATUS,
   LTE_REG_BNDSTAT_LAST = LTE_REG_BNDSTATUS,
   LTE_REG_BOUND_FIRST = LTE_REG_BND0,
   LTE_REG_BOUND_LAST = LTE_REG_BND3,
   LTE_REG_CR_FIRST = LTE_REG_CR0,
   LTE_REG_CR_LAST = LTE_REG_CR15,
   LTE_REG_DR_FIRST = LTE_REG_DR0,
   LTE_REG_DR_LAST = LTE_REG_DR15,
   LTE_REG_FLAGS_FIRST = LTE_REG_FLAGS,
   LTE_REG_FLAGS_LAST = LTE_REG_RFLAGS,
   LTE_REG_GPR16_FIRST = LTE_REG_AX,
   LTE_REG_GPR16_LAST = LTE_REG_R15W,
   LTE_REG_GPR32_FIRST = LTE_REG_EAX,
   LTE_REG_GPR32_LAST = LTE_REG_R15D,
   LTE_REG_GPR64_FIRST = LTE_REG_RAX,
   LTE_REG_GPR64_LAST = LTE_REG_R15,
   LTE_REG_GPR8_FIRST = LTE_REG_AL,
   LTE_REG_GPR8_LAST = LTE_REG_R15B,
   LTE_REG_GPR8H_FIRST = LTE_REG_AH,
   LTE_REG_GPR8H_LAST = LTE_REG_BH,
   LTE_REG_IP_FIRST = LTE_REG_RIP,
   LTE_REG_IP_LAST = LTE_REG_IP,
   LTE_REG_MASK_FIRST = LTE_REG_K0,
   LTE_REG_MASK_LAST = LTE_REG_K7,
   LTE_REG_MMX_FIRST = LTE_REG_MMX0,
   LTE_REG_MMX_LAST = LTE_REG_MMX7,
   LTE_REG_MXCSR_FIRST = LTE_REG_MXCSR,
   LTE_REG_MXCSR_LAST = LTE_REG_MXCSR,
   LTE_REG_SEGBASE_FIRST = LTE_REG_FSBASE,
   LTE_REG_SEGBASE_LAST = LTE_REG_GSBASE,
   LTE_REG_PSEUDOX87_FIRST = LTE_REG_X87CONTROL,
   LTE_REG_PSEUDOX87_LAST = LTE_REG_X87LASTDP,
   LTE_REG_SR_FIRST = LTE_REG_CS,
   LTE_REG_SR_LAST = LTE_REG_GS,
   LTE_REG_X87_FIRST = LTE_REG_ST0,
   LTE_REG_X87_LAST = LTE_REG_ST7,
   LTE_REG_XCR_FIRST = LTE_REG_XCR0,
   LTE_REG_XCR_LAST = LTE_REG_XCR0,
   LTE_REG_XMM_FIRST = LTE_REG_XMM0,
   LTE_REG_XMM_LAST = LTE_REG_XMM31,
   LTE_REG_YMM_FIRST = LTE_REG_YMM0,
   LTE_REG_YMM_LAST = LTE_REG_YMM31,
   LTE_REG_ZMM_FIRST = LTE_REG_ZMM0,
   LTE_REG_ZMM_LAST = LTE_REG_ZMM31
};

lte_reg_enum_t str2lte_reg_enum_t(const char* s);

const char* lte_reg_enum_t2str(const lte_reg_enum_t v);
# 16 "lte_x86_gpr.h" 2


typedef lte_uint8_t lte_gpr8_t;
typedef lte_uint16_t lte_gpr16_t;
typedef lte_uint32_t lte_gpr32_t;
typedef lte_uint64_t lte_gpr64_t;


typedef union {
   struct {
      union {
         lte_gpr64_t rflags;
         lte_gpr32_t eflags;
      };
      union {
         lte_gpr64_t rdi;
         lte_gpr32_t edi;
      };
      union {
         lte_gpr64_t rsi;
         lte_gpr32_t esi;
      };
      union {
         lte_gpr64_t rbp;
         lte_gpr32_t ebp;
      };
      union {
         lte_gpr64_t rsp;
         lte_gpr32_t esp;
      };
      union {
         lte_gpr64_t rbx;
         lte_gpr32_t ebx;
      };
      union {
         lte_gpr64_t rdx;
         lte_gpr32_t edx;
      };
      union {
         lte_gpr64_t rcx;
         lte_gpr32_t ecx;
      };
      union {
         lte_gpr64_t rax;
         lte_gpr32_t eax;
      };
      union {
         lte_gpr64_t r8;
         lte_gpr32_t r8d;
      };
      union {
         lte_gpr64_t r9;
         lte_gpr32_t r9d;
      };
      union {
         lte_gpr64_t r10;
         lte_gpr32_t r10d;
      };
      union {
         lte_gpr64_t r11;
         lte_gpr32_t r11d;
      };
      union {
         lte_gpr64_t r12;
         lte_gpr32_t r12d;
      };
      union {
         lte_gpr64_t r13;
         lte_gpr32_t r13d;
      };
      union {
         lte_gpr64_t r14;
         lte_gpr32_t r14d;
      };
      union {
         lte_gpr64_t r15;
         lte_gpr32_t r15d;
      };
   };
   lte_gpr64_t r[17];
} __attribute__((packed)) lte_gpr_state_t;


void lte_gpr_state_init(lte_gpr_state_t* state);

void lte_gpr_state_set_reg(lte_gpr_state_t* state, const lte_reg_enum_t reg, lte_gpr64_t v);
# 5 "lte_x86.h" 2
# 1 "lte_x86_fpu.h" 1
# 16 "lte_x86_fpu.h"
typedef union {
   lte_uint64_t qw[1];
   lte_uint32_t dw[2];
} __attribute__((packed)) lte_mm_reg_t;

typedef union {
   struct {
      lte_uint64_t sgnf;
      lte_uint16_t sexp;
   };
   lte_mm_reg_t mm;
   lte_uint64_t qw[2];
} __attribute__((packed)) lte_x87_st_reg_t;

typedef union {
   lte_uint64_t qw[2];
   lte_uint32_t dw[4];
} __attribute__((packed)) lte_xmm_reg_t;

typedef union {
   lte_xmm_reg_t xmm[2];
   lte_uint64_t qw[4];
   lte_uint32_t dw[8];
} __attribute__((packed)) lte_ymm_reg_t;

typedef union {
   lte_ymm_reg_t ymm[2];
   lte_xmm_reg_t xmm[4];
   lte_uint64_t qw[8];
   lte_uint32_t dw[16];
} __attribute__((packed)) lte_zmm_reg_t;

typedef lte_uint64_t lte_opmask_reg_t;
# 6 "lte_x86.h" 2
# 1 "lte_x86_cr.h" 1
# 16 "lte_x86_cr.h"
typedef union {
   struct {
      lte_uint64_t pe :1;
      lte_uint64_t mp :1;
      lte_uint64_t em :1;
      lte_uint64_t ts :1;
      lte_uint64_t et :1;
      lte_uint64_t ne :1;
      lte_uint64_t rsvd0 :10;
      lte_uint64_t wp :1;
      lte_uint64_t rsvd1 :1;
      lte_uint64_t am :1;
      lte_uint64_t rsvd2 :10;
      lte_uint64_t nw :1;
      lte_uint64_t cd :1;
      lte_uint64_t pg :1;
      lte_uint64_t rsvd3 :32;
   } bits;
   lte_uint64_t flat;
} lte_cr0_t;

typedef union {
    lte_uint64_t flat;
} lte_cr2_t;

typedef union {
   struct {
      lte_uint64_t rsvd0 :3;
      lte_uint64_t pwt :1;
      lte_uint64_t pcd :1;
      lte_uint64_t rsvd1 :7;
      lte_uint64_t page_directory_base :20;
   } no_pae;
   struct {
      lte_uint64_t rsvd0 :3;
      lte_uint64_t pwt :1;
      lte_uint64_t pcd :1;
      lte_uint64_t page_directory_pointer_base :27;
   } pae;
   struct {
      lte_uint64_t rsvd0 :3;
      lte_uint64_t pwt :1;
      lte_uint64_t pcd :1;
      lte_uint64_t rsvd1 :7;
      lte_uint64_t page_map4_base :40;
      lte_uint64_t rsvd2 :12;
   } long_mode;
  lte_uint64_t flat;
} lte_cr3_t;

typedef union {
   struct {
      lte_uint64_t vme :1;
      lte_uint64_t pvi :1;
      lte_uint64_t tsd :1;
      lte_uint64_t de :1;

      lte_uint64_t pse :1;
      lte_uint64_t pae :1;
      lte_uint64_t mce :1;
      lte_uint64_t pge :1;

      lte_uint64_t pce :1;
      lte_uint64_t osfxsr :1;
      lte_uint64_t osxmmexcpt :1;

      lte_uint64_t must_be_zero :2;
      lte_uint64_t vmxe :1;
      lte_uint64_t smxe :1;
      lte_uint64_t rsdv0 :2;
      lte_uint64_t pcide :1;
      lte_uint64_t osxsave :1;
      lte_uint64_t rsvd1 :1;
      lte_uint64_t smep :1;
      lte_uint64_t rsvd2 :43;
   } bits;
   lte_uint64_t flat;
} lte_cr4_t;

typedef union {
   struct
   {
      lte_uint64_t sce :1;
      lte_uint64_t rsvd0 :7;
      lte_uint64_t lme :1;
      lte_uint64_t rsvd1 :1;
      lte_uint64_t lma :1;
      lte_uint64_t nxe :1;
      lte_uint64_t rsvd2 :52;
   } bits;
   lte_uint64_t flat;
} lte_msr_efer_t;
# 7 "lte_x86.h" 2
# 1 "lte_x86_sr.h" 1
# 14 "lte_x86_sr.h"
# 1 "lte_x86_ldt.h" 1
# 17 "lte_x86_ldt.h"
# 1 "/usr/include/asm/ldt.h" 1 3 4
# 20 "/usr/include/asm/ldt.h" 3 4
struct user_desc {
 unsigned int entry_number;
 unsigned int base_addr;
 unsigned int limit;
 unsigned int seg_32bit:1;
 unsigned int contents:2;
 unsigned int read_exec_only:1;
 unsigned int limit_in_pages:1;
 unsigned int seg_not_present:1;
 unsigned int useable:1;

 unsigned int lm:1;

};
# 18 "lte_x86_ldt.h" 2
# 1 "/usr/include/linux/version.h" 1 3 4
# 19 "lte_x86_ldt.h" 2


typedef struct user_desc lte_ldt_entry_t;
# 15 "lte_x86_sr.h" 2






typedef union {
   struct {
      lte_uint32_t rpl:2;
      lte_uint32_t ti:1;
      lte_uint32_t index:13;
      lte_uint32_t rsvd:16;
   };
   lte_uint32_t v;
} lte_seg_sel_t;


typedef enum {
    SD_BASE_16_23_MASK = 0x000000ff,
    SD_BASE_16_23_OFFS = 0,
    SD_SEGTYPE_MASK = 0x00000f00,
    SD_SEGTYPE_OFFS = 8,
    SD_STYPE_A_MASK = 0x00000100,
    SD_STYPE_A_OFFS = 8,
    SD_STYPE_W_MASK = 0x00000200,
    SD_STYPE_W_OFFS = 9,
    SD_STYPE_E_MASK = 0x00000400,
    SD_STYPE_E_OFFS = 10,
    SD_STYPE_CODE_MASK = 0x00000800,
    SD_STYPE_CODE_OFFS = 11,
    SD_DTYPE_MASK = 0x00001000,
    SD_DTYPE_OFFS = 12,
    SD_DPL_MASK = 0x00006000,
    SD_DPL_OFFS = 13,
    SD_PRESENT_MASK = 0x00008000,
    SD_PRESENT_OFFS = 15,
    SD_LIMIT_16_19_MASK = 0x000f0000,
    SD_LIMIT_16_19_OFFS = 16,
    SD_AVL_MASK = 0x00100000,
    SD_AVL_OFFS = 20,
    SD_L_MASK = 0x00200000,
    SD_L_OFFS = 21,
    SD_DB_MASK = 0x00400000,
    SD_DB_OFFS = 22,
    SD_G_MASK = 0x00800000,
    SD_G_OFFS = 23,
    SD_BASE_24_31_MASK = 0xff000000,
    SD_BASE_24_31_OFFS = 24,
    SD_LIMIT_00_15_MASK = 0x0000ffff,
    SD_LIMIT_00_15_OFFS = 0,
    SD_BASE_00_15_MASK = 0xffff0000,
    SD_BASE_00_15_OFFS = 16,
    SD_STYPE_A = (SD_STYPE_A_MASK>>SD_STYPE_A_OFFS),
    SD_STYPE_W = (SD_STYPE_W_MASK>>SD_STYPE_W_OFFS),
    SD_STYPE_E = (SD_STYPE_E_MASK>>SD_STYPE_E_OFFS),
    SD_STYPE_CODE = (SD_STYPE_CODE_MASK>>SD_STYPE_CODE_OFFS),
    SD_CONTENT_DATA = 0,
    SD_CONTENT_STACK = 1,
    SD_CONTENT_CODE = 2,
} lte_seg_desc_enum_t;


typedef union {
   struct {
      lte_uint32_t base_16_23:8;
      lte_uint32_t stype:4;
      lte_uint32_t dtype:1;
      lte_uint32_t dpl:2;
      lte_uint32_t present:1;
      lte_uint32_t limit_16_19:4;
      lte_uint32_t avl:1;
      lte_uint32_t l_flag:1;
      lte_uint32_t db_flag:1;
      lte_uint32_t granularity:1;
      lte_uint32_t base_24_31:8;
      lte_uint32_t limit_0_15:16;
      lte_uint32_t base_0_15:16;
   };
   lte_uint64_t qw;
   lte_uint64_t dw[2];
} __attribute__((packed)) lte_seg_desc_t;



typedef struct {
   lte_seg_sel_t sel;
   lte_seg_desc_t hidden;
} lte_seg_reg_t;


typedef struct {
   lte_uint32_t offs;
   lte_seg_sel_t seg;
} lte_farptr32_t;

typedef struct {
   lte_uint64_t offs;
   lte_seg_sel_t seg;
} lte_farptr64_t;


typedef struct {
   union {
      struct {
         lte_seg_reg_t cs;
         lte_seg_reg_t ds;
         lte_seg_reg_t es;
         lte_seg_reg_t ss;
         lte_seg_reg_t fs;
         lte_seg_reg_t gs;
      } __attribute__((packed));
      lte_seg_reg_t sr[6];
   } __attribute__((packed));
   union {
      struct {
         lte_uint64_t fs_base;
         lte_uint64_t gs_base;
      } __attribute__((packed));
      lte_uint64_t base[2];
   } __attribute__((packed));
} __attribute__((packed)) lte_sr_state_t;


static __inline lte_uint32_t seg_desc_get_seg_base_addr(lte_seg_desc_t* p)
{
   return p->base_0_15 | (p->base_16_23<<16) | (p->base_24_31<<24);
}

static __inline void seg_desc_set_seg_base_addr(lte_seg_desc_t* p, lte_uint32_t base)
{
   p->base_0_15 = base & 0xffff;
   p->base_16_23 = (base >> 16) & 0xff;
   p->base_24_31 = (base >> 24) & 0xff;;
}

static __inline lte_uint32_t seg_desc_get_seg_limit(lte_seg_desc_t* p)
{
   return p->limit_0_15 | (p->limit_16_19<<16);
}

static __inline void seg_desc_set_seg_limit(lte_seg_desc_t* p, lte_uint32_t limit)
{
   p->limit_0_15 = limit & 0xffff;
   p->limit_16_19 = (limit >> 16) & 0xf;
}

static __inline lte_uint32_t seg_desc_get_seg_type(lte_seg_desc_t* p)
{
   return p->stype;
}

static __inline lte_uint32_t seg_desc_is_code_seg(lte_seg_desc_t* p)
{
   return (p->dw[0] & SD_STYPE_CODE_MASK) >> SD_STYPE_CODE_OFFS;
}
# 8 "lte_x86.h" 2
# 5 "lte_x86_xstate.h" 2
# 1 "/usr/include/string.h" 1 3 4
# 28 "/usr/include/string.h" 3 4
extern "C" {




# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/lib64/gcc/x86_64-suse-linux/4.9.2/include/stddef.h" 1 3 4
# 34 "/usr/include/string.h" 2 3 4









extern void *memcpy (void *__restrict __dest,
       __const void *__restrict __src, size_t __n)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern void *memmove (void *__dest, __const void *__src, size_t __n)
     throw () __attribute__ ((__nonnull__ (1, 2)));






extern void *memccpy (void *__restrict __dest, __const void *__restrict __src,
        int __c, size_t __n)
     throw () __attribute__ ((__nonnull__ (1, 2)));





extern void *memset (void *__s, int __c, size_t __n) throw () __attribute__ ((__nonnull__ (1)));


extern int memcmp (__const void *__s1, __const void *__s2, size_t __n)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));



extern "C++"
{
extern void *memchr (void *__s, int __c, size_t __n)
      throw () __asm ("memchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern __const void *memchr (__const void *__s, int __c, size_t __n)
      throw () __asm ("memchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 92 "/usr/include/string.h" 3 4
}










extern "C++" void *rawmemchr (void *__s, int __c)
     throw () __asm ("rawmemchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern "C++" __const void *rawmemchr (__const void *__s, int __c)
     throw () __asm ("rawmemchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));







extern "C++" void *memrchr (void *__s, int __c, size_t __n)
      throw () __asm ("memrchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern "C++" __const void *memrchr (__const void *__s, int __c, size_t __n)
      throw () __asm ("memrchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));









extern char *strcpy (char *__restrict __dest, __const char *__restrict __src)
     throw () __attribute__ ((__nonnull__ (1, 2)));

extern char *strncpy (char *__restrict __dest,
        __const char *__restrict __src, size_t __n)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern char *strcat (char *__restrict __dest, __const char *__restrict __src)
     throw () __attribute__ ((__nonnull__ (1, 2)));

extern char *strncat (char *__restrict __dest, __const char *__restrict __src,
        size_t __n) throw () __attribute__ ((__nonnull__ (1, 2)));


extern int strcmp (__const char *__s1, __const char *__s2)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

extern int strncmp (__const char *__s1, __const char *__s2, size_t __n)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strcoll (__const char *__s1, __const char *__s2)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

extern size_t strxfrm (char *__restrict __dest,
         __const char *__restrict __src, size_t __n)
     throw () __attribute__ ((__nonnull__ (2)));






# 1 "/usr/include/xlocale.h" 1 3 4
# 28 "/usr/include/xlocale.h" 3 4
typedef struct __locale_struct
{

  struct locale_data *__locales[13];


  const unsigned short int *__ctype_b;
  const int *__ctype_tolower;
  const int *__ctype_toupper;


  const char *__names[13];
} *__locale_t;


typedef __locale_t locale_t;
# 162 "/usr/include/string.h" 2 3 4


extern int strcoll_l (__const char *__s1, __const char *__s2, __locale_t __l)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 3)));

extern size_t strxfrm_l (char *__dest, __const char *__src, size_t __n,
    __locale_t __l) throw () __attribute__ ((__nonnull__ (2, 4)));




extern char *strdup (__const char *__s)
     throw () __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));






extern char *strndup (__const char *__string, size_t __n)
     throw () __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));
# 208 "/usr/include/string.h" 3 4



extern "C++"
{
extern char *strchr (char *__s, int __c)
     throw () __asm ("strchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern __const char *strchr (__const char *__s, int __c)
     throw () __asm ("strchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 231 "/usr/include/string.h" 3 4
}






extern "C++"
{
extern char *strrchr (char *__s, int __c)
     throw () __asm ("strrchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern __const char *strrchr (__const char *__s, int __c)
     throw () __asm ("strrchr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 258 "/usr/include/string.h" 3 4
}










extern "C++" char *strchrnul (char *__s, int __c)
     throw () __asm ("strchrnul") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern "C++" __const char *strchrnul (__const char *__s, int __c)
     throw () __asm ("strchrnul") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));









extern size_t strcspn (__const char *__s, __const char *__reject)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern size_t strspn (__const char *__s, __const char *__accept)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern "C++"
{
extern char *strpbrk (char *__s, __const char *__accept)
     throw () __asm ("strpbrk") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern __const char *strpbrk (__const char *__s, __const char *__accept)
     throw () __asm ("strpbrk") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 310 "/usr/include/string.h" 3 4
}






extern "C++"
{
extern char *strstr (char *__haystack, __const char *__needle)
     throw () __asm ("strstr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern __const char *strstr (__const char *__haystack,
        __const char *__needle)
     throw () __asm ("strstr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 338 "/usr/include/string.h" 3 4
}







extern char *strtok (char *__restrict __s, __const char *__restrict __delim)
     throw () __attribute__ ((__nonnull__ (2)));




extern char *__strtok_r (char *__restrict __s,
    __const char *__restrict __delim,
    char **__restrict __save_ptr)
     throw () __attribute__ ((__nonnull__ (2, 3)));

extern char *strtok_r (char *__restrict __s, __const char *__restrict __delim,
         char **__restrict __save_ptr)
     throw () __attribute__ ((__nonnull__ (2, 3)));





extern "C++" char *strcasestr (char *__haystack, __const char *__needle)
     throw () __asm ("strcasestr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
extern "C++" __const char *strcasestr (__const char *__haystack,
           __const char *__needle)
     throw () __asm ("strcasestr") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 380 "/usr/include/string.h" 3 4
extern void *memmem (__const void *__haystack, size_t __haystacklen,
       __const void *__needle, size_t __needlelen)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 3)));



extern void *__mempcpy (void *__restrict __dest,
   __const void *__restrict __src, size_t __n)
     throw () __attribute__ ((__nonnull__ (1, 2)));
extern void *mempcpy (void *__restrict __dest,
        __const void *__restrict __src, size_t __n)
     throw () __attribute__ ((__nonnull__ (1, 2)));





extern size_t strlen (__const char *__s)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));





extern size_t strnlen (__const char *__string, size_t __maxlen)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));





extern char *strerror (int __errnum) throw ();

# 436 "/usr/include/string.h" 3 4
extern char *strerror_r (int __errnum, char *__buf, size_t __buflen)
     throw () __attribute__ ((__nonnull__ (2)));





extern char *strerror_l (int __errnum, __locale_t __l) throw ();





extern void __bzero (void *__s, size_t __n) throw () __attribute__ ((__nonnull__ (1)));



extern void bcopy (__const void *__src, void *__dest, size_t __n)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern void bzero (void *__s, size_t __n) throw () __attribute__ ((__nonnull__ (1)));


extern int bcmp (__const void *__s1, __const void *__s2, size_t __n)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));



extern "C++"
{
extern char *index (char *__s, int __c)
     throw () __asm ("index") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern __const char *index (__const char *__s, int __c)
     throw () __asm ("index") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 485 "/usr/include/string.h" 3 4
}







extern "C++"
{
extern char *rindex (char *__s, int __c)
     throw () __asm ("rindex") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
extern __const char *rindex (__const char *__s, int __c)
     throw () __asm ("rindex") __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 513 "/usr/include/string.h" 3 4
}







extern int ffs (int __i) throw () __attribute__ ((__const__));




extern int ffsl (long int __l) throw () __attribute__ ((__const__));

__extension__ extern int ffsll (long long int __ll)
     throw () __attribute__ ((__const__));




extern int strcasecmp (__const char *__s1, __const char *__s2)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strncasecmp (__const char *__s1, __const char *__s2, size_t __n)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));





extern int strcasecmp_l (__const char *__s1, __const char *__s2,
    __locale_t __loc)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 3)));

extern int strncasecmp_l (__const char *__s1, __const char *__s2,
     size_t __n, __locale_t __loc)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 4)));





extern char *strsep (char **__restrict __stringp,
       __const char *__restrict __delim)
     throw () __attribute__ ((__nonnull__ (1, 2)));




extern char *strsignal (int __sig) throw ();


extern char *__stpcpy (char *__restrict __dest, __const char *__restrict __src)
     throw () __attribute__ ((__nonnull__ (1, 2)));
extern char *stpcpy (char *__restrict __dest, __const char *__restrict __src)
     throw () __attribute__ ((__nonnull__ (1, 2)));



extern char *__stpncpy (char *__restrict __dest,
   __const char *__restrict __src, size_t __n)
     throw () __attribute__ ((__nonnull__ (1, 2)));
extern char *stpncpy (char *__restrict __dest,
        __const char *__restrict __src, size_t __n)
     throw () __attribute__ ((__nonnull__ (1, 2)));




extern int strverscmp (__const char *__s1, __const char *__s2)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern char *strfry (char *__string) throw () __attribute__ ((__nonnull__ (1)));


extern void *memfrob (void *__s, size_t __n) throw () __attribute__ ((__nonnull__ (1)));







extern "C++" char *basename (char *__filename)
     throw () __asm ("basename") __attribute__ ((__nonnull__ (1)));
extern "C++" __const char *basename (__const char *__filename)
     throw () __asm ("basename") __attribute__ ((__nonnull__ (1)));
# 644 "/usr/include/string.h" 3 4
}
# 6 "lte_x86_xstate.h" 2

enum xfeature_enum_t {
   LTE_XFEATURE_X87,
   LTE_XFEATURE_SSE,
   LTE_XFEATURE_AVX,
   LTE_XFEATURE_BNDREGS,
   LTE_XFEATURE_BNDCSR,
   LTE_XFEATURE_OPMASK,
   LTE_XFEATURE_ZMM_HI256,
   LTE_XFEATURE_HI16_ZMM,
   LTE_XFEATURE_PT,
   LTE_XFEATURE_PKRU,
   LTE_XFEATURE_LAST,

   LTE_XFEATURE_MASK_X87 = (1 << LTE_XFEATURE_X87),
   LTE_XFEATURE_MASK_SSE = (1 << LTE_XFEATURE_SSE),
   LTE_XFEATURE_MASK_YMM = (1 << LTE_XFEATURE_AVX),
   LTE_XFEATURE_MASK_BNDREGS = (1 << LTE_XFEATURE_BNDREGS),
   LTE_XFEATURE_MASK_BNDCSR = (1 << LTE_XFEATURE_BNDCSR),
   LTE_XFEATURE_MASK_OPMASK = (1 << LTE_XFEATURE_OPMASK),
   LTE_XFEATURE_MASK_ZMM_HI256 = (1 << LTE_XFEATURE_ZMM_HI256),
   LTE_XFEATURE_MASK_HI16_ZMM = (1 << LTE_XFEATURE_HI16_ZMM),
   LTE_XFEATURE_MASK_PT = (1 << LTE_XFEATURE_PT),
   LTE_XFEATURE_MASK_PKRU = (1 << LTE_XFEATURE_PKRU),
   LTE_ADDED_TO_FORCE_SIZE = (0xFFFFFFFFFFFFFFFF)
};

enum xsave_layout_enum_t {
   LTE_XSAVE_FX_OFFSET = 0,
   LTE_XSAVE_FX_SIZE = 512,
   LTE_XSAVE_XHDR_OFFSET = 512,
   LTE_XSAVE_XHDR_SIZE = 64,
   LTE_XSAVE_YMM_HI256_OFFSET = 576,
   LTE_XSAVE_YMM_HI256_SIZE = 256,
   LTE_XSAVE_BNDREGS_OFFSET = 960,
   LTE_XSAVE_BNDREGS_SIZE = 64,
   LTE_XSAVE_BNDCSR_OFFSET = 1024,
   LTE_XSAVE_BNDCSR_SIZE = 64,
   LTE_XSAVE_OPMASK_OFFSET = 1088,
   LTE_XSAVE_OPMASK_SIZE = 64,
   LTE_XSAVE_ZMM_HI256_OFFSET = 1152,
   LTE_XSAVE_ZMM_HI256_SIZE = 512,
   LTE_XSAVE_HI16_ZMM_OFFSET = 1664,
   LTE_XSAVE_HI16_ZMM_SIZE = 1024,
};


typedef union {
   struct {
      lte_uint64_t lb;
      lte_uint64_t ub;
   };
   lte_uint64_t qw[2];
} __attribute__((packed)) lte_mpx_bndreg_t;

typedef struct {
   lte_uint64_t bndcfgu;
   lte_uint64_t bndstatus;
} __attribute__((packed)) lte_mpx_bndcsr_t;



typedef struct {
   lte_uint64_t xstate_bv;
   lte_uint64_t xcomp_bv;
   lte_uint64_t rsvd[6];
} __attribute__((packed)) lte_xstate_hdr_t;



typedef struct {
   lte_uint16_t fcw;
   lte_uint16_t fsw;
   lte_uint16_t ftw;
   lte_uint16_t fop;
   union {
      lte_uint64_t fpuip;
      struct {
         lte_uint32_t fip;
         lte_uint16_t fcs;
         lte_uint16_t rsdv0;
      } __attribute__((packed));
   } __attribute__((packed));
   union {
      lte_uint64_t fpudp;
      struct {
         lte_uint32_t foo;
         lte_uint16_t fos;
         lte_uint16_t rsdv1;
      } __attribute__((packed));
   } __attribute__((packed));
   lte_uint32_t mxcsr;
   lte_uint32_t mxcsr_mask;
   lte_x87_st_reg_t st[8];
   lte_xmm_reg_t xmm[16];
   lte_xmm_reg_t rsvd[6];
} __attribute__((packed)) __attribute__((aligned(16))) lte_fxstate_t;

lte_uint16_t lte_fxstate_get_abridged_ftw(lte_uint16_t ftw_hw);


typedef union {
    lte_xmm_reg_t ymmhi[16];
} __attribute__((packed)) lte_xstate_ext_ymm_hi128_t;


typedef union {
    lte_mpx_bndreg_t bnd[4];
} __attribute__((packed)) lte_xstate_ext_bndregs_t;


typedef union {
    lte_mpx_bndcsr_t bndcsr;
    lte_uint8_t pad[LTE_XSAVE_BNDCSR_SIZE];
} __attribute__((packed)) lte_xstate_ext_bndcsr_t;


typedef union {
    lte_opmask_reg_t k[8];
} __attribute__((packed)) lte_xstate_ext_opmask_t;


typedef union {
    lte_ymm_reg_t zmmhi[16];
} __attribute__((packed)) lte_xstate_ext_zmm_hi256_t;


typedef struct {
    lte_zmm_reg_t zmm[16];
} __attribute__((packed)) lte_xstate_ext_hi16_zmm_t;


typedef struct {
   lte_uint64_t msr[13];
} __attribute__((packed)) lte_xstate_ext_pt_t;


typedef struct {
   lte_uint32_t pkru;
   lte_uint32_t pad;
} __attribute__((packed)) lte_xstate_ext_pkru_t;

typedef struct {
   lte_fxstate_t fx;
   lte_xstate_hdr_t xhdr;
   union {
      lte_xstate_ext_ymm_hi128_t ext2;
      lte_uint8_t ext_area2[LTE_XSAVE_BNDREGS_OFFSET-LTE_XSAVE_YMM_HI256_OFFSET];
   } __attribute__((packed));
   union {
      lte_xstate_ext_bndregs_t ext3;
      lte_uint8_t ext_area3[LTE_XSAVE_BNDCSR_OFFSET-LTE_XSAVE_BNDREGS_OFFSET];
   } __attribute__((packed));
   union {
      lte_xstate_ext_bndcsr_t ext4;
      lte_uint8_t ext_area4[LTE_XSAVE_OPMASK_OFFSET-LTE_XSAVE_BNDCSR_OFFSET];
   } __attribute__((packed));
   union {
      lte_xstate_ext_opmask_t ext5;
      lte_uint8_t ext_area5[LTE_XSAVE_ZMM_HI256_OFFSET-LTE_XSAVE_OPMASK_OFFSET];
   } __attribute__((packed));
   union {
      lte_xstate_ext_zmm_hi256_t ext6;
      lte_uint8_t ext_area6[LTE_XSAVE_HI16_ZMM_OFFSET-LTE_XSAVE_ZMM_HI256_OFFSET];
   } __attribute__((packed));
   union {
      lte_xstate_ext_hi16_zmm_t ext7;
      lte_uint8_t ext_area7[sizeof(ext7)];
   } __attribute__((packed));
   union {
      lte_xstate_ext_pt_t ext8;
      lte_uint8_t ext_area8[sizeof(ext8)];
   } __attribute__((packed));
   union {
      lte_xstate_ext_pkru_t ext9;
      lte_uint8_t ext_area9[sizeof(ext9)];
   } __attribute__((packed));
} __attribute__((packed)) __attribute__((aligned(64))) lte_xstate_t;


static __inline void lte_x86_xstate_zero_state(lte_xstate_t* p)
{
   memset(p, 0, sizeof(*p));
}
# 5 "lte_x86_state.h" 2


typedef struct {
   lte_xstate_t xstate;
   lte_sr_state_t srstate;
   lte_gpr_state_t gprstate;
   lte_ldt_entry_t segdesc[6];
   union {
      lte_gpr64_t rip;
      lte_gpr32_t eip;
   };
   lte_gpr64_t xcr0;
} __attribute__((packed)) __attribute__((aligned(64))) lte_x86_state_t;

static __inline void lte_x86_state_zero_state(lte_x86_state_t* p)
{
   memset(p, 0, sizeof(*p));
}

void lte_x86_state_init_state(lte_x86_state_t* p);
# 15 "lte_entry_point.h" 2
# 1 "lte_syself.h" 1
# 17 "lte_syself.h"
# 1 "/usr/include/elf.h" 1 3 4
# 26 "/usr/include/elf.h" 3 4
extern "C" {






typedef uint16_t Elf32_Half;
typedef uint16_t Elf64_Half;


typedef uint32_t Elf32_Word;
typedef int32_t Elf32_Sword;
typedef uint32_t Elf64_Word;
typedef int32_t Elf64_Sword;


typedef uint64_t Elf32_Xword;
typedef int64_t Elf32_Sxword;
typedef uint64_t Elf64_Xword;
typedef int64_t Elf64_Sxword;


typedef uint32_t Elf32_Addr;
typedef uint64_t Elf64_Addr;


typedef uint32_t Elf32_Off;
typedef uint64_t Elf64_Off;


typedef uint16_t Elf32_Section;
typedef uint16_t Elf64_Section;


typedef Elf32_Half Elf32_Versym;
typedef Elf64_Half Elf64_Versym;






typedef struct
{
  unsigned char e_ident[(16)];
  Elf32_Half e_type;
  Elf32_Half e_machine;
  Elf32_Word e_version;
  Elf32_Addr e_entry;
  Elf32_Off e_phoff;
  Elf32_Off e_shoff;
  Elf32_Word e_flags;
  Elf32_Half e_ehsize;
  Elf32_Half e_phentsize;
  Elf32_Half e_phnum;
  Elf32_Half e_shentsize;
  Elf32_Half e_shnum;
  Elf32_Half e_shstrndx;
} Elf32_Ehdr;

typedef struct
{
  unsigned char e_ident[(16)];
  Elf64_Half e_type;
  Elf64_Half e_machine;
  Elf64_Word e_version;
  Elf64_Addr e_entry;
  Elf64_Off e_phoff;
  Elf64_Off e_shoff;
  Elf64_Word e_flags;
  Elf64_Half e_ehsize;
  Elf64_Half e_phentsize;
  Elf64_Half e_phnum;
  Elf64_Half e_shentsize;
  Elf64_Half e_shnum;
  Elf64_Half e_shstrndx;
} Elf64_Ehdr;
# 268 "/usr/include/elf.h" 3 4
typedef struct
{
  Elf32_Word sh_name;
  Elf32_Word sh_type;
  Elf32_Word sh_flags;
  Elf32_Addr sh_addr;
  Elf32_Off sh_offset;
  Elf32_Word sh_size;
  Elf32_Word sh_link;
  Elf32_Word sh_info;
  Elf32_Word sh_addralign;
  Elf32_Word sh_entsize;
} Elf32_Shdr;

typedef struct
{
  Elf64_Word sh_name;
  Elf64_Word sh_type;
  Elf64_Xword sh_flags;
  Elf64_Addr sh_addr;
  Elf64_Off sh_offset;
  Elf64_Xword sh_size;
  Elf64_Word sh_link;
  Elf64_Word sh_info;
  Elf64_Xword sh_addralign;
  Elf64_Xword sh_entsize;
} Elf64_Shdr;
# 377 "/usr/include/elf.h" 3 4
typedef struct
{
  Elf32_Word st_name;
  Elf32_Addr st_value;
  Elf32_Word st_size;
  unsigned char st_info;
  unsigned char st_other;
  Elf32_Section st_shndx;
} Elf32_Sym;

typedef struct
{
  Elf64_Word st_name;
  unsigned char st_info;
  unsigned char st_other;
  Elf64_Section st_shndx;
  Elf64_Addr st_value;
  Elf64_Xword st_size;
} Elf64_Sym;




typedef struct
{
  Elf32_Half si_boundto;
  Elf32_Half si_flags;
} Elf32_Syminfo;

typedef struct
{
  Elf64_Half si_boundto;
  Elf64_Half si_flags;
} Elf64_Syminfo;
# 492 "/usr/include/elf.h" 3 4
typedef struct
{
  Elf32_Addr r_offset;
  Elf32_Word r_info;
} Elf32_Rel;






typedef struct
{
  Elf64_Addr r_offset;
  Elf64_Xword r_info;
} Elf64_Rel;



typedef struct
{
  Elf32_Addr r_offset;
  Elf32_Word r_info;
  Elf32_Sword r_addend;
} Elf32_Rela;

typedef struct
{
  Elf64_Addr r_offset;
  Elf64_Xword r_info;
  Elf64_Sxword r_addend;
} Elf64_Rela;
# 537 "/usr/include/elf.h" 3 4
typedef struct
{
  Elf32_Word p_type;
  Elf32_Off p_offset;
  Elf32_Addr p_vaddr;
  Elf32_Addr p_paddr;
  Elf32_Word p_filesz;
  Elf32_Word p_memsz;
  Elf32_Word p_flags;
  Elf32_Word p_align;
} Elf32_Phdr;

typedef struct
{
  Elf64_Word p_type;
  Elf64_Word p_flags;
  Elf64_Off p_offset;
  Elf64_Addr p_vaddr;
  Elf64_Addr p_paddr;
  Elf64_Xword p_filesz;
  Elf64_Xword p_memsz;
  Elf64_Xword p_align;
} Elf64_Phdr;
# 624 "/usr/include/elf.h" 3 4
typedef struct
{
  Elf32_Sword d_tag;
  union
    {
      Elf32_Word d_val;
      Elf32_Addr d_ptr;
    } d_un;
} Elf32_Dyn;

typedef struct
{
  Elf64_Sxword d_tag;
  union
    {
      Elf64_Xword d_val;
      Elf64_Addr d_ptr;
    } d_un;
} Elf64_Dyn;
# 791 "/usr/include/elf.h" 3 4
typedef struct
{
  Elf32_Half vd_version;
  Elf32_Half vd_flags;
  Elf32_Half vd_ndx;
  Elf32_Half vd_cnt;
  Elf32_Word vd_hash;
  Elf32_Word vd_aux;
  Elf32_Word vd_next;

} Elf32_Verdef;

typedef struct
{
  Elf64_Half vd_version;
  Elf64_Half vd_flags;
  Elf64_Half vd_ndx;
  Elf64_Half vd_cnt;
  Elf64_Word vd_hash;
  Elf64_Word vd_aux;
  Elf64_Word vd_next;

} Elf64_Verdef;
# 833 "/usr/include/elf.h" 3 4
typedef struct
{
  Elf32_Word vda_name;
  Elf32_Word vda_next;

} Elf32_Verdaux;

typedef struct
{
  Elf64_Word vda_name;
  Elf64_Word vda_next;

} Elf64_Verdaux;




typedef struct
{
  Elf32_Half vn_version;
  Elf32_Half vn_cnt;
  Elf32_Word vn_file;

  Elf32_Word vn_aux;
  Elf32_Word vn_next;

} Elf32_Verneed;

typedef struct
{
  Elf64_Half vn_version;
  Elf64_Half vn_cnt;
  Elf64_Word vn_file;

  Elf64_Word vn_aux;
  Elf64_Word vn_next;

} Elf64_Verneed;
# 880 "/usr/include/elf.h" 3 4
typedef struct
{
  Elf32_Word vna_hash;
  Elf32_Half vna_flags;
  Elf32_Half vna_other;
  Elf32_Word vna_name;
  Elf32_Word vna_next;

} Elf32_Vernaux;

typedef struct
{
  Elf64_Word vna_hash;
  Elf64_Half vna_flags;
  Elf64_Half vna_other;
  Elf64_Word vna_name;
  Elf64_Word vna_next;

} Elf64_Vernaux;
# 914 "/usr/include/elf.h" 3 4
typedef struct
{
  uint32_t a_type;
  union
    {
      uint32_t a_val;



    } a_un;
} Elf32_auxv_t;

typedef struct
{
  uint64_t a_type;
  union
    {
      uint64_t a_val;



    } a_un;
} Elf64_auxv_t;
# 998 "/usr/include/elf.h" 3 4
typedef struct
{
  Elf32_Word n_namesz;
  Elf32_Word n_descsz;
  Elf32_Word n_type;
} Elf32_Nhdr;

typedef struct
{
  Elf64_Word n_namesz;
  Elf64_Word n_descsz;
  Elf64_Word n_type;
} Elf64_Nhdr;
# 1062 "/usr/include/elf.h" 3 4
typedef struct
{
  Elf32_Xword m_value;
  Elf32_Word m_info;
  Elf32_Word m_poffset;
  Elf32_Half m_repeat;
  Elf32_Half m_stride;
} Elf32_Move;

typedef struct
{
  Elf64_Xword m_value;
  Elf64_Xword m_info;
  Elf64_Xword m_poffset;
  Elf64_Half m_repeat;
  Elf64_Half m_stride;
} Elf64_Move;
# 1432 "/usr/include/elf.h" 3 4
typedef union
{
  struct
    {
      Elf32_Word gt_current_g_value;
      Elf32_Word gt_unused;
    } gt_header;
  struct
    {
      Elf32_Word gt_g_value;
      Elf32_Word gt_bytes;
    } gt_entry;
} Elf32_gptab;



typedef struct
{
  Elf32_Word ri_gprmask;
  Elf32_Word ri_cprmask[4];
  Elf32_Sword ri_gp_value;
} Elf32_RegInfo;



typedef struct
{
  unsigned char kind;

  unsigned char size;
  Elf32_Section section;

  Elf32_Word info;
} Elf_Options;
# 1508 "/usr/include/elf.h" 3 4
typedef struct
{
  Elf32_Word hwp_flags1;
  Elf32_Word hwp_flags2;
} Elf_Options_Hw;
# 1669 "/usr/include/elf.h" 3 4
typedef struct
{
  Elf32_Word l_name;
  Elf32_Word l_time_stamp;
  Elf32_Word l_checksum;
  Elf32_Word l_version;
  Elf32_Word l_flags;
} Elf32_Lib;

typedef struct
{
  Elf64_Word l_name;
  Elf64_Word l_time_stamp;
  Elf64_Word l_checksum;
  Elf64_Word l_version;
  Elf64_Word l_flags;
} Elf64_Lib;
# 1700 "/usr/include/elf.h" 3 4
typedef Elf32_Addr Elf32_Conflict;
# 2734 "/usr/include/elf.h" 3 4
}
# 18 "lte_syself.h" 2
# 27 "lte_syself.h"
typedef Elf64_Rela Elf_Rela_t;

inline Elf32_Word ELF_R_SYM(Elf64_Xword i) { return (Elf32_Word)(i >> 32); }
inline Elf32_Word ELF_R_TYPE(Elf64_Xword i) { return (Elf32_Word)(i); }
inline Elf64_Xword ELF_R_INFO(Elf32_Word sym, Elf32_Word type) { return (((Elf64_Xword)sym) << 32) | type; }

typedef struct {
    const char* name;
    Elf64_Addr offs;
    Elf64_Xword size;
    unsigned char info;
    Elf_Rela_t* rela;
} Elf_SymInfo_t;

typedef lte_uint8_t Elf_Byte_t;
typedef lte_size_t Elf_Size_t;
typedef unsigned char Elf_Class_t;
# 16 "lte_entry_point.h" 2
# 1 "lte_strtab.h" 1
# 11 "lte_strtab.h"
       




# 1 "lte_utils.h" 1
# 15 "lte_utils.h"
# 1 "/usr/include/assert.h" 1 3 4
# 66 "/usr/include/assert.h" 3 4
extern "C" {


extern void __assert_fail (__const char *__assertion, __const char *__file,
      unsigned int __line, __const char *__function)
     throw () __attribute__ ((__noreturn__));


extern void __assert_perror_fail (int __errnum, __const char *__file,
      unsigned int __line,
      __const char *__function)
     throw () __attribute__ ((__noreturn__));




extern void __assert (const char *__assertion, const char *__file, int __line)
     throw () __attribute__ ((__noreturn__));


}
# 16 "lte_utils.h" 2
# 1 "/usr/include/stdio.h" 1 3 4
# 30 "/usr/include/stdio.h" 3 4
extern "C" {



# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/lib64/gcc/x86_64-suse-linux/4.9.2/include/stddef.h" 1 3 4
# 35 "/usr/include/stdio.h" 2 3 4
# 45 "/usr/include/stdio.h" 3 4
struct _IO_FILE;



typedef struct _IO_FILE FILE;





# 65 "/usr/include/stdio.h" 3 4
typedef struct _IO_FILE __FILE;
# 75 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/libio.h" 1 3 4
# 32 "/usr/include/libio.h" 3 4
# 1 "/usr/include/_G_config.h" 1 3 4
# 15 "/usr/include/_G_config.h" 3 4
# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/lib64/gcc/x86_64-suse-linux/4.9.2/include/stddef.h" 1 3 4
# 16 "/usr/include/_G_config.h" 2 3 4




# 1 "/usr/include/wchar.h" 1 3 4
# 83 "/usr/include/wchar.h" 3 4
typedef struct
{
  int __count;
  union
  {

    unsigned int __wch;



    char __wchb[4];
  } __value;
} __mbstate_t;
# 21 "/usr/include/_G_config.h" 2 3 4

typedef struct
{
  __off_t __pos;
  __mbstate_t __state;
} _G_fpos_t;
typedef struct
{
  __off64_t __pos;
  __mbstate_t __state;
} _G_fpos64_t;
# 53 "/usr/include/_G_config.h" 3 4
typedef int _G_int16_t __attribute__ ((__mode__ (__HI__)));
typedef int _G_int32_t __attribute__ ((__mode__ (__SI__)));
typedef unsigned int _G_uint16_t __attribute__ ((__mode__ (__HI__)));
typedef unsigned int _G_uint32_t __attribute__ ((__mode__ (__SI__)));
# 33 "/usr/include/libio.h" 2 3 4
# 53 "/usr/include/libio.h" 3 4
# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/lib64/gcc/x86_64-suse-linux/4.9.2/include/stdarg.h" 1 3 4
# 40 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/lib64/gcc/x86_64-suse-linux/4.9.2/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 54 "/usr/include/libio.h" 2 3 4
# 170 "/usr/include/libio.h" 3 4
struct _IO_jump_t; struct _IO_FILE;
# 180 "/usr/include/libio.h" 3 4
typedef void _IO_lock_t;





struct _IO_marker {
  struct _IO_marker *_next;
  struct _IO_FILE *_sbuf;



  int _pos;
# 203 "/usr/include/libio.h" 3 4
};


enum __codecvt_result
{
  __codecvt_ok,
  __codecvt_partial,
  __codecvt_error,
  __codecvt_noconv
};
# 271 "/usr/include/libio.h" 3 4
struct _IO_FILE {
  int _flags;




  char* _IO_read_ptr;
  char* _IO_read_end;
  char* _IO_read_base;
  char* _IO_write_base;
  char* _IO_write_ptr;
  char* _IO_write_end;
  char* _IO_buf_base;
  char* _IO_buf_end;

  char *_IO_save_base;
  char *_IO_backup_base;
  char *_IO_save_end;

  struct _IO_marker *_markers;

  struct _IO_FILE *_chain;

  int _fileno;



  int _flags2;

  __off_t _old_offset;



  unsigned short _cur_column;
  signed char _vtable_offset;
  char _shortbuf[1];



  _IO_lock_t *_lock;
# 319 "/usr/include/libio.h" 3 4
  __off64_t _offset;
# 328 "/usr/include/libio.h" 3 4
  void *__pad1;
  void *__pad2;
  void *__pad3;
  void *__pad4;
  size_t __pad5;

  int _mode;

  char _unused2[15 * sizeof (int) - 4 * sizeof (void *) - sizeof (size_t)];

};





struct _IO_FILE_plus;

extern struct _IO_FILE_plus _IO_2_1_stdin_;
extern struct _IO_FILE_plus _IO_2_1_stdout_;
extern struct _IO_FILE_plus _IO_2_1_stderr_;
# 364 "/usr/include/libio.h" 3 4
typedef __ssize_t __io_read_fn (void *__cookie, char *__buf, size_t __nbytes);







typedef __ssize_t __io_write_fn (void *__cookie, __const char *__buf,
     size_t __n);







typedef int __io_seek_fn (void *__cookie, __off64_t *__pos, int __w);


typedef int __io_close_fn (void *__cookie);




typedef __io_read_fn cookie_read_function_t;
typedef __io_write_fn cookie_write_function_t;
typedef __io_seek_fn cookie_seek_function_t;
typedef __io_close_fn cookie_close_function_t;


typedef struct
{
  __io_read_fn *read;
  __io_write_fn *write;
  __io_seek_fn *seek;
  __io_close_fn *close;
} _IO_cookie_io_functions_t;
typedef _IO_cookie_io_functions_t cookie_io_functions_t;

struct _IO_cookie_file;


extern void _IO_cookie_init (struct _IO_cookie_file *__cfile, int __read_write,
        void *__cookie, _IO_cookie_io_functions_t __fns);




extern "C" {


extern int __underflow (_IO_FILE *);
extern int __uflow (_IO_FILE *);
extern int __overflow (_IO_FILE *, int);
# 460 "/usr/include/libio.h" 3 4
extern int _IO_getc (_IO_FILE *__fp);
extern int _IO_putc (int __c, _IO_FILE *__fp);
extern int _IO_feof (_IO_FILE *__fp) throw ();
extern int _IO_ferror (_IO_FILE *__fp) throw ();

extern int _IO_peekc_locked (_IO_FILE *__fp);





extern void _IO_flockfile (_IO_FILE *) throw ();
extern void _IO_funlockfile (_IO_FILE *) throw ();
extern int _IO_ftrylockfile (_IO_FILE *) throw ();
# 490 "/usr/include/libio.h" 3 4
extern int _IO_vfscanf (_IO_FILE * __restrict, const char * __restrict,
   __gnuc_va_list, int *__restrict);
extern int _IO_vfprintf (_IO_FILE *__restrict, const char *__restrict,
    __gnuc_va_list);
extern __ssize_t _IO_padn (_IO_FILE *, int, __ssize_t);
extern size_t _IO_sgetn (_IO_FILE *, void *, size_t);

extern __off64_t _IO_seekoff (_IO_FILE *, __off64_t, int, int);
extern __off64_t _IO_seekpos (_IO_FILE *, __off64_t, int);

extern void _IO_free_backup_area (_IO_FILE *) throw ();
# 552 "/usr/include/libio.h" 3 4
}
# 76 "/usr/include/stdio.h" 2 3 4




typedef __gnuc_va_list va_list;
# 89 "/usr/include/stdio.h" 3 4


typedef _G_fpos_t fpos_t;





typedef _G_fpos64_t fpos64_t;
# 141 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/bits/stdio_lim.h" 1 3 4
# 142 "/usr/include/stdio.h" 2 3 4



extern struct _IO_FILE *stdin;
extern struct _IO_FILE *stdout;
extern struct _IO_FILE *stderr;









extern int remove (__const char *__filename) throw ();

extern int rename (__const char *__old, __const char *__new) throw ();




extern int renameat (int __oldfd, __const char *__old, int __newfd,
       __const char *__new) throw ();








extern FILE *tmpfile (void) ;
# 184 "/usr/include/stdio.h" 3 4
extern FILE *tmpfile64 (void) ;



extern char *tmpnam (char *__s) throw () ;





extern char *tmpnam_r (char *__s) throw () ;
# 206 "/usr/include/stdio.h" 3 4
extern char *tempnam (__const char *__dir, __const char *__pfx)
     throw () __attribute__ ((__malloc__)) ;








extern int fclose (FILE *__stream);




extern int fflush (FILE *__stream);

# 231 "/usr/include/stdio.h" 3 4
extern int fflush_unlocked (FILE *__stream);
# 241 "/usr/include/stdio.h" 3 4
extern int fcloseall (void);









extern FILE *fopen (__const char *__restrict __filename,
      __const char *__restrict __modes) ;




extern FILE *freopen (__const char *__restrict __filename,
        __const char *__restrict __modes,
        FILE *__restrict __stream) ;
# 274 "/usr/include/stdio.h" 3 4


extern FILE *fopen64 (__const char *__restrict __filename,
        __const char *__restrict __modes) ;
extern FILE *freopen64 (__const char *__restrict __filename,
   __const char *__restrict __modes,
   FILE *__restrict __stream) ;




extern FILE *fdopen (int __fd, __const char *__modes) throw () ;





extern FILE *fopencookie (void *__restrict __magic_cookie,
     __const char *__restrict __modes,
     _IO_cookie_io_functions_t __io_funcs) throw () ;




extern FILE *fmemopen (void *__s, size_t __len, __const char *__modes)
  throw () ;




extern FILE *open_memstream (char **__bufloc, size_t *__sizeloc) throw () ;






extern void setbuf (FILE *__restrict __stream, char *__restrict __buf) throw ();



extern int setvbuf (FILE *__restrict __stream, char *__restrict __buf,
      int __modes, size_t __n) throw ();





extern void setbuffer (FILE *__restrict __stream, char *__restrict __buf,
         size_t __size) throw ();


extern void setlinebuf (FILE *__stream) throw ();








extern int fprintf (FILE *__restrict __stream,
      __const char *__restrict __format, ...);




extern int printf (__const char *__restrict __format, ...);

extern int sprintf (char *__restrict __s,
      __const char *__restrict __format, ...) throw ();





extern int vfprintf (FILE *__restrict __s, __const char *__restrict __format,
       __gnuc_va_list __arg);




extern int vprintf (__const char *__restrict __format, __gnuc_va_list __arg);

extern int vsprintf (char *__restrict __s, __const char *__restrict __format,
       __gnuc_va_list __arg) throw ();





extern int snprintf (char *__restrict __s, size_t __maxlen,
       __const char *__restrict __format, ...)
     throw () __attribute__ ((__format__ (__printf__, 3, 4)));

extern int vsnprintf (char *__restrict __s, size_t __maxlen,
        __const char *__restrict __format, __gnuc_va_list __arg)
     throw () __attribute__ ((__format__ (__printf__, 3, 0)));






extern int vasprintf (char **__restrict __ptr, __const char *__restrict __f,
        __gnuc_va_list __arg)
     throw () __attribute__ ((__format__ (__printf__, 2, 0))) ;
extern int __asprintf (char **__restrict __ptr,
         __const char *__restrict __fmt, ...)
     throw () __attribute__ ((__format__ (__printf__, 2, 3))) ;
extern int asprintf (char **__restrict __ptr,
       __const char *__restrict __fmt, ...)
     throw () __attribute__ ((__format__ (__printf__, 2, 3))) ;
# 396 "/usr/include/stdio.h" 3 4
extern int vdprintf (int __fd, __const char *__restrict __fmt,
       __gnuc_va_list __arg)
     __attribute__ ((__format__ (__printf__, 2, 0)));
extern int dprintf (int __fd, __const char *__restrict __fmt, ...)
     __attribute__ ((__format__ (__printf__, 2, 3)));








extern int fscanf (FILE *__restrict __stream,
     __const char *__restrict __format, ...) ;




extern int scanf (__const char *__restrict __format, ...) ;

extern int sscanf (__const char *__restrict __s,
     __const char *__restrict __format, ...) throw ();
# 447 "/usr/include/stdio.h" 3 4








extern int vfscanf (FILE *__restrict __s, __const char *__restrict __format,
      __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 2, 0))) ;





extern int vscanf (__const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 1, 0))) ;


extern int vsscanf (__const char *__restrict __s,
      __const char *__restrict __format, __gnuc_va_list __arg)
     throw () __attribute__ ((__format__ (__scanf__, 2, 0)));
# 506 "/usr/include/stdio.h" 3 4









extern int fgetc (FILE *__stream);
extern int getc (FILE *__stream);





extern int getchar (void);

# 534 "/usr/include/stdio.h" 3 4
extern int getc_unlocked (FILE *__stream);
extern int getchar_unlocked (void);
# 545 "/usr/include/stdio.h" 3 4
extern int fgetc_unlocked (FILE *__stream);











extern int fputc (int __c, FILE *__stream);
extern int putc (int __c, FILE *__stream);





extern int putchar (int __c);

# 578 "/usr/include/stdio.h" 3 4
extern int fputc_unlocked (int __c, FILE *__stream);







extern int putc_unlocked (int __c, FILE *__stream);
extern int putchar_unlocked (int __c);






extern int getw (FILE *__stream);


extern int putw (int __w, FILE *__stream);








extern char *fgets (char *__restrict __s, int __n, FILE *__restrict __stream)
     ;






extern char *gets (char *__s) ;

# 624 "/usr/include/stdio.h" 3 4
extern char *fgets_unlocked (char *__restrict __s, int __n,
        FILE *__restrict __stream) ;
# 640 "/usr/include/stdio.h" 3 4
extern __ssize_t __getdelim (char **__restrict __lineptr,
          size_t *__restrict __n, int __delimiter,
          FILE *__restrict __stream) ;
extern __ssize_t getdelim (char **__restrict __lineptr,
        size_t *__restrict __n, int __delimiter,
        FILE *__restrict __stream) ;







extern __ssize_t getline (char **__restrict __lineptr,
       size_t *__restrict __n,
       FILE *__restrict __stream) ;








extern int fputs (__const char *__restrict __s, FILE *__restrict __stream);





extern int puts (__const char *__s);






extern int ungetc (int __c, FILE *__stream);






extern size_t fread (void *__restrict __ptr, size_t __size,
       size_t __n, FILE *__restrict __stream) ;




extern size_t fwrite (__const void *__restrict __ptr, size_t __size,
        size_t __n, FILE *__restrict __s) ;

# 701 "/usr/include/stdio.h" 3 4
extern int fputs_unlocked (__const char *__restrict __s,
      FILE *__restrict __stream);
# 712 "/usr/include/stdio.h" 3 4
extern size_t fread_unlocked (void *__restrict __ptr, size_t __size,
         size_t __n, FILE *__restrict __stream) ;
extern size_t fwrite_unlocked (__const void *__restrict __ptr, size_t __size,
          size_t __n, FILE *__restrict __stream) ;








extern int fseek (FILE *__stream, long int __off, int __whence);




extern long int ftell (FILE *__stream) ;




extern void rewind (FILE *__stream);

# 748 "/usr/include/stdio.h" 3 4
extern int fseeko (FILE *__stream, __off_t __off, int __whence);




extern __off_t ftello (FILE *__stream) ;
# 767 "/usr/include/stdio.h" 3 4






extern int fgetpos (FILE *__restrict __stream, fpos_t *__restrict __pos);




extern int fsetpos (FILE *__stream, __const fpos_t *__pos);
# 790 "/usr/include/stdio.h" 3 4



extern int fseeko64 (FILE *__stream, __off64_t __off, int __whence);
extern __off64_t ftello64 (FILE *__stream) ;
extern int fgetpos64 (FILE *__restrict __stream, fpos64_t *__restrict __pos);
extern int fsetpos64 (FILE *__stream, __const fpos64_t *__pos);




extern void clearerr (FILE *__stream) throw ();

extern int feof (FILE *__stream) throw () ;

extern int ferror (FILE *__stream) throw () ;




extern void clearerr_unlocked (FILE *__stream) throw ();
extern int feof_unlocked (FILE *__stream) throw () ;
extern int ferror_unlocked (FILE *__stream) throw () ;








extern void perror (__const char *__s);






# 1 "/usr/include/bits/sys_errlist.h" 1 3 4
# 27 "/usr/include/bits/sys_errlist.h" 3 4
extern int sys_nerr;
extern __const char *__const sys_errlist[];


extern int _sys_nerr;
extern __const char *__const _sys_errlist[];
# 829 "/usr/include/stdio.h" 2 3 4




extern int fileno (FILE *__stream) throw () ;




extern int fileno_unlocked (FILE *__stream) throw () ;
# 848 "/usr/include/stdio.h" 3 4
extern FILE *popen (__const char *__command, __const char *__modes) ;





extern int pclose (FILE *__stream);





extern char *ctermid (char *__s) throw ();





extern char *cuserid (char *__s);




struct obstack;


extern int obstack_printf (struct obstack *__restrict __obstack,
      __const char *__restrict __format, ...)
     throw () __attribute__ ((__format__ (__printf__, 2, 3)));
extern int obstack_vprintf (struct obstack *__restrict __obstack,
       __const char *__restrict __format,
       __gnuc_va_list __args)
     throw () __attribute__ ((__format__ (__printf__, 2, 0)));







extern void flockfile (FILE *__stream) throw ();



extern int ftrylockfile (FILE *__stream) throw () ;


extern void funlockfile (FILE *__stream) throw ();
# 918 "/usr/include/stdio.h" 3 4
}
# 17 "lte_utils.h" 2
# 1 "/usr/include/stdlib.h" 1 3 4
# 33 "/usr/include/stdlib.h" 3 4
# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/lib64/gcc/x86_64-suse-linux/4.9.2/include/stddef.h" 1 3 4
# 34 "/usr/include/stdlib.h" 2 3 4

extern "C" {






# 1 "/usr/include/bits/waitflags.h" 1 3 4
# 43 "/usr/include/stdlib.h" 2 3 4
# 1 "/usr/include/bits/waitstatus.h" 1 3 4
# 67 "/usr/include/bits/waitstatus.h" 3 4
union wait
  {
    int w_status;
    struct
      {

 unsigned int __w_termsig:7;
 unsigned int __w_coredump:1;
 unsigned int __w_retcode:8;
 unsigned int:16;







      } __wait_terminated;
    struct
      {

 unsigned int __w_stopval:8;
 unsigned int __w_stopsig:8;
 unsigned int:16;






      } __wait_stopped;
  };
# 44 "/usr/include/stdlib.h" 2 3 4
# 96 "/usr/include/stdlib.h" 3 4


typedef struct
  {
    int quot;
    int rem;
  } div_t;



typedef struct
  {
    long int quot;
    long int rem;
  } ldiv_t;







__extension__ typedef struct
  {
    long long int quot;
    long long int rem;
  } lldiv_t;


# 140 "/usr/include/stdlib.h" 3 4
extern size_t __ctype_get_mb_cur_max (void) throw () ;




extern double atof (__const char *__nptr)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;

extern int atoi (__const char *__nptr)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;

extern long int atol (__const char *__nptr)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;





__extension__ extern long long int atoll (__const char *__nptr)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;





extern double strtod (__const char *__restrict __nptr,
        char **__restrict __endptr)
     throw () __attribute__ ((__nonnull__ (1))) ;





extern float strtof (__const char *__restrict __nptr,
       char **__restrict __endptr) throw () __attribute__ ((__nonnull__ (1))) ;

extern long double strtold (__const char *__restrict __nptr,
       char **__restrict __endptr)
     throw () __attribute__ ((__nonnull__ (1))) ;





extern long int strtol (__const char *__restrict __nptr,
   char **__restrict __endptr, int __base)
     throw () __attribute__ ((__nonnull__ (1))) ;

extern unsigned long int strtoul (__const char *__restrict __nptr,
      char **__restrict __endptr, int __base)
     throw () __attribute__ ((__nonnull__ (1))) ;




__extension__
extern long long int strtoq (__const char *__restrict __nptr,
        char **__restrict __endptr, int __base)
     throw () __attribute__ ((__nonnull__ (1))) ;

__extension__
extern unsigned long long int strtouq (__const char *__restrict __nptr,
           char **__restrict __endptr, int __base)
     throw () __attribute__ ((__nonnull__ (1))) ;





__extension__
extern long long int strtoll (__const char *__restrict __nptr,
         char **__restrict __endptr, int __base)
     throw () __attribute__ ((__nonnull__ (1))) ;

__extension__
extern unsigned long long int strtoull (__const char *__restrict __nptr,
     char **__restrict __endptr, int __base)
     throw () __attribute__ ((__nonnull__ (1))) ;

# 240 "/usr/include/stdlib.h" 3 4
extern long int strtol_l (__const char *__restrict __nptr,
     char **__restrict __endptr, int __base,
     __locale_t __loc) throw () __attribute__ ((__nonnull__ (1, 4))) ;

extern unsigned long int strtoul_l (__const char *__restrict __nptr,
        char **__restrict __endptr,
        int __base, __locale_t __loc)
     throw () __attribute__ ((__nonnull__ (1, 4))) ;

__extension__
extern long long int strtoll_l (__const char *__restrict __nptr,
    char **__restrict __endptr, int __base,
    __locale_t __loc)
     throw () __attribute__ ((__nonnull__ (1, 4))) ;

__extension__
extern unsigned long long int strtoull_l (__const char *__restrict __nptr,
       char **__restrict __endptr,
       int __base, __locale_t __loc)
     throw () __attribute__ ((__nonnull__ (1, 4))) ;

extern double strtod_l (__const char *__restrict __nptr,
   char **__restrict __endptr, __locale_t __loc)
     throw () __attribute__ ((__nonnull__ (1, 3))) ;

extern float strtof_l (__const char *__restrict __nptr,
         char **__restrict __endptr, __locale_t __loc)
     throw () __attribute__ ((__nonnull__ (1, 3))) ;

extern long double strtold_l (__const char *__restrict __nptr,
         char **__restrict __endptr,
         __locale_t __loc)
     throw () __attribute__ ((__nonnull__ (1, 3))) ;
# 311 "/usr/include/stdlib.h" 3 4
extern char *l64a (long int __n) throw () ;


extern long int a64l (__const char *__s)
     throw () __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;
# 327 "/usr/include/stdlib.h" 3 4
extern long int random (void) throw ();


extern void srandom (unsigned int __seed) throw ();





extern char *initstate (unsigned int __seed, char *__statebuf,
   size_t __statelen) throw () __attribute__ ((__nonnull__ (2)));



extern char *setstate (char *__statebuf) throw () __attribute__ ((__nonnull__ (1)));







struct random_data
  {
    int32_t *fptr;
    int32_t *rptr;
    int32_t *state;
    int rand_type;
    int rand_deg;
    int rand_sep;
    int32_t *end_ptr;
  };

extern int random_r (struct random_data *__restrict __buf,
       int32_t *__restrict __result) throw () __attribute__ ((__nonnull__ (1, 2)));

extern int srandom_r (unsigned int __seed, struct random_data *__buf)
     throw () __attribute__ ((__nonnull__ (2)));

extern int initstate_r (unsigned int __seed, char *__restrict __statebuf,
   size_t __statelen,
   struct random_data *__restrict __buf)
     throw () __attribute__ ((__nonnull__ (2, 4)));

extern int setstate_r (char *__restrict __statebuf,
         struct random_data *__restrict __buf)
     throw () __attribute__ ((__nonnull__ (1, 2)));






extern int rand (void) throw ();

extern void srand (unsigned int __seed) throw ();




extern int rand_r (unsigned int *__seed) throw ();







extern double drand48 (void) throw ();
extern double erand48 (unsigned short int __xsubi[3]) throw () __attribute__ ((__nonnull__ (1)));


extern long int lrand48 (void) throw ();
extern long int nrand48 (unsigned short int __xsubi[3])
     throw () __attribute__ ((__nonnull__ (1)));


extern long int mrand48 (void) throw ();
extern long int jrand48 (unsigned short int __xsubi[3])
     throw () __attribute__ ((__nonnull__ (1)));


extern void srand48 (long int __seedval) throw ();
extern unsigned short int *seed48 (unsigned short int __seed16v[3])
     throw () __attribute__ ((__nonnull__ (1)));
extern void lcong48 (unsigned short int __param[7]) throw () __attribute__ ((__nonnull__ (1)));





struct drand48_data
  {
    unsigned short int __x[3];
    unsigned short int __old_x[3];
    unsigned short int __c;
    unsigned short int __init;
    unsigned long long int __a;
  };


extern int drand48_r (struct drand48_data *__restrict __buffer,
        double *__restrict __result) throw () __attribute__ ((__nonnull__ (1, 2)));
extern int erand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        double *__restrict __result) throw () __attribute__ ((__nonnull__ (1, 2)));


extern int lrand48_r (struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     throw () __attribute__ ((__nonnull__ (1, 2)));
extern int nrand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern int mrand48_r (struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     throw () __attribute__ ((__nonnull__ (1, 2)));
extern int jrand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern int srand48_r (long int __seedval, struct drand48_data *__buffer)
     throw () __attribute__ ((__nonnull__ (2)));

extern int seed48_r (unsigned short int __seed16v[3],
       struct drand48_data *__buffer) throw () __attribute__ ((__nonnull__ (1, 2)));

extern int lcong48_r (unsigned short int __param[7],
        struct drand48_data *__buffer)
     throw () __attribute__ ((__nonnull__ (1, 2)));









extern void *malloc (size_t __size) throw () __attribute__ ((__malloc__)) ;

extern void *calloc (size_t __nmemb, size_t __size)
     throw () __attribute__ ((__malloc__)) ;










extern void *realloc (void *__ptr, size_t __size)
     throw () __attribute__ ((__warn_unused_result__));

extern void free (void *__ptr) throw ();




extern void cfree (void *__ptr) throw ();



# 1 "/usr/include/alloca.h" 1 3 4
# 25 "/usr/include/alloca.h" 3 4
# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/lib64/gcc/x86_64-suse-linux/4.9.2/include/stddef.h" 1 3 4
# 26 "/usr/include/alloca.h" 2 3 4

extern "C" {





extern void *alloca (size_t __size) throw ();





}
# 498 "/usr/include/stdlib.h" 2 3 4




extern void *valloc (size_t __size) throw () __attribute__ ((__malloc__)) ;




extern int posix_memalign (void **__memptr, size_t __alignment, size_t __size)
     throw () __attribute__ ((__nonnull__ (1))) ;




extern void abort (void) throw () __attribute__ ((__noreturn__));



extern int atexit (void (*__func) (void)) throw () __attribute__ ((__nonnull__ (1)));






extern "C++" int at_quick_exit (void (*__func) (void))
     throw () __asm ("at_quick_exit") __attribute__ ((__nonnull__ (1)));









extern int on_exit (void (*__func) (int __status, void *__arg), void *__arg)
     throw () __attribute__ ((__nonnull__ (1)));






extern void exit (int __status) throw () __attribute__ ((__noreturn__));







extern void quick_exit (int __status) throw () __attribute__ ((__noreturn__));







extern void _Exit (int __status) throw () __attribute__ ((__noreturn__));






extern char *getenv (__const char *__name) throw () __attribute__ ((__nonnull__ (1))) ;




extern char *__secure_getenv (__const char *__name)
     throw () __attribute__ ((__nonnull__ (1))) ;





extern int putenv (char *__string) throw () __attribute__ ((__nonnull__ (1)));





extern int setenv (__const char *__name, __const char *__value, int __replace)
     throw () __attribute__ ((__nonnull__ (2)));


extern int unsetenv (__const char *__name) throw ();






extern int clearenv (void) throw ();
# 604 "/usr/include/stdlib.h" 3 4
extern char *mktemp (char *__template) throw () __attribute__ ((__nonnull__ (1))) ;
# 615 "/usr/include/stdlib.h" 3 4
extern int mkstemp (char *__template) __attribute__ ((__nonnull__ (1))) ;
# 625 "/usr/include/stdlib.h" 3 4
extern int mkstemp64 (char *__template) __attribute__ ((__nonnull__ (1))) ;
# 637 "/usr/include/stdlib.h" 3 4
extern int mkstemps (char *__template, int __suffixlen) __attribute__ ((__nonnull__ (1))) ;
# 647 "/usr/include/stdlib.h" 3 4
extern int mkstemps64 (char *__template, int __suffixlen)
     __attribute__ ((__nonnull__ (1))) ;
# 658 "/usr/include/stdlib.h" 3 4
extern char *mkdtemp (char *__template) throw () __attribute__ ((__nonnull__ (1))) ;
# 669 "/usr/include/stdlib.h" 3 4
extern int mkostemp (char *__template, int __flags) __attribute__ ((__nonnull__ (1))) ;
# 679 "/usr/include/stdlib.h" 3 4
extern int mkostemp64 (char *__template, int __flags) __attribute__ ((__nonnull__ (1))) ;
# 689 "/usr/include/stdlib.h" 3 4
extern int mkostemps (char *__template, int __suffixlen, int __flags)
     __attribute__ ((__nonnull__ (1))) ;
# 701 "/usr/include/stdlib.h" 3 4
extern int mkostemps64 (char *__template, int __suffixlen, int __flags)
     __attribute__ ((__nonnull__ (1))) ;









extern int system (__const char *__command) ;






extern char *canonicalize_file_name (__const char *__name)
     throw () __attribute__ ((__nonnull__ (1))) ;
# 729 "/usr/include/stdlib.h" 3 4
extern char *realpath (__const char *__restrict __name,
         char *__restrict __resolved) throw () ;






typedef int (*__compar_fn_t) (__const void *, __const void *);


typedef __compar_fn_t comparison_fn_t;



typedef int (*__compar_d_fn_t) (__const void *, __const void *, void *);





extern void *bsearch (__const void *__key, __const void *__base,
        size_t __nmemb, size_t __size, __compar_fn_t __compar)
     __attribute__ ((__nonnull__ (1, 2, 5))) ;



extern void qsort (void *__base, size_t __nmemb, size_t __size,
     __compar_fn_t __compar) __attribute__ ((__nonnull__ (1, 4)));

extern void qsort_r (void *__base, size_t __nmemb, size_t __size,
       __compar_d_fn_t __compar, void *__arg)
  __attribute__ ((__nonnull__ (1, 4)));




extern int abs (int __x) throw () __attribute__ ((__const__)) ;
extern long int labs (long int __x) throw () __attribute__ ((__const__)) ;



__extension__ extern long long int llabs (long long int __x)
     throw () __attribute__ ((__const__)) ;







extern div_t div (int __numer, int __denom)
     throw () __attribute__ ((__const__)) ;
extern ldiv_t ldiv (long int __numer, long int __denom)
     throw () __attribute__ ((__const__)) ;




__extension__ extern lldiv_t lldiv (long long int __numer,
        long long int __denom)
     throw () __attribute__ ((__const__)) ;

# 802 "/usr/include/stdlib.h" 3 4
extern char *ecvt (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign) throw () __attribute__ ((__nonnull__ (3, 4))) ;




extern char *fcvt (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign) throw () __attribute__ ((__nonnull__ (3, 4))) ;




extern char *gcvt (double __value, int __ndigit, char *__buf)
     throw () __attribute__ ((__nonnull__ (3))) ;




extern char *qecvt (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign)
     throw () __attribute__ ((__nonnull__ (3, 4))) ;
extern char *qfcvt (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign)
     throw () __attribute__ ((__nonnull__ (3, 4))) ;
extern char *qgcvt (long double __value, int __ndigit, char *__buf)
     throw () __attribute__ ((__nonnull__ (3))) ;




extern int ecvt_r (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign, char *__restrict __buf,
     size_t __len) throw () __attribute__ ((__nonnull__ (3, 4, 5)));
extern int fcvt_r (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign, char *__restrict __buf,
     size_t __len) throw () __attribute__ ((__nonnull__ (3, 4, 5)));

extern int qecvt_r (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign,
      char *__restrict __buf, size_t __len)
     throw () __attribute__ ((__nonnull__ (3, 4, 5)));
extern int qfcvt_r (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign,
      char *__restrict __buf, size_t __len)
     throw () __attribute__ ((__nonnull__ (3, 4, 5)));







extern int mblen (__const char *__s, size_t __n) throw () ;


extern int mbtowc (wchar_t *__restrict __pwc,
     __const char *__restrict __s, size_t __n) throw () ;


extern int wctomb (char *__s, wchar_t __wchar) throw () ;



extern size_t mbstowcs (wchar_t *__restrict __pwcs,
   __const char *__restrict __s, size_t __n) throw ();

extern size_t wcstombs (char *__restrict __s,
   __const wchar_t *__restrict __pwcs, size_t __n)
     throw ();








extern int rpmatch (__const char *__response) throw () __attribute__ ((__nonnull__ (1))) ;
# 890 "/usr/include/stdlib.h" 3 4
extern int getsubopt (char **__restrict __optionp,
        char *__const *__restrict __tokens,
        char **__restrict __valuep)
     throw () __attribute__ ((__nonnull__ (1, 2, 3))) ;





extern void setkey (__const char *__key) throw () __attribute__ ((__nonnull__ (1)));







extern int posix_openpt (int __oflag) ;







extern int grantpt (int __fd) throw ();



extern int unlockpt (int __fd) throw ();




extern char *ptsname (int __fd) throw () ;






extern int ptsname_r (int __fd, char *__buf, size_t __buflen)
     throw () __attribute__ ((__nonnull__ (2)));


extern int getpt (void);






extern int getloadavg (double __loadavg[], int __nelem)
     throw () __attribute__ ((__nonnull__ (1)));
# 958 "/usr/include/stdlib.h" 3 4
}
# 18 "lte_utils.h" 2
# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/lib64/gcc/x86_64-suse-linux/4.9.2/include/stdarg.h" 1 3 4
# 19 "lte_utils.h" 2

# 1 "/usr/include/unistd.h" 1 3 4
# 28 "/usr/include/unistd.h" 3 4
extern "C" {
# 203 "/usr/include/unistd.h" 3 4
# 1 "/usr/include/bits/posix_opt.h" 1 3 4
# 204 "/usr/include/unistd.h" 2 3 4



# 1 "/usr/include/bits/environments.h" 1 3 4
# 23 "/usr/include/bits/environments.h" 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 24 "/usr/include/bits/environments.h" 2 3 4
# 208 "/usr/include/unistd.h" 2 3 4
# 227 "/usr/include/unistd.h" 3 4
# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/lib64/gcc/x86_64-suse-linux/4.9.2/include/stddef.h" 1 3 4
# 228 "/usr/include/unistd.h" 2 3 4
# 275 "/usr/include/unistd.h" 3 4
typedef __socklen_t socklen_t;
# 288 "/usr/include/unistd.h" 3 4
extern int access (__const char *__name, int __type) throw () __attribute__ ((__nonnull__ (1)));




extern int euidaccess (__const char *__name, int __type)
     throw () __attribute__ ((__nonnull__ (1)));


extern int eaccess (__const char *__name, int __type)
     throw () __attribute__ ((__nonnull__ (1)));






extern int faccessat (int __fd, __const char *__file, int __type, int __flag)
     throw () __attribute__ ((__nonnull__ (2))) ;
# 331 "/usr/include/unistd.h" 3 4
extern __off_t lseek (int __fd, __off_t __offset, int __whence) throw ();
# 342 "/usr/include/unistd.h" 3 4
extern __off64_t lseek64 (int __fd, __off64_t __offset, int __whence)
     throw ();






extern int close (int __fd);






extern ssize_t read (int __fd, void *__buf, size_t __nbytes) ;





extern ssize_t write (int __fd, __const void *__buf, size_t __n) ;
# 373 "/usr/include/unistd.h" 3 4
extern ssize_t pread (int __fd, void *__buf, size_t __nbytes,
        __off_t __offset) ;






extern ssize_t pwrite (int __fd, __const void *__buf, size_t __n,
         __off_t __offset) ;
# 401 "/usr/include/unistd.h" 3 4
extern ssize_t pread64 (int __fd, void *__buf, size_t __nbytes,
   __off64_t __offset) ;


extern ssize_t pwrite64 (int __fd, __const void *__buf, size_t __n,
    __off64_t __offset) ;







extern int pipe (int __pipedes[2]) throw () ;




extern int pipe2 (int __pipedes[2], int __flags) throw () ;
# 429 "/usr/include/unistd.h" 3 4
extern unsigned int alarm (unsigned int __seconds) throw ();
# 441 "/usr/include/unistd.h" 3 4
extern unsigned int sleep (unsigned int __seconds);






extern __useconds_t ualarm (__useconds_t __value, __useconds_t __interval)
     throw ();






extern int usleep (__useconds_t __useconds);
# 465 "/usr/include/unistd.h" 3 4
extern int pause (void);



extern int chown (__const char *__file, __uid_t __owner, __gid_t __group)
     throw () __attribute__ ((__nonnull__ (1))) ;



extern int fchown (int __fd, __uid_t __owner, __gid_t __group) throw () ;




extern int lchown (__const char *__file, __uid_t __owner, __gid_t __group)
     throw () __attribute__ ((__nonnull__ (1))) ;






extern int fchownat (int __fd, __const char *__file, __uid_t __owner,
       __gid_t __group, int __flag)
     throw () __attribute__ ((__nonnull__ (2))) ;



extern int chdir (__const char *__path) throw () __attribute__ ((__nonnull__ (1))) ;



extern int fchdir (int __fd) throw () ;
# 507 "/usr/include/unistd.h" 3 4
extern char *getcwd (char *__buf, size_t __size) throw () ;





extern char *get_current_dir_name (void) throw ();






extern char *getwd (char *__buf)
     throw () __attribute__ ((__nonnull__ (1))) __attribute__ ((__deprecated__)) ;




extern int dup (int __fd) throw () ;


extern int dup2 (int __fd, int __fd2) throw ();




extern int dup3 (int __fd, int __fd2, int __flags) throw ();



extern char **__environ;

extern char **environ;





extern int execve (__const char *__path, char *__const __argv[],
     char *__const __envp[]) throw () __attribute__ ((__nonnull__ (1)));




extern int fexecve (int __fd, char *__const __argv[], char *__const __envp[])
     throw ();




extern int execv (__const char *__path, char *__const __argv[])
     throw () __attribute__ ((__nonnull__ (1)));



extern int execle (__const char *__path, __const char *__arg, ...)
     throw () __attribute__ ((__nonnull__ (1)));



extern int execl (__const char *__path, __const char *__arg, ...)
     throw () __attribute__ ((__nonnull__ (1)));



extern int execvp (__const char *__file, char *__const __argv[])
     throw () __attribute__ ((__nonnull__ (1)));




extern int execlp (__const char *__file, __const char *__arg, ...)
     throw () __attribute__ ((__nonnull__ (1)));




extern int execvpe (__const char *__file, char *__const __argv[],
      char *__const __envp[])
     throw () __attribute__ ((__nonnull__ (1)));





extern int nice (int __inc) throw () ;




extern void _exit (int __status) __attribute__ ((__noreturn__));





# 1 "/usr/include/bits/confname.h" 1 3 4
# 26 "/usr/include/bits/confname.h" 3 4
enum
  {
    _PC_LINK_MAX,

    _PC_MAX_CANON,

    _PC_MAX_INPUT,

    _PC_NAME_MAX,

    _PC_PATH_MAX,

    _PC_PIPE_BUF,

    _PC_CHOWN_RESTRICTED,

    _PC_NO_TRUNC,

    _PC_VDISABLE,

    _PC_SYNC_IO,

    _PC_ASYNC_IO,

    _PC_PRIO_IO,

    _PC_SOCK_MAXBUF,

    _PC_FILESIZEBITS,

    _PC_REC_INCR_XFER_SIZE,

    _PC_REC_MAX_XFER_SIZE,

    _PC_REC_MIN_XFER_SIZE,

    _PC_REC_XFER_ALIGN,

    _PC_ALLOC_SIZE_MIN,

    _PC_SYMLINK_MAX,

    _PC_2_SYMLINKS

  };


enum
  {
    _SC_ARG_MAX,

    _SC_CHILD_MAX,

    _SC_CLK_TCK,

    _SC_NGROUPS_MAX,

    _SC_OPEN_MAX,

    _SC_STREAM_MAX,

    _SC_TZNAME_MAX,

    _SC_JOB_CONTROL,

    _SC_SAVED_IDS,

    _SC_REALTIME_SIGNALS,

    _SC_PRIORITY_SCHEDULING,

    _SC_TIMERS,

    _SC_ASYNCHRONOUS_IO,

    _SC_PRIORITIZED_IO,

    _SC_SYNCHRONIZED_IO,

    _SC_FSYNC,

    _SC_MAPPED_FILES,

    _SC_MEMLOCK,

    _SC_MEMLOCK_RANGE,

    _SC_MEMORY_PROTECTION,

    _SC_MESSAGE_PASSING,

    _SC_SEMAPHORES,

    _SC_SHARED_MEMORY_OBJECTS,

    _SC_AIO_LISTIO_MAX,

    _SC_AIO_MAX,

    _SC_AIO_PRIO_DELTA_MAX,

    _SC_DELAYTIMER_MAX,

    _SC_MQ_OPEN_MAX,

    _SC_MQ_PRIO_MAX,

    _SC_VERSION,

    _SC_PAGESIZE,


    _SC_RTSIG_MAX,

    _SC_SEM_NSEMS_MAX,

    _SC_SEM_VALUE_MAX,

    _SC_SIGQUEUE_MAX,

    _SC_TIMER_MAX,




    _SC_BC_BASE_MAX,

    _SC_BC_DIM_MAX,

    _SC_BC_SCALE_MAX,

    _SC_BC_STRING_MAX,

    _SC_COLL_WEIGHTS_MAX,

    _SC_EQUIV_CLASS_MAX,

    _SC_EXPR_NEST_MAX,

    _SC_LINE_MAX,

    _SC_RE_DUP_MAX,

    _SC_CHARCLASS_NAME_MAX,


    _SC_2_VERSION,

    _SC_2_C_BIND,

    _SC_2_C_DEV,

    _SC_2_FORT_DEV,

    _SC_2_FORT_RUN,

    _SC_2_SW_DEV,

    _SC_2_LOCALEDEF,


    _SC_PII,

    _SC_PII_XTI,

    _SC_PII_SOCKET,

    _SC_PII_INTERNET,

    _SC_PII_OSI,

    _SC_POLL,

    _SC_SELECT,

    _SC_UIO_MAXIOV,

    _SC_IOV_MAX = _SC_UIO_MAXIOV,

    _SC_PII_INTERNET_STREAM,

    _SC_PII_INTERNET_DGRAM,

    _SC_PII_OSI_COTS,

    _SC_PII_OSI_CLTS,

    _SC_PII_OSI_M,

    _SC_T_IOV_MAX,



    _SC_THREADS,

    _SC_THREAD_SAFE_FUNCTIONS,

    _SC_GETGR_R_SIZE_MAX,

    _SC_GETPW_R_SIZE_MAX,

    _SC_LOGIN_NAME_MAX,

    _SC_TTY_NAME_MAX,

    _SC_THREAD_DESTRUCTOR_ITERATIONS,

    _SC_THREAD_KEYS_MAX,

    _SC_THREAD_STACK_MIN,

    _SC_THREAD_THREADS_MAX,

    _SC_THREAD_ATTR_STACKADDR,

    _SC_THREAD_ATTR_STACKSIZE,

    _SC_THREAD_PRIORITY_SCHEDULING,

    _SC_THREAD_PRIO_INHERIT,

    _SC_THREAD_PRIO_PROTECT,

    _SC_THREAD_PROCESS_SHARED,


    _SC_NPROCESSORS_CONF,

    _SC_NPROCESSORS_ONLN,

    _SC_PHYS_PAGES,

    _SC_AVPHYS_PAGES,

    _SC_ATEXIT_MAX,

    _SC_PASS_MAX,


    _SC_XOPEN_VERSION,

    _SC_XOPEN_XCU_VERSION,

    _SC_XOPEN_UNIX,

    _SC_XOPEN_CRYPT,

    _SC_XOPEN_ENH_I18N,

    _SC_XOPEN_SHM,


    _SC_2_CHAR_TERM,

    _SC_2_C_VERSION,

    _SC_2_UPE,


    _SC_XOPEN_XPG2,

    _SC_XOPEN_XPG3,

    _SC_XOPEN_XPG4,


    _SC_CHAR_BIT,

    _SC_CHAR_MAX,

    _SC_CHAR_MIN,

    _SC_INT_MAX,

    _SC_INT_MIN,

    _SC_LONG_BIT,

    _SC_WORD_BIT,

    _SC_MB_LEN_MAX,

    _SC_NZERO,

    _SC_SSIZE_MAX,

    _SC_SCHAR_MAX,

    _SC_SCHAR_MIN,

    _SC_SHRT_MAX,

    _SC_SHRT_MIN,

    _SC_UCHAR_MAX,

    _SC_UINT_MAX,

    _SC_ULONG_MAX,

    _SC_USHRT_MAX,


    _SC_NL_ARGMAX,

    _SC_NL_LANGMAX,

    _SC_NL_MSGMAX,

    _SC_NL_NMAX,

    _SC_NL_SETMAX,

    _SC_NL_TEXTMAX,


    _SC_XBS5_ILP32_OFF32,

    _SC_XBS5_ILP32_OFFBIG,

    _SC_XBS5_LP64_OFF64,

    _SC_XBS5_LPBIG_OFFBIG,


    _SC_XOPEN_LEGACY,

    _SC_XOPEN_REALTIME,

    _SC_XOPEN_REALTIME_THREADS,


    _SC_ADVISORY_INFO,

    _SC_BARRIERS,

    _SC_BASE,

    _SC_C_LANG_SUPPORT,

    _SC_C_LANG_SUPPORT_R,

    _SC_CLOCK_SELECTION,

    _SC_CPUTIME,

    _SC_THREAD_CPUTIME,

    _SC_DEVICE_IO,

    _SC_DEVICE_SPECIFIC,

    _SC_DEVICE_SPECIFIC_R,

    _SC_FD_MGMT,

    _SC_FIFO,

    _SC_PIPE,

    _SC_FILE_ATTRIBUTES,

    _SC_FILE_LOCKING,

    _SC_FILE_SYSTEM,

    _SC_MONOTONIC_CLOCK,

    _SC_MULTI_PROCESS,

    _SC_SINGLE_PROCESS,

    _SC_NETWORKING,

    _SC_READER_WRITER_LOCKS,

    _SC_SPIN_LOCKS,

    _SC_REGEXP,

    _SC_REGEX_VERSION,

    _SC_SHELL,

    _SC_SIGNALS,

    _SC_SPAWN,

    _SC_SPORADIC_SERVER,

    _SC_THREAD_SPORADIC_SERVER,

    _SC_SYSTEM_DATABASE,

    _SC_SYSTEM_DATABASE_R,

    _SC_TIMEOUTS,

    _SC_TYPED_MEMORY_OBJECTS,

    _SC_USER_GROUPS,

    _SC_USER_GROUPS_R,

    _SC_2_PBS,

    _SC_2_PBS_ACCOUNTING,

    _SC_2_PBS_LOCATE,

    _SC_2_PBS_MESSAGE,

    _SC_2_PBS_TRACK,

    _SC_SYMLOOP_MAX,

    _SC_STREAMS,

    _SC_2_PBS_CHECKPOINT,


    _SC_V6_ILP32_OFF32,

    _SC_V6_ILP32_OFFBIG,

    _SC_V6_LP64_OFF64,

    _SC_V6_LPBIG_OFFBIG,


    _SC_HOST_NAME_MAX,

    _SC_TRACE,

    _SC_TRACE_EVENT_FILTER,

    _SC_TRACE_INHERIT,

    _SC_TRACE_LOG,


    _SC_LEVEL1_ICACHE_SIZE,

    _SC_LEVEL1_ICACHE_ASSOC,

    _SC_LEVEL1_ICACHE_LINESIZE,

    _SC_LEVEL1_DCACHE_SIZE,

    _SC_LEVEL1_DCACHE_ASSOC,

    _SC_LEVEL1_DCACHE_LINESIZE,

    _SC_LEVEL2_CACHE_SIZE,

    _SC_LEVEL2_CACHE_ASSOC,

    _SC_LEVEL2_CACHE_LINESIZE,

    _SC_LEVEL3_CACHE_SIZE,

    _SC_LEVEL3_CACHE_ASSOC,

    _SC_LEVEL3_CACHE_LINESIZE,

    _SC_LEVEL4_CACHE_SIZE,

    _SC_LEVEL4_CACHE_ASSOC,

    _SC_LEVEL4_CACHE_LINESIZE,



    _SC_IPV6 = _SC_LEVEL1_ICACHE_SIZE + 50,

    _SC_RAW_SOCKETS,


    _SC_V7_ILP32_OFF32,

    _SC_V7_ILP32_OFFBIG,

    _SC_V7_LP64_OFF64,

    _SC_V7_LPBIG_OFFBIG,


    _SC_SS_REPL_MAX,


    _SC_TRACE_EVENT_NAME_MAX,

    _SC_TRACE_NAME_MAX,

    _SC_TRACE_SYS_MAX,

    _SC_TRACE_USER_EVENT_MAX,


    _SC_XOPEN_STREAMS,


    _SC_THREAD_ROBUST_PRIO_INHERIT,

    _SC_THREAD_ROBUST_PRIO_PROTECT

  };


enum
  {
    _CS_PATH,


    _CS_V6_WIDTH_RESTRICTED_ENVS,



    _CS_GNU_LIBC_VERSION,

    _CS_GNU_LIBPTHREAD_VERSION,


    _CS_V5_WIDTH_RESTRICTED_ENVS,



    _CS_V7_WIDTH_RESTRICTED_ENVS,



    _CS_LFS_CFLAGS = 1000,

    _CS_LFS_LDFLAGS,

    _CS_LFS_LIBS,

    _CS_LFS_LINTFLAGS,

    _CS_LFS64_CFLAGS,

    _CS_LFS64_LDFLAGS,

    _CS_LFS64_LIBS,

    _CS_LFS64_LINTFLAGS,


    _CS_XBS5_ILP32_OFF32_CFLAGS = 1100,

    _CS_XBS5_ILP32_OFF32_LDFLAGS,

    _CS_XBS5_ILP32_OFF32_LIBS,

    _CS_XBS5_ILP32_OFF32_LINTFLAGS,

    _CS_XBS5_ILP32_OFFBIG_CFLAGS,

    _CS_XBS5_ILP32_OFFBIG_LDFLAGS,

    _CS_XBS5_ILP32_OFFBIG_LIBS,

    _CS_XBS5_ILP32_OFFBIG_LINTFLAGS,

    _CS_XBS5_LP64_OFF64_CFLAGS,

    _CS_XBS5_LP64_OFF64_LDFLAGS,

    _CS_XBS5_LP64_OFF64_LIBS,

    _CS_XBS5_LP64_OFF64_LINTFLAGS,

    _CS_XBS5_LPBIG_OFFBIG_CFLAGS,

    _CS_XBS5_LPBIG_OFFBIG_LDFLAGS,

    _CS_XBS5_LPBIG_OFFBIG_LIBS,

    _CS_XBS5_LPBIG_OFFBIG_LINTFLAGS,


    _CS_POSIX_V6_ILP32_OFF32_CFLAGS,

    _CS_POSIX_V6_ILP32_OFF32_LDFLAGS,

    _CS_POSIX_V6_ILP32_OFF32_LIBS,

    _CS_POSIX_V6_ILP32_OFF32_LINTFLAGS,

    _CS_POSIX_V6_ILP32_OFFBIG_CFLAGS,

    _CS_POSIX_V6_ILP32_OFFBIG_LDFLAGS,

    _CS_POSIX_V6_ILP32_OFFBIG_LIBS,

    _CS_POSIX_V6_ILP32_OFFBIG_LINTFLAGS,

    _CS_POSIX_V6_LP64_OFF64_CFLAGS,

    _CS_POSIX_V6_LP64_OFF64_LDFLAGS,

    _CS_POSIX_V6_LP64_OFF64_LIBS,

    _CS_POSIX_V6_LP64_OFF64_LINTFLAGS,

    _CS_POSIX_V6_LPBIG_OFFBIG_CFLAGS,

    _CS_POSIX_V6_LPBIG_OFFBIG_LDFLAGS,

    _CS_POSIX_V6_LPBIG_OFFBIG_LIBS,

    _CS_POSIX_V6_LPBIG_OFFBIG_LINTFLAGS,


    _CS_POSIX_V7_ILP32_OFF32_CFLAGS,

    _CS_POSIX_V7_ILP32_OFF32_LDFLAGS,

    _CS_POSIX_V7_ILP32_OFF32_LIBS,

    _CS_POSIX_V7_ILP32_OFF32_LINTFLAGS,

    _CS_POSIX_V7_ILP32_OFFBIG_CFLAGS,

    _CS_POSIX_V7_ILP32_OFFBIG_LDFLAGS,

    _CS_POSIX_V7_ILP32_OFFBIG_LIBS,

    _CS_POSIX_V7_ILP32_OFFBIG_LINTFLAGS,

    _CS_POSIX_V7_LP64_OFF64_CFLAGS,

    _CS_POSIX_V7_LP64_OFF64_LDFLAGS,

    _CS_POSIX_V7_LP64_OFF64_LIBS,

    _CS_POSIX_V7_LP64_OFF64_LINTFLAGS,

    _CS_POSIX_V7_LPBIG_OFFBIG_CFLAGS,

    _CS_POSIX_V7_LPBIG_OFFBIG_LDFLAGS,

    _CS_POSIX_V7_LPBIG_OFFBIG_LIBS,

    _CS_POSIX_V7_LPBIG_OFFBIG_LINTFLAGS

  };
# 605 "/usr/include/unistd.h" 2 3 4


extern long int pathconf (__const char *__path, int __name)
     throw () __attribute__ ((__nonnull__ (1)));


extern long int fpathconf (int __fd, int __name) throw ();


extern long int sysconf (int __name) throw ();



extern size_t confstr (int __name, char *__buf, size_t __len) throw ();




extern __pid_t getpid (void) throw ();


extern __pid_t getppid (void) throw ();




extern __pid_t getpgrp (void) throw ();
# 641 "/usr/include/unistd.h" 3 4
extern __pid_t __getpgid (__pid_t __pid) throw ();

extern __pid_t getpgid (__pid_t __pid) throw ();






extern int setpgid (__pid_t __pid, __pid_t __pgid) throw ();
# 667 "/usr/include/unistd.h" 3 4
extern int setpgrp (void) throw ();
# 684 "/usr/include/unistd.h" 3 4
extern __pid_t setsid (void) throw ();



extern __pid_t getsid (__pid_t __pid) throw ();



extern __uid_t getuid (void) throw ();


extern __uid_t geteuid (void) throw ();


extern __gid_t getgid (void) throw ();


extern __gid_t getegid (void) throw ();




extern int getgroups (int __size, __gid_t __list[]) throw () ;



extern int group_member (__gid_t __gid) throw ();






extern int setuid (__uid_t __uid) throw ();




extern int setreuid (__uid_t __ruid, __uid_t __euid) throw ();




extern int seteuid (__uid_t __uid) throw ();






extern int setgid (__gid_t __gid) throw ();




extern int setregid (__gid_t __rgid, __gid_t __egid) throw ();




extern int setegid (__gid_t __gid) throw ();





extern int getresuid (__uid_t *__ruid, __uid_t *__euid, __uid_t *__suid)
     throw ();



extern int getresgid (__gid_t *__rgid, __gid_t *__egid, __gid_t *__sgid)
     throw ();



extern int setresuid (__uid_t __ruid, __uid_t __euid, __uid_t __suid)
     throw ();



extern int setresgid (__gid_t __rgid, __gid_t __egid, __gid_t __sgid)
     throw ();






extern __pid_t fork (void) throw ();






extern __pid_t vfork (void) throw ();





extern char *ttyname (int __fd) throw ();



extern int ttyname_r (int __fd, char *__buf, size_t __buflen)
     throw () __attribute__ ((__nonnull__ (2))) ;



extern int isatty (int __fd) throw ();





extern int ttyslot (void) throw ();




extern int link (__const char *__from, __const char *__to)
     throw () __attribute__ ((__nonnull__ (1, 2))) ;




extern int linkat (int __fromfd, __const char *__from, int __tofd,
     __const char *__to, int __flags)
     throw () __attribute__ ((__nonnull__ (2, 4))) ;




extern int symlink (__const char *__from, __const char *__to)
     throw () __attribute__ ((__nonnull__ (1, 2))) ;




extern ssize_t readlink (__const char *__restrict __path,
    char *__restrict __buf, size_t __len)
     throw () __attribute__ ((__nonnull__ (1, 2))) ;




extern int symlinkat (__const char *__from, int __tofd,
        __const char *__to) throw () __attribute__ ((__nonnull__ (1, 3))) ;


extern ssize_t readlinkat (int __fd, __const char *__restrict __path,
      char *__restrict __buf, size_t __len)
     throw () __attribute__ ((__nonnull__ (2, 3))) ;



extern int unlink (__const char *__name) throw () __attribute__ ((__nonnull__ (1)));



extern int unlinkat (int __fd, __const char *__name, int __flag)
     throw () __attribute__ ((__nonnull__ (2)));



extern int rmdir (__const char *__path) throw () __attribute__ ((__nonnull__ (1)));



extern __pid_t tcgetpgrp (int __fd) throw ();


extern int tcsetpgrp (int __fd, __pid_t __pgrp_id) throw ();






extern char *getlogin (void);







extern int getlogin_r (char *__name, size_t __name_len) __attribute__ ((__nonnull__ (1)));




extern int setlogin (__const char *__name) throw () __attribute__ ((__nonnull__ (1)));
# 887 "/usr/include/unistd.h" 3 4
# 1 "/usr/include/getopt.h" 1 3 4
# 50 "/usr/include/getopt.h" 3 4
extern "C" {
# 59 "/usr/include/getopt.h" 3 4
extern char *optarg;
# 73 "/usr/include/getopt.h" 3 4
extern int optind;




extern int opterr;



extern int optopt;
# 152 "/usr/include/getopt.h" 3 4
extern int getopt (int ___argc, char *const *___argv, const char *__shortopts)
       throw ();
# 187 "/usr/include/getopt.h" 3 4
}
# 888 "/usr/include/unistd.h" 2 3 4







extern int gethostname (char *__name, size_t __len) throw () __attribute__ ((__nonnull__ (1)));






extern int sethostname (__const char *__name, size_t __len)
     throw () __attribute__ ((__nonnull__ (1))) ;



extern int sethostid (long int __id) throw () ;





extern int getdomainname (char *__name, size_t __len)
     throw () __attribute__ ((__nonnull__ (1))) ;
extern int setdomainname (__const char *__name, size_t __len)
     throw () __attribute__ ((__nonnull__ (1))) ;





extern int vhangup (void) throw ();


extern int revoke (__const char *__file) throw () __attribute__ ((__nonnull__ (1))) ;







extern int profil (unsigned short int *__sample_buffer, size_t __size,
     size_t __offset, unsigned int __scale)
     throw () __attribute__ ((__nonnull__ (1)));





extern int acct (__const char *__name) throw ();



extern char *getusershell (void) throw ();
extern void endusershell (void) throw ();
extern void setusershell (void) throw ();





extern int daemon (int __nochdir, int __noclose) throw () ;






extern int chroot (__const char *__path) throw () __attribute__ ((__nonnull__ (1))) ;



extern char *getpass (__const char *__prompt) __attribute__ ((__nonnull__ (1)));
# 973 "/usr/include/unistd.h" 3 4
extern int fsync (int __fd);






extern long int gethostid (void);


extern void sync (void) throw ();




extern int getpagesize (void) throw () __attribute__ ((__const__));




extern int getdtablesize (void) throw ();




extern int truncate (__const char *__file, __off_t __length)
     throw () __attribute__ ((__nonnull__ (1))) ;
# 1010 "/usr/include/unistd.h" 3 4
extern int truncate64 (__const char *__file, __off64_t __length)
     throw () __attribute__ ((__nonnull__ (1))) ;
# 1020 "/usr/include/unistd.h" 3 4
extern int ftruncate (int __fd, __off_t __length) throw () ;
# 1030 "/usr/include/unistd.h" 3 4
extern int ftruncate64 (int __fd, __off64_t __length) throw () ;
# 1040 "/usr/include/unistd.h" 3 4
extern int brk (void *__addr) throw () ;





extern void *sbrk (intptr_t __delta) throw ();
# 1061 "/usr/include/unistd.h" 3 4
extern long int syscall (long int __sysno, ...) throw ();
# 1084 "/usr/include/unistd.h" 3 4
extern int lockf (int __fd, int __cmd, __off_t __len) ;
# 1094 "/usr/include/unistd.h" 3 4
extern int lockf64 (int __fd, int __cmd, __off64_t __len) ;
# 1115 "/usr/include/unistd.h" 3 4
extern int fdatasync (int __fildes);







extern char *crypt (__const char *__key, __const char *__salt)
     throw () __attribute__ ((__nonnull__ (1, 2)));



extern void encrypt (char *__block, int __edflag) throw () __attribute__ ((__nonnull__ (1)));






extern void swab (__const void *__restrict __from, void *__restrict __to,
    ssize_t __n) throw () __attribute__ ((__nonnull__ (1, 2)));







extern char *ctermid (char *__s) throw ();
# 1153 "/usr/include/unistd.h" 3 4
}
# 21 "lte_utils.h" 2
# 59 "lte_utils.h"
extern "C" {
# 79 "lte_utils.h"
void lte_assert(const char* expr, const char* msg, const char* file, int line);
void lte_errx(int err, const char* fmt, ...);
void lte_err_msg(const char* fmt, ...);
void lte_verr_msg(const char* fmt, va_list va);
void lte_warn_msg(const char* fmt, ...);
void lte_vwarn_msg(const char* fmt, va_list va);
void lte_trace(const char* file, int line, const char* fmt, ...);


}



class mktemp_template_t {
   protected:
      char m_tmpfile[4096];
      char* m_tmpfile_basename;

   public:
      mktemp_template_t()
      {
         m_tmpfile_basename = m_tmpfile + 2;
         strcpy(m_tmpfile, "./");
      }
      mktemp_template_t(const char* path, char delim = '/')
      {
         (((path != __null)==0)?lte_assert("path != NULL", 0, "lte_utils.h", 105),((void)(0)):((void)(0)));

         const char* psrc = path;
         for(char* pdst = m_tmpfile; *psrc;)
            if(delim == (*pdst++ = *psrc++))
               m_tmpfile_basename = pdst;

         if(m_tmpfile_basename = m_tmpfile)
         {
            m_tmpfile_basename += 2;
            strcpy(m_tmpfile, "./");
         }
         *m_tmpfile_basename = 0;
      }

      char* mk_template(const char* tmpl = __null)
      {
         size_t length;
         if(tmpl == __null)
         {
            static char tmpl_default[] = "XXXXXX";
            tmpl = tmpl_default;
            length = sizeof(tmpl_default);
         }
         else
         {
            length = strlen(tmpl) + 1;
         }

         size_t path_length = m_tmpfile_basename - m_tmpfile;
         char* p = (char*)malloc(path_length + length);
         (((p != __null)==0)?lte_assert("p != NULL", 0, "lte_utils.h", 136),((void)(0)):((void)(0)));
         memcpy(p, m_tmpfile, path_length);
         memcpy(p + path_length, tmpl, length);
         return p;
      }
};

class tempfile_t {
   protected:
      char* m_fname;

   public:
      tempfile_t() : m_fname(__null) {}
      ~tempfile_t() { clear(); }

      const char* create(mktemp_template_t& tmpl)
      {
         char* fname = tmpl.mk_template();
         if(fname)
         {
          int fd = mkstemp(fname);
          if((fd == -1)) lte_errx(-1, "fail to create temporary file");
          close(fd);
          clear();
         }
         else
         {
           (((fname)==0)?lte_assert("fname", 0, "lte_utils.h", 163),((void)(0)):((void)(0)));
         }
         return (m_fname = fname);
      }
      void clear()
      {
         if(m_fname)
         {
            unlink(m_fname);
            free(m_fname);
            m_fname = __null;
         }
      }

      operator const char* () const { return m_fname; }
};
# 17 "lte_strtab.h" 2
# 1 "lte_portability.h" 1
# 20 "lte_portability.h"
# 1 "/usr/include/sys/stat.h" 1 3 4
# 39 "/usr/include/sys/stat.h" 3 4
# 1 "/usr/include/time.h" 1 3 4
# 40 "/usr/include/sys/stat.h" 2 3 4
# 105 "/usr/include/sys/stat.h" 3 4
extern "C" {

# 1 "/usr/include/bits/stat.h" 1 3 4
# 43 "/usr/include/bits/stat.h" 3 4
struct stat
  {
    __dev_t st_dev;




    __ino_t st_ino;







    __nlink_t st_nlink;
    __mode_t st_mode;

    __uid_t st_uid;
    __gid_t st_gid;

    int __pad0;

    __dev_t st_rdev;




    __off_t st_size;



    __blksize_t st_blksize;

    __blkcnt_t st_blocks;
# 88 "/usr/include/bits/stat.h" 3 4
    struct timespec st_atim;
    struct timespec st_mtim;
    struct timespec st_ctim;
# 103 "/usr/include/bits/stat.h" 3 4
    long int __unused[3];
# 112 "/usr/include/bits/stat.h" 3 4
  };



struct stat64
  {
    __dev_t st_dev;

    __ino64_t st_ino;
    __nlink_t st_nlink;
    __mode_t st_mode;






    __uid_t st_uid;
    __gid_t st_gid;

    int __pad0;
    __dev_t st_rdev;
    __off_t st_size;





    __blksize_t st_blksize;
    __blkcnt64_t st_blocks;







    struct timespec st_atim;
    struct timespec st_mtim;
    struct timespec st_ctim;
# 164 "/usr/include/bits/stat.h" 3 4
    long int __unused[3];



  };
# 108 "/usr/include/sys/stat.h" 2 3 4
# 209 "/usr/include/sys/stat.h" 3 4
extern int stat (__const char *__restrict __file,
   struct stat *__restrict __buf) throw () __attribute__ ((__nonnull__ (1, 2)));



extern int fstat (int __fd, struct stat *__buf) throw () __attribute__ ((__nonnull__ (2)));
# 228 "/usr/include/sys/stat.h" 3 4
extern int stat64 (__const char *__restrict __file,
     struct stat64 *__restrict __buf) throw () __attribute__ ((__nonnull__ (1, 2)));
extern int fstat64 (int __fd, struct stat64 *__buf) throw () __attribute__ ((__nonnull__ (2)));







extern int fstatat (int __fd, __const char *__restrict __file,
      struct stat *__restrict __buf, int __flag)
     throw () __attribute__ ((__nonnull__ (2, 3)));
# 253 "/usr/include/sys/stat.h" 3 4
extern int fstatat64 (int __fd, __const char *__restrict __file,
        struct stat64 *__restrict __buf, int __flag)
     throw () __attribute__ ((__nonnull__ (2, 3)));







extern int lstat (__const char *__restrict __file,
    struct stat *__restrict __buf) throw () __attribute__ ((__nonnull__ (1, 2)));
# 276 "/usr/include/sys/stat.h" 3 4
extern int lstat64 (__const char *__restrict __file,
      struct stat64 *__restrict __buf)
     throw () __attribute__ ((__nonnull__ (1, 2)));





extern int chmod (__const char *__file, __mode_t __mode)
     throw () __attribute__ ((__nonnull__ (1)));





extern int lchmod (__const char *__file, __mode_t __mode)
     throw () __attribute__ ((__nonnull__ (1)));




extern int fchmod (int __fd, __mode_t __mode) throw ();





extern int fchmodat (int __fd, __const char *__file, __mode_t __mode,
       int __flag)
     throw () __attribute__ ((__nonnull__ (2))) ;






extern __mode_t umask (__mode_t __mask) throw ();




extern __mode_t getumask (void) throw ();



extern int mkdir (__const char *__path, __mode_t __mode)
     throw () __attribute__ ((__nonnull__ (1)));





extern int mkdirat (int __fd, __const char *__path, __mode_t __mode)
     throw () __attribute__ ((__nonnull__ (2)));






extern int mknod (__const char *__path, __mode_t __mode, __dev_t __dev)
     throw () __attribute__ ((__nonnull__ (1)));





extern int mknodat (int __fd, __const char *__path, __mode_t __mode,
      __dev_t __dev) throw () __attribute__ ((__nonnull__ (2)));





extern int mkfifo (__const char *__path, __mode_t __mode)
     throw () __attribute__ ((__nonnull__ (1)));





extern int mkfifoat (int __fd, __const char *__path, __mode_t __mode)
     throw () __attribute__ ((__nonnull__ (2)));





extern int utimensat (int __fd, __const char *__path,
        __const struct timespec __times[2],
        int __flags)
     throw () __attribute__ ((__nonnull__ (2)));




extern int futimens (int __fd, __const struct timespec __times[2]) throw ();
# 399 "/usr/include/sys/stat.h" 3 4
extern int __fxstat (int __ver, int __fildes, struct stat *__stat_buf)
     throw () __attribute__ ((__nonnull__ (3)));
extern int __xstat (int __ver, __const char *__filename,
      struct stat *__stat_buf) throw () __attribute__ ((__nonnull__ (2, 3)));
extern int __lxstat (int __ver, __const char *__filename,
       struct stat *__stat_buf) throw () __attribute__ ((__nonnull__ (2, 3)));
extern int __fxstatat (int __ver, int __fildes, __const char *__filename,
         struct stat *__stat_buf, int __flag)
     throw () __attribute__ ((__nonnull__ (3, 4)));
# 432 "/usr/include/sys/stat.h" 3 4
extern int __fxstat64 (int __ver, int __fildes, struct stat64 *__stat_buf)
     throw () __attribute__ ((__nonnull__ (3)));
extern int __xstat64 (int __ver, __const char *__filename,
        struct stat64 *__stat_buf) throw () __attribute__ ((__nonnull__ (2, 3)));
extern int __lxstat64 (int __ver, __const char *__filename,
         struct stat64 *__stat_buf) throw () __attribute__ ((__nonnull__ (2, 3)));
extern int __fxstatat64 (int __ver, int __fildes, __const char *__filename,
    struct stat64 *__stat_buf, int __flag)
     throw () __attribute__ ((__nonnull__ (3, 4)));

extern int __xmknod (int __ver, __const char *__path, __mode_t __mode,
       __dev_t *__dev) throw () __attribute__ ((__nonnull__ (2, 4)));

extern int __xmknodat (int __ver, int __fd, __const char *__path,
         __mode_t __mode, __dev_t *__dev)
     throw () __attribute__ ((__nonnull__ (3, 5)));
# 534 "/usr/include/sys/stat.h" 3 4
}
# 21 "lte_portability.h" 2
# 1 "/usr/include/fcntl.h" 1 3 4
# 30 "/usr/include/fcntl.h" 3 4
extern "C" {



# 1 "/usr/include/bits/fcntl.h" 1 3 4
# 25 "/usr/include/bits/fcntl.h" 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 26 "/usr/include/bits/fcntl.h" 2 3 4

# 1 "/usr/include/bits/uio.h" 1 3 4
# 44 "/usr/include/bits/uio.h" 3 4
struct iovec
  {
    void *iov_base;
    size_t iov_len;
  };
# 28 "/usr/include/bits/fcntl.h" 2 3 4
# 160 "/usr/include/bits/fcntl.h" 3 4
struct flock
  {
    short int l_type;
    short int l_whence;

    __off_t l_start;
    __off_t l_len;




    __pid_t l_pid;
  };


struct flock64
  {
    short int l_type;
    short int l_whence;
    __off64_t l_start;
    __off64_t l_len;
    __pid_t l_pid;
  };




enum __pid_type
  {
    F_OWNER_TID = 0,
    F_OWNER_PID,
    F_OWNER_GID
  };


struct f_owner_ex
  {
    enum __pid_type type;
    __pid_t pid;
  };
# 244 "/usr/include/bits/fcntl.h" 3 4
extern "C" {




extern ssize_t readahead (int __fd, __off64_t __offset, size_t __count)
    throw ();



extern int sync_file_range (int __fd, __off64_t __from, __off64_t __to,
       unsigned int __flags);



extern ssize_t vmsplice (int __fdout, const struct iovec *__iov,
    size_t __count, unsigned int __flags);


extern ssize_t splice (int __fdin, __off64_t *__offin, int __fdout,
         __off64_t *__offout, size_t __len,
         unsigned int __flags);


extern ssize_t tee (int __fdin, int __fdout, size_t __len,
      unsigned int __flags);



extern int fallocate (int __fd, int __mode, __off_t __offset, __off_t __len);
# 284 "/usr/include/bits/fcntl.h" 3 4
extern int fallocate64 (int __fd, int __mode, __off64_t __offset,
   __off64_t __len);



}
# 35 "/usr/include/fcntl.h" 2 3 4
# 78 "/usr/include/fcntl.h" 3 4
extern int fcntl (int __fd, int __cmd, ...);
# 87 "/usr/include/fcntl.h" 3 4
extern int open (__const char *__file, int __oflag, ...) __attribute__ ((__nonnull__ (1)));
# 97 "/usr/include/fcntl.h" 3 4
extern int open64 (__const char *__file, int __oflag, ...) __attribute__ ((__nonnull__ (1)));
# 111 "/usr/include/fcntl.h" 3 4
extern int openat (int __fd, __const char *__file, int __oflag, ...)
     __attribute__ ((__nonnull__ (2)));
# 122 "/usr/include/fcntl.h" 3 4
extern int openat64 (int __fd, __const char *__file, int __oflag, ...)
     __attribute__ ((__nonnull__ (2)));
# 132 "/usr/include/fcntl.h" 3 4
extern int creat (__const char *__file, __mode_t __mode) __attribute__ ((__nonnull__ (1)));
# 142 "/usr/include/fcntl.h" 3 4
extern int creat64 (__const char *__file, __mode_t __mode) __attribute__ ((__nonnull__ (1)));
# 178 "/usr/include/fcntl.h" 3 4
extern int posix_fadvise (int __fd, __off_t __offset, __off_t __len,
     int __advise) throw ();
# 190 "/usr/include/fcntl.h" 3 4
extern int posix_fadvise64 (int __fd, __off64_t __offset, __off64_t __len,
       int __advise) throw ();
# 200 "/usr/include/fcntl.h" 3 4
extern int posix_fallocate (int __fd, __off_t __offset, __off_t __len);
# 211 "/usr/include/fcntl.h" 3 4
extern int posix_fallocate64 (int __fd, __off64_t __offset, __off64_t __len);
# 222 "/usr/include/fcntl.h" 3 4
}
# 22 "lte_portability.h" 2




# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/sstream" 1 3
# 36 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/sstream" 3
       
# 37 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/sstream" 3

# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/istream" 1 3
# 36 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/istream" 3
       
# 37 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/istream" 3

# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ios" 1 3
# 36 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ios" 3
       
# 37 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ios" 3

# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/iosfwd" 1 3
# 36 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/iosfwd" 3
       
# 37 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/iosfwd" 3

# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/x86_64-suse-linux/bits/c++config.h" 1 3
# 186 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/x86_64-suse-linux/bits/c++config.h" 3
namespace std
{
  typedef long unsigned int size_t;
  typedef long int ptrdiff_t;




}
# 430 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/x86_64-suse-linux/bits/c++config.h" 3
# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/x86_64-suse-linux/bits/os_defines.h" 1 3
# 431 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/x86_64-suse-linux/bits/c++config.h" 2 3


# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/x86_64-suse-linux/bits/cpu_defines.h" 1 3
# 434 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/x86_64-suse-linux/bits/c++config.h" 2 3
# 39 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/iosfwd" 2 3
# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stringfwd.h" 1 3
# 37 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stringfwd.h" 3
       
# 38 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stringfwd.h" 3


# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/memoryfwd.h" 1 3
# 46 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/memoryfwd.h" 3
       
# 47 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/memoryfwd.h" 3



namespace std __attribute__ ((__visibility__ ("default")))
{

# 63 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/memoryfwd.h" 3
  template<typename>
    class allocator;

  template<>
    class allocator<void>;


  template<typename, typename>
    struct uses_allocator;




}
# 41 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stringfwd.h" 2 3

namespace std __attribute__ ((__visibility__ ("default")))
{








  template<class _CharT>
    struct char_traits;

  template<typename _CharT, typename _Traits = char_traits<_CharT>,
           typename _Alloc = allocator<_CharT> >
    class basic_string;

  template<> struct char_traits<char>;


  typedef basic_string<char> string;


  template<> struct char_traits<wchar_t>;


  typedef basic_string<wchar_t> wstring;
# 86 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stringfwd.h" 3

}
# 40 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/iosfwd" 2 3
# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/postypes.h" 1 3
# 38 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/postypes.h" 3
       
# 39 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/postypes.h" 3

# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/cwchar" 1 3
# 39 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/cwchar" 3
       
# 40 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/cwchar" 3




# 1 "/usr/include/wchar.h" 1 3 4
# 52 "/usr/include/wchar.h" 3 4
# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/lib64/gcc/x86_64-suse-linux/4.9.2/include/stddef.h" 1 3 4
# 353 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/lib64/gcc/x86_64-suse-linux/4.9.2/include/stddef.h" 3 4
typedef unsigned int wint_t;
# 53 "/usr/include/wchar.h" 2 3 4
# 104 "/usr/include/wchar.h" 3 4


typedef __mbstate_t mbstate_t;



# 129 "/usr/include/wchar.h" 3 4
extern "C" {




struct tm;









extern wchar_t *wcscpy (wchar_t *__restrict __dest,
   __const wchar_t *__restrict __src) throw ();

extern wchar_t *wcsncpy (wchar_t *__restrict __dest,
    __const wchar_t *__restrict __src, size_t __n)
     throw ();


extern wchar_t *wcscat (wchar_t *__restrict __dest,
   __const wchar_t *__restrict __src) throw ();

extern wchar_t *wcsncat (wchar_t *__restrict __dest,
    __const wchar_t *__restrict __src, size_t __n)
     throw ();


extern int wcscmp (__const wchar_t *__s1, __const wchar_t *__s2)
     throw () __attribute__ ((__pure__));

extern int wcsncmp (__const wchar_t *__s1, __const wchar_t *__s2, size_t __n)
     throw () __attribute__ ((__pure__));




extern int wcscasecmp (__const wchar_t *__s1, __const wchar_t *__s2) throw ();


extern int wcsncasecmp (__const wchar_t *__s1, __const wchar_t *__s2,
   size_t __n) throw ();





extern int wcscasecmp_l (__const wchar_t *__s1, __const wchar_t *__s2,
    __locale_t __loc) throw ();

extern int wcsncasecmp_l (__const wchar_t *__s1, __const wchar_t *__s2,
     size_t __n, __locale_t __loc) throw ();





extern int wcscoll (__const wchar_t *__s1, __const wchar_t *__s2) throw ();



extern size_t wcsxfrm (wchar_t *__restrict __s1,
         __const wchar_t *__restrict __s2, size_t __n) throw ();








extern int wcscoll_l (__const wchar_t *__s1, __const wchar_t *__s2,
        __locale_t __loc) throw ();




extern size_t wcsxfrm_l (wchar_t *__s1, __const wchar_t *__s2,
    size_t __n, __locale_t __loc) throw ();


extern wchar_t *wcsdup (__const wchar_t *__s) throw () __attribute__ ((__malloc__));





extern "C++" wchar_t *wcschr (wchar_t *__wcs, wchar_t __wc)
     throw () __asm ("wcschr") __attribute__ ((__pure__));
extern "C++" __const wchar_t *wcschr (__const wchar_t *__wcs, wchar_t __wc)
     throw () __asm ("wcschr") __attribute__ ((__pure__));






extern "C++" wchar_t *wcsrchr (wchar_t *__wcs, wchar_t __wc)
     throw () __asm ("wcsrchr") __attribute__ ((__pure__));
extern "C++" __const wchar_t *wcsrchr (__const wchar_t *__wcs, wchar_t __wc)
     throw () __asm ("wcsrchr") __attribute__ ((__pure__));









extern wchar_t *wcschrnul (__const wchar_t *__s, wchar_t __wc)
     throw () __attribute__ ((__pure__));





extern size_t wcscspn (__const wchar_t *__wcs, __const wchar_t *__reject)
     throw () __attribute__ ((__pure__));


extern size_t wcsspn (__const wchar_t *__wcs, __const wchar_t *__accept)
     throw () __attribute__ ((__pure__));


extern "C++" wchar_t *wcspbrk (wchar_t *__wcs, __const wchar_t *__accept)
     throw () __asm ("wcspbrk") __attribute__ ((__pure__));
extern "C++" __const wchar_t *wcspbrk (__const wchar_t *__wcs,
           __const wchar_t *__accept)
     throw () __asm ("wcspbrk") __attribute__ ((__pure__));






extern "C++" wchar_t *wcsstr (wchar_t *__haystack, __const wchar_t *__needle)
     throw () __asm ("wcsstr") __attribute__ ((__pure__));
extern "C++" __const wchar_t *wcsstr (__const wchar_t *__haystack,
          __const wchar_t *__needle)
     throw () __asm ("wcsstr") __attribute__ ((__pure__));






extern wchar_t *wcstok (wchar_t *__restrict __s,
   __const wchar_t *__restrict __delim,
   wchar_t **__restrict __ptr) throw ();


extern size_t wcslen (__const wchar_t *__s) throw () __attribute__ ((__pure__));





extern "C++" wchar_t *wcswcs (wchar_t *__haystack, __const wchar_t *__needle)
     throw () __asm ("wcswcs") __attribute__ ((__pure__));
extern "C++" __const wchar_t *wcswcs (__const wchar_t *__haystack,
          __const wchar_t *__needle)
     throw () __asm ("wcswcs") __attribute__ ((__pure__));
# 303 "/usr/include/wchar.h" 3 4
extern size_t wcsnlen (__const wchar_t *__s, size_t __maxlen)
     throw () __attribute__ ((__pure__));






extern "C++" wchar_t *wmemchr (wchar_t *__s, wchar_t __c, size_t __n)
     throw () __asm ("wmemchr") __attribute__ ((__pure__));
extern "C++" __const wchar_t *wmemchr (__const wchar_t *__s, wchar_t __c,
           size_t __n)
     throw () __asm ("wmemchr") __attribute__ ((__pure__));






extern int wmemcmp (__const wchar_t *__s1, __const wchar_t *__s2, size_t __n)
     throw () __attribute__ ((__pure__));


extern wchar_t *wmemcpy (wchar_t *__restrict __s1,
    __const wchar_t *__restrict __s2, size_t __n) throw ();



extern wchar_t *wmemmove (wchar_t *__s1, __const wchar_t *__s2, size_t __n)
     throw ();


extern wchar_t *wmemset (wchar_t *__s, wchar_t __c, size_t __n) throw ();





extern wchar_t *wmempcpy (wchar_t *__restrict __s1,
     __const wchar_t *__restrict __s2, size_t __n)
     throw ();






extern wint_t btowc (int __c) throw ();



extern int wctob (wint_t __c) throw ();



extern int mbsinit (__const mbstate_t *__ps) throw () __attribute__ ((__pure__));



extern size_t mbrtowc (wchar_t *__restrict __pwc,
         __const char *__restrict __s, size_t __n,
         mbstate_t *__p) throw ();


extern size_t wcrtomb (char *__restrict __s, wchar_t __wc,
         mbstate_t *__restrict __ps) throw ();


extern size_t __mbrlen (__const char *__restrict __s, size_t __n,
   mbstate_t *__restrict __ps) throw ();
extern size_t mbrlen (__const char *__restrict __s, size_t __n,
        mbstate_t *__restrict __ps) throw ();

# 402 "/usr/include/wchar.h" 3 4



extern size_t mbsrtowcs (wchar_t *__restrict __dst,
    __const char **__restrict __src, size_t __len,
    mbstate_t *__restrict __ps) throw ();



extern size_t wcsrtombs (char *__restrict __dst,
    __const wchar_t **__restrict __src, size_t __len,
    mbstate_t *__restrict __ps) throw ();






extern size_t mbsnrtowcs (wchar_t *__restrict __dst,
     __const char **__restrict __src, size_t __nmc,
     size_t __len, mbstate_t *__restrict __ps) throw ();



extern size_t wcsnrtombs (char *__restrict __dst,
     __const wchar_t **__restrict __src,
     size_t __nwc, size_t __len,
     mbstate_t *__restrict __ps) throw ();






extern int wcwidth (wchar_t __c) throw ();



extern int wcswidth (__const wchar_t *__s, size_t __n) throw ();






extern double wcstod (__const wchar_t *__restrict __nptr,
        wchar_t **__restrict __endptr) throw ();





extern float wcstof (__const wchar_t *__restrict __nptr,
       wchar_t **__restrict __endptr) throw ();
extern long double wcstold (__const wchar_t *__restrict __nptr,
       wchar_t **__restrict __endptr) throw ();







extern long int wcstol (__const wchar_t *__restrict __nptr,
   wchar_t **__restrict __endptr, int __base) throw ();



extern unsigned long int wcstoul (__const wchar_t *__restrict __nptr,
      wchar_t **__restrict __endptr, int __base)
     throw ();






__extension__
extern long long int wcstoll (__const wchar_t *__restrict __nptr,
         wchar_t **__restrict __endptr, int __base)
     throw ();



__extension__
extern unsigned long long int wcstoull (__const wchar_t *__restrict __nptr,
     wchar_t **__restrict __endptr,
     int __base) throw ();






__extension__
extern long long int wcstoq (__const wchar_t *__restrict __nptr,
        wchar_t **__restrict __endptr, int __base)
     throw ();



__extension__
extern unsigned long long int wcstouq (__const wchar_t *__restrict __nptr,
           wchar_t **__restrict __endptr,
           int __base) throw ();
# 527 "/usr/include/wchar.h" 3 4
extern long int wcstol_l (__const wchar_t *__restrict __nptr,
     wchar_t **__restrict __endptr, int __base,
     __locale_t __loc) throw ();

extern unsigned long int wcstoul_l (__const wchar_t *__restrict __nptr,
        wchar_t **__restrict __endptr,
        int __base, __locale_t __loc) throw ();

__extension__
extern long long int wcstoll_l (__const wchar_t *__restrict __nptr,
    wchar_t **__restrict __endptr,
    int __base, __locale_t __loc) throw ();

__extension__
extern unsigned long long int wcstoull_l (__const wchar_t *__restrict __nptr,
       wchar_t **__restrict __endptr,
       int __base, __locale_t __loc)
     throw ();

extern double wcstod_l (__const wchar_t *__restrict __nptr,
   wchar_t **__restrict __endptr, __locale_t __loc)
     throw ();

extern float wcstof_l (__const wchar_t *__restrict __nptr,
         wchar_t **__restrict __endptr, __locale_t __loc)
     throw ();

extern long double wcstold_l (__const wchar_t *__restrict __nptr,
         wchar_t **__restrict __endptr,
         __locale_t __loc) throw ();






extern wchar_t *wcpcpy (wchar_t *__restrict __dest,
   __const wchar_t *__restrict __src) throw ();



extern wchar_t *wcpncpy (wchar_t *__restrict __dest,
    __const wchar_t *__restrict __src, size_t __n)
     throw ();
# 579 "/usr/include/wchar.h" 3 4
extern __FILE *open_wmemstream (wchar_t **__bufloc, size_t *__sizeloc) throw ();






extern int fwide (__FILE *__fp, int __mode) throw ();






extern int fwprintf (__FILE *__restrict __stream,
       __const wchar_t *__restrict __format, ...)
                                                           ;




extern int wprintf (__const wchar_t *__restrict __format, ...)
                                                           ;

extern int swprintf (wchar_t *__restrict __s, size_t __n,
       __const wchar_t *__restrict __format, ...)
     throw () ;





extern int vfwprintf (__FILE *__restrict __s,
        __const wchar_t *__restrict __format,
        __gnuc_va_list __arg)
                                                           ;




extern int vwprintf (__const wchar_t *__restrict __format,
       __gnuc_va_list __arg)
                                                           ;


extern int vswprintf (wchar_t *__restrict __s, size_t __n,
        __const wchar_t *__restrict __format,
        __gnuc_va_list __arg)
     throw () ;






extern int fwscanf (__FILE *__restrict __stream,
      __const wchar_t *__restrict __format, ...)
                                                          ;




extern int wscanf (__const wchar_t *__restrict __format, ...)
                                                          ;

extern int swscanf (__const wchar_t *__restrict __s,
      __const wchar_t *__restrict __format, ...)
     throw () ;
# 679 "/usr/include/wchar.h" 3 4









extern int vfwscanf (__FILE *__restrict __s,
       __const wchar_t *__restrict __format,
       __gnuc_va_list __arg)
                                                          ;




extern int vwscanf (__const wchar_t *__restrict __format,
      __gnuc_va_list __arg)
                                                          ;

extern int vswscanf (__const wchar_t *__restrict __s,
       __const wchar_t *__restrict __format,
       __gnuc_va_list __arg)
     throw () ;
# 735 "/usr/include/wchar.h" 3 4









extern wint_t fgetwc (__FILE *__stream);
extern wint_t getwc (__FILE *__stream);





extern wint_t getwchar (void);






extern wint_t fputwc (wchar_t __wc, __FILE *__stream);
extern wint_t putwc (wchar_t __wc, __FILE *__stream);





extern wint_t putwchar (wchar_t __wc);







extern wchar_t *fgetws (wchar_t *__restrict __ws, int __n,
   __FILE *__restrict __stream);





extern int fputws (__const wchar_t *__restrict __ws,
     __FILE *__restrict __stream);






extern wint_t ungetwc (wint_t __wc, __FILE *__stream);

# 800 "/usr/include/wchar.h" 3 4
extern wint_t getwc_unlocked (__FILE *__stream);
extern wint_t getwchar_unlocked (void);







extern wint_t fgetwc_unlocked (__FILE *__stream);







extern wint_t fputwc_unlocked (wchar_t __wc, __FILE *__stream);
# 826 "/usr/include/wchar.h" 3 4
extern wint_t putwc_unlocked (wchar_t __wc, __FILE *__stream);
extern wint_t putwchar_unlocked (wchar_t __wc);
# 836 "/usr/include/wchar.h" 3 4
extern wchar_t *fgetws_unlocked (wchar_t *__restrict __ws, int __n,
     __FILE *__restrict __stream);







extern int fputws_unlocked (__const wchar_t *__restrict __ws,
       __FILE *__restrict __stream);







extern size_t wcsftime (wchar_t *__restrict __s, size_t __maxsize,
   __const wchar_t *__restrict __format,
   __const struct tm *__restrict __tp) throw ();







extern size_t wcsftime_l (wchar_t *__restrict __s, size_t __maxsize,
     __const wchar_t *__restrict __format,
     __const struct tm *__restrict __tp,
     __locale_t __loc) throw ();
# 890 "/usr/include/wchar.h" 3 4
}
# 45 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/cwchar" 2 3
# 62 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/cwchar" 3
namespace std
{
  using ::mbstate_t;
}
# 135 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/cwchar" 3
namespace std __attribute__ ((__visibility__ ("default")))
{


  using ::wint_t;

  using ::btowc;
  using ::fgetwc;
  using ::fgetws;
  using ::fputwc;
  using ::fputws;
  using ::fwide;
  using ::fwprintf;
  using ::fwscanf;
  using ::getwc;
  using ::getwchar;
  using ::mbrlen;
  using ::mbrtowc;
  using ::mbsinit;
  using ::mbsrtowcs;
  using ::putwc;
  using ::putwchar;

  using ::swprintf;

  using ::swscanf;
  using ::ungetwc;
  using ::vfwprintf;

  using ::vfwscanf;


  using ::vswprintf;


  using ::vswscanf;

  using ::vwprintf;

  using ::vwscanf;

  using ::wcrtomb;
  using ::wcscat;
  using ::wcscmp;
  using ::wcscoll;
  using ::wcscpy;
  using ::wcscspn;
  using ::wcsftime;
  using ::wcslen;
  using ::wcsncat;
  using ::wcsncmp;
  using ::wcsncpy;
  using ::wcsrtombs;
  using ::wcsspn;
  using ::wcstod;

  using ::wcstof;

  using ::wcstok;
  using ::wcstol;
  using ::wcstoul;
  using ::wcsxfrm;
  using ::wctob;
  using ::wmemcmp;
  using ::wmemcpy;
  using ::wmemmove;
  using ::wmemset;
  using ::wprintf;
  using ::wscanf;
  using ::wcschr;
  using ::wcspbrk;
  using ::wcsrchr;
  using ::wcsstr;
  using ::wmemchr;
# 232 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/cwchar" 3

}







namespace __gnu_cxx
{





  using ::wcstold;
# 257 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/cwchar" 3
  using ::wcstoll;
  using ::wcstoull;

}

namespace std
{
  using ::__gnu_cxx::wcstold;
  using ::__gnu_cxx::wcstoll;
  using ::__gnu_cxx::wcstoull;
}
# 41 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/postypes.h" 2 3
# 68 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/postypes.h" 3
namespace std __attribute__ ((__visibility__ ("default")))
{

# 88 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/postypes.h" 3
  typedef long streamoff;
# 98 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/postypes.h" 3
  typedef ptrdiff_t streamsize;
# 111 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/postypes.h" 3
  template<typename _StateT>
    class fpos
    {
    private:
      streamoff _M_off;
      _StateT _M_state;

    public:




      fpos()
      : _M_off(0), _M_state() { }
# 133 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/postypes.h" 3
      fpos(streamoff __off)
      : _M_off(__off), _M_state() { }


      operator streamoff() const { return _M_off; }


      void
      state(_StateT __st)
      { _M_state = __st; }


      _StateT
      state() const
      { return _M_state; }





      fpos&
      operator+=(streamoff __off)
      {
 _M_off += __off;
 return *this;
      }





      fpos&
      operator-=(streamoff __off)
      {
 _M_off -= __off;
 return *this;
      }







      fpos
      operator+(streamoff __off) const
      {
 fpos __pos(*this);
 __pos += __off;
 return __pos;
      }







      fpos
      operator-(streamoff __off) const
      {
 fpos __pos(*this);
 __pos -= __off;
 return __pos;
      }






      streamoff
      operator-(const fpos& __other) const
      { return _M_off - __other._M_off; }
    };






  template<typename _StateT>
    inline bool
    operator==(const fpos<_StateT>& __lhs, const fpos<_StateT>& __rhs)
    { return streamoff(__lhs) == streamoff(__rhs); }

  template<typename _StateT>
    inline bool
    operator!=(const fpos<_StateT>& __lhs, const fpos<_StateT>& __rhs)
    { return streamoff(__lhs) != streamoff(__rhs); }





  typedef fpos<mbstate_t> streampos;

  typedef fpos<mbstate_t> wstreampos;
# 239 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/postypes.h" 3

}
# 41 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/iosfwd" 2 3

namespace std __attribute__ ((__visibility__ ("default")))
{

# 74 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/iosfwd" 3
  class ios_base;

  template<typename _CharT, typename _Traits = char_traits<_CharT> >
    class basic_ios;

  template<typename _CharT, typename _Traits = char_traits<_CharT> >
    class basic_streambuf;

  template<typename _CharT, typename _Traits = char_traits<_CharT> >
    class basic_istream;

  template<typename _CharT, typename _Traits = char_traits<_CharT> >
    class basic_ostream;

  template<typename _CharT, typename _Traits = char_traits<_CharT> >
    class basic_iostream;

  template<typename _CharT, typename _Traits = char_traits<_CharT>,
     typename _Alloc = allocator<_CharT> >
    class basic_stringbuf;

  template<typename _CharT, typename _Traits = char_traits<_CharT>,
    typename _Alloc = allocator<_CharT> >
    class basic_istringstream;

  template<typename _CharT, typename _Traits = char_traits<_CharT>,
    typename _Alloc = allocator<_CharT> >
    class basic_ostringstream;

  template<typename _CharT, typename _Traits = char_traits<_CharT>,
    typename _Alloc = allocator<_CharT> >
    class basic_stringstream;

  template<typename _CharT, typename _Traits = char_traits<_CharT> >
    class basic_filebuf;

  template<typename _CharT, typename _Traits = char_traits<_CharT> >
    class basic_ifstream;

  template<typename _CharT, typename _Traits = char_traits<_CharT> >
    class basic_ofstream;

  template<typename _CharT, typename _Traits = char_traits<_CharT> >
    class basic_fstream;

  template<typename _CharT, typename _Traits = char_traits<_CharT> >
    class istreambuf_iterator;

  template<typename _CharT, typename _Traits = char_traits<_CharT> >
    class ostreambuf_iterator;



  typedef basic_ios<char> ios;


  typedef basic_streambuf<char> streambuf;


  typedef basic_istream<char> istream;


  typedef basic_ostream<char> ostream;


  typedef basic_iostream<char> iostream;


  typedef basic_stringbuf<char> stringbuf;


  typedef basic_istringstream<char> istringstream;


  typedef basic_ostringstream<char> ostringstream;


  typedef basic_stringstream<char> stringstream;


  typedef basic_filebuf<char> filebuf;


  typedef basic_ifstream<char> ifstream;


  typedef basic_ofstream<char> ofstream;


  typedef basic_fstream<char> fstream;



  typedef basic_ios<wchar_t> wios;


  typedef basic_streambuf<wchar_t> wstreambuf;


  typedef basic_istream<wchar_t> wistream;


  typedef basic_ostream<wchar_t> wostream;


  typedef basic_iostream<wchar_t> wiostream;


  typedef basic_stringbuf<wchar_t> wstringbuf;


  typedef basic_istringstream<wchar_t> wistringstream;


  typedef basic_ostringstream<wchar_t> wostringstream;


  typedef basic_stringstream<wchar_t> wstringstream;


  typedef basic_filebuf<wchar_t> wfilebuf;


  typedef basic_ifstream<wchar_t> wifstream;


  typedef basic_ofstream<wchar_t> wofstream;


  typedef basic_fstream<wchar_t> wfstream;




}
# 39 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ios" 2 3
# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/exception" 1 3
# 33 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/exception" 3
       
# 34 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/exception" 3

#pragma GCC visibility push(default)


# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/atomic_lockfree_defines.h" 1 3
# 33 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/atomic_lockfree_defines.h" 3
       
# 34 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/atomic_lockfree_defines.h" 3
# 39 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/exception" 2 3

extern "C++" {

namespace std
{
# 60 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/exception" 3
  class exception
  {
  public:
    exception() throw() { }
    virtual ~exception() throw();



    virtual const char* what() const throw();
  };



  class bad_exception : public exception
  {
  public:
    bad_exception() throw() { }



    virtual ~bad_exception() throw();


    virtual const char* what() const throw();
  };


  typedef void (*terminate_handler) ();


  typedef void (*unexpected_handler) ();


  terminate_handler set_terminate(terminate_handler) throw();
# 102 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/exception" 3
  void terminate() throw() __attribute__ ((__noreturn__));


  unexpected_handler set_unexpected(unexpected_handler) throw();
# 114 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/exception" 3
  void unexpected() __attribute__ ((__noreturn__));
# 127 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/exception" 3
  bool uncaught_exception() throw() __attribute__ ((__pure__));


}

namespace __gnu_cxx
{

# 152 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/exception" 3
  void __verbose_terminate_handler();


}

}

#pragma GCC visibility pop
# 40 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ios" 2 3
# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/char_traits.h" 1 3
# 37 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/char_traits.h" 3
       
# 38 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/char_traits.h" 3

# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_algobase.h" 1 3
# 60 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_algobase.h" 3
# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/functexcept.h" 1 3
# 40 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/functexcept.h" 3
# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/exception_defines.h" 1 3
# 41 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/functexcept.h" 2 3

namespace std __attribute__ ((__visibility__ ("default")))
{



  void
  __throw_bad_exception(void) __attribute__((__noreturn__));


  void
  __throw_bad_alloc(void) __attribute__((__noreturn__));


  void
  __throw_bad_cast(void) __attribute__((__noreturn__));

  void
  __throw_bad_typeid(void) __attribute__((__noreturn__));


  void
  __throw_logic_error(const char*) __attribute__((__noreturn__));

  void
  __throw_domain_error(const char*) __attribute__((__noreturn__));

  void
  __throw_invalid_argument(const char*) __attribute__((__noreturn__));

  void
  __throw_length_error(const char*) __attribute__((__noreturn__));

  void
  __throw_out_of_range(const char*) __attribute__((__noreturn__));

  void
  __throw_out_of_range_fmt(const char*, ...) __attribute__((__noreturn__))
    __attribute__((__format__(__printf__, 1, 2)));

  void
  __throw_runtime_error(const char*) __attribute__((__noreturn__));

  void
  __throw_range_error(const char*) __attribute__((__noreturn__));

  void
  __throw_overflow_error(const char*) __attribute__((__noreturn__));

  void
  __throw_underflow_error(const char*) __attribute__((__noreturn__));


  void
  __throw_ios_failure(const char*) __attribute__((__noreturn__));

  void
  __throw_system_error(int) __attribute__((__noreturn__));

  void
  __throw_future_error(int) __attribute__((__noreturn__));


  void
  __throw_bad_function_call() __attribute__((__noreturn__));


}
# 61 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_algobase.h" 2 3
# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/cpp_type_traits.h" 1 3
# 35 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/cpp_type_traits.h" 3
       
# 36 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/cpp_type_traits.h" 3
# 68 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/cpp_type_traits.h" 3
namespace __gnu_cxx __attribute__ ((__visibility__ ("default")))
{


  template<typename _Iterator, typename _Container>
    class __normal_iterator;


}

namespace std __attribute__ ((__visibility__ ("default")))
{


  struct __true_type { };
  struct __false_type { };

  template<bool>
    struct __truth_type
    { typedef __false_type __type; };

  template<>
    struct __truth_type<true>
    { typedef __true_type __type; };



  template<class _Sp, class _Tp>
    struct __traitor
    {
      enum { __value = bool(_Sp::__value) || bool(_Tp::__value) };
      typedef typename __truth_type<__value>::__type __type;
    };


  template<typename, typename>
    struct __are_same
    {
      enum { __value = 0 };
      typedef __false_type __type;
    };

  template<typename _Tp>
    struct __are_same<_Tp, _Tp>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };


  template<typename _Tp>
    struct __is_void
    {
      enum { __value = 0 };
      typedef __false_type __type;
    };

  template<>
    struct __is_void<void>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };




  template<typename _Tp>
    struct __is_integer
    {
      enum { __value = 0 };
      typedef __false_type __type;
    };




  template<>
    struct __is_integer<bool>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<char>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<signed char>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<unsigned char>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };


  template<>
    struct __is_integer<wchar_t>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };
# 198 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/cpp_type_traits.h" 3
  template<>
    struct __is_integer<short>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<unsigned short>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<int>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<unsigned int>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<long>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<unsigned long>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<long long>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_integer<unsigned long long>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };




  template<typename _Tp>
    struct __is_floating
    {
      enum { __value = 0 };
      typedef __false_type __type;
    };


  template<>
    struct __is_floating<float>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_floating<double>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_floating<long double>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };




  template<typename _Tp>
    struct __is_pointer
    {
      enum { __value = 0 };
      typedef __false_type __type;
    };

  template<typename _Tp>
    struct __is_pointer<_Tp*>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };




  template<typename _Tp>
    struct __is_normal_iterator
    {
      enum { __value = 0 };
      typedef __false_type __type;
    };

  template<typename _Iterator, typename _Container>
    struct __is_normal_iterator< __gnu_cxx::__normal_iterator<_Iterator,
             _Container> >
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };




  template<typename _Tp>
    struct __is_arithmetic
    : public __traitor<__is_integer<_Tp>, __is_floating<_Tp> >
    { };




  template<typename _Tp>
    struct __is_scalar
    : public __traitor<__is_arithmetic<_Tp>, __is_pointer<_Tp> >
    { };




  template<typename _Tp>
    struct __is_char
    {
      enum { __value = 0 };
      typedef __false_type __type;
    };

  template<>
    struct __is_char<char>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };


  template<>
    struct __is_char<wchar_t>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };


  template<typename _Tp>
    struct __is_byte
    {
      enum { __value = 0 };
      typedef __false_type __type;
    };

  template<>
    struct __is_byte<char>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_byte<signed char>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };

  template<>
    struct __is_byte<unsigned char>
    {
      enum { __value = 1 };
      typedef __true_type __type;
    };




  template<typename _Tp>
    struct __is_move_iterator
    {
      enum { __value = 0 };
      typedef __false_type __type;
    };
# 413 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/cpp_type_traits.h" 3

}
# 62 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_algobase.h" 2 3
# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ext/type_traits.h" 1 3
# 32 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ext/type_traits.h" 3
       
# 33 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ext/type_traits.h" 3




namespace __gnu_cxx __attribute__ ((__visibility__ ("default")))
{



  template<bool, typename>
    struct __enable_if
    { };

  template<typename _Tp>
    struct __enable_if<true, _Tp>
    { typedef _Tp __type; };



  template<bool _Cond, typename _Iftrue, typename _Iffalse>
    struct __conditional_type
    { typedef _Iftrue __type; };

  template<typename _Iftrue, typename _Iffalse>
    struct __conditional_type<false, _Iftrue, _Iffalse>
    { typedef _Iffalse __type; };



  template<typename _Tp>
    struct __add_unsigned
    {
    private:
      typedef __enable_if<std::__is_integer<_Tp>::__value, _Tp> __if_type;

    public:
      typedef typename __if_type::__type __type;
    };

  template<>
    struct __add_unsigned<char>
    { typedef unsigned char __type; };

  template<>
    struct __add_unsigned<signed char>
    { typedef unsigned char __type; };

  template<>
    struct __add_unsigned<short>
    { typedef unsigned short __type; };

  template<>
    struct __add_unsigned<int>
    { typedef unsigned int __type; };

  template<>
    struct __add_unsigned<long>
    { typedef unsigned long __type; };

  template<>
    struct __add_unsigned<long long>
    { typedef unsigned long long __type; };


  template<>
    struct __add_unsigned<bool>;

  template<>
    struct __add_unsigned<wchar_t>;



  template<typename _Tp>
    struct __remove_unsigned
    {
    private:
      typedef __enable_if<std::__is_integer<_Tp>::__value, _Tp> __if_type;

    public:
      typedef typename __if_type::__type __type;
    };

  template<>
    struct __remove_unsigned<char>
    { typedef signed char __type; };

  template<>
    struct __remove_unsigned<unsigned char>
    { typedef signed char __type; };

  template<>
    struct __remove_unsigned<unsigned short>
    { typedef short __type; };

  template<>
    struct __remove_unsigned<unsigned int>
    { typedef int __type; };

  template<>
    struct __remove_unsigned<unsigned long>
    { typedef long __type; };

  template<>
    struct __remove_unsigned<unsigned long long>
    { typedef long long __type; };


  template<>
    struct __remove_unsigned<bool>;

  template<>
    struct __remove_unsigned<wchar_t>;



  template<typename _Type>
    inline bool
    __is_null_pointer(_Type* __ptr)
    { return __ptr == 0; }

  template<typename _Type>
    inline bool
    __is_null_pointer(_Type)
    { return false; }
# 165 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ext/type_traits.h" 3
  template<typename _Tp, bool = std::__is_integer<_Tp>::__value>
    struct __promote
    { typedef double __type; };




  template<typename _Tp>
    struct __promote<_Tp, false>
    { };

  template<>
    struct __promote<long double>
    { typedef long double __type; };

  template<>
    struct __promote<double>
    { typedef double __type; };

  template<>
    struct __promote<float>
    { typedef float __type; };

  template<typename _Tp, typename _Up,
           typename _Tp2 = typename __promote<_Tp>::__type,
           typename _Up2 = typename __promote<_Up>::__type>
    struct __promote_2
    {
      typedef __typeof__(_Tp2() + _Up2()) __type;
    };

  template<typename _Tp, typename _Up, typename _Vp,
           typename _Tp2 = typename __promote<_Tp>::__type,
           typename _Up2 = typename __promote<_Up>::__type,
           typename _Vp2 = typename __promote<_Vp>::__type>
    struct __promote_3
    {
      typedef __typeof__(_Tp2() + _Up2() + _Vp2()) __type;
    };

  template<typename _Tp, typename _Up, typename _Vp, typename _Wp,
           typename _Tp2 = typename __promote<_Tp>::__type,
           typename _Up2 = typename __promote<_Up>::__type,
           typename _Vp2 = typename __promote<_Vp>::__type,
           typename _Wp2 = typename __promote<_Wp>::__type>
    struct __promote_4
    {
      typedef __typeof__(_Tp2() + _Up2() + _Vp2() + _Wp2()) __type;
    };


}
# 63 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_algobase.h" 2 3
# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ext/numeric_traits.h" 1 3
# 32 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ext/numeric_traits.h" 3
       
# 33 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ext/numeric_traits.h" 3




namespace __gnu_cxx __attribute__ ((__visibility__ ("default")))
{

# 54 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ext/numeric_traits.h" 3
  template<typename _Value>
    struct __numeric_traits_integer
    {

      static const _Value __min = (((_Value)(-1) < 0) ? (_Value)1 << (sizeof(_Value) * 8 - ((_Value)(-1) < 0)) : (_Value)0);
      static const _Value __max = (((_Value)(-1) < 0) ? (((((_Value)1 << ((sizeof(_Value) * 8 - ((_Value)(-1) < 0)) - 1)) - 1) << 1) + 1) : ~(_Value)0);



      static const bool __is_signed = ((_Value)(-1) < 0);
      static const int __digits = (sizeof(_Value) * 8 - ((_Value)(-1) < 0));
    };

  template<typename _Value>
    const _Value __numeric_traits_integer<_Value>::__min;

  template<typename _Value>
    const _Value __numeric_traits_integer<_Value>::__max;

  template<typename _Value>
    const bool __numeric_traits_integer<_Value>::__is_signed;

  template<typename _Value>
    const int __numeric_traits_integer<_Value>::__digits;
# 99 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ext/numeric_traits.h" 3
  template<typename _Value>
    struct __numeric_traits_floating
    {

      static const int __max_digits10 = (2 + (std::__are_same<_Value, float>::__value ? 24 : std::__are_same<_Value, double>::__value ? 53 : 64) * 643L / 2136);


      static const bool __is_signed = true;
      static const int __digits10 = (std::__are_same<_Value, float>::__value ? 6 : std::__are_same<_Value, double>::__value ? 15 : 18);
      static const int __max_exponent10 = (std::__are_same<_Value, float>::__value ? 38 : std::__are_same<_Value, double>::__value ? 308 : 4932);
    };

  template<typename _Value>
    const int __numeric_traits_floating<_Value>::__max_digits10;

  template<typename _Value>
    const bool __numeric_traits_floating<_Value>::__is_signed;

  template<typename _Value>
    const int __numeric_traits_floating<_Value>::__digits10;

  template<typename _Value>
    const int __numeric_traits_floating<_Value>::__max_exponent10;

  template<typename _Value>
    struct __numeric_traits
    : public __conditional_type<std::__is_integer<_Value>::__value,
    __numeric_traits_integer<_Value>,
    __numeric_traits_floating<_Value> >::__type
    { };


}
# 64 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_algobase.h" 2 3
# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_pair.h" 1 3
# 59 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_pair.h" 3
# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/move.h" 1 3
# 34 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/move.h" 3
# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/concept_check.h" 1 3
# 33 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/concept_check.h" 3
       
# 34 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/concept_check.h" 3
# 35 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/move.h" 2 3

namespace std __attribute__ ((__visibility__ ("default")))
{







  template<typename _Tp>
    inline _Tp*
    __addressof(_Tp& __r)
    {
      return reinterpret_cast<_Tp*>
 (&const_cast<char&>(reinterpret_cast<const volatile char&>(__r)));
    }


}
# 149 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/move.h" 3
namespace std __attribute__ ((__visibility__ ("default")))
{

# 164 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/move.h" 3
  template<typename _Tp>
    inline void
    swap(_Tp& __a, _Tp& __b)




    {

     

      _Tp __tmp = (__a);
      __a = (__b);
      __b = (__tmp);
    }




  template<typename _Tp, size_t _Nm>
    inline void
    swap(_Tp (&__a)[_Nm], _Tp (&__b)[_Nm])



    {
      for (size_t __n = 0; __n < _Nm; ++__n)
 swap(__a[__n], __b[__n]);
    }



}
# 60 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_pair.h" 2 3





namespace std __attribute__ ((__visibility__ ("default")))
{

# 95 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_pair.h" 3
  template<class _T1, class _T2>
    struct pair
    {
      typedef _T1 first_type;
      typedef _T2 second_type;

      _T1 first;
      _T2 second;





      pair()
      : first(), second() { }


      pair(const _T1& __a, const _T2& __b)
      : first(__a), second(__b) { }



      template<class _U1, class _U2>
 pair(const pair<_U1, _U2>& __p)
 : first(__p.first), second(__p.second) { }
# 209 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_pair.h" 3
    };


  template<class _T1, class _T2>
    inline bool
    operator==(const pair<_T1, _T2>& __x, const pair<_T1, _T2>& __y)
    { return __x.first == __y.first && __x.second == __y.second; }


  template<class _T1, class _T2>
    inline bool
    operator<(const pair<_T1, _T2>& __x, const pair<_T1, _T2>& __y)
    { return __x.first < __y.first
      || (!(__y.first < __x.first) && __x.second < __y.second); }


  template<class _T1, class _T2>
    inline bool
    operator!=(const pair<_T1, _T2>& __x, const pair<_T1, _T2>& __y)
    { return !(__x == __y); }


  template<class _T1, class _T2>
    inline bool
    operator>(const pair<_T1, _T2>& __x, const pair<_T1, _T2>& __y)
    { return __y < __x; }


  template<class _T1, class _T2>
    inline bool
    operator<=(const pair<_T1, _T2>& __x, const pair<_T1, _T2>& __y)
    { return !(__y < __x); }


  template<class _T1, class _T2>
    inline bool
    operator>=(const pair<_T1, _T2>& __x, const pair<_T1, _T2>& __y)
    { return !(__x < __y); }
# 284 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_pair.h" 3
  template<class _T1, class _T2>
    inline pair<_T1, _T2>
    make_pair(_T1 __x, _T2 __y)
    { return pair<_T1, _T2>(__x, __y); }





}
# 65 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_algobase.h" 2 3
# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_iterator_base_types.h" 1 3
# 62 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_iterator_base_types.h" 3
       
# 63 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_iterator_base_types.h" 3







namespace std __attribute__ ((__visibility__ ("default")))
{

# 89 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_iterator_base_types.h" 3
  struct input_iterator_tag { };


  struct output_iterator_tag { };


  struct forward_iterator_tag : public input_iterator_tag { };



  struct bidirectional_iterator_tag : public forward_iterator_tag { };



  struct random_access_iterator_tag : public bidirectional_iterator_tag { };
# 116 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_iterator_base_types.h" 3
  template<typename _Category, typename _Tp, typename _Distance = ptrdiff_t,
           typename _Pointer = _Tp*, typename _Reference = _Tp&>
    struct iterator
    {

      typedef _Category iterator_category;

      typedef _Tp value_type;

      typedef _Distance difference_type;

      typedef _Pointer pointer;

      typedef _Reference reference;
    };
# 162 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_iterator_base_types.h" 3
  template<typename _Iterator>
    struct iterator_traits
    {
      typedef typename _Iterator::iterator_category iterator_category;
      typedef typename _Iterator::value_type value_type;
      typedef typename _Iterator::difference_type difference_type;
      typedef typename _Iterator::pointer pointer;
      typedef typename _Iterator::reference reference;
    };



  template<typename _Tp>
    struct iterator_traits<_Tp*>
    {
      typedef random_access_iterator_tag iterator_category;
      typedef _Tp value_type;
      typedef ptrdiff_t difference_type;
      typedef _Tp* pointer;
      typedef _Tp& reference;
    };


  template<typename _Tp>
    struct iterator_traits<const _Tp*>
    {
      typedef random_access_iterator_tag iterator_category;
      typedef _Tp value_type;
      typedef ptrdiff_t difference_type;
      typedef const _Tp* pointer;
      typedef const _Tp& reference;
    };





  template<typename _Iter>
    inline typename iterator_traits<_Iter>::iterator_category
    __iterator_category(const _Iter&)
    { return typename iterator_traits<_Iter>::iterator_category(); }





  template<typename _Iterator, bool _HasBase>
    struct _Iter_base
    {
      typedef _Iterator iterator_type;
      static iterator_type _S_base(_Iterator __it)
      { return __it; }
    };

  template<typename _Iterator>
    struct _Iter_base<_Iterator, true>
    {
      typedef typename _Iterator::iterator_type iterator_type;
      static iterator_type _S_base(_Iterator __it)
      { return __it.base(); }
    };
# 232 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_iterator_base_types.h" 3

}
# 66 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_algobase.h" 2 3
# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_iterator_base_funcs.h" 1 3
# 62 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_iterator_base_funcs.h" 3
       
# 63 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_iterator_base_funcs.h" 3


# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/debug/debug.h" 1 3
# 46 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/debug/debug.h" 3
namespace std
{
  namespace __debug { }
}




namespace __gnu_debug
{
  using namespace std::__debug;
}
# 66 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_iterator_base_funcs.h" 2 3

namespace std __attribute__ ((__visibility__ ("default")))
{


  template<typename _InputIterator>
    inline typename iterator_traits<_InputIterator>::difference_type
    __distance(_InputIterator __first, _InputIterator __last,
               input_iterator_tag)
    {

     

      typename iterator_traits<_InputIterator>::difference_type __n = 0;
      while (__first != __last)
 {
   ++__first;
   ++__n;
 }
      return __n;
    }

  template<typename _RandomAccessIterator>
    inline typename iterator_traits<_RandomAccessIterator>::difference_type
    __distance(_RandomAccessIterator __first, _RandomAccessIterator __last,
               random_access_iterator_tag)
    {

     

      return __last - __first;
    }
# 112 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_iterator_base_funcs.h" 3
  template<typename _InputIterator>
    inline typename iterator_traits<_InputIterator>::difference_type
    distance(_InputIterator __first, _InputIterator __last)
    {

      return std::__distance(__first, __last,
        std::__iterator_category(__first));
    }

  template<typename _InputIterator, typename _Distance>
    inline void
    __advance(_InputIterator& __i, _Distance __n, input_iterator_tag)
    {

     
      ;
      while (__n--)
 ++__i;
    }

  template<typename _BidirectionalIterator, typename _Distance>
    inline void
    __advance(_BidirectionalIterator& __i, _Distance __n,
       bidirectional_iterator_tag)
    {

     

      if (__n > 0)
        while (__n--)
   ++__i;
      else
        while (__n++)
   --__i;
    }

  template<typename _RandomAccessIterator, typename _Distance>
    inline void
    __advance(_RandomAccessIterator& __i, _Distance __n,
              random_access_iterator_tag)
    {

     

      __i += __n;
    }
# 171 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_iterator_base_funcs.h" 3
  template<typename _InputIterator, typename _Distance>
    inline void
    advance(_InputIterator& __i, _Distance __n)
    {

      typename iterator_traits<_InputIterator>::difference_type __d = __n;
      std::__advance(__i, __d, std::__iterator_category(__i));
    }
# 202 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_iterator_base_funcs.h" 3

}
# 67 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_algobase.h" 2 3
# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_iterator.h" 1 3
# 66 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_iterator.h" 3
# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/ptr_traits.h" 1 3
# 67 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_iterator.h" 2 3

namespace std __attribute__ ((__visibility__ ("default")))
{

# 96 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_iterator.h" 3
  template<typename _Iterator>
    class reverse_iterator
    : public iterator<typename iterator_traits<_Iterator>::iterator_category,
        typename iterator_traits<_Iterator>::value_type,
        typename iterator_traits<_Iterator>::difference_type,
        typename iterator_traits<_Iterator>::pointer,
                      typename iterator_traits<_Iterator>::reference>
    {
    protected:
      _Iterator current;

      typedef iterator_traits<_Iterator> __traits_type;

    public:
      typedef _Iterator iterator_type;
      typedef typename __traits_type::difference_type difference_type;
      typedef typename __traits_type::pointer pointer;
      typedef typename __traits_type::reference reference;







      reverse_iterator() : current() { }




      explicit
      reverse_iterator(iterator_type __x) : current(__x) { }




      reverse_iterator(const reverse_iterator& __x)
      : current(__x.current) { }





      template<typename _Iter>
        reverse_iterator(const reverse_iterator<_Iter>& __x)
 : current(__x.base()) { }




      iterator_type
      base() const
      { return current; }
# 160 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_iterator.h" 3
      reference
      operator*() const
      {
 _Iterator __tmp = current;
 return *--__tmp;
      }






      pointer
      operator->() const
      { return &(operator*()); }






      reverse_iterator&
      operator++()
      {
 --current;
 return *this;
      }






      reverse_iterator
      operator++(int)
      {
 reverse_iterator __tmp = *this;
 --current;
 return __tmp;
      }






      reverse_iterator&
      operator--()
      {
 ++current;
 return *this;
      }






      reverse_iterator
      operator--(int)
      {
 reverse_iterator __tmp = *this;
 ++current;
 return __tmp;
      }






      reverse_iterator
      operator+(difference_type __n) const
      { return reverse_iterator(current - __n); }







      reverse_iterator&
      operator+=(difference_type __n)
      {
 current -= __n;
 return *this;
      }






      reverse_iterator
      operator-(difference_type __n) const
      { return reverse_iterator(current + __n); }







      reverse_iterator&
      operator-=(difference_type __n)
      {
 current += __n;
 return *this;
      }






      reference
      operator[](difference_type __n) const
      { return *(*this + __n); }
    };
# 290 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_iterator.h" 3
  template<typename _Iterator>
    inline bool
    operator==(const reverse_iterator<_Iterator>& __x,
        const reverse_iterator<_Iterator>& __y)
    { return __x.base() == __y.base(); }

  template<typename _Iterator>
    inline bool
    operator<(const reverse_iterator<_Iterator>& __x,
       const reverse_iterator<_Iterator>& __y)
    { return __y.base() < __x.base(); }

  template<typename _Iterator>
    inline bool
    operator!=(const reverse_iterator<_Iterator>& __x,
        const reverse_iterator<_Iterator>& __y)
    { return !(__x == __y); }

  template<typename _Iterator>
    inline bool
    operator>(const reverse_iterator<_Iterator>& __x,
       const reverse_iterator<_Iterator>& __y)
    { return __y < __x; }

  template<typename _Iterator>
    inline bool
    operator<=(const reverse_iterator<_Iterator>& __x,
        const reverse_iterator<_Iterator>& __y)
    { return !(__y < __x); }

  template<typename _Iterator>
    inline bool
    operator>=(const reverse_iterator<_Iterator>& __x,
        const reverse_iterator<_Iterator>& __y)
    { return !(__x < __y); }

  template<typename _Iterator>
    inline typename reverse_iterator<_Iterator>::difference_type
    operator-(const reverse_iterator<_Iterator>& __x,
       const reverse_iterator<_Iterator>& __y)
    { return __y.base() - __x.base(); }

  template<typename _Iterator>
    inline reverse_iterator<_Iterator>
    operator+(typename reverse_iterator<_Iterator>::difference_type __n,
       const reverse_iterator<_Iterator>& __x)
    { return reverse_iterator<_Iterator>(__x.base() - __n); }



  template<typename _IteratorL, typename _IteratorR>
    inline bool
    operator==(const reverse_iterator<_IteratorL>& __x,
        const reverse_iterator<_IteratorR>& __y)
    { return __x.base() == __y.base(); }

  template<typename _IteratorL, typename _IteratorR>
    inline bool
    operator<(const reverse_iterator<_IteratorL>& __x,
       const reverse_iterator<_IteratorR>& __y)
    { return __y.base() < __x.base(); }

  template<typename _IteratorL, typename _IteratorR>
    inline bool
    operator!=(const reverse_iterator<_IteratorL>& __x,
        const reverse_iterator<_IteratorR>& __y)
    { return !(__x == __y); }

  template<typename _IteratorL, typename _IteratorR>
    inline bool
    operator>(const reverse_iterator<_IteratorL>& __x,
       const reverse_iterator<_IteratorR>& __y)
    { return __y < __x; }

  template<typename _IteratorL, typename _IteratorR>
    inline bool
    operator<=(const reverse_iterator<_IteratorL>& __x,
        const reverse_iterator<_IteratorR>& __y)
    { return !(__y < __x); }

  template<typename _IteratorL, typename _IteratorR>
    inline bool
    operator>=(const reverse_iterator<_IteratorL>& __x,
        const reverse_iterator<_IteratorR>& __y)
    { return !(__x < __y); }

  template<typename _IteratorL, typename _IteratorR>







    inline typename reverse_iterator<_IteratorL>::difference_type
    operator-(const reverse_iterator<_IteratorL>& __x,
       const reverse_iterator<_IteratorR>& __y)

    { return __y.base() - __x.base(); }
# 402 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_iterator.h" 3
  template<typename _Container>
    class back_insert_iterator
    : public iterator<output_iterator_tag, void, void, void, void>
    {
    protected:
      _Container* container;

    public:

      typedef _Container container_type;


      explicit
      back_insert_iterator(_Container& __x) : container(&__x) { }
# 429 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_iterator.h" 3
      back_insert_iterator&
      operator=(typename _Container::const_reference __value)
      {
 container->push_back(__value);
 return *this;
      }
# 452 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_iterator.h" 3
      back_insert_iterator&
      operator*()
      { return *this; }


      back_insert_iterator&
      operator++()
      { return *this; }


      back_insert_iterator
      operator++(int)
      { return *this; }
    };
# 478 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_iterator.h" 3
  template<typename _Container>
    inline back_insert_iterator<_Container>
    back_inserter(_Container& __x)
    { return back_insert_iterator<_Container>(__x); }
# 493 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_iterator.h" 3
  template<typename _Container>
    class front_insert_iterator
    : public iterator<output_iterator_tag, void, void, void, void>
    {
    protected:
      _Container* container;

    public:

      typedef _Container container_type;


      explicit front_insert_iterator(_Container& __x) : container(&__x) { }
# 519 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_iterator.h" 3
      front_insert_iterator&
      operator=(typename _Container::const_reference __value)
      {
 container->push_front(__value);
 return *this;
      }
# 542 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_iterator.h" 3
      front_insert_iterator&
      operator*()
      { return *this; }


      front_insert_iterator&
      operator++()
      { return *this; }


      front_insert_iterator
      operator++(int)
      { return *this; }
    };
# 568 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_iterator.h" 3
  template<typename _Container>
    inline front_insert_iterator<_Container>
    front_inserter(_Container& __x)
    { return front_insert_iterator<_Container>(__x); }
# 587 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_iterator.h" 3
  template<typename _Container>
    class insert_iterator
    : public iterator<output_iterator_tag, void, void, void, void>
    {
    protected:
      _Container* container;
      typename _Container::iterator iter;

    public:

      typedef _Container container_type;





      insert_iterator(_Container& __x, typename _Container::iterator __i)
      : container(&__x), iter(__i) {}
# 630 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_iterator.h" 3
      insert_iterator&
      operator=(typename _Container::const_reference __value)
      {
 iter = container->insert(iter, __value);
 ++iter;
 return *this;
      }
# 656 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_iterator.h" 3
      insert_iterator&
      operator*()
      { return *this; }


      insert_iterator&
      operator++()
      { return *this; }


      insert_iterator&
      operator++(int)
      { return *this; }
    };
# 682 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_iterator.h" 3
  template<typename _Container, typename _Iterator>
    inline insert_iterator<_Container>
    inserter(_Container& __x, _Iterator __i)
    {
      return insert_iterator<_Container>(__x,
      typename _Container::iterator(__i));
    }




}

namespace __gnu_cxx __attribute__ ((__visibility__ ("default")))
{

# 706 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_iterator.h" 3
  using std::iterator_traits;
  using std::iterator;
  template<typename _Iterator, typename _Container>
    class __normal_iterator
    {
    protected:
      _Iterator _M_current;

      typedef iterator_traits<_Iterator> __traits_type;

    public:
      typedef _Iterator iterator_type;
      typedef typename __traits_type::iterator_category iterator_category;
      typedef typename __traits_type::value_type value_type;
      typedef typename __traits_type::difference_type difference_type;
      typedef typename __traits_type::reference reference;
      typedef typename __traits_type::pointer pointer;

      __normal_iterator()
      : _M_current(_Iterator()) { }

      explicit
      __normal_iterator(const _Iterator& __i)
      : _M_current(__i) { }


      template<typename _Iter>
        __normal_iterator(const __normal_iterator<_Iter,
     typename __enable_if<
              (std::__are_same<_Iter, typename _Container::pointer>::__value),
        _Container>::__type>& __i)
        : _M_current(__i.base()) { }


      reference
      operator*() const
      { return *_M_current; }

      pointer
      operator->() const
      { return _M_current; }

      __normal_iterator&
      operator++()
      {
 ++_M_current;
 return *this;
      }

      __normal_iterator
      operator++(int)
      { return __normal_iterator(_M_current++); }


      __normal_iterator&
      operator--()
      {
 --_M_current;
 return *this;
      }

      __normal_iterator
      operator--(int)
      { return __normal_iterator(_M_current--); }


      reference
      operator[](difference_type __n) const
      { return _M_current[__n]; }

      __normal_iterator&
      operator+=(difference_type __n)
      { _M_current += __n; return *this; }

      __normal_iterator
      operator+(difference_type __n) const
      { return __normal_iterator(_M_current + __n); }

      __normal_iterator&
      operator-=(difference_type __n)
      { _M_current -= __n; return *this; }

      __normal_iterator
      operator-(difference_type __n) const
      { return __normal_iterator(_M_current - __n); }

      const _Iterator&
      base() const
      { return _M_current; }
    };
# 806 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_iterator.h" 3
  template<typename _IteratorL, typename _IteratorR, typename _Container>
    inline bool
    operator==(const __normal_iterator<_IteratorL, _Container>& __lhs,
        const __normal_iterator<_IteratorR, _Container>& __rhs)
   
    { return __lhs.base() == __rhs.base(); }

  template<typename _Iterator, typename _Container>
    inline bool
    operator==(const __normal_iterator<_Iterator, _Container>& __lhs,
        const __normal_iterator<_Iterator, _Container>& __rhs)
   
    { return __lhs.base() == __rhs.base(); }

  template<typename _IteratorL, typename _IteratorR, typename _Container>
    inline bool
    operator!=(const __normal_iterator<_IteratorL, _Container>& __lhs,
        const __normal_iterator<_IteratorR, _Container>& __rhs)
   
    { return __lhs.base() != __rhs.base(); }

  template<typename _Iterator, typename _Container>
    inline bool
    operator!=(const __normal_iterator<_Iterator, _Container>& __lhs,
        const __normal_iterator<_Iterator, _Container>& __rhs)
   
    { return __lhs.base() != __rhs.base(); }


  template<typename _IteratorL, typename _IteratorR, typename _Container>
    inline bool
    operator<(const __normal_iterator<_IteratorL, _Container>& __lhs,
       const __normal_iterator<_IteratorR, _Container>& __rhs)
   
    { return __lhs.base() < __rhs.base(); }

  template<typename _Iterator, typename _Container>
    inline bool
    operator<(const __normal_iterator<_Iterator, _Container>& __lhs,
       const __normal_iterator<_Iterator, _Container>& __rhs)
   
    { return __lhs.base() < __rhs.base(); }

  template<typename _IteratorL, typename _IteratorR, typename _Container>
    inline bool
    operator>(const __normal_iterator<_IteratorL, _Container>& __lhs,
       const __normal_iterator<_IteratorR, _Container>& __rhs)
   
    { return __lhs.base() > __rhs.base(); }

  template<typename _Iterator, typename _Container>
    inline bool
    operator>(const __normal_iterator<_Iterator, _Container>& __lhs,
       const __normal_iterator<_Iterator, _Container>& __rhs)
   
    { return __lhs.base() > __rhs.base(); }

  template<typename _IteratorL, typename _IteratorR, typename _Container>
    inline bool
    operator<=(const __normal_iterator<_IteratorL, _Container>& __lhs,
        const __normal_iterator<_IteratorR, _Container>& __rhs)
   
    { return __lhs.base() <= __rhs.base(); }

  template<typename _Iterator, typename _Container>
    inline bool
    operator<=(const __normal_iterator<_Iterator, _Container>& __lhs,
        const __normal_iterator<_Iterator, _Container>& __rhs)
   
    { return __lhs.base() <= __rhs.base(); }

  template<typename _IteratorL, typename _IteratorR, typename _Container>
    inline bool
    operator>=(const __normal_iterator<_IteratorL, _Container>& __lhs,
        const __normal_iterator<_IteratorR, _Container>& __rhs)
   
    { return __lhs.base() >= __rhs.base(); }

  template<typename _Iterator, typename _Container>
    inline bool
    operator>=(const __normal_iterator<_Iterator, _Container>& __lhs,
        const __normal_iterator<_Iterator, _Container>& __rhs)
   
    { return __lhs.base() >= __rhs.base(); }





  template<typename _IteratorL, typename _IteratorR, typename _Container>







    inline typename __normal_iterator<_IteratorL, _Container>::difference_type
    operator-(const __normal_iterator<_IteratorL, _Container>& __lhs,
       const __normal_iterator<_IteratorR, _Container>& __rhs)

    { return __lhs.base() - __rhs.base(); }

  template<typename _Iterator, typename _Container>
    inline typename __normal_iterator<_Iterator, _Container>::difference_type
    operator-(const __normal_iterator<_Iterator, _Container>& __lhs,
       const __normal_iterator<_Iterator, _Container>& __rhs)
   
    { return __lhs.base() - __rhs.base(); }

  template<typename _Iterator, typename _Container>
    inline __normal_iterator<_Iterator, _Container>
    operator+(typename __normal_iterator<_Iterator, _Container>::difference_type
       __n, const __normal_iterator<_Iterator, _Container>& __i)
   
    { return __normal_iterator<_Iterator, _Container>(__i.base() + __n); }


}
# 68 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_algobase.h" 2 3



# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/predefined_ops.h" 1 3
# 33 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/predefined_ops.h" 3
namespace __gnu_cxx
{
namespace __ops
{
  struct _Iter_less_iter
  {
    template<typename _Iterator1, typename _Iterator2>
      bool
      operator()(_Iterator1 __it1, _Iterator2 __it2) const
      { return *__it1 < *__it2; }
  };

  inline _Iter_less_iter
  __iter_less_iter()
  { return _Iter_less_iter(); }

  struct _Iter_less_val
  {
    template<typename _Iterator, typename _Value>
      bool
      operator()(_Iterator __it, _Value& __val) const
      { return *__it < __val; }
    };

  inline _Iter_less_val
  __iter_less_val()
  { return _Iter_less_val(); }

  inline _Iter_less_val
  __iter_comp_val(_Iter_less_iter)
  { return _Iter_less_val(); }

  struct _Val_less_iter
  {
    template<typename _Value, typename _Iterator>
      bool
      operator()(_Value& __val, _Iterator __it) const
      { return __val < *__it; }
    };

  inline _Val_less_iter
  __val_less_iter()
  { return _Val_less_iter(); }

  inline _Val_less_iter
  __val_comp_iter(_Iter_less_iter)
  { return _Val_less_iter(); }

  struct _Iter_equal_to_iter
  {
    template<typename _Iterator1, typename _Iterator2>
      bool
      operator()(_Iterator1 __it1, _Iterator2 __it2) const
      { return *__it1 == *__it2; }
    };

  inline _Iter_equal_to_iter
  __iter_equal_to_iter()
  { return _Iter_equal_to_iter(); }

  struct _Iter_equal_to_val
  {
    template<typename _Iterator, typename _Value>
      bool
      operator()(_Iterator __it, _Value& __val) const
      { return *__it == __val; }
    };

  inline _Iter_equal_to_val
  __iter_equal_to_val()
  { return _Iter_equal_to_val(); }

  inline _Iter_equal_to_val
  __iter_comp_val(_Iter_equal_to_iter)
  { return _Iter_equal_to_val(); }

  template<typename _Compare>
    struct _Iter_comp_iter
    {
      _Compare _M_comp;

      _Iter_comp_iter(_Compare __comp)
 : _M_comp(__comp)
      { }

      template<typename _Iterator1, typename _Iterator2>
        bool
        operator()(_Iterator1 __it1, _Iterator2 __it2)
        { return bool(_M_comp(*__it1, *__it2)); }
    };

  template<typename _Compare>
    inline _Iter_comp_iter<_Compare>
    __iter_comp_iter(_Compare __comp)
    { return _Iter_comp_iter<_Compare>(__comp); }

  template<typename _Compare>
    struct _Iter_comp_val
    {
      _Compare _M_comp;

      _Iter_comp_val(_Compare __comp)
 : _M_comp(__comp)
      { }

      template<typename _Iterator, typename _Value>
 bool
 operator()(_Iterator __it, _Value& __val)
 { return bool(_M_comp(*__it, __val)); }
    };

  template<typename _Compare>
   inline _Iter_comp_val<_Compare>
    __iter_comp_val(_Compare __comp)
    { return _Iter_comp_val<_Compare>(__comp); }

  template<typename _Compare>
    inline _Iter_comp_val<_Compare>
    __iter_comp_val(_Iter_comp_iter<_Compare> __comp)
    { return _Iter_comp_val<_Compare>(__comp._M_comp); }

  template<typename _Compare>
    struct _Val_comp_iter
    {
      _Compare _M_comp;

      _Val_comp_iter(_Compare __comp)
 : _M_comp(__comp)
      { }

      template<typename _Value, typename _Iterator>
 bool
 operator()(_Value& __val, _Iterator __it)
 { return bool(_M_comp(__val, *__it)); }
    };

  template<typename _Compare>
    inline _Val_comp_iter<_Compare>
    __val_comp_iter(_Compare __comp)
    { return _Val_comp_iter<_Compare>(__comp); }

  template<typename _Compare>
    inline _Val_comp_iter<_Compare>
    __val_comp_iter(_Iter_comp_iter<_Compare> __comp)
    { return _Val_comp_iter<_Compare>(__comp._M_comp); }

  template<typename _Value>
    struct _Iter_equals_val
    {
      _Value& _M_value;

      _Iter_equals_val(_Value& __value)
 : _M_value(__value)
      { }

      template<typename _Iterator>
 bool
 operator()(_Iterator __it)
 { return *__it == _M_value; }
    };

  template<typename _Value>
    inline _Iter_equals_val<_Value>
    __iter_equals_val(_Value& __val)
    { return _Iter_equals_val<_Value>(__val); }

  template<typename _Iterator1>
    struct _Iter_equals_iter
    {
      typename std::iterator_traits<_Iterator1>::reference _M_ref;

      _Iter_equals_iter(_Iterator1 __it1)
 : _M_ref(*__it1)
      { }

      template<typename _Iterator2>
 bool
 operator()(_Iterator2 __it2)
 { return *__it2 == _M_ref; }
    };

  template<typename _Iterator>
    inline _Iter_equals_iter<_Iterator>
    __iter_comp_iter(_Iter_equal_to_iter, _Iterator __it)
    { return _Iter_equals_iter<_Iterator>(__it); }

  template<typename _Predicate>
    struct _Iter_pred
    {
      _Predicate _M_pred;

      _Iter_pred(_Predicate __pred)
 : _M_pred(__pred)
      { }

      template<typename _Iterator>
 bool
 operator()(_Iterator __it)
 { return bool(_M_pred(*__it)); }
    };

  template<typename _Predicate>
    inline _Iter_pred<_Predicate>
    __pred_iter(_Predicate __pred)
    { return _Iter_pred<_Predicate>(__pred); }

  template<typename _Compare, typename _Value>
    struct _Iter_comp_to_val
    {
      _Compare _M_comp;
      _Value& _M_value;

      _Iter_comp_to_val(_Compare __comp, _Value& __value)
 : _M_comp(__comp), _M_value(__value)
      { }

      template<typename _Iterator>
 bool
 operator()(_Iterator __it)
 { return bool(_M_comp(*__it, _M_value)); }
    };

  template<typename _Compare, typename _Value>
    _Iter_comp_to_val<_Compare, _Value>
    __iter_comp_val(_Compare __comp, _Value &__val)
    { return _Iter_comp_to_val<_Compare, _Value>(__comp, __val); }

  template<typename _Compare, typename _Iterator1>
    struct _Iter_comp_to_iter
    {
      _Compare _M_comp;
      typename std::iterator_traits<_Iterator1>::reference _M_ref;

      _Iter_comp_to_iter(_Compare __comp, _Iterator1 __it1)
 : _M_comp(__comp), _M_ref(*__it1)
      { }

      template<typename _Iterator2>
 bool
 operator()(_Iterator2 __it2)
 { return bool(_M_comp(*__it2, _M_ref)); }
    };

  template<typename _Compare, typename _Iterator>
    inline _Iter_comp_to_iter<_Compare, _Iterator>
    __iter_comp_iter(_Iter_comp_iter<_Compare> __comp, _Iterator __it)
    { return _Iter_comp_to_iter<_Compare, _Iterator>(__comp._M_comp, __it); }

  template<typename _Predicate>
    struct _Iter_negate
    {
      _Predicate _M_pred;

      _Iter_negate(_Predicate __pred)
 : _M_pred(__pred)
      { }

      template<typename _Iterator>
 bool
 operator()(_Iterator __it)
 { return !bool(_M_pred(*__it)); }
    };

  template<typename _Predicate>
    inline _Iter_negate<_Predicate>
    __negate(_Iter_pred<_Predicate> __pred)
    { return _Iter_negate<_Predicate>(__pred._M_pred); }

}
}
# 72 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_algobase.h" 2 3

namespace std __attribute__ ((__visibility__ ("default")))
{






  template<bool _BoolType>
    struct __iter_swap
    {
      template<typename _ForwardIterator1, typename _ForwardIterator2>
        static void
        iter_swap(_ForwardIterator1 __a, _ForwardIterator2 __b)
        {
          typedef typename iterator_traits<_ForwardIterator1>::value_type
            _ValueType1;
          _ValueType1 __tmp = (*__a);
          *__a = (*__b);
          *__b = (__tmp);
 }
    };

  template<>
    struct __iter_swap<true>
    {
      template<typename _ForwardIterator1, typename _ForwardIterator2>
        static void
        iter_swap(_ForwardIterator1 __a, _ForwardIterator2 __b)
        {
          swap(*__a, *__b);
        }
    };
# 118 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_algobase.h" 3
  template<typename _ForwardIterator1, typename _ForwardIterator2>
    inline void
    iter_swap(_ForwardIterator1 __a, _ForwardIterator2 __b)
    {

     

     



      typedef typename iterator_traits<_ForwardIterator1>::value_type
 _ValueType1;
      typedef typename iterator_traits<_ForwardIterator2>::value_type
 _ValueType2;

     

     


      typedef typename iterator_traits<_ForwardIterator1>::reference
 _ReferenceType1;
      typedef typename iterator_traits<_ForwardIterator2>::reference
 _ReferenceType2;
      std::__iter_swap<__are_same<_ValueType1, _ValueType2>::__value
 && __are_same<_ValueType1&, _ReferenceType1>::__value
 && __are_same<_ValueType2&, _ReferenceType2>::__value>::
 iter_swap(__a, __b);



    }
# 164 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_algobase.h" 3
  template<typename _ForwardIterator1, typename _ForwardIterator2>
    _ForwardIterator2
    swap_ranges(_ForwardIterator1 __first1, _ForwardIterator1 __last1,
  _ForwardIterator2 __first2)
    {

     

     

      ;

      for (; __first1 != __last1; ++__first1, ++__first2)
 std::iter_swap(__first1, __first2);
      return __first2;
    }
# 192 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_algobase.h" 3
  template<typename _Tp>
    inline const _Tp&
    min(const _Tp& __a, const _Tp& __b)
    {

     

      if (__b < __a)
 return __b;
      return __a;
    }
# 215 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_algobase.h" 3
  template<typename _Tp>
    inline const _Tp&
    max(const _Tp& __a, const _Tp& __b)
    {

     

      if (__a < __b)
 return __b;
      return __a;
    }
# 238 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_algobase.h" 3
  template<typename _Tp, typename _Compare>
    inline const _Tp&
    min(const _Tp& __a, const _Tp& __b, _Compare __comp)
    {

      if (__comp(__b, __a))
 return __b;
      return __a;
    }
# 259 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_algobase.h" 3
  template<typename _Tp, typename _Compare>
    inline const _Tp&
    max(const _Tp& __a, const _Tp& __b, _Compare __comp)
    {

      if (__comp(__a, __b))
 return __b;
      return __a;
    }



  template<typename _Iterator>
    struct _Niter_base
    : _Iter_base<_Iterator, __is_normal_iterator<_Iterator>::__value>
    { };

  template<typename _Iterator>
    inline typename _Niter_base<_Iterator>::iterator_type
    __niter_base(_Iterator __it)
    { return std::_Niter_base<_Iterator>::_S_base(__it); }


  template<typename _Iterator>
    struct _Miter_base
    : _Iter_base<_Iterator, __is_move_iterator<_Iterator>::__value>
    { };

  template<typename _Iterator>
    inline typename _Miter_base<_Iterator>::iterator_type
    __miter_base(_Iterator __it)
    { return std::_Miter_base<_Iterator>::_S_base(__it); }







  template<bool, bool, typename>
    struct __copy_move
    {
      template<typename _II, typename _OI>
        static _OI
        __copy_m(_II __first, _II __last, _OI __result)
        {
   for (; __first != __last; ++__result, ++__first)
     *__result = *__first;
   return __result;
 }
    };
# 326 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_algobase.h" 3
  template<>
    struct __copy_move<false, false, random_access_iterator_tag>
    {
      template<typename _II, typename _OI>
        static _OI
        __copy_m(_II __first, _II __last, _OI __result)
        {
   typedef typename iterator_traits<_II>::difference_type _Distance;
   for(_Distance __n = __last - __first; __n > 0; --__n)
     {
       *__result = *__first;
       ++__first;
       ++__result;
     }
   return __result;
 }
    };
# 364 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_algobase.h" 3
  template<bool _IsMove>
    struct __copy_move<_IsMove, true, random_access_iterator_tag>
    {
      template<typename _Tp>
        static _Tp*
        __copy_m(const _Tp* __first, const _Tp* __last, _Tp* __result)
        {





   const ptrdiff_t _Num = __last - __first;
   if (_Num)
     __builtin_memmove(__result, __first, sizeof(_Tp) * _Num);
   return __result + _Num;
 }
    };

  template<bool _IsMove, typename _II, typename _OI>
    inline _OI
    __copy_move_a(_II __first, _II __last, _OI __result)
    {
      typedef typename iterator_traits<_II>::value_type _ValueTypeI;
      typedef typename iterator_traits<_OI>::value_type _ValueTypeO;
      typedef typename iterator_traits<_II>::iterator_category _Category;
      const bool __simple = (__is_trivial(_ValueTypeI)
                      && __is_pointer<_II>::__value
                      && __is_pointer<_OI>::__value
        && __are_same<_ValueTypeI, _ValueTypeO>::__value);

      return std::__copy_move<_IsMove, __simple,
                       _Category>::__copy_m(__first, __last, __result);
    }



  template<typename _CharT>
    struct char_traits;

  template<typename _CharT, typename _Traits>
    class istreambuf_iterator;

  template<typename _CharT, typename _Traits>
    class ostreambuf_iterator;

  template<bool _IsMove, typename _CharT>
    typename __gnu_cxx::__enable_if<__is_char<_CharT>::__value,
      ostreambuf_iterator<_CharT, char_traits<_CharT> > >::__type
    __copy_move_a2(_CharT*, _CharT*,
     ostreambuf_iterator<_CharT, char_traits<_CharT> >);

  template<bool _IsMove, typename _CharT>
    typename __gnu_cxx::__enable_if<__is_char<_CharT>::__value,
      ostreambuf_iterator<_CharT, char_traits<_CharT> > >::__type
    __copy_move_a2(const _CharT*, const _CharT*,
     ostreambuf_iterator<_CharT, char_traits<_CharT> >);

  template<bool _IsMove, typename _CharT>
    typename __gnu_cxx::__enable_if<__is_char<_CharT>::__value,
        _CharT*>::__type
    __copy_move_a2(istreambuf_iterator<_CharT, char_traits<_CharT> >,
     istreambuf_iterator<_CharT, char_traits<_CharT> >, _CharT*);

  template<bool _IsMove, typename _II, typename _OI>
    inline _OI
    __copy_move_a2(_II __first, _II __last, _OI __result)
    {
      return _OI(std::__copy_move_a<_IsMove>(std::__niter_base(__first),
          std::__niter_base(__last),
          std::__niter_base(__result)));
    }
# 454 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_algobase.h" 3
  template<typename _II, typename _OI>
    inline _OI
    copy(_II __first, _II __last, _OI __result)
    {

     
     

      ;

      return (std::__copy_move_a2<__is_move_iterator<_II>::__value>
       (std::__miter_base(__first), std::__miter_base(__last),
        __result));
    }
# 506 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_algobase.h" 3
  template<bool, bool, typename>
    struct __copy_move_backward
    {
      template<typename _BI1, typename _BI2>
        static _BI2
        __copy_move_b(_BI1 __first, _BI1 __last, _BI2 __result)
        {
   while (__first != __last)
     *--__result = *--__last;
   return __result;
 }
    };
# 534 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_algobase.h" 3
  template<>
    struct __copy_move_backward<false, false, random_access_iterator_tag>
    {
      template<typename _BI1, typename _BI2>
        static _BI2
        __copy_move_b(_BI1 __first, _BI1 __last, _BI2 __result)
        {
   typename iterator_traits<_BI1>::difference_type __n;
   for (__n = __last - __first; __n > 0; --__n)
     *--__result = *--__last;
   return __result;
 }
    };
# 564 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_algobase.h" 3
  template<bool _IsMove>
    struct __copy_move_backward<_IsMove, true, random_access_iterator_tag>
    {
      template<typename _Tp>
        static _Tp*
        __copy_move_b(const _Tp* __first, const _Tp* __last, _Tp* __result)
        {





   const ptrdiff_t _Num = __last - __first;
   if (_Num)
     __builtin_memmove(__result - _Num, __first, sizeof(_Tp) * _Num);
   return __result - _Num;
 }
    };

  template<bool _IsMove, typename _BI1, typename _BI2>
    inline _BI2
    __copy_move_backward_a(_BI1 __first, _BI1 __last, _BI2 __result)
    {
      typedef typename iterator_traits<_BI1>::value_type _ValueType1;
      typedef typename iterator_traits<_BI2>::value_type _ValueType2;
      typedef typename iterator_traits<_BI1>::iterator_category _Category;
      const bool __simple = (__is_trivial(_ValueType1)
                      && __is_pointer<_BI1>::__value
                      && __is_pointer<_BI2>::__value
        && __are_same<_ValueType1, _ValueType2>::__value);

      return std::__copy_move_backward<_IsMove, __simple,
                                _Category>::__copy_move_b(__first,
         __last,
         __result);
    }

  template<bool _IsMove, typename _BI1, typename _BI2>
    inline _BI2
    __copy_move_backward_a2(_BI1 __first, _BI1 __last, _BI2 __result)
    {
      return _BI2(std::__copy_move_backward_a<_IsMove>
    (std::__niter_base(__first), std::__niter_base(__last),
     std::__niter_base(__result)));
    }
# 628 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_algobase.h" 3
  template<typename _BI1, typename _BI2>
    inline _BI2
    copy_backward(_BI1 __first, _BI1 __last, _BI2 __result)
    {

     
     
     


      ;

      return (std::__copy_move_backward_a2<__is_move_iterator<_BI1>::__value>
       (std::__miter_base(__first), std::__miter_base(__last),
        __result));
    }
# 686 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_algobase.h" 3
  template<typename _ForwardIterator, typename _Tp>
    inline typename
    __gnu_cxx::__enable_if<!__is_scalar<_Tp>::__value, void>::__type
    __fill_a(_ForwardIterator __first, _ForwardIterator __last,
       const _Tp& __value)
    {
      for (; __first != __last; ++__first)
 *__first = __value;
    }

  template<typename _ForwardIterator, typename _Tp>
    inline typename
    __gnu_cxx::__enable_if<__is_scalar<_Tp>::__value, void>::__type
    __fill_a(_ForwardIterator __first, _ForwardIterator __last,
      const _Tp& __value)
    {
      const _Tp __tmp = __value;
      for (; __first != __last; ++__first)
 *__first = __tmp;
    }


  template<typename _Tp>
    inline typename
    __gnu_cxx::__enable_if<__is_byte<_Tp>::__value, void>::__type
    __fill_a(_Tp* __first, _Tp* __last, const _Tp& __c)
    {
      const _Tp __tmp = __c;
      __builtin_memset(__first, static_cast<unsigned char>(__tmp),
         __last - __first);
    }
# 730 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_algobase.h" 3
  template<typename _ForwardIterator, typename _Tp>
    inline void
    fill(_ForwardIterator __first, _ForwardIterator __last, const _Tp& __value)
    {

     

      ;

      std::__fill_a(std::__niter_base(__first), std::__niter_base(__last),
      __value);
    }

  template<typename _OutputIterator, typename _Size, typename _Tp>
    inline typename
    __gnu_cxx::__enable_if<!__is_scalar<_Tp>::__value, _OutputIterator>::__type
    __fill_n_a(_OutputIterator __first, _Size __n, const _Tp& __value)
    {
      for (__decltype(__n + 0) __niter = __n;
    __niter > 0; --__niter, ++__first)
 *__first = __value;
      return __first;
    }

  template<typename _OutputIterator, typename _Size, typename _Tp>
    inline typename
    __gnu_cxx::__enable_if<__is_scalar<_Tp>::__value, _OutputIterator>::__type
    __fill_n_a(_OutputIterator __first, _Size __n, const _Tp& __value)
    {
      const _Tp __tmp = __value;
      for (__decltype(__n + 0) __niter = __n;
    __niter > 0; --__niter, ++__first)
 *__first = __tmp;
      return __first;
    }

  template<typename _Size, typename _Tp>
    inline typename
    __gnu_cxx::__enable_if<__is_byte<_Tp>::__value, _Tp*>::__type
    __fill_n_a(_Tp* __first, _Size __n, const _Tp& __c)
    {
      std::__fill_a(__first, __first + __n, __c);
      return __first + __n;
    }
# 790 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_algobase.h" 3
  template<typename _OI, typename _Size, typename _Tp>
    inline _OI
    fill_n(_OI __first, _Size __n, const _Tp& __value)
    {

     

      return _OI(std::__fill_n_a(std::__niter_base(__first), __n, __value));
    }

  template<bool _BoolType>
    struct __equal
    {
      template<typename _II1, typename _II2>
        static bool
        equal(_II1 __first1, _II1 __last1, _II2 __first2)
        {
   for (; __first1 != __last1; ++__first1, ++__first2)
     if (!(*__first1 == *__first2))
       return false;
   return true;
 }
    };

  template<>
    struct __equal<true>
    {
      template<typename _Tp>
        static bool
        equal(const _Tp* __first1, const _Tp* __last1, const _Tp* __first2)
        {
   return !__builtin_memcmp(__first1, __first2, sizeof(_Tp)
       * (__last1 - __first1));
 }
    };

  template<typename _II1, typename _II2>
    inline bool
    __equal_aux(_II1 __first1, _II1 __last1, _II2 __first2)
    {
      typedef typename iterator_traits<_II1>::value_type _ValueType1;
      typedef typename iterator_traits<_II2>::value_type _ValueType2;
      const bool __simple = ((__is_integer<_ValueType1>::__value
         || __is_pointer<_ValueType1>::__value)
                      && __is_pointer<_II1>::__value
                      && __is_pointer<_II2>::__value
        && __are_same<_ValueType1, _ValueType2>::__value);

      return std::__equal<__simple>::equal(__first1, __last1, __first2);
    }

  template<typename, typename>
    struct __lc_rai
    {
      template<typename _II1, typename _II2>
        static _II1
        __newlast1(_II1, _II1 __last1, _II2, _II2)
        { return __last1; }

      template<typename _II>
        static bool
        __cnd2(_II __first, _II __last)
        { return __first != __last; }
    };

  template<>
    struct __lc_rai<random_access_iterator_tag, random_access_iterator_tag>
    {
      template<typename _RAI1, typename _RAI2>
        static _RAI1
        __newlast1(_RAI1 __first1, _RAI1 __last1,
     _RAI2 __first2, _RAI2 __last2)
        {
   const typename iterator_traits<_RAI1>::difference_type
     __diff1 = __last1 - __first1;
   const typename iterator_traits<_RAI2>::difference_type
     __diff2 = __last2 - __first2;
   return __diff2 < __diff1 ? __first1 + __diff2 : __last1;
 }

      template<typename _RAI>
        static bool
        __cnd2(_RAI, _RAI)
        { return true; }
    };

  template<typename _II1, typename _II2, typename _Compare>
    bool
    __lexicographical_compare_impl(_II1 __first1, _II1 __last1,
       _II2 __first2, _II2 __last2,
       _Compare __comp)
    {
      typedef typename iterator_traits<_II1>::iterator_category _Category1;
      typedef typename iterator_traits<_II2>::iterator_category _Category2;
      typedef std::__lc_rai<_Category1, _Category2> __rai_type;

      __last1 = __rai_type::__newlast1(__first1, __last1, __first2, __last2);
      for (; __first1 != __last1 && __rai_type::__cnd2(__first2, __last2);
    ++__first1, ++__first2)
 {
   if (__comp(__first1, __first2))
     return true;
   if (__comp(__first2, __first1))
     return false;
 }
      return __first1 == __last1 && __first2 != __last2;
    }

  template<bool _BoolType>
    struct __lexicographical_compare
    {
      template<typename _II1, typename _II2>
        static bool __lc(_II1, _II1, _II2, _II2);
    };

  template<bool _BoolType>
    template<typename _II1, typename _II2>
      bool
      __lexicographical_compare<_BoolType>::
      __lc(_II1 __first1, _II1 __last1, _II2 __first2, _II2 __last2)
      {
 return std::__lexicographical_compare_impl(__first1, __last1,
         __first2, __last2,
     __gnu_cxx::__ops::__iter_less_iter());
      }

  template<>
    struct __lexicographical_compare<true>
    {
      template<typename _Tp, typename _Up>
        static bool
        __lc(const _Tp* __first1, const _Tp* __last1,
      const _Up* __first2, const _Up* __last2)
 {
   const size_t __len1 = __last1 - __first1;
   const size_t __len2 = __last2 - __first2;
   const int __result = __builtin_memcmp(__first1, __first2,
      std::min(__len1, __len2));
   return __result != 0 ? __result < 0 : __len1 < __len2;
 }
    };

  template<typename _II1, typename _II2>
    inline bool
    __lexicographical_compare_aux(_II1 __first1, _II1 __last1,
      _II2 __first2, _II2 __last2)
    {
      typedef typename iterator_traits<_II1>::value_type _ValueType1;
      typedef typename iterator_traits<_II2>::value_type _ValueType2;
      const bool __simple =
 (__is_byte<_ValueType1>::__value && __is_byte<_ValueType2>::__value
  && !__gnu_cxx::__numeric_traits<_ValueType1>::__is_signed
  && !__gnu_cxx::__numeric_traits<_ValueType2>::__is_signed
  && __is_pointer<_II1>::__value
  && __is_pointer<_II2>::__value);

      return std::__lexicographical_compare<__simple>::__lc(__first1, __last1,
           __first2, __last2);
    }

  template<typename _ForwardIterator, typename _Tp, typename _Compare>
    _ForwardIterator
    __lower_bound(_ForwardIterator __first, _ForwardIterator __last,
    const _Tp& __val, _Compare __comp)
    {
      typedef typename iterator_traits<_ForwardIterator>::difference_type
 _DistanceType;

      _DistanceType __len = std::distance(__first, __last);

      while (__len > 0)
 {
   _DistanceType __half = __len >> 1;
   _ForwardIterator __middle = __first;
   std::advance(__middle, __half);
   if (__comp(__middle, __val))
     {
       __first = __middle;
       ++__first;
       __len = __len - __half - 1;
     }
   else
     __len = __half;
 }
      return __first;
    }
# 988 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_algobase.h" 3
  template<typename _ForwardIterator, typename _Tp>
    inline _ForwardIterator
    lower_bound(_ForwardIterator __first, _ForwardIterator __last,
  const _Tp& __val)
    {

     
     

      ;

      return std::__lower_bound(__first, __last, __val,
    __gnu_cxx::__ops::__iter_less_val());
    }



  inline int
  __lg(int __n)
  { return sizeof(int) * 8 - 1 - __builtin_clz(__n); }

  inline unsigned
  __lg(unsigned __n)
  { return sizeof(int) * 8 - 1 - __builtin_clz(__n); }

  inline long
  __lg(long __n)
  { return sizeof(long) * 8 - 1 - __builtin_clzl(__n); }

  inline unsigned long
  __lg(unsigned long __n)
  { return sizeof(long) * 8 - 1 - __builtin_clzl(__n); }

  inline long long
  __lg(long long __n)
  { return sizeof(long long) * 8 - 1 - __builtin_clzll(__n); }

  inline unsigned long long
  __lg(unsigned long long __n)
  { return sizeof(long long) * 8 - 1 - __builtin_clzll(__n); }




# 1045 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_algobase.h" 3
  template<typename _II1, typename _II2>
    inline bool
    equal(_II1 __first1, _II1 __last1, _II2 __first2)
    {

     
     
     


      ;

      return std::__equal_aux(std::__niter_base(__first1),
         std::__niter_base(__last1),
         std::__niter_base(__first2));
    }
# 1077 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_algobase.h" 3
  template<typename _IIter1, typename _IIter2, typename _BinaryPredicate>
    inline bool
    equal(_IIter1 __first1, _IIter1 __last1,
   _IIter2 __first2, _BinaryPredicate __binary_pred)
    {

     
     
      ;

      for (; __first1 != __last1; ++__first1, ++__first2)
 if (!bool(__binary_pred(*__first1, *__first2)))
   return false;
      return true;
    }
# 1205 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_algobase.h" 3
  template<typename _II1, typename _II2>
    inline bool
    lexicographical_compare(_II1 __first1, _II1 __last1,
       _II2 __first2, _II2 __last2)
    {





     
     
     
     
      ;
      ;

      return std::__lexicographical_compare_aux(std::__niter_base(__first1),
      std::__niter_base(__last1),
      std::__niter_base(__first2),
      std::__niter_base(__last2));
    }
# 1241 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_algobase.h" 3
  template<typename _II1, typename _II2, typename _Compare>
    inline bool
    lexicographical_compare(_II1 __first1, _II1 __last1,
       _II2 __first2, _II2 __last2, _Compare __comp)
    {

     
     
      ;
      ;

      return std::__lexicographical_compare_impl
 (__first1, __last1, __first2, __last2,
  __gnu_cxx::__ops::__iter_comp_iter(__comp));
    }

  template<typename _InputIterator1, typename _InputIterator2,
    typename _BinaryPredicate>
    pair<_InputIterator1, _InputIterator2>
    __mismatch(_InputIterator1 __first1, _InputIterator1 __last1,
        _InputIterator2 __first2, _BinaryPredicate __binary_pred)
    {
      while (__first1 != __last1 && __binary_pred(__first1, __first2))
        {
   ++__first1;
   ++__first2;
        }
      return pair<_InputIterator1, _InputIterator2>(__first1, __first2);
    }
# 1284 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_algobase.h" 3
  template<typename _InputIterator1, typename _InputIterator2>
    inline pair<_InputIterator1, _InputIterator2>
    mismatch(_InputIterator1 __first1, _InputIterator1 __last1,
      _InputIterator2 __first2)
    {

     
     
     


      ;

      return std::__mismatch(__first1, __last1, __first2,
        __gnu_cxx::__ops::__iter_equal_to_iter());
    }
# 1317 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_algobase.h" 3
  template<typename _InputIterator1, typename _InputIterator2,
    typename _BinaryPredicate>
    inline pair<_InputIterator1, _InputIterator2>
    mismatch(_InputIterator1 __first1, _InputIterator1 __last1,
      _InputIterator2 __first2, _BinaryPredicate __binary_pred)
    {

     
     
      ;

      return std::__mismatch(__first1, __last1, __first2,
 __gnu_cxx::__ops::__iter_comp_iter(__binary_pred));
    }
# 1417 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_algobase.h" 3

}
# 40 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/char_traits.h" 2 3

# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/cwchar" 1 3
# 39 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/cwchar" 3
       
# 40 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/cwchar" 3




# 1 "/usr/include/wchar.h" 1 3 4
# 45 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/cwchar" 2 3
# 42 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/char_traits.h" 2 3

namespace __gnu_cxx __attribute__ ((__visibility__ ("default")))
{

# 57 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/char_traits.h" 3
  template<typename _CharT>
    struct _Char_types
    {
      typedef unsigned long int_type;
      typedef std::streampos pos_type;
      typedef std::streamoff off_type;
      typedef std::mbstate_t state_type;
    };
# 82 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/char_traits.h" 3
  template<typename _CharT>
    struct char_traits
    {
      typedef _CharT char_type;
      typedef typename _Char_types<_CharT>::int_type int_type;
      typedef typename _Char_types<_CharT>::pos_type pos_type;
      typedef typename _Char_types<_CharT>::off_type off_type;
      typedef typename _Char_types<_CharT>::state_type state_type;

      static void
      assign(char_type& __c1, const char_type& __c2)
      { __c1 = __c2; }

      static bool
      eq(const char_type& __c1, const char_type& __c2)
      { return __c1 == __c2; }

      static bool
      lt(const char_type& __c1, const char_type& __c2)
      { return __c1 < __c2; }

      static int
      compare(const char_type* __s1, const char_type* __s2, std::size_t __n);

      static std::size_t
      length(const char_type* __s);

      static const char_type*
      find(const char_type* __s, std::size_t __n, const char_type& __a);

      static char_type*
      move(char_type* __s1, const char_type* __s2, std::size_t __n);

      static char_type*
      copy(char_type* __s1, const char_type* __s2, std::size_t __n);

      static char_type*
      assign(char_type* __s, std::size_t __n, char_type __a);

      static char_type
      to_char_type(const int_type& __c)
      { return static_cast<char_type>(__c); }

      static int_type
      to_int_type(const char_type& __c)
      { return static_cast<int_type>(__c); }

      static bool
      eq_int_type(const int_type& __c1, const int_type& __c2)
      { return __c1 == __c2; }

      static int_type
      eof()
      { return static_cast<int_type>(-1); }

      static int_type
      not_eof(const int_type& __c)
      { return !eq_int_type(__c, eof()) ? __c : to_int_type(char_type()); }
    };

  template<typename _CharT>
    int
    char_traits<_CharT>::
    compare(const char_type* __s1, const char_type* __s2, std::size_t __n)
    {
      for (std::size_t __i = 0; __i < __n; ++__i)
 if (lt(__s1[__i], __s2[__i]))
   return -1;
 else if (lt(__s2[__i], __s1[__i]))
   return 1;
      return 0;
    }

  template<typename _CharT>
    std::size_t
    char_traits<_CharT>::
    length(const char_type* __p)
    {
      std::size_t __i = 0;
      while (!eq(__p[__i], char_type()))
        ++__i;
      return __i;
    }

  template<typename _CharT>
    const typename char_traits<_CharT>::char_type*
    char_traits<_CharT>::
    find(const char_type* __s, std::size_t __n, const char_type& __a)
    {
      for (std::size_t __i = 0; __i < __n; ++__i)
        if (eq(__s[__i], __a))
          return __s + __i;
      return 0;
    }

  template<typename _CharT>
    typename char_traits<_CharT>::char_type*
    char_traits<_CharT>::
    move(char_type* __s1, const char_type* __s2, std::size_t __n)
    {
      return static_cast<_CharT*>(__builtin_memmove(__s1, __s2,
          __n * sizeof(char_type)));
    }

  template<typename _CharT>
    typename char_traits<_CharT>::char_type*
    char_traits<_CharT>::
    copy(char_type* __s1, const char_type* __s2, std::size_t __n)
    {

      std::copy(__s2, __s2 + __n, __s1);
      return __s1;
    }

  template<typename _CharT>
    typename char_traits<_CharT>::char_type*
    char_traits<_CharT>::
    assign(char_type* __s, std::size_t __n, char_type __a)
    {

      std::fill_n(__s, __n, __a);
      return __s;
    }


}

namespace std __attribute__ ((__visibility__ ("default")))
{

# 226 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/char_traits.h" 3
  template<class _CharT>
    struct char_traits : public __gnu_cxx::char_traits<_CharT>
    { };



  template<>
    struct char_traits<char>
    {
      typedef char char_type;
      typedef int int_type;
      typedef streampos pos_type;
      typedef streamoff off_type;
      typedef mbstate_t state_type;

      static void
      assign(char_type& __c1, const char_type& __c2)
      { __c1 = __c2; }

      static bool
      eq(const char_type& __c1, const char_type& __c2)
      { return __c1 == __c2; }

      static bool
      lt(const char_type& __c1, const char_type& __c2)
      {

 return (static_cast<unsigned char>(__c1)
  < static_cast<unsigned char>(__c2));
      }

      static int
      compare(const char_type* __s1, const char_type* __s2, size_t __n)
      { return __builtin_memcmp(__s1, __s2, __n); }

      static size_t
      length(const char_type* __s)
      { return __builtin_strlen(__s); }

      static const char_type*
      find(const char_type* __s, size_t __n, const char_type& __a)
      { return static_cast<const char_type*>(__builtin_memchr(__s, __a, __n)); }

      static char_type*
      move(char_type* __s1, const char_type* __s2, size_t __n)
      { return static_cast<char_type*>(__builtin_memmove(__s1, __s2, __n)); }

      static char_type*
      copy(char_type* __s1, const char_type* __s2, size_t __n)
      { return static_cast<char_type*>(__builtin_memcpy(__s1, __s2, __n)); }

      static char_type*
      assign(char_type* __s, size_t __n, char_type __a)
      { return static_cast<char_type*>(__builtin_memset(__s, __a, __n)); }

      static char_type
      to_char_type(const int_type& __c)
      { return static_cast<char_type>(__c); }



      static int_type
      to_int_type(const char_type& __c)
      { return static_cast<int_type>(static_cast<unsigned char>(__c)); }

      static bool
      eq_int_type(const int_type& __c1, const int_type& __c2)
      { return __c1 == __c2; }

      static int_type
      eof()
      { return static_cast<int_type>(-1); }

      static int_type
      not_eof(const int_type& __c)
      { return (__c == eof()) ? 0 : __c; }
  };




  template<>
    struct char_traits<wchar_t>
    {
      typedef wchar_t char_type;
      typedef wint_t int_type;
      typedef streamoff off_type;
      typedef wstreampos pos_type;
      typedef mbstate_t state_type;

      static void
      assign(char_type& __c1, const char_type& __c2)
      { __c1 = __c2; }

      static bool
      eq(const char_type& __c1, const char_type& __c2)
      { return __c1 == __c2; }

      static bool
      lt(const char_type& __c1, const char_type& __c2)
      { return __c1 < __c2; }

      static int
      compare(const char_type* __s1, const char_type* __s2, size_t __n)
      { return wmemcmp(__s1, __s2, __n); }

      static size_t
      length(const char_type* __s)
      { return wcslen(__s); }

      static const char_type*
      find(const char_type* __s, size_t __n, const char_type& __a)
      { return wmemchr(__s, __a, __n); }

      static char_type*
      move(char_type* __s1, const char_type* __s2, size_t __n)
      { return wmemmove(__s1, __s2, __n); }

      static char_type*
      copy(char_type* __s1, const char_type* __s2, size_t __n)
      { return wmemcpy(__s1, __s2, __n); }

      static char_type*
      assign(char_type* __s, size_t __n, char_type __a)
      { return wmemset(__s, __a, __n); }

      static char_type
      to_char_type(const int_type& __c)
      { return char_type(__c); }

      static int_type
      to_int_type(const char_type& __c)
      { return int_type(__c); }

      static bool
      eq_int_type(const int_type& __c1, const int_type& __c2)
      { return __c1 == __c2; }

      static int_type
      eof()
      { return static_cast<int_type>((0xffffffffu)); }

      static int_type
      not_eof(const int_type& __c)
      { return eq_int_type(__c, eof()) ? 0 : __c; }
  };



}
# 41 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ios" 2 3
# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/localefwd.h" 1 3
# 37 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/localefwd.h" 3
       
# 38 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/localefwd.h" 3


# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/x86_64-suse-linux/bits/c++locale.h" 1 3
# 39 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/x86_64-suse-linux/bits/c++locale.h" 3
       
# 40 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/x86_64-suse-linux/bits/c++locale.h" 3

# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/clocale" 1 3
# 39 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/clocale" 3
       
# 40 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/clocale" 3


# 1 "/usr/include/locale.h" 1 3 4
# 29 "/usr/include/locale.h" 3 4
# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/lib64/gcc/x86_64-suse-linux/4.9.2/include/stddef.h" 1 3 4
# 30 "/usr/include/locale.h" 2 3 4
# 1 "/usr/include/bits/locale.h" 1 3 4
# 27 "/usr/include/bits/locale.h" 3 4
enum
{
  __LC_CTYPE = 0,
  __LC_NUMERIC = 1,
  __LC_TIME = 2,
  __LC_COLLATE = 3,
  __LC_MONETARY = 4,
  __LC_MESSAGES = 5,
  __LC_ALL = 6,
  __LC_PAPER = 7,
  __LC_NAME = 8,
  __LC_ADDRESS = 9,
  __LC_TELEPHONE = 10,
  __LC_MEASUREMENT = 11,
  __LC_IDENTIFICATION = 12
};
# 31 "/usr/include/locale.h" 2 3 4

extern "C" {
# 51 "/usr/include/locale.h" 3 4



struct lconv
{


  char *decimal_point;
  char *thousands_sep;





  char *grouping;





  char *int_curr_symbol;
  char *currency_symbol;
  char *mon_decimal_point;
  char *mon_thousands_sep;
  char *mon_grouping;
  char *positive_sign;
  char *negative_sign;
  char int_frac_digits;
  char frac_digits;

  char p_cs_precedes;

  char p_sep_by_space;

  char n_cs_precedes;

  char n_sep_by_space;






  char p_sign_posn;
  char n_sign_posn;


  char int_p_cs_precedes;

  char int_p_sep_by_space;

  char int_n_cs_precedes;

  char int_n_sep_by_space;






  char int_p_sign_posn;
  char int_n_sign_posn;
# 121 "/usr/include/locale.h" 3 4
};



extern char *setlocale (int __category, __const char *__locale) throw ();


extern struct lconv *localeconv (void) throw ();


# 152 "/usr/include/locale.h" 3 4
extern __locale_t newlocale (int __category_mask, __const char *__locale,
        __locale_t __base) throw ();
# 187 "/usr/include/locale.h" 3 4
extern __locale_t duplocale (__locale_t __dataset) throw ();



extern void freelocale (__locale_t __dataset) throw ();






extern __locale_t uselocale (__locale_t __dataset) throw ();







}
# 43 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/clocale" 2 3
# 51 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/clocale" 3
namespace std
{
  using ::lconv;
  using ::setlocale;
  using ::localeconv;
}
# 42 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/x86_64-suse-linux/bits/c++locale.h" 2 3






namespace __gnu_cxx __attribute__ ((__visibility__ ("default")))
{


  extern "C" __typeof(uselocale) __uselocale;


}


namespace std __attribute__ ((__visibility__ ("default")))
{


  typedef __locale_t __c_locale;





  inline int
  __convert_from_v(const __c_locale& __cloc __attribute__ ((__unused__)),
     char* __out,
     const int __size __attribute__ ((__unused__)),
     const char* __fmt, ...)
  {

    __c_locale __old = __gnu_cxx::__uselocale(__cloc);
# 88 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/x86_64-suse-linux/bits/c++locale.h" 3
    __builtin_va_list __args;
    __builtin_va_start(__args, __fmt);


    const int __ret = __builtin_vsnprintf(__out, __size, __fmt, __args);




    __builtin_va_end(__args);


    __gnu_cxx::__uselocale(__old);







    return __ret;
  }


}
# 41 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/localefwd.h" 2 3

# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/cctype" 1 3
# 39 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/cctype" 3
       
# 40 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/cctype" 3


# 1 "/usr/include/ctype.h" 1 3 4
# 30 "/usr/include/ctype.h" 3 4
extern "C" {
# 48 "/usr/include/ctype.h" 3 4
enum
{
  _ISupper = ((0) < 8 ? ((1 << (0)) << 8) : ((1 << (0)) >> 8)),
  _ISlower = ((1) < 8 ? ((1 << (1)) << 8) : ((1 << (1)) >> 8)),
  _ISalpha = ((2) < 8 ? ((1 << (2)) << 8) : ((1 << (2)) >> 8)),
  _ISdigit = ((3) < 8 ? ((1 << (3)) << 8) : ((1 << (3)) >> 8)),
  _ISxdigit = ((4) < 8 ? ((1 << (4)) << 8) : ((1 << (4)) >> 8)),
  _ISspace = ((5) < 8 ? ((1 << (5)) << 8) : ((1 << (5)) >> 8)),
  _ISprint = ((6) < 8 ? ((1 << (6)) << 8) : ((1 << (6)) >> 8)),
  _ISgraph = ((7) < 8 ? ((1 << (7)) << 8) : ((1 << (7)) >> 8)),
  _ISblank = ((8) < 8 ? ((1 << (8)) << 8) : ((1 << (8)) >> 8)),
  _IScntrl = ((9) < 8 ? ((1 << (9)) << 8) : ((1 << (9)) >> 8)),
  _ISpunct = ((10) < 8 ? ((1 << (10)) << 8) : ((1 << (10)) >> 8)),
  _ISalnum = ((11) < 8 ? ((1 << (11)) << 8) : ((1 << (11)) >> 8))
};
# 81 "/usr/include/ctype.h" 3 4
extern __const unsigned short int **__ctype_b_loc (void)
     throw () __attribute__ ((__const));
extern __const __int32_t **__ctype_tolower_loc (void)
     throw () __attribute__ ((__const));
extern __const __int32_t **__ctype_toupper_loc (void)
     throw () __attribute__ ((__const));
# 96 "/usr/include/ctype.h" 3 4






extern int isalnum (int) throw ();
extern int isalpha (int) throw ();
extern int iscntrl (int) throw ();
extern int isdigit (int) throw ();
extern int islower (int) throw ();
extern int isgraph (int) throw ();
extern int isprint (int) throw ();
extern int ispunct (int) throw ();
extern int isspace (int) throw ();
extern int isupper (int) throw ();
extern int isxdigit (int) throw ();



extern int tolower (int __c) throw ();


extern int toupper (int __c) throw ();








extern int isblank (int) throw ();






extern int isctype (int __c, int __mask) throw ();






extern int isascii (int __c) throw ();



extern int toascii (int __c) throw ();



extern int _toupper (int) throw ();
extern int _tolower (int) throw ();
# 247 "/usr/include/ctype.h" 3 4
extern int isalnum_l (int, __locale_t) throw ();
extern int isalpha_l (int, __locale_t) throw ();
extern int iscntrl_l (int, __locale_t) throw ();
extern int isdigit_l (int, __locale_t) throw ();
extern int islower_l (int, __locale_t) throw ();
extern int isgraph_l (int, __locale_t) throw ();
extern int isprint_l (int, __locale_t) throw ();
extern int ispunct_l (int, __locale_t) throw ();
extern int isspace_l (int, __locale_t) throw ();
extern int isupper_l (int, __locale_t) throw ();
extern int isxdigit_l (int, __locale_t) throw ();

extern int isblank_l (int, __locale_t) throw ();



extern int __tolower_l (int __c, __locale_t __l) throw ();
extern int tolower_l (int __c, __locale_t __l) throw ();


extern int __toupper_l (int __c, __locale_t __l) throw ();
extern int toupper_l (int __c, __locale_t __l) throw ();
# 323 "/usr/include/ctype.h" 3 4
}
# 43 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/cctype" 2 3
# 62 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/cctype" 3
namespace std
{
  using ::isalnum;
  using ::isalpha;
  using ::iscntrl;
  using ::isdigit;
  using ::isgraph;
  using ::islower;
  using ::isprint;
  using ::ispunct;
  using ::isspace;
  using ::isupper;
  using ::isxdigit;
  using ::tolower;
  using ::toupper;
}
# 43 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/localefwd.h" 2 3

namespace std __attribute__ ((__visibility__ ("default")))
{

# 55 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/localefwd.h" 3
  class locale;

  template<typename _Facet>
    bool
    has_facet(const locale&) throw();

  template<typename _Facet>
    const _Facet&
    use_facet(const locale&);


  template<typename _CharT>
    bool
    isspace(_CharT, const locale&);

  template<typename _CharT>
    bool
    isprint(_CharT, const locale&);

  template<typename _CharT>
    bool
    iscntrl(_CharT, const locale&);

  template<typename _CharT>
    bool
    isupper(_CharT, const locale&);

  template<typename _CharT>
    bool
    islower(_CharT, const locale&);

  template<typename _CharT>
    bool
    isalpha(_CharT, const locale&);

  template<typename _CharT>
    bool
    isdigit(_CharT, const locale&);

  template<typename _CharT>
    bool
    ispunct(_CharT, const locale&);

  template<typename _CharT>
    bool
    isxdigit(_CharT, const locale&);

  template<typename _CharT>
    bool
    isalnum(_CharT, const locale&);

  template<typename _CharT>
    bool
    isgraph(_CharT, const locale&);

  template<typename _CharT>
    _CharT
    toupper(_CharT, const locale&);

  template<typename _CharT>
    _CharT
    tolower(_CharT, const locale&);


  class ctype_base;
  template<typename _CharT>
    class ctype;
  template<> class ctype<char>;

  template<> class ctype<wchar_t>;

  template<typename _CharT>
    class ctype_byname;


  class codecvt_base;
  template<typename _InternT, typename _ExternT, typename _StateT>
    class codecvt;
  template<> class codecvt<char, char, mbstate_t>;

  template<> class codecvt<wchar_t, char, mbstate_t>;

  template<typename _InternT, typename _ExternT, typename _StateT>
    class codecvt_byname;



  template<typename _CharT, typename _InIter = istreambuf_iterator<_CharT> >
    class num_get;
  template<typename _CharT, typename _OutIter = ostreambuf_iterator<_CharT> >
    class num_put;

  template<typename _CharT> class numpunct;
  template<typename _CharT> class numpunct_byname;


  template<typename _CharT>
    class collate;
  template<typename _CharT> class
    collate_byname;


  class time_base;
  template<typename _CharT, typename _InIter = istreambuf_iterator<_CharT> >
    class time_get;
  template<typename _CharT, typename _InIter = istreambuf_iterator<_CharT> >
    class time_get_byname;
  template<typename _CharT, typename _OutIter = ostreambuf_iterator<_CharT> >
    class time_put;
  template<typename _CharT, typename _OutIter = ostreambuf_iterator<_CharT> >
    class time_put_byname;


  class money_base;

  template<typename _CharT, typename _InIter = istreambuf_iterator<_CharT> >
    class money_get;
  template<typename _CharT, typename _OutIter = ostreambuf_iterator<_CharT> >
    class money_put;

  template<typename _CharT, bool _Intl = false>
    class moneypunct;
  template<typename _CharT, bool _Intl = false>
    class moneypunct_byname;


  class messages_base;
  template<typename _CharT>
    class messages;
  template<typename _CharT>
    class messages_byname;


}
# 42 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ios" 2 3
# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/ios_base.h" 1 3
# 37 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/ios_base.h" 3
       
# 38 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/ios_base.h" 3

# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ext/atomicity.h" 1 3
# 32 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ext/atomicity.h" 3
       
# 33 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ext/atomicity.h" 3


# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/x86_64-suse-linux/bits/gthr.h" 1 3
# 30 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/x86_64-suse-linux/bits/gthr.h" 3
#pragma GCC visibility push(default)
# 148 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/x86_64-suse-linux/bits/gthr.h" 3
# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/x86_64-suse-linux/bits/gthr-default.h" 1 3
# 35 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/x86_64-suse-linux/bits/gthr-default.h" 3
# 1 "/usr/include/pthread.h" 1 3 4
# 25 "/usr/include/pthread.h" 3 4
# 1 "/usr/include/sched.h" 1 3 4
# 29 "/usr/include/sched.h" 3 4
# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/lib64/gcc/x86_64-suse-linux/4.9.2/include/stddef.h" 1 3 4
# 30 "/usr/include/sched.h" 2 3 4


# 1 "/usr/include/time.h" 1 3 4
# 33 "/usr/include/sched.h" 2 3 4


# 1 "/usr/include/bits/sched.h" 1 3 4
# 71 "/usr/include/bits/sched.h" 3 4
struct sched_param
  {
    int __sched_priority;
  };

extern "C" {



extern int clone (int (*__fn) (void *__arg), void *__child_stack,
    int __flags, void *__arg, ...) throw ();


extern int unshare (int __flags) throw ();


extern int sched_getcpu (void) throw ();


}







struct __sched_param
  {
    int __sched_priority;
  };
# 113 "/usr/include/bits/sched.h" 3 4
typedef unsigned long int __cpu_mask;






typedef struct
{
  __cpu_mask __bits[4096 / (8 * sizeof (__cpu_mask))];
} cpu_set_t;
# 196 "/usr/include/bits/sched.h" 3 4
extern "C" {

extern int __sched_cpucount (size_t __setsize, const cpu_set_t *__setp)
  throw ();
extern cpu_set_t *__sched_cpualloc (size_t __count) throw () ;
extern void __sched_cpufree (cpu_set_t *__set) throw ();

}
# 36 "/usr/include/sched.h" 2 3 4




extern "C" {


extern int sched_setparam (__pid_t __pid, __const struct sched_param *__param)
     throw ();


extern int sched_getparam (__pid_t __pid, struct sched_param *__param) throw ();


extern int sched_setscheduler (__pid_t __pid, int __policy,
          __const struct sched_param *__param) throw ();


extern int sched_getscheduler (__pid_t __pid) throw ();


extern int sched_yield (void) throw ();


extern int sched_get_priority_max (int __algorithm) throw ();


extern int sched_get_priority_min (int __algorithm) throw ();


extern int sched_rr_get_interval (__pid_t __pid, struct timespec *__t) throw ();
# 110 "/usr/include/sched.h" 3 4
extern int sched_setaffinity (__pid_t __pid, size_t __cpusetsize,
         __const cpu_set_t *__cpuset) throw ();


extern int sched_getaffinity (__pid_t __pid, size_t __cpusetsize,
         cpu_set_t *__cpuset) throw ();


}
# 26 "/usr/include/pthread.h" 2 3 4
# 1 "/usr/include/time.h" 1 3 4
# 30 "/usr/include/time.h" 3 4
extern "C" {







# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/lib64/gcc/x86_64-suse-linux/4.9.2/include/stddef.h" 1 3 4
# 39 "/usr/include/time.h" 2 3 4



# 1 "/usr/include/bits/time.h" 1 3 4
# 43 "/usr/include/time.h" 2 3 4
# 131 "/usr/include/time.h" 3 4


struct tm
{
  int tm_sec;
  int tm_min;
  int tm_hour;
  int tm_mday;
  int tm_mon;
  int tm_year;
  int tm_wday;
  int tm_yday;
  int tm_isdst;


  long int tm_gmtoff;
  __const char *tm_zone;




};








struct itimerspec
  {
    struct timespec it_interval;
    struct timespec it_value;
  };


struct sigevent;
# 180 "/usr/include/time.h" 3 4



extern clock_t clock (void) throw ();


extern time_t time (time_t *__timer) throw ();


extern double difftime (time_t __time1, time_t __time0)
     throw () __attribute__ ((__const__));


extern time_t mktime (struct tm *__tp) throw ();





extern size_t strftime (char *__restrict __s, size_t __maxsize,
   __const char *__restrict __format,
   __const struct tm *__restrict __tp) throw ();





extern char *strptime (__const char *__restrict __s,
         __const char *__restrict __fmt, struct tm *__tp)
     throw ();







extern size_t strftime_l (char *__restrict __s, size_t __maxsize,
     __const char *__restrict __format,
     __const struct tm *__restrict __tp,
     __locale_t __loc) throw ();



extern char *strptime_l (__const char *__restrict __s,
    __const char *__restrict __fmt, struct tm *__tp,
    __locale_t __loc) throw ();






extern struct tm *gmtime (__const time_t *__timer) throw ();



extern struct tm *localtime (__const time_t *__timer) throw ();





extern struct tm *gmtime_r (__const time_t *__restrict __timer,
       struct tm *__restrict __tp) throw ();



extern struct tm *localtime_r (__const time_t *__restrict __timer,
          struct tm *__restrict __tp) throw ();





extern char *asctime (__const struct tm *__tp) throw ();


extern char *ctime (__const time_t *__timer) throw ();







extern char *asctime_r (__const struct tm *__restrict __tp,
   char *__restrict __buf) throw ();


extern char *ctime_r (__const time_t *__restrict __timer,
        char *__restrict __buf) throw ();




extern char *__tzname[2];
extern int __daylight;
extern long int __timezone;




extern char *tzname[2];



extern void tzset (void) throw ();



extern int daylight;
extern long int timezone;





extern int stime (__const time_t *__when) throw ();
# 313 "/usr/include/time.h" 3 4
extern time_t timegm (struct tm *__tp) throw ();


extern time_t timelocal (struct tm *__tp) throw ();


extern int dysize (int __year) throw () __attribute__ ((__const__));
# 328 "/usr/include/time.h" 3 4
extern int nanosleep (__const struct timespec *__requested_time,
        struct timespec *__remaining);



extern int clock_getres (clockid_t __clock_id, struct timespec *__res) throw ();


extern int clock_gettime (clockid_t __clock_id, struct timespec *__tp) throw ();


extern int clock_settime (clockid_t __clock_id, __const struct timespec *__tp)
     throw ();






extern int clock_nanosleep (clockid_t __clock_id, int __flags,
       __const struct timespec *__req,
       struct timespec *__rem);


extern int clock_getcpuclockid (pid_t __pid, clockid_t *__clock_id) throw ();




extern int timer_create (clockid_t __clock_id,
    struct sigevent *__restrict __evp,
    timer_t *__restrict __timerid) throw ();


extern int timer_delete (timer_t __timerid) throw ();


extern int timer_settime (timer_t __timerid, int __flags,
     __const struct itimerspec *__restrict __value,
     struct itimerspec *__restrict __ovalue) throw ();


extern int timer_gettime (timer_t __timerid, struct itimerspec *__value)
     throw ();


extern int timer_getoverrun (timer_t __timerid) throw ();
# 390 "/usr/include/time.h" 3 4
extern int getdate_err;
# 399 "/usr/include/time.h" 3 4
extern struct tm *getdate (__const char *__string);
# 413 "/usr/include/time.h" 3 4
extern int getdate_r (__const char *__restrict __string,
        struct tm *__restrict __resbufp);


}
# 27 "/usr/include/pthread.h" 2 3 4


# 1 "/usr/include/signal.h" 1 3 4
# 31 "/usr/include/signal.h" 3 4
extern "C" {

# 1 "/usr/include/bits/sigset.h" 1 3 4
# 34 "/usr/include/signal.h" 2 3 4
# 408 "/usr/include/signal.h" 3 4
}
# 30 "/usr/include/pthread.h" 2 3 4

# 1 "/usr/include/bits/setjmp.h" 1 3 4
# 27 "/usr/include/bits/setjmp.h" 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 28 "/usr/include/bits/setjmp.h" 2 3 4




typedef long int __jmp_buf[8];
# 32 "/usr/include/pthread.h" 2 3 4
# 1 "/usr/include/bits/wordsize.h" 1 3 4
# 33 "/usr/include/pthread.h" 2 3 4



enum
{
  PTHREAD_CREATE_JOINABLE,

  PTHREAD_CREATE_DETACHED

};



enum
{
  PTHREAD_MUTEX_TIMED_NP,
  PTHREAD_MUTEX_RECURSIVE_NP,
  PTHREAD_MUTEX_ERRORCHECK_NP,
  PTHREAD_MUTEX_ADAPTIVE_NP

  ,
  PTHREAD_MUTEX_NORMAL = PTHREAD_MUTEX_TIMED_NP,
  PTHREAD_MUTEX_RECURSIVE = PTHREAD_MUTEX_RECURSIVE_NP,
  PTHREAD_MUTEX_ERRORCHECK = PTHREAD_MUTEX_ERRORCHECK_NP,
  PTHREAD_MUTEX_DEFAULT = PTHREAD_MUTEX_NORMAL



  , PTHREAD_MUTEX_FAST_NP = PTHREAD_MUTEX_TIMED_NP

};




enum
{
  PTHREAD_MUTEX_STALLED,
  PTHREAD_MUTEX_STALLED_NP = PTHREAD_MUTEX_STALLED,
  PTHREAD_MUTEX_ROBUST,
  PTHREAD_MUTEX_ROBUST_NP = PTHREAD_MUTEX_ROBUST
};





enum
{
  PTHREAD_PRIO_NONE,
  PTHREAD_PRIO_INHERIT,
  PTHREAD_PRIO_PROTECT
};
# 117 "/usr/include/pthread.h" 3 4
enum
{
  PTHREAD_RWLOCK_PREFER_READER_NP,
  PTHREAD_RWLOCK_PREFER_WRITER_NP,
  PTHREAD_RWLOCK_PREFER_WRITER_NONRECURSIVE_NP,
  PTHREAD_RWLOCK_DEFAULT_NP = PTHREAD_RWLOCK_PREFER_READER_NP
};
# 149 "/usr/include/pthread.h" 3 4
enum
{
  PTHREAD_INHERIT_SCHED,

  PTHREAD_EXPLICIT_SCHED

};



enum
{
  PTHREAD_SCOPE_SYSTEM,

  PTHREAD_SCOPE_PROCESS

};



enum
{
  PTHREAD_PROCESS_PRIVATE,

  PTHREAD_PROCESS_SHARED

};
# 184 "/usr/include/pthread.h" 3 4
struct _pthread_cleanup_buffer
{
  void (*__routine) (void *);
  void *__arg;
  int __canceltype;
  struct _pthread_cleanup_buffer *__prev;
};


enum
{
  PTHREAD_CANCEL_ENABLE,

  PTHREAD_CANCEL_DISABLE

};
enum
{
  PTHREAD_CANCEL_DEFERRED,

  PTHREAD_CANCEL_ASYNCHRONOUS

};
# 222 "/usr/include/pthread.h" 3 4
extern "C" {




extern int pthread_create (pthread_t *__restrict __newthread,
      __const pthread_attr_t *__restrict __attr,
      void *(*__start_routine) (void *),
      void *__restrict __arg) throw () __attribute__ ((__nonnull__ (1, 3)));





extern void pthread_exit (void *__retval) __attribute__ ((__noreturn__));







extern int pthread_join (pthread_t __th, void **__thread_return);




extern int pthread_tryjoin_np (pthread_t __th, void **__thread_return) throw ();







extern int pthread_timedjoin_np (pthread_t __th, void **__thread_return,
     __const struct timespec *__abstime);






extern int pthread_detach (pthread_t __th) throw ();



extern pthread_t pthread_self (void) throw () __attribute__ ((__const__));


extern int pthread_equal (pthread_t __thread1, pthread_t __thread2) throw ();







extern int pthread_attr_init (pthread_attr_t *__attr) throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_attr_destroy (pthread_attr_t *__attr)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_attr_getdetachstate (__const pthread_attr_t *__attr,
     int *__detachstate)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_setdetachstate (pthread_attr_t *__attr,
     int __detachstate)
     throw () __attribute__ ((__nonnull__ (1)));



extern int pthread_attr_getguardsize (__const pthread_attr_t *__attr,
          size_t *__guardsize)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_setguardsize (pthread_attr_t *__attr,
          size_t __guardsize)
     throw () __attribute__ ((__nonnull__ (1)));



extern int pthread_attr_getschedparam (__const pthread_attr_t *__restrict
           __attr,
           struct sched_param *__restrict __param)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_setschedparam (pthread_attr_t *__restrict __attr,
           __const struct sched_param *__restrict
           __param) throw () __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_getschedpolicy (__const pthread_attr_t *__restrict
     __attr, int *__restrict __policy)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_setschedpolicy (pthread_attr_t *__attr, int __policy)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_attr_getinheritsched (__const pthread_attr_t *__restrict
      __attr, int *__restrict __inherit)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_setinheritsched (pthread_attr_t *__attr,
      int __inherit)
     throw () __attribute__ ((__nonnull__ (1)));



extern int pthread_attr_getscope (__const pthread_attr_t *__restrict __attr,
      int *__restrict __scope)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_attr_setscope (pthread_attr_t *__attr, int __scope)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_attr_getstackaddr (__const pthread_attr_t *__restrict
          __attr, void **__restrict __stackaddr)
     throw () __attribute__ ((__nonnull__ (1, 2))) __attribute__ ((__deprecated__));





extern int pthread_attr_setstackaddr (pthread_attr_t *__attr,
          void *__stackaddr)
     throw () __attribute__ ((__nonnull__ (1))) __attribute__ ((__deprecated__));


extern int pthread_attr_getstacksize (__const pthread_attr_t *__restrict
          __attr, size_t *__restrict __stacksize)
     throw () __attribute__ ((__nonnull__ (1, 2)));




extern int pthread_attr_setstacksize (pthread_attr_t *__attr,
          size_t __stacksize)
     throw () __attribute__ ((__nonnull__ (1)));



extern int pthread_attr_getstack (__const pthread_attr_t *__restrict __attr,
      void **__restrict __stackaddr,
      size_t *__restrict __stacksize)
     throw () __attribute__ ((__nonnull__ (1, 2, 3)));




extern int pthread_attr_setstack (pthread_attr_t *__attr, void *__stackaddr,
      size_t __stacksize) throw () __attribute__ ((__nonnull__ (1)));





extern int pthread_attr_setaffinity_np (pthread_attr_t *__attr,
     size_t __cpusetsize,
     __const cpu_set_t *__cpuset)
     throw () __attribute__ ((__nonnull__ (1, 3)));



extern int pthread_attr_getaffinity_np (__const pthread_attr_t *__attr,
     size_t __cpusetsize,
     cpu_set_t *__cpuset)
     throw () __attribute__ ((__nonnull__ (1, 3)));





extern int pthread_getattr_np (pthread_t __th, pthread_attr_t *__attr)
     throw () __attribute__ ((__nonnull__ (2)));







extern int pthread_setschedparam (pthread_t __target_thread, int __policy,
      __const struct sched_param *__param)
     throw () __attribute__ ((__nonnull__ (3)));


extern int pthread_getschedparam (pthread_t __target_thread,
      int *__restrict __policy,
      struct sched_param *__restrict __param)
     throw () __attribute__ ((__nonnull__ (2, 3)));


extern int pthread_setschedprio (pthread_t __target_thread, int __prio)
     throw ();




extern int pthread_getconcurrency (void) throw ();


extern int pthread_setconcurrency (int __level) throw ();







extern int pthread_yield (void) throw ();




extern int pthread_setaffinity_np (pthread_t __th, size_t __cpusetsize,
       __const cpu_set_t *__cpuset)
     throw () __attribute__ ((__nonnull__ (3)));


extern int pthread_getaffinity_np (pthread_t __th, size_t __cpusetsize,
       cpu_set_t *__cpuset)
     throw () __attribute__ ((__nonnull__ (3)));
# 468 "/usr/include/pthread.h" 3 4
extern int pthread_once (pthread_once_t *__once_control,
    void (*__init_routine) (void)) __attribute__ ((__nonnull__ (1, 2)));
# 480 "/usr/include/pthread.h" 3 4
extern int pthread_setcancelstate (int __state, int *__oldstate);



extern int pthread_setcanceltype (int __type, int *__oldtype);


extern int pthread_cancel (pthread_t __th);




extern void pthread_testcancel (void);




typedef struct
{
  struct
  {
    __jmp_buf __cancel_jmp_buf;
    int __mask_was_saved;
  } __cancel_jmp_buf[1];
  void *__pad[4];
} __pthread_unwind_buf_t __attribute__ ((__aligned__));
# 514 "/usr/include/pthread.h" 3 4
struct __pthread_cleanup_frame
{
  void (*__cancel_routine) (void *);
  void *__cancel_arg;
  int __do_it;
  int __cancel_type;
};




class __pthread_cleanup_class
{
  void (*__cancel_routine) (void *);
  void *__cancel_arg;
  int __do_it;
  int __cancel_type;

 public:
  __pthread_cleanup_class (void (*__fct) (void *), void *__arg)
    : __cancel_routine (__fct), __cancel_arg (__arg), __do_it (1) { }
  ~__pthread_cleanup_class () { if (__do_it) __cancel_routine (__cancel_arg); }
  void __setdoit (int __newval) { __do_it = __newval; }
  void __defer () { pthread_setcanceltype (PTHREAD_CANCEL_DEFERRED,
        &__cancel_type); }
  void __restore () const { pthread_setcanceltype (__cancel_type, 0); }
};
# 716 "/usr/include/pthread.h" 3 4
struct __jmp_buf_tag;
extern int __sigsetjmp (struct __jmp_buf_tag *__env, int __savemask) throw ();





extern int pthread_mutex_init (pthread_mutex_t *__mutex,
          __const pthread_mutexattr_t *__mutexattr)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_mutex_destroy (pthread_mutex_t *__mutex)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_mutex_trylock (pthread_mutex_t *__mutex)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_mutex_lock (pthread_mutex_t *__mutex)
     throw () __attribute__ ((__nonnull__ (1)));



extern int pthread_mutex_timedlock (pthread_mutex_t *__restrict __mutex,
                                    __const struct timespec *__restrict
                                    __abstime) throw () __attribute__ ((__nonnull__ (1, 2)));



extern int pthread_mutex_unlock (pthread_mutex_t *__mutex)
     throw () __attribute__ ((__nonnull__ (1)));




extern int pthread_mutex_getprioceiling (__const pthread_mutex_t *
      __restrict __mutex,
      int *__restrict __prioceiling)
     throw () __attribute__ ((__nonnull__ (1, 2)));



extern int pthread_mutex_setprioceiling (pthread_mutex_t *__restrict __mutex,
      int __prioceiling,
      int *__restrict __old_ceiling)
     throw () __attribute__ ((__nonnull__ (1, 3)));





extern int pthread_mutex_consistent_np (pthread_mutex_t *__mutex)
     throw () __attribute__ ((__nonnull__ (1)));

extern int pthread_mutex_consistent_np (pthread_mutex_t *__mutex)
     throw () __attribute__ ((__nonnull__ (1)));
# 782 "/usr/include/pthread.h" 3 4
extern int pthread_mutexattr_init (pthread_mutexattr_t *__attr)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_mutexattr_destroy (pthread_mutexattr_t *__attr)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_mutexattr_getpshared (__const pthread_mutexattr_t *
      __restrict __attr,
      int *__restrict __pshared)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_mutexattr_setpshared (pthread_mutexattr_t *__attr,
      int __pshared)
     throw () __attribute__ ((__nonnull__ (1)));



extern int pthread_mutexattr_gettype (__const pthread_mutexattr_t *__restrict
          __attr, int *__restrict __kind)
     throw () __attribute__ ((__nonnull__ (1, 2)));




extern int pthread_mutexattr_settype (pthread_mutexattr_t *__attr, int __kind)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_mutexattr_getprotocol (__const pthread_mutexattr_t *
       __restrict __attr,
       int *__restrict __protocol)
     throw () __attribute__ ((__nonnull__ (1, 2)));



extern int pthread_mutexattr_setprotocol (pthread_mutexattr_t *__attr,
       int __protocol)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_mutexattr_getprioceiling (__const pthread_mutexattr_t *
          __restrict __attr,
          int *__restrict __prioceiling)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_mutexattr_setprioceiling (pthread_mutexattr_t *__attr,
          int __prioceiling)
     throw () __attribute__ ((__nonnull__ (1)));




extern int pthread_mutexattr_getrobust (__const pthread_mutexattr_t *__attr,
     int *__robustness)
     throw () __attribute__ ((__nonnull__ (1, 2)));

extern int pthread_mutexattr_getrobust_np (__const pthread_mutexattr_t *__attr,
        int *__robustness)
     throw () __attribute__ ((__nonnull__ (1, 2)));



extern int pthread_mutexattr_setrobust (pthread_mutexattr_t *__attr,
     int __robustness)
     throw () __attribute__ ((__nonnull__ (1)));

extern int pthread_mutexattr_setrobust_np (pthread_mutexattr_t *__attr,
        int __robustness)
     throw () __attribute__ ((__nonnull__ (1)));
# 864 "/usr/include/pthread.h" 3 4
extern int pthread_rwlock_init (pthread_rwlock_t *__restrict __rwlock,
    __const pthread_rwlockattr_t *__restrict
    __attr) throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_rwlock_destroy (pthread_rwlock_t *__rwlock)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_rwlock_rdlock (pthread_rwlock_t *__rwlock)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_rwlock_tryrdlock (pthread_rwlock_t *__rwlock)
  throw () __attribute__ ((__nonnull__ (1)));



extern int pthread_rwlock_timedrdlock (pthread_rwlock_t *__restrict __rwlock,
           __const struct timespec *__restrict
           __abstime) throw () __attribute__ ((__nonnull__ (1, 2)));



extern int pthread_rwlock_wrlock (pthread_rwlock_t *__rwlock)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_rwlock_trywrlock (pthread_rwlock_t *__rwlock)
     throw () __attribute__ ((__nonnull__ (1)));



extern int pthread_rwlock_timedwrlock (pthread_rwlock_t *__restrict __rwlock,
           __const struct timespec *__restrict
           __abstime) throw () __attribute__ ((__nonnull__ (1, 2)));



extern int pthread_rwlock_unlock (pthread_rwlock_t *__rwlock)
     throw () __attribute__ ((__nonnull__ (1)));





extern int pthread_rwlockattr_init (pthread_rwlockattr_t *__attr)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_rwlockattr_destroy (pthread_rwlockattr_t *__attr)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_rwlockattr_getpshared (__const pthread_rwlockattr_t *
       __restrict __attr,
       int *__restrict __pshared)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_rwlockattr_setpshared (pthread_rwlockattr_t *__attr,
       int __pshared)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_rwlockattr_getkind_np (__const pthread_rwlockattr_t *
       __restrict __attr,
       int *__restrict __pref)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_rwlockattr_setkind_np (pthread_rwlockattr_t *__attr,
       int __pref) throw () __attribute__ ((__nonnull__ (1)));







extern int pthread_cond_init (pthread_cond_t *__restrict __cond,
         __const pthread_condattr_t *__restrict
         __cond_attr) throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_cond_destroy (pthread_cond_t *__cond)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_cond_signal (pthread_cond_t *__cond)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_cond_broadcast (pthread_cond_t *__cond)
     throw () __attribute__ ((__nonnull__ (1)));






extern int pthread_cond_wait (pthread_cond_t *__restrict __cond,
         pthread_mutex_t *__restrict __mutex)
     __attribute__ ((__nonnull__ (1, 2)));
# 976 "/usr/include/pthread.h" 3 4
extern int pthread_cond_timedwait (pthread_cond_t *__restrict __cond,
       pthread_mutex_t *__restrict __mutex,
       __const struct timespec *__restrict
       __abstime) __attribute__ ((__nonnull__ (1, 2, 3)));




extern int pthread_condattr_init (pthread_condattr_t *__attr)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_condattr_destroy (pthread_condattr_t *__attr)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_condattr_getpshared (__const pthread_condattr_t *
                                        __restrict __attr,
                                        int *__restrict __pshared)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_condattr_setpshared (pthread_condattr_t *__attr,
                                        int __pshared) throw () __attribute__ ((__nonnull__ (1)));



extern int pthread_condattr_getclock (__const pthread_condattr_t *
          __restrict __attr,
          __clockid_t *__restrict __clock_id)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_condattr_setclock (pthread_condattr_t *__attr,
          __clockid_t __clock_id)
     throw () __attribute__ ((__nonnull__ (1)));
# 1020 "/usr/include/pthread.h" 3 4
extern int pthread_spin_init (pthread_spinlock_t *__lock, int __pshared)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_spin_destroy (pthread_spinlock_t *__lock)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_spin_lock (pthread_spinlock_t *__lock)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_spin_trylock (pthread_spinlock_t *__lock)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_spin_unlock (pthread_spinlock_t *__lock)
     throw () __attribute__ ((__nonnull__ (1)));






extern int pthread_barrier_init (pthread_barrier_t *__restrict __barrier,
     __const pthread_barrierattr_t *__restrict
     __attr, unsigned int __count)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_barrier_destroy (pthread_barrier_t *__barrier)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_barrier_wait (pthread_barrier_t *__barrier)
     throw () __attribute__ ((__nonnull__ (1)));



extern int pthread_barrierattr_init (pthread_barrierattr_t *__attr)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_barrierattr_destroy (pthread_barrierattr_t *__attr)
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_barrierattr_getpshared (__const pthread_barrierattr_t *
        __restrict __attr,
        int *__restrict __pshared)
     throw () __attribute__ ((__nonnull__ (1, 2)));


extern int pthread_barrierattr_setpshared (pthread_barrierattr_t *__attr,
                                           int __pshared)
     throw () __attribute__ ((__nonnull__ (1)));
# 1087 "/usr/include/pthread.h" 3 4
extern int pthread_key_create (pthread_key_t *__key,
          void (*__destr_function) (void *))
     throw () __attribute__ ((__nonnull__ (1)));


extern int pthread_key_delete (pthread_key_t __key) throw ();


extern void *pthread_getspecific (pthread_key_t __key) throw ();


extern int pthread_setspecific (pthread_key_t __key,
    __const void *__pointer) throw () ;




extern int pthread_getcpuclockid (pthread_t __thread_id,
      __clockid_t *__clock_id)
     throw () __attribute__ ((__nonnull__ (2)));
# 1121 "/usr/include/pthread.h" 3 4
extern int pthread_atfork (void (*__prepare) (void),
      void (*__parent) (void),
      void (*__child) (void)) throw ();
# 1135 "/usr/include/pthread.h" 3 4
}
# 36 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/x86_64-suse-linux/bits/gthr-default.h" 2 3
# 47 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/x86_64-suse-linux/bits/gthr-default.h" 3
typedef pthread_t __gthread_t;
typedef pthread_key_t __gthread_key_t;
typedef pthread_once_t __gthread_once_t;
typedef pthread_mutex_t __gthread_mutex_t;
typedef pthread_mutex_t __gthread_recursive_mutex_t;
typedef pthread_cond_t __gthread_cond_t;
typedef struct timespec __gthread_time_t;
# 101 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/x86_64-suse-linux/bits/gthr-default.h" 3
static __typeof(pthread_once) __gthrw_pthread_once __attribute__ ((__weakref__("pthread_once")));
static __typeof(pthread_getspecific) __gthrw_pthread_getspecific __attribute__ ((__weakref__("pthread_getspecific")));
static __typeof(pthread_setspecific) __gthrw_pthread_setspecific __attribute__ ((__weakref__("pthread_setspecific")));

static __typeof(pthread_create) __gthrw_pthread_create __attribute__ ((__weakref__("pthread_create")));
static __typeof(pthread_join) __gthrw_pthread_join __attribute__ ((__weakref__("pthread_join")));
static __typeof(pthread_equal) __gthrw_pthread_equal __attribute__ ((__weakref__("pthread_equal")));
static __typeof(pthread_self) __gthrw_pthread_self __attribute__ ((__weakref__("pthread_self")));
static __typeof(pthread_detach) __gthrw_pthread_detach __attribute__ ((__weakref__("pthread_detach")));

static __typeof(pthread_cancel) __gthrw_pthread_cancel __attribute__ ((__weakref__("pthread_cancel")));

static __typeof(sched_yield) __gthrw_sched_yield __attribute__ ((__weakref__("sched_yield")));

static __typeof(pthread_mutex_lock) __gthrw_pthread_mutex_lock __attribute__ ((__weakref__("pthread_mutex_lock")));
static __typeof(pthread_mutex_trylock) __gthrw_pthread_mutex_trylock __attribute__ ((__weakref__("pthread_mutex_trylock")));

static __typeof(pthread_mutex_timedlock) __gthrw_pthread_mutex_timedlock __attribute__ ((__weakref__("pthread_mutex_timedlock")));

static __typeof(pthread_mutex_unlock) __gthrw_pthread_mutex_unlock __attribute__ ((__weakref__("pthread_mutex_unlock")));
static __typeof(pthread_mutex_init) __gthrw_pthread_mutex_init __attribute__ ((__weakref__("pthread_mutex_init")));
static __typeof(pthread_mutex_destroy) __gthrw_pthread_mutex_destroy __attribute__ ((__weakref__("pthread_mutex_destroy")));

static __typeof(pthread_cond_init) __gthrw_pthread_cond_init __attribute__ ((__weakref__("pthread_cond_init")));
static __typeof(pthread_cond_broadcast) __gthrw_pthread_cond_broadcast __attribute__ ((__weakref__("pthread_cond_broadcast")));
static __typeof(pthread_cond_signal) __gthrw_pthread_cond_signal __attribute__ ((__weakref__("pthread_cond_signal")));
static __typeof(pthread_cond_wait) __gthrw_pthread_cond_wait __attribute__ ((__weakref__("pthread_cond_wait")));
static __typeof(pthread_cond_timedwait) __gthrw_pthread_cond_timedwait __attribute__ ((__weakref__("pthread_cond_timedwait")));
static __typeof(pthread_cond_destroy) __gthrw_pthread_cond_destroy __attribute__ ((__weakref__("pthread_cond_destroy")));

static __typeof(pthread_key_create) __gthrw_pthread_key_create __attribute__ ((__weakref__("pthread_key_create")));
static __typeof(pthread_key_delete) __gthrw_pthread_key_delete __attribute__ ((__weakref__("pthread_key_delete")));
static __typeof(pthread_mutexattr_init) __gthrw_pthread_mutexattr_init __attribute__ ((__weakref__("pthread_mutexattr_init")));
static __typeof(pthread_mutexattr_settype) __gthrw_pthread_mutexattr_settype __attribute__ ((__weakref__("pthread_mutexattr_settype")));
static __typeof(pthread_mutexattr_destroy) __gthrw_pthread_mutexattr_destroy __attribute__ ((__weakref__("pthread_mutexattr_destroy")));
# 236 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/x86_64-suse-linux/bits/gthr-default.h" 3
static __typeof(pthread_key_create) __gthrw___pthread_key_create __attribute__ ((__weakref__("__pthread_key_create")));
# 246 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/x86_64-suse-linux/bits/gthr-default.h" 3
static inline int
__gthread_active_p (void)
{
  static void *const __gthread_active_ptr
    = __extension__ (void *) &__gthrw___pthread_key_create;
  return __gthread_active_ptr != 0;
}
# 658 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/x86_64-suse-linux/bits/gthr-default.h" 3
static inline int
__gthread_create (__gthread_t *__threadid, void *(*__func) (void*),
    void *__args)
{
  return __gthrw_pthread_create (__threadid, __null, __func, __args);
}

static inline int
__gthread_join (__gthread_t __threadid, void **__value_ptr)
{
  return __gthrw_pthread_join (__threadid, __value_ptr);
}

static inline int
__gthread_detach (__gthread_t __threadid)
{
  return __gthrw_pthread_detach (__threadid);
}

static inline int
__gthread_equal (__gthread_t __t1, __gthread_t __t2)
{
  return __gthrw_pthread_equal (__t1, __t2);
}

static inline __gthread_t
__gthread_self (void)
{
  return __gthrw_pthread_self ();
}

static inline int
__gthread_yield (void)
{
  return __gthrw_sched_yield ();
}

static inline int
__gthread_once (__gthread_once_t *__once, void (*__func) (void))
{
  if (__gthread_active_p ())
    return __gthrw_pthread_once (__once, __func);
  else
    return -1;
}

static inline int
__gthread_key_create (__gthread_key_t *__key, void (*__dtor) (void *))
{
  return __gthrw_pthread_key_create (__key, __dtor);
}

static inline int
__gthread_key_delete (__gthread_key_t __key)
{
  return __gthrw_pthread_key_delete (__key);
}

static inline void *
__gthread_getspecific (__gthread_key_t __key)
{
  return __gthrw_pthread_getspecific (__key);
}

static inline int
__gthread_setspecific (__gthread_key_t __key, const void *__ptr)
{
  return __gthrw_pthread_setspecific (__key, __ptr);
}

static inline void
__gthread_mutex_init_function (__gthread_mutex_t *__mutex)
{
  if (__gthread_active_p ())
    __gthrw_pthread_mutex_init (__mutex, __null);
}

static inline int
__gthread_mutex_destroy (__gthread_mutex_t *__mutex)
{
  if (__gthread_active_p ())
    return __gthrw_pthread_mutex_destroy (__mutex);
  else
    return 0;
}

static inline int
__gthread_mutex_lock (__gthread_mutex_t *__mutex)
{
  if (__gthread_active_p ())
    return __gthrw_pthread_mutex_lock (__mutex);
  else
    return 0;
}

static inline int
__gthread_mutex_trylock (__gthread_mutex_t *__mutex)
{
  if (__gthread_active_p ())
    return __gthrw_pthread_mutex_trylock (__mutex);
  else
    return 0;
}


static inline int
__gthread_mutex_timedlock (__gthread_mutex_t *__mutex,
      const __gthread_time_t *__abs_timeout)
{
  if (__gthread_active_p ())
    return __gthrw_pthread_mutex_timedlock (__mutex, __abs_timeout);
  else
    return 0;
}


static inline int
__gthread_mutex_unlock (__gthread_mutex_t *__mutex)
{
  if (__gthread_active_p ())
    return __gthrw_pthread_mutex_unlock (__mutex);
  else
    return 0;
}
# 807 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/x86_64-suse-linux/bits/gthr-default.h" 3
static inline int
__gthread_recursive_mutex_lock (__gthread_recursive_mutex_t *__mutex)
{
  return __gthread_mutex_lock (__mutex);
}

static inline int
__gthread_recursive_mutex_trylock (__gthread_recursive_mutex_t *__mutex)
{
  return __gthread_mutex_trylock (__mutex);
}


static inline int
__gthread_recursive_mutex_timedlock (__gthread_recursive_mutex_t *__mutex,
         const __gthread_time_t *__abs_timeout)
{
  return __gthread_mutex_timedlock (__mutex, __abs_timeout);
}


static inline int
__gthread_recursive_mutex_unlock (__gthread_recursive_mutex_t *__mutex)
{
  return __gthread_mutex_unlock (__mutex);
}

static inline int
__gthread_recursive_mutex_destroy (__gthread_recursive_mutex_t *__mutex)
{
  return __gthread_mutex_destroy (__mutex);
}
# 849 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/x86_64-suse-linux/bits/gthr-default.h" 3
static inline int
__gthread_cond_broadcast (__gthread_cond_t *__cond)
{
  return __gthrw_pthread_cond_broadcast (__cond);
}

static inline int
__gthread_cond_signal (__gthread_cond_t *__cond)
{
  return __gthrw_pthread_cond_signal (__cond);
}

static inline int
__gthread_cond_wait (__gthread_cond_t *__cond, __gthread_mutex_t *__mutex)
{
  return __gthrw_pthread_cond_wait (__cond, __mutex);
}

static inline int
__gthread_cond_timedwait (__gthread_cond_t *__cond, __gthread_mutex_t *__mutex,
     const __gthread_time_t *__abs_timeout)
{
  return __gthrw_pthread_cond_timedwait (__cond, __mutex, __abs_timeout);
}

static inline int
__gthread_cond_wait_recursive (__gthread_cond_t *__cond,
          __gthread_recursive_mutex_t *__mutex)
{
  return __gthread_cond_wait (__cond, __mutex);
}

static inline int
__gthread_cond_destroy (__gthread_cond_t* __cond)
{
  return __gthrw_pthread_cond_destroy (__cond);
}
# 149 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/x86_64-suse-linux/bits/gthr.h" 2 3


#pragma GCC visibility pop
# 36 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ext/atomicity.h" 2 3
# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/x86_64-suse-linux/bits/atomic_word.h" 1 3
# 32 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/x86_64-suse-linux/bits/atomic_word.h" 3
typedef int _Atomic_word;
# 37 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ext/atomicity.h" 2 3

namespace __gnu_cxx __attribute__ ((__visibility__ ("default")))
{







  static inline _Atomic_word
  __exchange_and_add(volatile _Atomic_word* __mem, int __val)
  { return __atomic_fetch_add(__mem, __val, 4); }

  static inline void
  __atomic_add(volatile _Atomic_word* __mem, int __val)
  { __atomic_fetch_add(__mem, __val, 4); }
# 64 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ext/atomicity.h" 3
  static inline _Atomic_word
  __exchange_and_add_single(_Atomic_word* __mem, int __val)
  {
    _Atomic_word __result = *__mem;
    *__mem += __val;
    return __result;
  }

  static inline void
  __atomic_add_single(_Atomic_word* __mem, int __val)
  { *__mem += __val; }

  static inline _Atomic_word
  __attribute__ ((__unused__))
  __exchange_and_add_dispatch(_Atomic_word* __mem, int __val)
  {

    if (__gthread_active_p())
      return __exchange_and_add(__mem, __val);
    else
      return __exchange_and_add_single(__mem, __val);



  }

  static inline void
  __attribute__ ((__unused__))
  __atomic_add_dispatch(_Atomic_word* __mem, int __val)
  {

    if (__gthread_active_p())
      __atomic_add(__mem, __val);
    else
      __atomic_add_single(__mem, __val);



  }


}
# 40 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/ios_base.h" 2 3

# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_classes.h" 1 3
# 37 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_classes.h" 3
       
# 38 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_classes.h" 3


# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/string" 1 3
# 36 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/string" 3
       
# 37 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/string" 3




# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/allocator.h" 1 3
# 46 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/allocator.h" 3
# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/x86_64-suse-linux/bits/c++allocator.h" 1 3
# 33 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/x86_64-suse-linux/bits/c++allocator.h" 3
# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ext/new_allocator.h" 1 3
# 33 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ext/new_allocator.h" 3
# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/new" 1 3
# 37 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/new" 3
       
# 38 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/new" 3




#pragma GCC visibility push(default)

extern "C++" {

namespace std
{






  class bad_alloc : public exception
  {
  public:
    bad_alloc() throw() { }



    virtual ~bad_alloc() throw();


    virtual const char* what() const throw();
  };
# 85 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/new" 3
  class bad_array_length : public bad_alloc
  {
  public:
    bad_array_length() throw() { };



    virtual ~bad_array_length() throw();


    virtual const char* what() const throw();
  };


  struct nothrow_t { };

  extern const nothrow_t nothrow;



  typedef void (*new_handler)();



  new_handler set_new_handler(new_handler) throw();





}
# 128 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/new" 3
void* operator new(std::size_t) throw(std::bad_alloc)
  __attribute__((__externally_visible__));
void* operator new[](std::size_t) throw(std::bad_alloc)
  __attribute__((__externally_visible__));
void operator delete(void*) throw()
  __attribute__((__externally_visible__));
void operator delete[](void*) throw()
  __attribute__((__externally_visible__));
void* operator new(std::size_t, const std::nothrow_t&) throw()
  __attribute__((__externally_visible__));
void* operator new[](std::size_t, const std::nothrow_t&) throw()
  __attribute__((__externally_visible__));
void operator delete(void*, const std::nothrow_t&) throw()
  __attribute__((__externally_visible__));
void operator delete[](void*, const std::nothrow_t&) throw()
  __attribute__((__externally_visible__));


inline void* operator new(std::size_t, void* __p) throw()
{ return __p; }
inline void* operator new[](std::size_t, void* __p) throw()
{ return __p; }


inline void operator delete (void*, void*) throw() { }
inline void operator delete[](void*, void*) throw() { }

}

#pragma GCC visibility pop
# 34 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ext/new_allocator.h" 2 3






namespace __gnu_cxx __attribute__ ((__visibility__ ("default")))
{


  using std::size_t;
  using std::ptrdiff_t;
# 57 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ext/new_allocator.h" 3
  template<typename _Tp>
    class new_allocator
    {
    public:
      typedef size_t size_type;
      typedef ptrdiff_t difference_type;
      typedef _Tp* pointer;
      typedef const _Tp* const_pointer;
      typedef _Tp& reference;
      typedef const _Tp& const_reference;
      typedef _Tp value_type;

      template<typename _Tp1>
        struct rebind
        { typedef new_allocator<_Tp1> other; };







      new_allocator() throw() { }

      new_allocator(const new_allocator&) throw() { }

      template<typename _Tp1>
        new_allocator(const new_allocator<_Tp1>&) throw() { }

      ~new_allocator() throw() { }

      pointer
      address(reference __x) const
      { return std::__addressof(__x); }

      const_pointer
      address(const_reference __x) const
      { return std::__addressof(__x); }



      pointer
      allocate(size_type __n, const void* = 0)
      {
 if (__n > this->max_size())
   std::__throw_bad_alloc();

 return static_cast<_Tp*>(::operator new(__n * sizeof(_Tp)));
      }


      void
      deallocate(pointer __p, size_type)
      { ::operator delete(__p); }

      size_type
      max_size() const throw()
      { return size_t(-1) / sizeof(_Tp); }
# 128 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ext/new_allocator.h" 3
      void
      construct(pointer __p, const _Tp& __val)
      { ::new((void *)__p) _Tp(__val); }

      void
      destroy(pointer __p) { __p->~_Tp(); }

    };

  template<typename _Tp>
    inline bool
    operator==(const new_allocator<_Tp>&, const new_allocator<_Tp>&)
    { return true; }

  template<typename _Tp>
    inline bool
    operator!=(const new_allocator<_Tp>&, const new_allocator<_Tp>&)
    { return false; }


}
# 34 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/x86_64-suse-linux/bits/c++allocator.h" 2 3
# 47 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/allocator.h" 2 3





namespace std __attribute__ ((__visibility__ ("default")))
{








  template<>
    class allocator<void>
    {
    public:
      typedef size_t size_type;
      typedef ptrdiff_t difference_type;
      typedef void* pointer;
      typedef const void* const_pointer;
      typedef void value_type;

      template<typename _Tp1>
        struct rebind
        { typedef allocator<_Tp1> other; };






    };
# 91 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/allocator.h" 3
  template<typename _Tp>
    class allocator: public __gnu_cxx::new_allocator<_Tp>
    {
   public:
      typedef size_t size_type;
      typedef ptrdiff_t difference_type;
      typedef _Tp* pointer;
      typedef const _Tp* const_pointer;
      typedef _Tp& reference;
      typedef const _Tp& const_reference;
      typedef _Tp value_type;

      template<typename _Tp1>
        struct rebind
        { typedef allocator<_Tp1> other; };







      allocator() throw() { }

      allocator(const allocator& __a) throw()
      : __gnu_cxx::new_allocator<_Tp>(__a) { }

      template<typename _Tp1>
        allocator(const allocator<_Tp1>&) throw() { }

      ~allocator() throw() { }


    };

  template<typename _T1, typename _T2>
    inline bool
    operator==(const allocator<_T1>&, const allocator<_T2>&)
    { return true; }

  template<typename _Tp>
    inline bool
    operator==(const allocator<_Tp>&, const allocator<_Tp>&)
    { return true; }

  template<typename _T1, typename _T2>
    inline bool
    operator!=(const allocator<_T1>&, const allocator<_T2>&)
    { return false; }

  template<typename _Tp>
    inline bool
    operator!=(const allocator<_Tp>&, const allocator<_Tp>&)
    { return false; }






  extern template class allocator<char>;
  extern template class allocator<wchar_t>;






  template<typename _Alloc, bool = __is_empty(_Alloc)>
    struct __alloc_swap
    { static void _S_do_it(_Alloc&, _Alloc&) { } };

  template<typename _Alloc>
    struct __alloc_swap<_Alloc, false>
    {
      static void
      _S_do_it(_Alloc& __one, _Alloc& __two)
      {

 if (__one != __two)
   swap(__one, __two);
      }
    };


  template<typename _Alloc, bool = __is_empty(_Alloc)>
    struct __alloc_neq
    {
      static bool
      _S_do_it(const _Alloc&, const _Alloc&)
      { return false; }
    };

  template<typename _Alloc>
    struct __alloc_neq<_Alloc, false>
    {
      static bool
      _S_do_it(const _Alloc& __one, const _Alloc& __two)
      { return __one != __two; }
    };
# 218 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/allocator.h" 3

}
# 42 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/string" 2 3


# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/ostream_insert.h" 1 3
# 33 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/ostream_insert.h" 3
       
# 34 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/ostream_insert.h" 3


# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/cxxabi_forced.h" 1 3
# 34 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/cxxabi_forced.h" 3
       
# 35 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/cxxabi_forced.h" 3

#pragma GCC visibility push(default)


namespace __cxxabiv1
{







  class __forced_unwind
  {
    virtual ~__forced_unwind() throw();


    virtual void __pure_dummy() = 0;
  };
}


#pragma GCC visibility pop
# 37 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/ostream_insert.h" 2 3

namespace std __attribute__ ((__visibility__ ("default")))
{


  template<typename _CharT, typename _Traits>
    inline void
    __ostream_write(basic_ostream<_CharT, _Traits>& __out,
      const _CharT* __s, streamsize __n)
    {
      typedef basic_ostream<_CharT, _Traits> __ostream_type;
      typedef typename __ostream_type::ios_base __ios_base;

      const streamsize __put = __out.rdbuf()->sputn(__s, __n);
      if (__put != __n)
 __out.setstate(__ios_base::badbit);
    }

  template<typename _CharT, typename _Traits>
    inline void
    __ostream_fill(basic_ostream<_CharT, _Traits>& __out, streamsize __n)
    {
      typedef basic_ostream<_CharT, _Traits> __ostream_type;
      typedef typename __ostream_type::ios_base __ios_base;

      const _CharT __c = __out.fill();
      for (; __n > 0; --__n)
 {
   const typename _Traits::int_type __put = __out.rdbuf()->sputc(__c);
   if (_Traits::eq_int_type(__put, _Traits::eof()))
     {
       __out.setstate(__ios_base::badbit);
       break;
     }
 }
    }

  template<typename _CharT, typename _Traits>
    basic_ostream<_CharT, _Traits>&
    __ostream_insert(basic_ostream<_CharT, _Traits>& __out,
       const _CharT* __s, streamsize __n)
    {
      typedef basic_ostream<_CharT, _Traits> __ostream_type;
      typedef typename __ostream_type::ios_base __ios_base;

      typename __ostream_type::sentry __cerb(__out);
      if (__cerb)
 {
   try
     {
       const streamsize __w = __out.width();
       if (__w > __n)
  {
    const bool __left = ((__out.flags()
     & __ios_base::adjustfield)
           == __ios_base::left);
    if (!__left)
      __ostream_fill(__out, __w - __n);
    if (__out.good())
      __ostream_write(__out, __s, __n);
    if (__left && __out.good())
      __ostream_fill(__out, __w - __n);
  }
       else
  __ostream_write(__out, __s, __n);
       __out.width(0);
     }
   catch(__cxxabiv1::__forced_unwind&)
     {
       __out._M_setstate(__ios_base::badbit);
       throw;
     }
   catch(...)
     { __out._M_setstate(__ios_base::badbit); }
 }
      return __out;
    }




  extern template ostream& __ostream_insert(ostream&, const char*, streamsize);


  extern template wostream& __ostream_insert(wostream&, const wchar_t*,
          streamsize);




}
# 45 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/string" 2 3



# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_function.h" 1 3
# 63 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_function.h" 3
namespace std __attribute__ ((__visibility__ ("default")))
{

# 104 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_function.h" 3
  template<typename _Arg, typename _Result>
    struct unary_function
    {

      typedef _Arg argument_type;


      typedef _Result result_type;
    };




  template<typename _Arg1, typename _Arg2, typename _Result>
    struct binary_function
    {

      typedef _Arg1 first_argument_type;


      typedef _Arg2 second_argument_type;


      typedef _Result result_type;
    };
# 166 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_function.h" 3
  template<typename _Tp>
    struct plus : public binary_function<_Tp, _Tp, _Tp>
    {
      _Tp
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x + __y; }
    };


  template<typename _Tp>
    struct minus : public binary_function<_Tp, _Tp, _Tp>
    {
      _Tp
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x - __y; }
    };


  template<typename _Tp>
    struct multiplies : public binary_function<_Tp, _Tp, _Tp>
    {
      _Tp
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x * __y; }
    };


  template<typename _Tp>
    struct divides : public binary_function<_Tp, _Tp, _Tp>
    {
      _Tp
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x / __y; }
    };


  template<typename _Tp>
    struct modulus : public binary_function<_Tp, _Tp, _Tp>
    {
      _Tp
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x % __y; }
    };


  template<typename _Tp>
    struct negate : public unary_function<_Tp, _Tp>
    {
      _Tp
      operator()(const _Tp& __x) const
      { return -__x; }
    };
# 339 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_function.h" 3
  template<typename _Tp>
    struct equal_to : public binary_function<_Tp, _Tp, bool>
    {
      bool
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x == __y; }
    };


  template<typename _Tp>
    struct not_equal_to : public binary_function<_Tp, _Tp, bool>
    {
      bool
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x != __y; }
    };


  template<typename _Tp>
    struct greater : public binary_function<_Tp, _Tp, bool>
    {
      bool
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x > __y; }
    };


  template<typename _Tp>
    struct less : public binary_function<_Tp, _Tp, bool>
    {
      bool
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x < __y; }
    };


  template<typename _Tp>
    struct greater_equal : public binary_function<_Tp, _Tp, bool>
    {
      bool
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x >= __y; }
    };


  template<typename _Tp>
    struct less_equal : public binary_function<_Tp, _Tp, bool>
    {
      bool
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x <= __y; }
    };
# 500 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_function.h" 3
  template<typename _Tp>
    struct logical_and : public binary_function<_Tp, _Tp, bool>
    {
      bool
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x && __y; }
    };


  template<typename _Tp>
    struct logical_or : public binary_function<_Tp, _Tp, bool>
    {
      bool
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x || __y; }
    };


  template<typename _Tp>
    struct logical_not : public unary_function<_Tp, bool>
    {
      bool
      operator()(const _Tp& __x) const
      { return !__x; }
    };
# 587 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_function.h" 3
  template<typename _Tp>
    struct bit_and : public binary_function<_Tp, _Tp, _Tp>
    {
      _Tp
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x & __y; }
    };

  template<typename _Tp>
    struct bit_or : public binary_function<_Tp, _Tp, _Tp>
    {
      _Tp
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x | __y; }
    };

  template<typename _Tp>
    struct bit_xor : public binary_function<_Tp, _Tp, _Tp>
    {
      _Tp
      operator()(const _Tp& __x, const _Tp& __y) const
      { return __x ^ __y; }
    };

  template<typename _Tp>
    struct bit_not : public unary_function<_Tp, _Tp>
    {
      _Tp
      operator()(const _Tp& __x) const
      { return ~__x; }
    };
# 703 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_function.h" 3
  template<typename _Predicate>
    class unary_negate
    : public unary_function<typename _Predicate::argument_type, bool>
    {
    protected:
      _Predicate _M_pred;

    public:
      explicit
      unary_negate(const _Predicate& __x) : _M_pred(__x) { }

      bool
      operator()(const typename _Predicate::argument_type& __x) const
      { return !_M_pred(__x); }
    };


  template<typename _Predicate>
    inline unary_negate<_Predicate>
    not1(const _Predicate& __pred)
    { return unary_negate<_Predicate>(__pred); }


  template<typename _Predicate>
    class binary_negate
    : public binary_function<typename _Predicate::first_argument_type,
        typename _Predicate::second_argument_type, bool>
    {
    protected:
      _Predicate _M_pred;

    public:
      explicit
      binary_negate(const _Predicate& __x) : _M_pred(__x) { }

      bool
      operator()(const typename _Predicate::first_argument_type& __x,
   const typename _Predicate::second_argument_type& __y) const
      { return !_M_pred(__x, __y); }
    };


  template<typename _Predicate>
    inline binary_negate<_Predicate>
    not2(const _Predicate& __pred)
    { return binary_negate<_Predicate>(__pred); }
# 774 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_function.h" 3
  template<typename _Arg, typename _Result>
    class pointer_to_unary_function : public unary_function<_Arg, _Result>
    {
    protected:
      _Result (*_M_ptr)(_Arg);

    public:
      pointer_to_unary_function() { }

      explicit
      pointer_to_unary_function(_Result (*__x)(_Arg))
      : _M_ptr(__x) { }

      _Result
      operator()(_Arg __x) const
      { return _M_ptr(__x); }
    };


  template<typename _Arg, typename _Result>
    inline pointer_to_unary_function<_Arg, _Result>
    ptr_fun(_Result (*__x)(_Arg))
    { return pointer_to_unary_function<_Arg, _Result>(__x); }


  template<typename _Arg1, typename _Arg2, typename _Result>
    class pointer_to_binary_function
    : public binary_function<_Arg1, _Arg2, _Result>
    {
    protected:
      _Result (*_M_ptr)(_Arg1, _Arg2);

    public:
      pointer_to_binary_function() { }

      explicit
      pointer_to_binary_function(_Result (*__x)(_Arg1, _Arg2))
      : _M_ptr(__x) { }

      _Result
      operator()(_Arg1 __x, _Arg2 __y) const
      { return _M_ptr(__x, __y); }
    };


  template<typename _Arg1, typename _Arg2, typename _Result>
    inline pointer_to_binary_function<_Arg1, _Arg2, _Result>
    ptr_fun(_Result (*__x)(_Arg1, _Arg2))
    { return pointer_to_binary_function<_Arg1, _Arg2, _Result>(__x); }


  template<typename _Tp>
    struct _Identity
    : public unary_function<_Tp,_Tp>
    {
      _Tp&
      operator()(_Tp& __x) const
      { return __x; }

      const _Tp&
      operator()(const _Tp& __x) const
      { return __x; }
    };

  template<typename _Pair>
    struct _Select1st
    : public unary_function<_Pair, typename _Pair::first_type>
    {
      typename _Pair::first_type&
      operator()(_Pair& __x) const
      { return __x.first; }

      const typename _Pair::first_type&
      operator()(const _Pair& __x) const
      { return __x.first; }
# 861 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_function.h" 3
    };

  template<typename _Pair>
    struct _Select2nd
    : public unary_function<_Pair, typename _Pair::second_type>
    {
      typename _Pair::second_type&
      operator()(_Pair& __x) const
      { return __x.second; }

      const typename _Pair::second_type&
      operator()(const _Pair& __x) const
      { return __x.second; }
    };
# 894 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_function.h" 3
  template<typename _Ret, typename _Tp>
    class mem_fun_t : public unary_function<_Tp*, _Ret>
    {
    public:
      explicit
      mem_fun_t(_Ret (_Tp::*__pf)())
      : _M_f(__pf) { }

      _Ret
      operator()(_Tp* __p) const
      { return (__p->*_M_f)(); }

    private:
      _Ret (_Tp::*_M_f)();
    };



  template<typename _Ret, typename _Tp>
    class const_mem_fun_t : public unary_function<const _Tp*, _Ret>
    {
    public:
      explicit
      const_mem_fun_t(_Ret (_Tp::*__pf)() const)
      : _M_f(__pf) { }

      _Ret
      operator()(const _Tp* __p) const
      { return (__p->*_M_f)(); }

    private:
      _Ret (_Tp::*_M_f)() const;
    };



  template<typename _Ret, typename _Tp>
    class mem_fun_ref_t : public unary_function<_Tp, _Ret>
    {
    public:
      explicit
      mem_fun_ref_t(_Ret (_Tp::*__pf)())
      : _M_f(__pf) { }

      _Ret
      operator()(_Tp& __r) const
      { return (__r.*_M_f)(); }

    private:
      _Ret (_Tp::*_M_f)();
  };



  template<typename _Ret, typename _Tp>
    class const_mem_fun_ref_t : public unary_function<_Tp, _Ret>
    {
    public:
      explicit
      const_mem_fun_ref_t(_Ret (_Tp::*__pf)() const)
      : _M_f(__pf) { }

      _Ret
      operator()(const _Tp& __r) const
      { return (__r.*_M_f)(); }

    private:
      _Ret (_Tp::*_M_f)() const;
    };



  template<typename _Ret, typename _Tp, typename _Arg>
    class mem_fun1_t : public binary_function<_Tp*, _Arg, _Ret>
    {
    public:
      explicit
      mem_fun1_t(_Ret (_Tp::*__pf)(_Arg))
      : _M_f(__pf) { }

      _Ret
      operator()(_Tp* __p, _Arg __x) const
      { return (__p->*_M_f)(__x); }

    private:
      _Ret (_Tp::*_M_f)(_Arg);
    };



  template<typename _Ret, typename _Tp, typename _Arg>
    class const_mem_fun1_t : public binary_function<const _Tp*, _Arg, _Ret>
    {
    public:
      explicit
      const_mem_fun1_t(_Ret (_Tp::*__pf)(_Arg) const)
      : _M_f(__pf) { }

      _Ret
      operator()(const _Tp* __p, _Arg __x) const
      { return (__p->*_M_f)(__x); }

    private:
      _Ret (_Tp::*_M_f)(_Arg) const;
    };



  template<typename _Ret, typename _Tp, typename _Arg>
    class mem_fun1_ref_t : public binary_function<_Tp, _Arg, _Ret>
    {
    public:
      explicit
      mem_fun1_ref_t(_Ret (_Tp::*__pf)(_Arg))
      : _M_f(__pf) { }

      _Ret
      operator()(_Tp& __r, _Arg __x) const
      { return (__r.*_M_f)(__x); }

    private:
      _Ret (_Tp::*_M_f)(_Arg);
    };



  template<typename _Ret, typename _Tp, typename _Arg>
    class const_mem_fun1_ref_t : public binary_function<_Tp, _Arg, _Ret>
    {
    public:
      explicit
      const_mem_fun1_ref_t(_Ret (_Tp::*__pf)(_Arg) const)
      : _M_f(__pf) { }

      _Ret
      operator()(const _Tp& __r, _Arg __x) const
      { return (__r.*_M_f)(__x); }

    private:
      _Ret (_Tp::*_M_f)(_Arg) const;
    };



  template<typename _Ret, typename _Tp>
    inline mem_fun_t<_Ret, _Tp>
    mem_fun(_Ret (_Tp::*__f)())
    { return mem_fun_t<_Ret, _Tp>(__f); }

  template<typename _Ret, typename _Tp>
    inline const_mem_fun_t<_Ret, _Tp>
    mem_fun(_Ret (_Tp::*__f)() const)
    { return const_mem_fun_t<_Ret, _Tp>(__f); }

  template<typename _Ret, typename _Tp>
    inline mem_fun_ref_t<_Ret, _Tp>
    mem_fun_ref(_Ret (_Tp::*__f)())
    { return mem_fun_ref_t<_Ret, _Tp>(__f); }

  template<typename _Ret, typename _Tp>
    inline const_mem_fun_ref_t<_Ret, _Tp>
    mem_fun_ref(_Ret (_Tp::*__f)() const)
    { return const_mem_fun_ref_t<_Ret, _Tp>(__f); }

  template<typename _Ret, typename _Tp, typename _Arg>
    inline mem_fun1_t<_Ret, _Tp, _Arg>
    mem_fun(_Ret (_Tp::*__f)(_Arg))
    { return mem_fun1_t<_Ret, _Tp, _Arg>(__f); }

  template<typename _Ret, typename _Tp, typename _Arg>
    inline const_mem_fun1_t<_Ret, _Tp, _Arg>
    mem_fun(_Ret (_Tp::*__f)(_Arg) const)
    { return const_mem_fun1_t<_Ret, _Tp, _Arg>(__f); }

  template<typename _Ret, typename _Tp, typename _Arg>
    inline mem_fun1_ref_t<_Ret, _Tp, _Arg>
    mem_fun_ref(_Ret (_Tp::*__f)(_Arg))
    { return mem_fun1_ref_t<_Ret, _Tp, _Arg>(__f); }

  template<typename _Ret, typename _Tp, typename _Arg>
    inline const_mem_fun1_ref_t<_Ret, _Tp, _Arg>
    mem_fun_ref(_Ret (_Tp::*__f)(_Arg) const)
    { return const_mem_fun1_ref_t<_Ret, _Tp, _Arg>(__f); }




}


# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/backward/binders.h" 1 3
# 59 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/backward/binders.h" 3
namespace std __attribute__ ((__visibility__ ("default")))
{

# 103 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/backward/binders.h" 3
  template<typename _Operation>
    class binder1st
    : public unary_function<typename _Operation::second_argument_type,
       typename _Operation::result_type>
    {
    protected:
      _Operation op;
      typename _Operation::first_argument_type value;

    public:
      binder1st(const _Operation& __x,
  const typename _Operation::first_argument_type& __y)
      : op(__x), value(__y) { }

      typename _Operation::result_type
      operator()(const typename _Operation::second_argument_type& __x) const
      { return op(value, __x); }



      typename _Operation::result_type
      operator()(typename _Operation::second_argument_type& __x) const
      { return op(value, __x); }
    } ;


  template<typename _Operation, typename _Tp>
    inline binder1st<_Operation>
    bind1st(const _Operation& __fn, const _Tp& __x)
    {
      typedef typename _Operation::first_argument_type _Arg1_type;
      return binder1st<_Operation>(__fn, _Arg1_type(__x));
    }


  template<typename _Operation>
    class binder2nd
    : public unary_function<typename _Operation::first_argument_type,
       typename _Operation::result_type>
    {
    protected:
      _Operation op;
      typename _Operation::second_argument_type value;

    public:
      binder2nd(const _Operation& __x,
  const typename _Operation::second_argument_type& __y)
      : op(__x), value(__y) { }

      typename _Operation::result_type
      operator()(const typename _Operation::first_argument_type& __x) const
      { return op(__x, value); }



      typename _Operation::result_type
      operator()(typename _Operation::first_argument_type& __x) const
      { return op(__x, value); }
    } ;


  template<typename _Operation, typename _Tp>
    inline binder2nd<_Operation>
    bind2nd(const _Operation& __fn, const _Tp& __x)
    {
      typedef typename _Operation::second_argument_type _Arg2_type;
      return binder2nd<_Operation>(__fn, _Arg2_type(__x));
    }



}
# 1085 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_function.h" 2 3
# 49 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/string" 2 3


# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/range_access.h" 1 3
# 33 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/range_access.h" 3
       
# 34 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/range_access.h" 3
# 52 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/string" 2 3
# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 1 3
# 37 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
       
# 38 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3







namespace std __attribute__ ((__visibility__ ("default")))
{

# 111 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
  template<typename _CharT, typename _Traits, typename _Alloc>
    class basic_string
    {
      typedef typename _Alloc::template rebind<_CharT>::other _CharT_alloc_type;


    public:
      typedef _Traits traits_type;
      typedef typename _Traits::char_type value_type;
      typedef _Alloc allocator_type;
      typedef typename _CharT_alloc_type::size_type size_type;
      typedef typename _CharT_alloc_type::difference_type difference_type;
      typedef typename _CharT_alloc_type::reference reference;
      typedef typename _CharT_alloc_type::const_reference const_reference;
      typedef typename _CharT_alloc_type::pointer pointer;
      typedef typename _CharT_alloc_type::const_pointer const_pointer;
      typedef __gnu_cxx::__normal_iterator<pointer, basic_string> iterator;
      typedef __gnu_cxx::__normal_iterator<const_pointer, basic_string>
                                                            const_iterator;
      typedef std::reverse_iterator<const_iterator> const_reverse_iterator;
      typedef std::reverse_iterator<iterator> reverse_iterator;

    private:
# 148 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      struct _Rep_base
      {
 size_type _M_length;
 size_type _M_capacity;
 _Atomic_word _M_refcount;
      };

      struct _Rep : _Rep_base
      {

 typedef typename _Alloc::template rebind<char>::other _Raw_bytes_alloc;
# 173 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
 static const size_type _S_max_size;
 static const _CharT _S_terminal;



        static size_type _S_empty_rep_storage[];

        static _Rep&
        _S_empty_rep()
        {



   void* __p = reinterpret_cast<void*>(&_S_empty_rep_storage);
   return *reinterpret_cast<_Rep*>(__p);
 }

        bool
 _M_is_leaked() const
        { return this->_M_refcount < 0; }

        bool
 _M_is_shared() const
        { return this->_M_refcount > 0; }

        void
 _M_set_leaked()
        { this->_M_refcount = -1; }

        void
 _M_set_sharable()
        { this->_M_refcount = 0; }

 void
 _M_set_length_and_sharable(size_type __n)
 {

   if (__builtin_expect(this != &_S_empty_rep(), false))

     {
       this->_M_set_sharable();
       this->_M_length = __n;
       traits_type::assign(this->_M_refdata()[__n], _S_terminal);


     }
 }

 _CharT*
 _M_refdata() throw()
 { return reinterpret_cast<_CharT*>(this + 1); }

 _CharT*
 _M_grab(const _Alloc& __alloc1, const _Alloc& __alloc2)
 {
   return (!_M_is_leaked() && __alloc1 == __alloc2)
           ? _M_refcopy() : _M_clone(__alloc1);
 }


 static _Rep*
 _S_create(size_type, size_type, const _Alloc&);

 void
 _M_dispose(const _Alloc& __a)
 {

   if (__builtin_expect(this != &_S_empty_rep(), false))

     {

       ;
       if (__gnu_cxx::__exchange_and_add_dispatch(&this->_M_refcount,
        -1) <= 0)
  {
    ;
    _M_destroy(__a);
  }
     }
 }

 void
 _M_destroy(const _Alloc&) throw();

 _CharT*
 _M_refcopy() throw()
 {

   if (__builtin_expect(this != &_S_empty_rep(), false))

            __gnu_cxx::__atomic_add_dispatch(&this->_M_refcount, 1);
   return _M_refdata();
 }

 _CharT*
 _M_clone(const _Alloc&, size_type __res = 0);
      };


      struct _Alloc_hider : _Alloc
      {
 _Alloc_hider(_CharT* __dat, const _Alloc& __a)
 : _Alloc(__a), _M_p(__dat) { }

 _CharT* _M_p;
      };

    public:




      static const size_type npos = static_cast<size_type>(-1);

    private:

      mutable _Alloc_hider _M_dataplus;

      _CharT*
      _M_data() const
      { return _M_dataplus._M_p; }

      _CharT*
      _M_data(_CharT* __p)
      { return (_M_dataplus._M_p = __p); }

      _Rep*
      _M_rep() const
      { return &((reinterpret_cast<_Rep*> (_M_data()))[-1]); }



      iterator
      _M_ibegin() const
      { return iterator(_M_data()); }

      iterator
      _M_iend() const
      { return iterator(_M_data() + this->size()); }

      void
      _M_leak()
      {
 if (!_M_rep()->_M_is_leaked())
   _M_leak_hard();
      }

      size_type
      _M_check(size_type __pos, const char* __s) const
      {
 if (__pos > this->size())
   __throw_out_of_range_fmt(("%s: __pos (which is %zu) > " "this->size() (which is %zu)")
                                         ,
       __s, __pos, this->size());
 return __pos;
      }

      void
      _M_check_length(size_type __n1, size_type __n2, const char* __s) const
      {
 if (this->max_size() - (this->size() - __n1) < __n2)
   __throw_length_error((__s));
      }


      size_type
      _M_limit(size_type __pos, size_type __off) const
      {
 const bool __testoff = __off < this->size() - __pos;
 return __testoff ? __off : this->size() - __pos;
      }


      bool
      _M_disjunct(const _CharT* __s) const
      {
 return (less<const _CharT*>()(__s, _M_data())
  || less<const _CharT*>()(_M_data() + this->size(), __s));
      }



      static void
      _M_copy(_CharT* __d, const _CharT* __s, size_type __n)
      {
 if (__n == 1)
   traits_type::assign(*__d, *__s);
 else
   traits_type::copy(__d, __s, __n);
      }

      static void
      _M_move(_CharT* __d, const _CharT* __s, size_type __n)
      {
 if (__n == 1)
   traits_type::assign(*__d, *__s);
 else
   traits_type::move(__d, __s, __n);
      }

      static void
      _M_assign(_CharT* __d, size_type __n, _CharT __c)
      {
 if (__n == 1)
   traits_type::assign(*__d, __c);
 else
   traits_type::assign(__d, __n, __c);
      }



      template<class _Iterator>
        static void
        _S_copy_chars(_CharT* __p, _Iterator __k1, _Iterator __k2)

        {
   for (; __k1 != __k2; ++__k1, ++__p)
     traits_type::assign(*__p, *__k1);
 }

      static void
      _S_copy_chars(_CharT* __p, iterator __k1, iterator __k2)
      { _S_copy_chars(__p, __k1.base(), __k2.base()); }

      static void
      _S_copy_chars(_CharT* __p, const_iterator __k1, const_iterator __k2)
     
      { _S_copy_chars(__p, __k1.base(), __k2.base()); }

      static void
      _S_copy_chars(_CharT* __p, _CharT* __k1, _CharT* __k2)
      { _M_copy(__p, __k1, __k2 - __k1); }

      static void
      _S_copy_chars(_CharT* __p, const _CharT* __k1, const _CharT* __k2)
     
      { _M_copy(__p, __k1, __k2 - __k1); }

      static int
      _S_compare(size_type __n1, size_type __n2)
      {
 const difference_type __d = difference_type(__n1 - __n2);

 if (__d > __gnu_cxx::__numeric_traits<int>::__max)
   return __gnu_cxx::__numeric_traits<int>::__max;
 else if (__d < __gnu_cxx::__numeric_traits<int>::__min)
   return __gnu_cxx::__numeric_traits<int>::__min;
 else
   return int(__d);
      }

      void
      _M_mutate(size_type __pos, size_type __len1, size_type __len2);

      void
      _M_leak_hard();

      static _Rep&
      _S_empty_rep()
      { return _Rep::_S_empty_rep(); }

    public:







      basic_string()

      : _M_dataplus(_S_empty_rep()._M_refdata(), _Alloc()) { }







      explicit
      basic_string(const _Alloc& __a);






      basic_string(const basic_string& __str);






      basic_string(const basic_string& __str, size_type __pos,
     size_type __n = npos);







      basic_string(const basic_string& __str, size_type __pos,
     size_type __n, const _Alloc& __a);
# 488 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      basic_string(const _CharT* __s, size_type __n,
     const _Alloc& __a = _Alloc());





      basic_string(const _CharT* __s, const _Alloc& __a = _Alloc());






      basic_string(size_type __n, _CharT __c, const _Alloc& __a = _Alloc());
# 539 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      template<class _InputIterator>
        basic_string(_InputIterator __beg, _InputIterator __end,
       const _Alloc& __a = _Alloc());




      ~basic_string()
      { _M_rep()->_M_dispose(this->get_allocator()); }





      basic_string&
      operator=(const basic_string& __str)
      { return this->assign(__str); }





      basic_string&
      operator=(const _CharT* __s)
      { return this->assign(__s); }
# 572 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      basic_string&
      operator=(_CharT __c)
      {
 this->assign(1, __c);
 return *this;
      }
# 613 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      iterator
      begin()
      {
 _M_leak();
 return iterator(_M_data());
      }





      const_iterator
      begin() const
      { return const_iterator(_M_data()); }





      iterator
      end()
      {
 _M_leak();
 return iterator(_M_data() + this->size());
      }





      const_iterator
      end() const
      { return const_iterator(_M_data() + this->size()); }






      reverse_iterator
      rbegin()
      { return reverse_iterator(this->end()); }






      const_reverse_iterator
      rbegin() const
      { return const_reverse_iterator(this->end()); }






      reverse_iterator
      rend()
      { return reverse_iterator(this->begin()); }






      const_reverse_iterator
      rend() const
      { return const_reverse_iterator(this->begin()); }
# 719 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
    public:



      size_type
      size() const
      { return _M_rep()->_M_length; }



      size_type
      length() const
      { return _M_rep()->_M_length; }


      size_type
      max_size() const
      { return _Rep::_S_max_size; }
# 748 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      void
      resize(size_type __n, _CharT __c);
# 761 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      void
      resize(size_type __n)
      { this->resize(__n, _CharT()); }
# 784 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      size_type
      capacity() const
      { return _M_rep()->_M_capacity; }
# 805 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      void
      reserve(size_type __res_arg = 0);





      void
      clear()
      { _M_mutate(0, this->size(), 0); }





      bool
      empty() const
      { return this->size() == 0; }
# 835 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      const_reference
      operator[] (size_type __pos) const
      {
 ;
 return _M_data()[__pos];
      }
# 852 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      reference
      operator[](size_type __pos)
      {


 ;

 ;
 _M_leak();
 return _M_data()[__pos];
      }
# 874 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      const_reference
      at(size_type __n) const
      {
 if (__n >= this->size())
   __throw_out_of_range_fmt(("basic_string::at: __n " "(which is %zu) >= this->size() " "(which is %zu)")

                            ,
       __n, this->size());
 return _M_data()[__n];
      }
# 896 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      reference
      at(size_type __n)
      {
 if (__n >= size())
   __throw_out_of_range_fmt(("basic_string::at: __n " "(which is %zu) >= this->size() " "(which is %zu)")

                            ,
       __n, this->size());
 _M_leak();
 return _M_data()[__n];
      }
# 948 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      basic_string&
      operator+=(const basic_string& __str)
      { return this->append(__str); }






      basic_string&
      operator+=(const _CharT* __s)
      { return this->append(__s); }






      basic_string&
      operator+=(_CharT __c)
      {
 this->push_back(__c);
 return *this;
      }
# 989 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      basic_string&
      append(const basic_string& __str);
# 1005 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      basic_string&
      append(const basic_string& __str, size_type __pos, size_type __n);







      basic_string&
      append(const _CharT* __s, size_type __n);






      basic_string&
      append(const _CharT* __s)
      {
 ;
 return this->append(__s, traits_type::length(__s));
      }
# 1037 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      basic_string&
      append(size_type __n, _CharT __c);
# 1059 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      template<class _InputIterator>
        basic_string&
        append(_InputIterator __first, _InputIterator __last)
        { return this->replace(_M_iend(), _M_iend(), __first, __last); }





      void
      push_back(_CharT __c)
      {
 const size_type __len = 1 + this->size();
 if (__len > this->capacity() || _M_rep()->_M_is_shared())
   this->reserve(__len);
 traits_type::assign(_M_data()[this->size()], __c);
 _M_rep()->_M_set_length_and_sharable(__len);
      }






      basic_string&
      assign(const basic_string& __str);
# 1117 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      basic_string&
      assign(const basic_string& __str, size_type __pos, size_type __n)
      { return this->assign(__str._M_data()
       + __str._M_check(__pos, "basic_string::assign"),
       __str._M_limit(__pos, __n)); }
# 1133 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      basic_string&
      assign(const _CharT* __s, size_type __n);
# 1145 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      basic_string&
      assign(const _CharT* __s)
      {
 ;
 return this->assign(__s, traits_type::length(__s));
      }
# 1161 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      basic_string&
      assign(size_type __n, _CharT __c)
      { return _M_replace_aux(size_type(0), this->size(), __n, __c); }
# 1173 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      template<class _InputIterator>
        basic_string&
        assign(_InputIterator __first, _InputIterator __last)
        { return this->replace(_M_ibegin(), _M_iend(), __first, __last); }
# 1202 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      void
      insert(iterator __p, size_type __n, _CharT __c)
      { this->replace(__p, __p, __n, __c); }
# 1218 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      template<class _InputIterator>
        void
        insert(iterator __p, _InputIterator __beg, _InputIterator __end)
        { this->replace(__p, __p, __beg, __end); }
# 1250 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      basic_string&
      insert(size_type __pos1, const basic_string& __str)
      { return this->insert(__pos1, __str, size_type(0), __str.size()); }
# 1272 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      basic_string&
      insert(size_type __pos1, const basic_string& __str,
      size_type __pos2, size_type __n)
      { return this->insert(__pos1, __str._M_data()
       + __str._M_check(__pos2, "basic_string::insert"),
       __str._M_limit(__pos2, __n)); }
# 1295 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      basic_string&
      insert(size_type __pos, const _CharT* __s, size_type __n);
# 1313 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      basic_string&
      insert(size_type __pos, const _CharT* __s)
      {
 ;
 return this->insert(__pos, __s, traits_type::length(__s));
      }
# 1336 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      basic_string&
      insert(size_type __pos, size_type __n, _CharT __c)
      { return _M_replace_aux(_M_check(__pos, "basic_string::insert"),
         size_type(0), __n, __c); }
# 1354 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      iterator
      insert(iterator __p, _CharT __c)
      {
 ;
 const size_type __pos = __p - _M_ibegin();
 _M_replace_aux(__pos, size_type(0), size_type(1), __c);
 _M_rep()->_M_set_leaked();
 return iterator(_M_data() + __pos);
      }
# 1379 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      basic_string&
      erase(size_type __pos = 0, size_type __n = npos)
      {
 _M_mutate(_M_check(__pos, "basic_string::erase"),
    _M_limit(__pos, __n), size_type(0));
 return *this;
      }
# 1395 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      iterator
      erase(iterator __position)
      {

                               ;
 const size_type __pos = __position - _M_ibegin();
 _M_mutate(__pos, size_type(1), size_type(0));
 _M_rep()->_M_set_leaked();
 return iterator(_M_data() + __pos);
      }
# 1415 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      iterator
      erase(iterator __first, iterator __last);
# 1446 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      basic_string&
      replace(size_type __pos, size_type __n, const basic_string& __str)
      { return this->replace(__pos, __n, __str._M_data(), __str.size()); }
# 1468 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      basic_string&
      replace(size_type __pos1, size_type __n1, const basic_string& __str,
       size_type __pos2, size_type __n2)
      { return this->replace(__pos1, __n1, __str._M_data()
        + __str._M_check(__pos2, "basic_string::replace"),
        __str._M_limit(__pos2, __n2)); }
# 1493 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      basic_string&
      replace(size_type __pos, size_type __n1, const _CharT* __s,
       size_type __n2);
# 1513 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      basic_string&
      replace(size_type __pos, size_type __n1, const _CharT* __s)
      {
 ;
 return this->replace(__pos, __n1, __s, traits_type::length(__s));
      }
# 1537 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      basic_string&
      replace(size_type __pos, size_type __n1, size_type __n2, _CharT __c)
      { return _M_replace_aux(_M_check(__pos, "basic_string::replace"),
         _M_limit(__pos, __n1), __n2, __c); }
# 1555 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      basic_string&
      replace(iterator __i1, iterator __i2, const basic_string& __str)
      { return this->replace(__i1, __i2, __str._M_data(), __str.size()); }
# 1574 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      basic_string&
      replace(iterator __i1, iterator __i2, const _CharT* __s, size_type __n)
      {

                          ;
 return this->replace(__i1 - _M_ibegin(), __i2 - __i1, __s, __n);
      }
# 1595 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      basic_string&
      replace(iterator __i1, iterator __i2, const _CharT* __s)
      {
 ;
 return this->replace(__i1, __i2, __s, traits_type::length(__s));
      }
# 1616 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      basic_string&
      replace(iterator __i1, iterator __i2, size_type __n, _CharT __c)
      {

                          ;
 return _M_replace_aux(__i1 - _M_ibegin(), __i2 - __i1, __n, __c);
      }
# 1639 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      template<class _InputIterator>
        basic_string&
        replace(iterator __i1, iterator __i2,
  _InputIterator __k1, _InputIterator __k2)
        {
  
                            ;
   ;
   typedef typename std::__is_integer<_InputIterator>::__type _Integral;
   return _M_replace_dispatch(__i1, __i2, __k1, __k2, _Integral());
 }



      basic_string&
      replace(iterator __i1, iterator __i2, _CharT* __k1, _CharT* __k2)
      {

                          ;
 ;
 return this->replace(__i1 - _M_ibegin(), __i2 - __i1,
        __k1, __k2 - __k1);
      }

      basic_string&
      replace(iterator __i1, iterator __i2,
       const _CharT* __k1, const _CharT* __k2)
      {

                          ;
 ;
 return this->replace(__i1 - _M_ibegin(), __i2 - __i1,
        __k1, __k2 - __k1);
      }

      basic_string&
      replace(iterator __i1, iterator __i2, iterator __k1, iterator __k2)
      {

                          ;
 ;
 return this->replace(__i1 - _M_ibegin(), __i2 - __i1,
        __k1.base(), __k2 - __k1);
      }

      basic_string&
      replace(iterator __i1, iterator __i2,
       const_iterator __k1, const_iterator __k2)
      {

                          ;
 ;
 return this->replace(__i1 - _M_ibegin(), __i2 - __i1,
        __k1.base(), __k2 - __k1);
      }
# 1715 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
    private:
      template<class _Integer>
 basic_string&
 _M_replace_dispatch(iterator __i1, iterator __i2, _Integer __n,
       _Integer __val, __true_type)
        { return _M_replace_aux(__i1 - _M_ibegin(), __i2 - __i1, __n, __val); }

      template<class _InputIterator>
 basic_string&
 _M_replace_dispatch(iterator __i1, iterator __i2, _InputIterator __k1,
       _InputIterator __k2, __false_type);

      basic_string&
      _M_replace_aux(size_type __pos1, size_type __n1, size_type __n2,
       _CharT __c);

      basic_string&
      _M_replace_safe(size_type __pos1, size_type __n1, const _CharT* __s,
        size_type __n2);



      template<class _InIterator>
        static _CharT*
        _S_construct_aux(_InIterator __beg, _InIterator __end,
    const _Alloc& __a, __false_type)
 {
          typedef typename iterator_traits<_InIterator>::iterator_category _Tag;
          return _S_construct(__beg, __end, __a, _Tag());
 }



      template<class _Integer>
        static _CharT*
        _S_construct_aux(_Integer __beg, _Integer __end,
    const _Alloc& __a, __true_type)
        { return _S_construct_aux_2(static_cast<size_type>(__beg),
        __end, __a); }

      static _CharT*
      _S_construct_aux_2(size_type __req, _CharT __c, const _Alloc& __a)
      { return _S_construct(__req, __c, __a); }

      template<class _InIterator>
        static _CharT*
        _S_construct(_InIterator __beg, _InIterator __end, const _Alloc& __a)
 {
   typedef typename std::__is_integer<_InIterator>::__type _Integral;
   return _S_construct_aux(__beg, __end, __a, _Integral());
        }


      template<class _InIterator>
        static _CharT*
         _S_construct(_InIterator __beg, _InIterator __end, const _Alloc& __a,
        input_iterator_tag);



      template<class _FwdIterator>
        static _CharT*
        _S_construct(_FwdIterator __beg, _FwdIterator __end, const _Alloc& __a,
       forward_iterator_tag);

      static _CharT*
      _S_construct(size_type __req, _CharT __c, const _Alloc& __a);

    public:
# 1797 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      size_type
      copy(_CharT* __s, size_type __n, size_type __pos = 0) const;
# 1808 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      void
      swap(basic_string& __s);
# 1818 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      const _CharT*
      c_str() const
      { return _M_data(); }







      const _CharT*
      data() const
      { return _M_data(); }




      allocator_type
      get_allocator() const
      { return _M_dataplus; }
# 1851 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      size_type
      find(const _CharT* __s, size_type __pos, size_type __n) const;
# 1864 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      size_type
      find(const basic_string& __str, size_type __pos = 0) const

      { return this->find(__str.data(), __pos, __str.size()); }
# 1879 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      size_type
      find(const _CharT* __s, size_type __pos = 0) const
      {
 ;
 return this->find(__s, __pos, traits_type::length(__s));
      }
# 1896 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      size_type
      find(_CharT __c, size_type __pos = 0) const ;
# 1909 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      size_type
      rfind(const basic_string& __str, size_type __pos = npos) const

      { return this->rfind(__str.data(), __pos, __str.size()); }
# 1926 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      size_type
      rfind(const _CharT* __s, size_type __pos, size_type __n) const;
# 1939 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      size_type
      rfind(const _CharT* __s, size_type __pos = npos) const
      {
 ;
 return this->rfind(__s, __pos, traits_type::length(__s));
      }
# 1956 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      size_type
      rfind(_CharT __c, size_type __pos = npos) const ;
# 1970 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      size_type
      find_first_of(const basic_string& __str, size_type __pos = 0) const

      { return this->find_first_of(__str.data(), __pos, __str.size()); }
# 1987 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      size_type
      find_first_of(const _CharT* __s, size_type __pos, size_type __n) const;
# 2000 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      size_type
      find_first_of(const _CharT* __s, size_type __pos = 0) const
      {
 ;
 return this->find_first_of(__s, __pos, traits_type::length(__s));
      }
# 2019 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      size_type
      find_first_of(_CharT __c, size_type __pos = 0) const
      { return this->find(__c, __pos); }
# 2034 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      size_type
      find_last_of(const basic_string& __str, size_type __pos = npos) const

      { return this->find_last_of(__str.data(), __pos, __str.size()); }
# 2051 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      size_type
      find_last_of(const _CharT* __s, size_type __pos, size_type __n) const;
# 2064 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      size_type
      find_last_of(const _CharT* __s, size_type __pos = npos) const
      {
 ;
 return this->find_last_of(__s, __pos, traits_type::length(__s));
      }
# 2083 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      size_type
      find_last_of(_CharT __c, size_type __pos = npos) const
      { return this->rfind(__c, __pos); }
# 2097 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      size_type
      find_first_not_of(const basic_string& __str, size_type __pos = 0) const

      { return this->find_first_not_of(__str.data(), __pos, __str.size()); }
# 2114 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      size_type
      find_first_not_of(const _CharT* __s, size_type __pos,
   size_type __n) const;
# 2128 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      size_type
      find_first_not_of(const _CharT* __s, size_type __pos = 0) const
      {
 ;
 return this->find_first_not_of(__s, __pos, traits_type::length(__s));
      }
# 2145 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      size_type
      find_first_not_of(_CharT __c, size_type __pos = 0) const
 ;
# 2160 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      size_type
      find_last_not_of(const basic_string& __str, size_type __pos = npos) const

      { return this->find_last_not_of(__str.data(), __pos, __str.size()); }
# 2177 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      size_type
      find_last_not_of(const _CharT* __s, size_type __pos,
         size_type __n) const;
# 2191 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      size_type
      find_last_not_of(const _CharT* __s, size_type __pos = npos) const
      {
 ;
 return this->find_last_not_of(__s, __pos, traits_type::length(__s));
      }
# 2208 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      size_type
      find_last_not_of(_CharT __c, size_type __pos = npos) const
 ;
# 2224 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      basic_string
      substr(size_type __pos = 0, size_type __n = npos) const
      { return basic_string(*this,
       _M_check(__pos, "basic_string::substr"), __n); }
# 2243 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      int
      compare(const basic_string& __str) const
      {
 const size_type __size = this->size();
 const size_type __osize = __str.size();
 const size_type __len = std::min(__size, __osize);

 int __r = traits_type::compare(_M_data(), __str.data(), __len);
 if (!__r)
   __r = _S_compare(__size, __osize);
 return __r;
      }
# 2275 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      int
      compare(size_type __pos, size_type __n, const basic_string& __str) const;
# 2301 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      int
      compare(size_type __pos1, size_type __n1, const basic_string& __str,
       size_type __pos2, size_type __n2) const;
# 2319 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      int
      compare(const _CharT* __s) const;
# 2343 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      int
      compare(size_type __pos, size_type __n1, const _CharT* __s) const;
# 2370 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
      int
      compare(size_type __pos, size_type __n1, const _CharT* __s,
       size_type __n2) const;
  };
# 2382 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
  template<typename _CharT, typename _Traits, typename _Alloc>
    basic_string<_CharT, _Traits, _Alloc>
    operator+(const basic_string<_CharT, _Traits, _Alloc>& __lhs,
       const basic_string<_CharT, _Traits, _Alloc>& __rhs)
    {
      basic_string<_CharT, _Traits, _Alloc> __str(__lhs);
      __str.append(__rhs);
      return __str;
    }







  template<typename _CharT, typename _Traits, typename _Alloc>
    basic_string<_CharT,_Traits,_Alloc>
    operator+(const _CharT* __lhs,
       const basic_string<_CharT,_Traits,_Alloc>& __rhs);







  template<typename _CharT, typename _Traits, typename _Alloc>
    basic_string<_CharT,_Traits,_Alloc>
    operator+(_CharT __lhs, const basic_string<_CharT,_Traits,_Alloc>& __rhs);







  template<typename _CharT, typename _Traits, typename _Alloc>
    inline basic_string<_CharT, _Traits, _Alloc>
    operator+(const basic_string<_CharT, _Traits, _Alloc>& __lhs,
      const _CharT* __rhs)
    {
      basic_string<_CharT, _Traits, _Alloc> __str(__lhs);
      __str.append(__rhs);
      return __str;
    }







  template<typename _CharT, typename _Traits, typename _Alloc>
    inline basic_string<_CharT, _Traits, _Alloc>
    operator+(const basic_string<_CharT, _Traits, _Alloc>& __lhs, _CharT __rhs)
    {
      typedef basic_string<_CharT, _Traits, _Alloc> __string_type;
      typedef typename __string_type::size_type __size_type;
      __string_type __str(__lhs);
      __str.append(__size_type(1), __rhs);
      return __str;
    }
# 2503 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
  template<typename _CharT, typename _Traits, typename _Alloc>
    inline bool
    operator==(const basic_string<_CharT, _Traits, _Alloc>& __lhs,
        const basic_string<_CharT, _Traits, _Alloc>& __rhs)
    { return __lhs.compare(__rhs) == 0; }

  template<typename _CharT>
    inline
    typename __gnu_cxx::__enable_if<__is_char<_CharT>::__value, bool>::__type
    operator==(const basic_string<_CharT>& __lhs,
        const basic_string<_CharT>& __rhs)
    { return (__lhs.size() == __rhs.size()
       && !std::char_traits<_CharT>::compare(__lhs.data(), __rhs.data(),
          __lhs.size())); }







  template<typename _CharT, typename _Traits, typename _Alloc>
    inline bool
    operator==(const _CharT* __lhs,
        const basic_string<_CharT, _Traits, _Alloc>& __rhs)
    { return __rhs.compare(__lhs) == 0; }







  template<typename _CharT, typename _Traits, typename _Alloc>
    inline bool
    operator==(const basic_string<_CharT, _Traits, _Alloc>& __lhs,
        const _CharT* __rhs)
    { return __lhs.compare(__rhs) == 0; }
# 2549 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
  template<typename _CharT, typename _Traits, typename _Alloc>
    inline bool
    operator!=(const basic_string<_CharT, _Traits, _Alloc>& __lhs,
        const basic_string<_CharT, _Traits, _Alloc>& __rhs)
    { return !(__lhs == __rhs); }







  template<typename _CharT, typename _Traits, typename _Alloc>
    inline bool
    operator!=(const _CharT* __lhs,
        const basic_string<_CharT, _Traits, _Alloc>& __rhs)
    { return !(__lhs == __rhs); }







  template<typename _CharT, typename _Traits, typename _Alloc>
    inline bool
    operator!=(const basic_string<_CharT, _Traits, _Alloc>& __lhs,
        const _CharT* __rhs)
    { return !(__lhs == __rhs); }
# 2586 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
  template<typename _CharT, typename _Traits, typename _Alloc>
    inline bool
    operator<(const basic_string<_CharT, _Traits, _Alloc>& __lhs,
       const basic_string<_CharT, _Traits, _Alloc>& __rhs)
    { return __lhs.compare(__rhs) < 0; }







  template<typename _CharT, typename _Traits, typename _Alloc>
    inline bool
    operator<(const basic_string<_CharT, _Traits, _Alloc>& __lhs,
       const _CharT* __rhs)
    { return __lhs.compare(__rhs) < 0; }







  template<typename _CharT, typename _Traits, typename _Alloc>
    inline bool
    operator<(const _CharT* __lhs,
       const basic_string<_CharT, _Traits, _Alloc>& __rhs)
    { return __rhs.compare(__lhs) > 0; }
# 2623 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
  template<typename _CharT, typename _Traits, typename _Alloc>
    inline bool
    operator>(const basic_string<_CharT, _Traits, _Alloc>& __lhs,
       const basic_string<_CharT, _Traits, _Alloc>& __rhs)
    { return __lhs.compare(__rhs) > 0; }







  template<typename _CharT, typename _Traits, typename _Alloc>
    inline bool
    operator>(const basic_string<_CharT, _Traits, _Alloc>& __lhs,
       const _CharT* __rhs)
    { return __lhs.compare(__rhs) > 0; }







  template<typename _CharT, typename _Traits, typename _Alloc>
    inline bool
    operator>(const _CharT* __lhs,
       const basic_string<_CharT, _Traits, _Alloc>& __rhs)
    { return __rhs.compare(__lhs) < 0; }
# 2660 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
  template<typename _CharT, typename _Traits, typename _Alloc>
    inline bool
    operator<=(const basic_string<_CharT, _Traits, _Alloc>& __lhs,
        const basic_string<_CharT, _Traits, _Alloc>& __rhs)
    { return __lhs.compare(__rhs) <= 0; }







  template<typename _CharT, typename _Traits, typename _Alloc>
    inline bool
    operator<=(const basic_string<_CharT, _Traits, _Alloc>& __lhs,
        const _CharT* __rhs)
    { return __lhs.compare(__rhs) <= 0; }







  template<typename _CharT, typename _Traits, typename _Alloc>
    inline bool
    operator<=(const _CharT* __lhs,
        const basic_string<_CharT, _Traits, _Alloc>& __rhs)
    { return __rhs.compare(__lhs) >= 0; }
# 2697 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
  template<typename _CharT, typename _Traits, typename _Alloc>
    inline bool
    operator>=(const basic_string<_CharT, _Traits, _Alloc>& __lhs,
        const basic_string<_CharT, _Traits, _Alloc>& __rhs)
    { return __lhs.compare(__rhs) >= 0; }







  template<typename _CharT, typename _Traits, typename _Alloc>
    inline bool
    operator>=(const basic_string<_CharT, _Traits, _Alloc>& __lhs,
        const _CharT* __rhs)
    { return __lhs.compare(__rhs) >= 0; }







  template<typename _CharT, typename _Traits, typename _Alloc>
    inline bool
    operator>=(const _CharT* __lhs,
      const basic_string<_CharT, _Traits, _Alloc>& __rhs)
    { return __rhs.compare(__lhs) <= 0; }
# 2734 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
  template<typename _CharT, typename _Traits, typename _Alloc>
    inline void
    swap(basic_string<_CharT, _Traits, _Alloc>& __lhs,
  basic_string<_CharT, _Traits, _Alloc>& __rhs)
    { __lhs.swap(__rhs); }
# 2752 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
  template<typename _CharT, typename _Traits, typename _Alloc>
    basic_istream<_CharT, _Traits>&
    operator>>(basic_istream<_CharT, _Traits>& __is,
        basic_string<_CharT, _Traits, _Alloc>& __str);

  template<>
    basic_istream<char>&
    operator>>(basic_istream<char>& __is, basic_string<char>& __str);
# 2770 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
  template<typename _CharT, typename _Traits, typename _Alloc>
    inline basic_ostream<_CharT, _Traits>&
    operator<<(basic_ostream<_CharT, _Traits>& __os,
        const basic_string<_CharT, _Traits, _Alloc>& __str)
    {


      return __ostream_insert(__os, __str.data(), __str.size());
    }
# 2793 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
  template<typename _CharT, typename _Traits, typename _Alloc>
    basic_istream<_CharT, _Traits>&
    getline(basic_istream<_CharT, _Traits>& __is,
     basic_string<_CharT, _Traits, _Alloc>& __str, _CharT __delim);
# 2810 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
  template<typename _CharT, typename _Traits, typename _Alloc>
    inline basic_istream<_CharT, _Traits>&
    getline(basic_istream<_CharT, _Traits>& __is,
     basic_string<_CharT, _Traits, _Alloc>& __str)
    { return std::getline(__is, __str, __is.widen('\n')); }
# 2832 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.h" 3
  template<>
    basic_istream<char>&
    getline(basic_istream<char>& __in, basic_string<char>& __str,
     char __delim);


  template<>
    basic_istream<wchar_t>&
    getline(basic_istream<wchar_t>& __in, basic_string<wchar_t>& __str,
     wchar_t __delim);



}
# 53 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/string" 2 3
# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.tcc" 1 3
# 40 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.tcc" 3
       
# 41 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.tcc" 3



namespace std __attribute__ ((__visibility__ ("default")))
{


  template<typename _CharT, typename _Traits, typename _Alloc>
    const typename basic_string<_CharT, _Traits, _Alloc>::size_type
    basic_string<_CharT, _Traits, _Alloc>::
    _Rep::_S_max_size = (((npos - sizeof(_Rep_base))/sizeof(_CharT)) - 1) / 4;

  template<typename _CharT, typename _Traits, typename _Alloc>
    const _CharT
    basic_string<_CharT, _Traits, _Alloc>::
    _Rep::_S_terminal = _CharT();

  template<typename _CharT, typename _Traits, typename _Alloc>
    const typename basic_string<_CharT, _Traits, _Alloc>::size_type
    basic_string<_CharT, _Traits, _Alloc>::npos;



  template<typename _CharT, typename _Traits, typename _Alloc>
    typename basic_string<_CharT, _Traits, _Alloc>::size_type
    basic_string<_CharT, _Traits, _Alloc>::_Rep::_S_empty_rep_storage[
    (sizeof(_Rep_base) + sizeof(_CharT) + sizeof(size_type) - 1) /
      sizeof(size_type)];





  template<typename _CharT, typename _Traits, typename _Alloc>
    template<typename _InIterator>
      _CharT*
      basic_string<_CharT, _Traits, _Alloc>::
      _S_construct(_InIterator __beg, _InIterator __end, const _Alloc& __a,
     input_iterator_tag)
      {

 if (__beg == __end && __a == _Alloc())
   return _S_empty_rep()._M_refdata();


 _CharT __buf[128];
 size_type __len = 0;
 while (__beg != __end && __len < sizeof(__buf) / sizeof(_CharT))
   {
     __buf[__len++] = *__beg;
     ++__beg;
   }
 _Rep* __r = _Rep::_S_create(__len, size_type(0), __a);
 _M_copy(__r->_M_refdata(), __buf, __len);
 try
   {
     while (__beg != __end)
       {
  if (__len == __r->_M_capacity)
    {

      _Rep* __another = _Rep::_S_create(__len + 1, __len, __a);
      _M_copy(__another->_M_refdata(), __r->_M_refdata(), __len);
      __r->_M_destroy(__a);
      __r = __another;
    }
  __r->_M_refdata()[__len++] = *__beg;
  ++__beg;
       }
   }
 catch(...)
   {
     __r->_M_destroy(__a);
     throw;
   }
 __r->_M_set_length_and_sharable(__len);
 return __r->_M_refdata();
      }

  template<typename _CharT, typename _Traits, typename _Alloc>
    template <typename _InIterator>
      _CharT*
      basic_string<_CharT, _Traits, _Alloc>::
      _S_construct(_InIterator __beg, _InIterator __end, const _Alloc& __a,
     forward_iterator_tag)
      {

 if (__beg == __end && __a == _Alloc())
   return _S_empty_rep()._M_refdata();


 if (__gnu_cxx::__is_null_pointer(__beg) && __beg != __end)
   __throw_logic_error(("basic_string::_S_construct null not valid"));

 const size_type __dnew = static_cast<size_type>(std::distance(__beg,
              __end));

 _Rep* __r = _Rep::_S_create(__dnew, size_type(0), __a);
 try
   { _S_copy_chars(__r->_M_refdata(), __beg, __end); }
 catch(...)
   {
     __r->_M_destroy(__a);
     throw;
   }
 __r->_M_set_length_and_sharable(__dnew);
 return __r->_M_refdata();
      }

  template<typename _CharT, typename _Traits, typename _Alloc>
    _CharT*
    basic_string<_CharT, _Traits, _Alloc>::
    _S_construct(size_type __n, _CharT __c, const _Alloc& __a)
    {

      if (__n == 0 && __a == _Alloc())
 return _S_empty_rep()._M_refdata();


      _Rep* __r = _Rep::_S_create(__n, size_type(0), __a);
      if (__n)
 _M_assign(__r->_M_refdata(), __n, __c);

      __r->_M_set_length_and_sharable(__n);
      return __r->_M_refdata();
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    basic_string<_CharT, _Traits, _Alloc>::
    basic_string(const basic_string& __str)
    : _M_dataplus(__str._M_rep()->_M_grab(_Alloc(__str.get_allocator()),
       __str.get_allocator()),
    __str.get_allocator())
    { }

  template<typename _CharT, typename _Traits, typename _Alloc>
    basic_string<_CharT, _Traits, _Alloc>::
    basic_string(const _Alloc& __a)
    : _M_dataplus(_S_construct(size_type(), _CharT(), __a), __a)
    { }

  template<typename _CharT, typename _Traits, typename _Alloc>
    basic_string<_CharT, _Traits, _Alloc>::
    basic_string(const basic_string& __str, size_type __pos, size_type __n)
    : _M_dataplus(_S_construct(__str._M_data()
          + __str._M_check(__pos,
      "basic_string::basic_string"),
          __str._M_data() + __str._M_limit(__pos, __n)
          + __pos, _Alloc()), _Alloc())
    { }

  template<typename _CharT, typename _Traits, typename _Alloc>
    basic_string<_CharT, _Traits, _Alloc>::
    basic_string(const basic_string& __str, size_type __pos,
   size_type __n, const _Alloc& __a)
    : _M_dataplus(_S_construct(__str._M_data()
          + __str._M_check(__pos,
      "basic_string::basic_string"),
          __str._M_data() + __str._M_limit(__pos, __n)
          + __pos, __a), __a)
    { }


  template<typename _CharT, typename _Traits, typename _Alloc>
    basic_string<_CharT, _Traits, _Alloc>::
    basic_string(const _CharT* __s, size_type __n, const _Alloc& __a)
    : _M_dataplus(_S_construct(__s, __s + __n, __a), __a)
    { }


  template<typename _CharT, typename _Traits, typename _Alloc>
    basic_string<_CharT, _Traits, _Alloc>::
    basic_string(const _CharT* __s, const _Alloc& __a)
    : _M_dataplus(_S_construct(__s, __s ? __s + traits_type::length(__s) :
          __s + npos, __a), __a)
    { }

  template<typename _CharT, typename _Traits, typename _Alloc>
    basic_string<_CharT, _Traits, _Alloc>::
    basic_string(size_type __n, _CharT __c, const _Alloc& __a)
    : _M_dataplus(_S_construct(__n, __c, __a), __a)
    { }


  template<typename _CharT, typename _Traits, typename _Alloc>
    template<typename _InputIterator>
    basic_string<_CharT, _Traits, _Alloc>::
    basic_string(_InputIterator __beg, _InputIterator __end, const _Alloc& __a)
    : _M_dataplus(_S_construct(__beg, __end, __a), __a)
    { }
# 240 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.tcc" 3
  template<typename _CharT, typename _Traits, typename _Alloc>
    basic_string<_CharT, _Traits, _Alloc>&
    basic_string<_CharT, _Traits, _Alloc>::
    assign(const basic_string& __str)
    {
      if (_M_rep() != __str._M_rep())
 {

   const allocator_type __a = this->get_allocator();
   _CharT* __tmp = __str._M_rep()->_M_grab(__a, __str.get_allocator());
   _M_rep()->_M_dispose(__a);
   _M_data(__tmp);
 }
      return *this;
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    basic_string<_CharT, _Traits, _Alloc>&
    basic_string<_CharT, _Traits, _Alloc>::
    assign(const _CharT* __s, size_type __n)
    {
      ;
      _M_check_length(this->size(), __n, "basic_string::assign");
      if (_M_disjunct(__s) || _M_rep()->_M_is_shared())
 return _M_replace_safe(size_type(0), this->size(), __s, __n);
      else
 {

   const size_type __pos = __s - _M_data();
   if (__pos >= __n)
     _M_copy(_M_data(), __s, __n);
   else if (__pos)
     _M_move(_M_data(), __s, __n);
   _M_rep()->_M_set_length_and_sharable(__n);
   return *this;
 }
     }

  template<typename _CharT, typename _Traits, typename _Alloc>
    basic_string<_CharT, _Traits, _Alloc>&
    basic_string<_CharT, _Traits, _Alloc>::
    append(size_type __n, _CharT __c)
    {
      if (__n)
 {
   _M_check_length(size_type(0), __n, "basic_string::append");
   const size_type __len = __n + this->size();
   if (__len > this->capacity() || _M_rep()->_M_is_shared())
     this->reserve(__len);
   _M_assign(_M_data() + this->size(), __n, __c);
   _M_rep()->_M_set_length_and_sharable(__len);
 }
      return *this;
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    basic_string<_CharT, _Traits, _Alloc>&
    basic_string<_CharT, _Traits, _Alloc>::
    append(const _CharT* __s, size_type __n)
    {
      ;
      if (__n)
 {
   _M_check_length(size_type(0), __n, "basic_string::append");
   const size_type __len = __n + this->size();
   if (__len > this->capacity() || _M_rep()->_M_is_shared())
     {
       if (_M_disjunct(__s))
  this->reserve(__len);
       else
  {
    const size_type __off = __s - _M_data();
    this->reserve(__len);
    __s = _M_data() + __off;
  }
     }
   _M_copy(_M_data() + this->size(), __s, __n);
   _M_rep()->_M_set_length_and_sharable(__len);
 }
      return *this;
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    basic_string<_CharT, _Traits, _Alloc>&
    basic_string<_CharT, _Traits, _Alloc>::
    append(const basic_string& __str)
    {
      const size_type __size = __str.size();
      if (__size)
 {
   const size_type __len = __size + this->size();
   if (__len > this->capacity() || _M_rep()->_M_is_shared())
     this->reserve(__len);
   _M_copy(_M_data() + this->size(), __str._M_data(), __size);
   _M_rep()->_M_set_length_and_sharable(__len);
 }
      return *this;
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    basic_string<_CharT, _Traits, _Alloc>&
    basic_string<_CharT, _Traits, _Alloc>::
    append(const basic_string& __str, size_type __pos, size_type __n)
    {
      __str._M_check(__pos, "basic_string::append");
      __n = __str._M_limit(__pos, __n);
      if (__n)
 {
   const size_type __len = __n + this->size();
   if (__len > this->capacity() || _M_rep()->_M_is_shared())
     this->reserve(__len);
   _M_copy(_M_data() + this->size(), __str._M_data() + __pos, __n);
   _M_rep()->_M_set_length_and_sharable(__len);
 }
      return *this;
    }

   template<typename _CharT, typename _Traits, typename _Alloc>
     basic_string<_CharT, _Traits, _Alloc>&
     basic_string<_CharT, _Traits, _Alloc>::
     insert(size_type __pos, const _CharT* __s, size_type __n)
     {
       ;
       _M_check(__pos, "basic_string::insert");
       _M_check_length(size_type(0), __n, "basic_string::insert");
       if (_M_disjunct(__s) || _M_rep()->_M_is_shared())
         return _M_replace_safe(__pos, size_type(0), __s, __n);
       else
         {

           const size_type __off = __s - _M_data();
           _M_mutate(__pos, 0, __n);
           __s = _M_data() + __off;
           _CharT* __p = _M_data() + __pos;
           if (__s + __n <= __p)
             _M_copy(__p, __s, __n);
           else if (__s >= __p)
             _M_copy(__p, __s + __n, __n);
           else
             {
        const size_type __nleft = __p - __s;
               _M_copy(__p, __s, __nleft);
               _M_copy(__p + __nleft, __p + __n, __n - __nleft);
             }
           return *this;
         }
     }

   template<typename _CharT, typename _Traits, typename _Alloc>
     typename basic_string<_CharT, _Traits, _Alloc>::iterator
     basic_string<_CharT, _Traits, _Alloc>::
     erase(iterator __first, iterator __last)
     {
      
                           ;




       const size_type __size = __last - __first;
       if (__size)
  {
    const size_type __pos = __first - _M_ibegin();
    _M_mutate(__pos, __size, size_type(0));
    _M_rep()->_M_set_leaked();
    return iterator(_M_data() + __pos);
  }
       else
  return __first;
     }

   template<typename _CharT, typename _Traits, typename _Alloc>
     basic_string<_CharT, _Traits, _Alloc>&
     basic_string<_CharT, _Traits, _Alloc>::
     replace(size_type __pos, size_type __n1, const _CharT* __s,
      size_type __n2)
     {
       ;
       _M_check(__pos, "basic_string::replace");
       __n1 = _M_limit(__pos, __n1);
       _M_check_length(__n1, __n2, "basic_string::replace");
       bool __left;
       if (_M_disjunct(__s) || _M_rep()->_M_is_shared())
         return _M_replace_safe(__pos, __n1, __s, __n2);
       else if ((__left = __s + __n2 <= _M_data() + __pos)
  || _M_data() + __pos + __n1 <= __s)
  {

    size_type __off = __s - _M_data();
    __left ? __off : (__off += __n2 - __n1);
    _M_mutate(__pos, __n1, __n2);
    _M_copy(_M_data() + __pos, _M_data() + __off, __n2);
    return *this;
  }
       else
  {

    const basic_string __tmp(__s, __n2);
    return _M_replace_safe(__pos, __n1, __tmp._M_data(), __n2);
  }
     }

  template<typename _CharT, typename _Traits, typename _Alloc>
    void
    basic_string<_CharT, _Traits, _Alloc>::_Rep::
    _M_destroy(const _Alloc& __a) throw ()
    {
      const size_type __size = sizeof(_Rep_base) +
                        (this->_M_capacity + 1) * sizeof(_CharT);
      _Raw_bytes_alloc(__a).deallocate(reinterpret_cast<char*>(this), __size);
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    void
    basic_string<_CharT, _Traits, _Alloc>::
    _M_leak_hard()
    {

      if (_M_rep() == &_S_empty_rep())
 return;

      if (_M_rep()->_M_is_shared())
 _M_mutate(0, 0, 0);
      _M_rep()->_M_set_leaked();
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    void
    basic_string<_CharT, _Traits, _Alloc>::
    _M_mutate(size_type __pos, size_type __len1, size_type __len2)
    {
      const size_type __old_size = this->size();
      const size_type __new_size = __old_size + __len2 - __len1;
      const size_type __how_much = __old_size - __pos - __len1;

      if (__new_size > this->capacity() || _M_rep()->_M_is_shared())
 {

   const allocator_type __a = get_allocator();
   _Rep* __r = _Rep::_S_create(__new_size, this->capacity(), __a);

   if (__pos)
     _M_copy(__r->_M_refdata(), _M_data(), __pos);
   if (__how_much)
     _M_copy(__r->_M_refdata() + __pos + __len2,
      _M_data() + __pos + __len1, __how_much);

   _M_rep()->_M_dispose(__a);
   _M_data(__r->_M_refdata());
 }
      else if (__how_much && __len1 != __len2)
 {

   _M_move(_M_data() + __pos + __len2,
    _M_data() + __pos + __len1, __how_much);
 }
      _M_rep()->_M_set_length_and_sharable(__new_size);
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    void
    basic_string<_CharT, _Traits, _Alloc>::
    reserve(size_type __res)
    {
      if (__res != this->capacity() || _M_rep()->_M_is_shared())
        {

   if (__res < this->size())
     __res = this->size();
   const allocator_type __a = get_allocator();
   _CharT* __tmp = _M_rep()->_M_clone(__a, __res - this->size());
   _M_rep()->_M_dispose(__a);
   _M_data(__tmp);
        }
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    void
    basic_string<_CharT, _Traits, _Alloc>::
    swap(basic_string& __s)
    {
      if (_M_rep()->_M_is_leaked())
 _M_rep()->_M_set_sharable();
      if (__s._M_rep()->_M_is_leaked())
 __s._M_rep()->_M_set_sharable();
      if (this->get_allocator() == __s.get_allocator())
 {
   _CharT* __tmp = _M_data();
   _M_data(__s._M_data());
   __s._M_data(__tmp);
 }

      else
 {
   const basic_string __tmp1(_M_ibegin(), _M_iend(),
        __s.get_allocator());
   const basic_string __tmp2(__s._M_ibegin(), __s._M_iend(),
        this->get_allocator());
   *this = __tmp2;
   __s = __tmp1;
 }
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    typename basic_string<_CharT, _Traits, _Alloc>::_Rep*
    basic_string<_CharT, _Traits, _Alloc>::_Rep::
    _S_create(size_type __capacity, size_type __old_capacity,
       const _Alloc& __alloc)
    {


      if (__capacity > _S_max_size)
 __throw_length_error(("basic_string::_S_create"));
# 577 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_string.tcc" 3
      const size_type __pagesize = 4096;
      const size_type __malloc_header_size = 4 * sizeof(void*);







      if (__capacity > __old_capacity && __capacity < 2 * __old_capacity)
 __capacity = 2 * __old_capacity;




      size_type __size = (__capacity + 1) * sizeof(_CharT) + sizeof(_Rep);

      const size_type __adj_size = __size + __malloc_header_size;
      if (__adj_size > __pagesize && __capacity > __old_capacity)
 {
   const size_type __extra = __pagesize - __adj_size % __pagesize;
   __capacity += __extra / sizeof(_CharT);

   if (__capacity > _S_max_size)
     __capacity = _S_max_size;
   __size = (__capacity + 1) * sizeof(_CharT) + sizeof(_Rep);
 }



      void* __place = _Raw_bytes_alloc(__alloc).allocate(__size);
      _Rep *__p = new (__place) _Rep;
      __p->_M_capacity = __capacity;







      __p->_M_set_sharable();
      return __p;
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    _CharT*
    basic_string<_CharT, _Traits, _Alloc>::_Rep::
    _M_clone(const _Alloc& __alloc, size_type __res)
    {

      const size_type __requested_cap = this->_M_length + __res;
      _Rep* __r = _Rep::_S_create(__requested_cap, this->_M_capacity,
      __alloc);
      if (this->_M_length)
 _M_copy(__r->_M_refdata(), _M_refdata(), this->_M_length);

      __r->_M_set_length_and_sharable(this->_M_length);
      return __r->_M_refdata();
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    void
    basic_string<_CharT, _Traits, _Alloc>::
    resize(size_type __n, _CharT __c)
    {
      const size_type __size = this->size();
      _M_check_length(__size, __n, "basic_string::resize");
      if (__size < __n)
 this->append(__n - __size, __c);
      else if (__n < __size)
 this->erase(__n);

    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    template<typename _InputIterator>
      basic_string<_CharT, _Traits, _Alloc>&
      basic_string<_CharT, _Traits, _Alloc>::
      _M_replace_dispatch(iterator __i1, iterator __i2, _InputIterator __k1,
     _InputIterator __k2, __false_type)
      {
 const basic_string __s(__k1, __k2);
 const size_type __n1 = __i2 - __i1;
 _M_check_length(__n1, __s.size(), "basic_string::_M_replace_dispatch");
 return _M_replace_safe(__i1 - _M_ibegin(), __n1, __s._M_data(),
          __s.size());
      }

  template<typename _CharT, typename _Traits, typename _Alloc>
    basic_string<_CharT, _Traits, _Alloc>&
    basic_string<_CharT, _Traits, _Alloc>::
    _M_replace_aux(size_type __pos1, size_type __n1, size_type __n2,
     _CharT __c)
    {
      _M_check_length(__n1, __n2, "basic_string::_M_replace_aux");
      _M_mutate(__pos1, __n1, __n2);
      if (__n2)
 _M_assign(_M_data() + __pos1, __n2, __c);
      return *this;
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    basic_string<_CharT, _Traits, _Alloc>&
    basic_string<_CharT, _Traits, _Alloc>::
    _M_replace_safe(size_type __pos1, size_type __n1, const _CharT* __s,
      size_type __n2)
    {
      _M_mutate(__pos1, __n1, __n2);
      if (__n2)
 _M_copy(_M_data() + __pos1, __s, __n2);
      return *this;
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    basic_string<_CharT, _Traits, _Alloc>
    operator+(const _CharT* __lhs,
       const basic_string<_CharT, _Traits, _Alloc>& __rhs)
    {
      ;
      typedef basic_string<_CharT, _Traits, _Alloc> __string_type;
      typedef typename __string_type::size_type __size_type;
      const __size_type __len = _Traits::length(__lhs);
      __string_type __str;
      __str.reserve(__len + __rhs.size());
      __str.append(__lhs, __len);
      __str.append(__rhs);
      return __str;
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    basic_string<_CharT, _Traits, _Alloc>
    operator+(_CharT __lhs, const basic_string<_CharT, _Traits, _Alloc>& __rhs)
    {
      typedef basic_string<_CharT, _Traits, _Alloc> __string_type;
      typedef typename __string_type::size_type __size_type;
      __string_type __str;
      const __size_type __len = __rhs.size();
      __str.reserve(__len + 1);
      __str.append(__size_type(1), __lhs);
      __str.append(__rhs);
      return __str;
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    typename basic_string<_CharT, _Traits, _Alloc>::size_type
    basic_string<_CharT, _Traits, _Alloc>::
    copy(_CharT* __s, size_type __n, size_type __pos) const
    {
      _M_check(__pos, "basic_string::copy");
      __n = _M_limit(__pos, __n);
      ;
      if (__n)
 _M_copy(__s, _M_data() + __pos, __n);

      return __n;
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    typename basic_string<_CharT, _Traits, _Alloc>::size_type
    basic_string<_CharT, _Traits, _Alloc>::
    find(const _CharT* __s, size_type __pos, size_type __n) const
    {
      ;
      const size_type __size = this->size();
      const _CharT* __data = _M_data();

      if (__n == 0)
 return __pos <= __size ? __pos : npos;

      if (__n <= __size)
 {
   for (; __pos <= __size - __n; ++__pos)
     if (traits_type::eq(__data[__pos], __s[0])
  && traits_type::compare(__data + __pos + 1,
     __s + 1, __n - 1) == 0)
       return __pos;
 }
      return npos;
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    typename basic_string<_CharT, _Traits, _Alloc>::size_type
    basic_string<_CharT, _Traits, _Alloc>::
    find(_CharT __c, size_type __pos) const
    {
      size_type __ret = npos;
      const size_type __size = this->size();
      if (__pos < __size)
 {
   const _CharT* __data = _M_data();
   const size_type __n = __size - __pos;
   const _CharT* __p = traits_type::find(__data + __pos, __n, __c);
   if (__p)
     __ret = __p - __data;
 }
      return __ret;
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    typename basic_string<_CharT, _Traits, _Alloc>::size_type
    basic_string<_CharT, _Traits, _Alloc>::
    rfind(const _CharT* __s, size_type __pos, size_type __n) const
    {
      ;
      const size_type __size = this->size();
      if (__n <= __size)
 {
   __pos = std::min(size_type(__size - __n), __pos);
   const _CharT* __data = _M_data();
   do
     {
       if (traits_type::compare(__data + __pos, __s, __n) == 0)
  return __pos;
     }
   while (__pos-- > 0);
 }
      return npos;
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    typename basic_string<_CharT, _Traits, _Alloc>::size_type
    basic_string<_CharT, _Traits, _Alloc>::
    rfind(_CharT __c, size_type __pos) const
    {
      size_type __size = this->size();
      if (__size)
 {
   if (--__size > __pos)
     __size = __pos;
   for (++__size; __size-- > 0; )
     if (traits_type::eq(_M_data()[__size], __c))
       return __size;
 }
      return npos;
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    typename basic_string<_CharT, _Traits, _Alloc>::size_type
    basic_string<_CharT, _Traits, _Alloc>::
    find_first_of(const _CharT* __s, size_type __pos, size_type __n) const
    {
      ;
      for (; __n && __pos < this->size(); ++__pos)
 {
   const _CharT* __p = traits_type::find(__s, __n, _M_data()[__pos]);
   if (__p)
     return __pos;
 }
      return npos;
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    typename basic_string<_CharT, _Traits, _Alloc>::size_type
    basic_string<_CharT, _Traits, _Alloc>::
    find_last_of(const _CharT* __s, size_type __pos, size_type __n) const
    {
      ;
      size_type __size = this->size();
      if (__size && __n)
 {
   if (--__size > __pos)
     __size = __pos;
   do
     {
       if (traits_type::find(__s, __n, _M_data()[__size]))
  return __size;
     }
   while (__size-- != 0);
 }
      return npos;
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    typename basic_string<_CharT, _Traits, _Alloc>::size_type
    basic_string<_CharT, _Traits, _Alloc>::
    find_first_not_of(const _CharT* __s, size_type __pos, size_type __n) const
    {
      ;
      for (; __pos < this->size(); ++__pos)
 if (!traits_type::find(__s, __n, _M_data()[__pos]))
   return __pos;
      return npos;
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    typename basic_string<_CharT, _Traits, _Alloc>::size_type
    basic_string<_CharT, _Traits, _Alloc>::
    find_first_not_of(_CharT __c, size_type __pos) const
    {
      for (; __pos < this->size(); ++__pos)
 if (!traits_type::eq(_M_data()[__pos], __c))
   return __pos;
      return npos;
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    typename basic_string<_CharT, _Traits, _Alloc>::size_type
    basic_string<_CharT, _Traits, _Alloc>::
    find_last_not_of(const _CharT* __s, size_type __pos, size_type __n) const
    {
      ;
      size_type __size = this->size();
      if (__size)
 {
   if (--__size > __pos)
     __size = __pos;
   do
     {
       if (!traits_type::find(__s, __n, _M_data()[__size]))
  return __size;
     }
   while (__size--);
 }
      return npos;
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    typename basic_string<_CharT, _Traits, _Alloc>::size_type
    basic_string<_CharT, _Traits, _Alloc>::
    find_last_not_of(_CharT __c, size_type __pos) const
    {
      size_type __size = this->size();
      if (__size)
 {
   if (--__size > __pos)
     __size = __pos;
   do
     {
       if (!traits_type::eq(_M_data()[__size], __c))
  return __size;
     }
   while (__size--);
 }
      return npos;
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    int
    basic_string<_CharT, _Traits, _Alloc>::
    compare(size_type __pos, size_type __n, const basic_string& __str) const
    {
      _M_check(__pos, "basic_string::compare");
      __n = _M_limit(__pos, __n);
      const size_type __osize = __str.size();
      const size_type __len = std::min(__n, __osize);
      int __r = traits_type::compare(_M_data() + __pos, __str.data(), __len);
      if (!__r)
 __r = _S_compare(__n, __osize);
      return __r;
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    int
    basic_string<_CharT, _Traits, _Alloc>::
    compare(size_type __pos1, size_type __n1, const basic_string& __str,
     size_type __pos2, size_type __n2) const
    {
      _M_check(__pos1, "basic_string::compare");
      __str._M_check(__pos2, "basic_string::compare");
      __n1 = _M_limit(__pos1, __n1);
      __n2 = __str._M_limit(__pos2, __n2);
      const size_type __len = std::min(__n1, __n2);
      int __r = traits_type::compare(_M_data() + __pos1,
         __str.data() + __pos2, __len);
      if (!__r)
 __r = _S_compare(__n1, __n2);
      return __r;
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    int
    basic_string<_CharT, _Traits, _Alloc>::
    compare(const _CharT* __s) const
    {
      ;
      const size_type __size = this->size();
      const size_type __osize = traits_type::length(__s);
      const size_type __len = std::min(__size, __osize);
      int __r = traits_type::compare(_M_data(), __s, __len);
      if (!__r)
 __r = _S_compare(__size, __osize);
      return __r;
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    int
    basic_string <_CharT, _Traits, _Alloc>::
    compare(size_type __pos, size_type __n1, const _CharT* __s) const
    {
      ;
      _M_check(__pos, "basic_string::compare");
      __n1 = _M_limit(__pos, __n1);
      const size_type __osize = traits_type::length(__s);
      const size_type __len = std::min(__n1, __osize);
      int __r = traits_type::compare(_M_data() + __pos, __s, __len);
      if (!__r)
 __r = _S_compare(__n1, __osize);
      return __r;
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    int
    basic_string <_CharT, _Traits, _Alloc>::
    compare(size_type __pos, size_type __n1, const _CharT* __s,
     size_type __n2) const
    {
      ;
      _M_check(__pos, "basic_string::compare");
      __n1 = _M_limit(__pos, __n1);
      const size_type __len = std::min(__n1, __n2);
      int __r = traits_type::compare(_M_data() + __pos, __s, __len);
      if (!__r)
 __r = _S_compare(__n1, __n2);
      return __r;
    }


  template<typename _CharT, typename _Traits, typename _Alloc>
    basic_istream<_CharT, _Traits>&
    operator>>(basic_istream<_CharT, _Traits>& __in,
        basic_string<_CharT, _Traits, _Alloc>& __str)
    {
      typedef basic_istream<_CharT, _Traits> __istream_type;
      typedef basic_string<_CharT, _Traits, _Alloc> __string_type;
      typedef typename __istream_type::ios_base __ios_base;
      typedef typename __istream_type::int_type __int_type;
      typedef typename __string_type::size_type __size_type;
      typedef ctype<_CharT> __ctype_type;
      typedef typename __ctype_type::ctype_base __ctype_base;

      __size_type __extracted = 0;
      typename __ios_base::iostate __err = __ios_base::goodbit;
      typename __istream_type::sentry __cerb(__in, false);
      if (__cerb)
 {
   try
     {

       __str.erase();
       _CharT __buf[128];
       __size_type __len = 0;
       const streamsize __w = __in.width();
       const __size_type __n = __w > 0 ? static_cast<__size_type>(__w)
                                : __str.max_size();
       const __ctype_type& __ct = use_facet<__ctype_type>(__in.getloc());
       const __int_type __eof = _Traits::eof();
       __int_type __c = __in.rdbuf()->sgetc();

       while (__extracted < __n
       && !_Traits::eq_int_type(__c, __eof)
       && !__ct.is(__ctype_base::space,
     _Traits::to_char_type(__c)))
  {
    if (__len == sizeof(__buf) / sizeof(_CharT))
      {
        __str.append(__buf, sizeof(__buf) / sizeof(_CharT));
        __len = 0;
      }
    __buf[__len++] = _Traits::to_char_type(__c);
    ++__extracted;
    __c = __in.rdbuf()->snextc();
  }
       __str.append(__buf, __len);

       if (_Traits::eq_int_type(__c, __eof))
  __err |= __ios_base::eofbit;
       __in.width(0);
     }
   catch(__cxxabiv1::__forced_unwind&)
     {
       __in._M_setstate(__ios_base::badbit);
       throw;
     }
   catch(...)
     {



       __in._M_setstate(__ios_base::badbit);
     }
 }

      if (!__extracted)
 __err |= __ios_base::failbit;
      if (__err)
 __in.setstate(__err);
      return __in;
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    basic_istream<_CharT, _Traits>&
    getline(basic_istream<_CharT, _Traits>& __in,
     basic_string<_CharT, _Traits, _Alloc>& __str, _CharT __delim)
    {
      typedef basic_istream<_CharT, _Traits> __istream_type;
      typedef basic_string<_CharT, _Traits, _Alloc> __string_type;
      typedef typename __istream_type::ios_base __ios_base;
      typedef typename __istream_type::int_type __int_type;
      typedef typename __string_type::size_type __size_type;

      __size_type __extracted = 0;
      const __size_type __n = __str.max_size();
      typename __ios_base::iostate __err = __ios_base::goodbit;
      typename __istream_type::sentry __cerb(__in, true);
      if (__cerb)
 {
   try
     {
       __str.erase();
       const __int_type __idelim = _Traits::to_int_type(__delim);
       const __int_type __eof = _Traits::eof();
       __int_type __c = __in.rdbuf()->sgetc();

       while (__extracted < __n
       && !_Traits::eq_int_type(__c, __eof)
       && !_Traits::eq_int_type(__c, __idelim))
  {
    __str += _Traits::to_char_type(__c);
    ++__extracted;
    __c = __in.rdbuf()->snextc();
  }

       if (_Traits::eq_int_type(__c, __eof))
  __err |= __ios_base::eofbit;
       else if (_Traits::eq_int_type(__c, __idelim))
  {
    ++__extracted;
    __in.rdbuf()->sbumpc();
  }
       else
  __err |= __ios_base::failbit;
     }
   catch(__cxxabiv1::__forced_unwind&)
     {
       __in._M_setstate(__ios_base::badbit);
       throw;
     }
   catch(...)
     {



       __in._M_setstate(__ios_base::badbit);
     }
 }
      if (!__extracted)
 __err |= __ios_base::failbit;
      if (__err)
 __in.setstate(__err);
      return __in;
    }




  extern template class basic_string<char>;
  extern template
    basic_istream<char>&
    operator>>(basic_istream<char>&, string&);
  extern template
    basic_ostream<char>&
    operator<<(basic_ostream<char>&, const string&);
  extern template
    basic_istream<char>&
    getline(basic_istream<char>&, string&, char);
  extern template
    basic_istream<char>&
    getline(basic_istream<char>&, string&);


  extern template class basic_string<wchar_t>;
  extern template
    basic_istream<wchar_t>&
    operator>>(basic_istream<wchar_t>&, wstring&);
  extern template
    basic_ostream<wchar_t>&
    operator<<(basic_ostream<wchar_t>&, const wstring&);
  extern template
    basic_istream<wchar_t>&
    getline(basic_istream<wchar_t>&, wstring&, wchar_t);
  extern template
    basic_istream<wchar_t>&
    getline(basic_istream<wchar_t>&, wstring&);




}
# 54 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/string" 2 3
# 41 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_classes.h" 2 3


namespace std __attribute__ ((__visibility__ ("default")))
{

# 62 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_classes.h" 3
  class locale
  {
  public:


    typedef int category;


    class facet;
    class id;
    class _Impl;

    friend class facet;
    friend class _Impl;

    template<typename _Facet>
      friend bool
      has_facet(const locale&) throw();

    template<typename _Facet>
      friend const _Facet&
      use_facet(const locale&);

    template<typename _Cache>
      friend struct __use_cache;
# 98 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_classes.h" 3
    static const category none = 0;
    static const category ctype = 1L << 0;
    static const category numeric = 1L << 1;
    static const category collate = 1L << 2;
    static const category time = 1L << 3;
    static const category monetary = 1L << 4;
    static const category messages = 1L << 5;
    static const category all = (ctype | numeric | collate |
        time | monetary | messages);
# 117 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_classes.h" 3
    locale() throw();
# 126 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_classes.h" 3
    locale(const locale& __other) throw();
# 136 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_classes.h" 3
    explicit
    locale(const char* __s);
# 151 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_classes.h" 3
    locale(const locale& __base, const char* __s, category __cat);
# 164 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_classes.h" 3
    locale(const locale& __base, const locale& __add, category __cat);
# 177 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_classes.h" 3
    template<typename _Facet>
      locale(const locale& __other, _Facet* __f);


    ~locale() throw();
# 191 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_classes.h" 3
    const locale&
    operator=(const locale& __other) throw();
# 206 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_classes.h" 3
    template<typename _Facet>
      locale
      combine(const locale& __other) const;






    string
    name() const;
# 225 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_classes.h" 3
    bool
    operator==(const locale& __other) const throw();







    bool
    operator!=(const locale& __other) const throw()
    { return !(this->operator==(__other)); }
# 253 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_classes.h" 3
    template<typename _Char, typename _Traits, typename _Alloc>
      bool
      operator()(const basic_string<_Char, _Traits, _Alloc>& __s1,
   const basic_string<_Char, _Traits, _Alloc>& __s2) const;
# 269 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_classes.h" 3
    static locale
    global(const locale& __loc);




    static const locale&
    classic();

  private:

    _Impl* _M_impl;


    static _Impl* _S_classic;


    static _Impl* _S_global;





    static const char* const* const _S_categories;
# 304 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_classes.h" 3
    enum { _S_categories_size = 6 + 6 };


    static __gthread_once_t _S_once;


    explicit
    locale(_Impl*) throw();

    static void
    _S_initialize();

    static void
    _S_initialize_once() throw();

    static category
    _S_normalize_category(category);

    void
    _M_coalesce(const locale& __base, const locale& __add, category __cat);
  };
# 338 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_classes.h" 3
  class locale::facet
  {
  private:
    friend class locale;
    friend class locale::_Impl;

    mutable _Atomic_word _M_refcount;


    static __c_locale _S_c_locale;


    static const char _S_c_name[2];


    static __gthread_once_t _S_once;


    static void
    _S_initialize_once();

  protected:
# 369 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_classes.h" 3
    explicit
    facet(size_t __refs = 0) throw() : _M_refcount(__refs ? 1 : 0)
    { }


    virtual
    ~facet();

    static void
    _S_create_c_locale(__c_locale& __cloc, const char* __s,
         __c_locale __old = 0);

    static __c_locale
    _S_clone_c_locale(__c_locale& __cloc) throw();

    static void
    _S_destroy_c_locale(__c_locale& __cloc);

    static __c_locale
    _S_lc_ctype_c_locale(__c_locale __cloc, const char* __s);



    static __c_locale
    _S_get_c_locale();

    __attribute__ ((__const__)) static const char*
    _S_get_c_name() throw();

  private:
    void
    _M_add_reference() const throw()
    { __gnu_cxx::__atomic_add_dispatch(&_M_refcount, 1); }

    void
    _M_remove_reference() const throw()
    {

      ;
      if (__gnu_cxx::__exchange_and_add_dispatch(&_M_refcount, -1) == 1)
 {
          ;
   try
     { delete this; }
   catch(...)
     { }
 }
    }

    facet(const facet&);

    facet&
    operator=(const facet&);
  };
# 436 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_classes.h" 3
  class locale::id
  {
  private:
    friend class locale;
    friend class locale::_Impl;

    template<typename _Facet>
      friend const _Facet&
      use_facet(const locale&);

    template<typename _Facet>
      friend bool
      has_facet(const locale&) throw();




    mutable size_t _M_index;


    static _Atomic_word _S_refcount;

    void
    operator=(const id&);

    id(const id&);

  public:



    id() { }

    size_t
    _M_id() const throw();
  };



  class locale::_Impl
  {
  public:

    friend class locale;
    friend class locale::facet;

    template<typename _Facet>
      friend bool
      has_facet(const locale&) throw();

    template<typename _Facet>
      friend const _Facet&
      use_facet(const locale&);

    template<typename _Cache>
      friend struct __use_cache;

  private:

    _Atomic_word _M_refcount;
    const facet** _M_facets;
    size_t _M_facets_size;
    const facet** _M_caches;
    char** _M_names;
    static const locale::id* const _S_id_ctype[];
    static const locale::id* const _S_id_numeric[];
    static const locale::id* const _S_id_collate[];
    static const locale::id* const _S_id_time[];
    static const locale::id* const _S_id_monetary[];
    static const locale::id* const _S_id_messages[];
    static const locale::id* const* const _S_facet_categories[];

    void
    _M_add_reference() throw()
    { __gnu_cxx::__atomic_add_dispatch(&_M_refcount, 1); }

    void
    _M_remove_reference() throw()
    {

      ;
      if (__gnu_cxx::__exchange_and_add_dispatch(&_M_refcount, -1) == 1)
 {
          ;
   try
     { delete this; }
   catch(...)
     { }
 }
    }

    _Impl(const _Impl&, size_t);
    _Impl(const char*, size_t);
    _Impl(size_t) throw();

   ~_Impl() throw();

    _Impl(const _Impl&);

    void
    operator=(const _Impl&);

    bool
    _M_check_same_name()
    {
      bool __ret = true;
      if (_M_names[1])

 for (size_t __i = 0; __ret && __i < _S_categories_size - 1; ++__i)
   __ret = __builtin_strcmp(_M_names[__i], _M_names[__i + 1]) == 0;
      return __ret;
    }

    void
    _M_replace_categories(const _Impl*, category);

    void
    _M_replace_category(const _Impl*, const locale::id* const*);

    void
    _M_replace_facet(const _Impl*, const locale::id*);

    void
    _M_install_facet(const locale::id*, const facet*);

    template<typename _Facet>
      void
      _M_init_facet(_Facet* __facet)
      { _M_install_facet(&_Facet::id, __facet); }

    void
    _M_install_cache(const facet*, size_t);
  };
# 583 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_classes.h" 3
  template<typename _CharT>
    class collate : public locale::facet
    {
    public:



      typedef _CharT char_type;
      typedef basic_string<_CharT> string_type;


    protected:


      __c_locale _M_c_locale_collate;

    public:

      static locale::id id;
# 610 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_classes.h" 3
      explicit
      collate(size_t __refs = 0)
      : facet(__refs), _M_c_locale_collate(_S_get_c_locale())
      { }
# 624 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_classes.h" 3
      explicit
      collate(__c_locale __cloc, size_t __refs = 0)
      : facet(__refs), _M_c_locale_collate(_S_clone_c_locale(__cloc))
      { }
# 641 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_classes.h" 3
      int
      compare(const _CharT* __lo1, const _CharT* __hi1,
       const _CharT* __lo2, const _CharT* __hi2) const
      { return this->do_compare(__lo1, __hi1, __lo2, __hi2); }
# 660 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_classes.h" 3
      string_type
      transform(const _CharT* __lo, const _CharT* __hi) const
      { return this->do_transform(__lo, __hi); }
# 674 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_classes.h" 3
      long
      hash(const _CharT* __lo, const _CharT* __hi) const
      { return this->do_hash(__lo, __hi); }


      int
      _M_compare(const _CharT*, const _CharT*) const throw();

      size_t
      _M_transform(_CharT*, const _CharT*, size_t) const throw();

  protected:

      virtual
      ~collate()
      { _S_destroy_c_locale(_M_c_locale_collate); }
# 703 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_classes.h" 3
      virtual int
      do_compare(const _CharT* __lo1, const _CharT* __hi1,
   const _CharT* __lo2, const _CharT* __hi2) const;
# 717 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_classes.h" 3
      virtual string_type
      do_transform(const _CharT* __lo, const _CharT* __hi) const;
# 730 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_classes.h" 3
      virtual long
      do_hash(const _CharT* __lo, const _CharT* __hi) const;
    };

  template<typename _CharT>
    locale::id collate<_CharT>::id;


  template<>
    int
    collate<char>::_M_compare(const char*, const char*) const throw();

  template<>
    size_t
    collate<char>::_M_transform(char*, const char*, size_t) const throw();


  template<>
    int
    collate<wchar_t>::_M_compare(const wchar_t*, const wchar_t*) const throw();

  template<>
    size_t
    collate<wchar_t>::_M_transform(wchar_t*, const wchar_t*, size_t) const throw();



  template<typename _CharT>
    class collate_byname : public collate<_CharT>
    {
    public:


      typedef _CharT char_type;
      typedef basic_string<_CharT> string_type;


      explicit
      collate_byname(const char* __s, size_t __refs = 0)
      : collate<_CharT>(__refs)
      {
 if (__builtin_strcmp(__s, "C") != 0
     && __builtin_strcmp(__s, "POSIX") != 0)
   {
     this->_S_destroy_c_locale(this->_M_c_locale_collate);
     this->_S_create_c_locale(this->_M_c_locale_collate, __s);
   }
      }

    protected:
      virtual
      ~collate_byname() { }
    };


}

# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_classes.tcc" 1 3
# 37 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_classes.tcc" 3
       
# 38 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_classes.tcc" 3

namespace std __attribute__ ((__visibility__ ("default")))
{


  template<typename _Facet>
    locale::
    locale(const locale& __other, _Facet* __f)
    {
      _M_impl = new _Impl(*__other._M_impl, 1);

      try
 { _M_impl->_M_install_facet(&_Facet::id, __f); }
      catch(...)
 {
   _M_impl->_M_remove_reference();
   throw;
 }
      delete [] _M_impl->_M_names[0];
      _M_impl->_M_names[0] = 0;
    }

  template<typename _Facet>
    locale
    locale::
    combine(const locale& __other) const
    {
      _Impl* __tmp = new _Impl(*_M_impl, 1);
      try
 {
   __tmp->_M_replace_facet(__other._M_impl, &_Facet::id);
 }
      catch(...)
 {
   __tmp->_M_remove_reference();
   throw;
 }
      return locale(__tmp);
    }

  template<typename _CharT, typename _Traits, typename _Alloc>
    bool
    locale::
    operator()(const basic_string<_CharT, _Traits, _Alloc>& __s1,
        const basic_string<_CharT, _Traits, _Alloc>& __s2) const
    {
      typedef std::collate<_CharT> __collate_type;
      const __collate_type& __collate = use_facet<__collate_type>(*this);
      return (__collate.compare(__s1.data(), __s1.data() + __s1.length(),
    __s2.data(), __s2.data() + __s2.length()) < 0);
    }
# 102 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_classes.tcc" 3
  template<typename _Facet>
    bool
    has_facet(const locale& __loc) throw()
    {
      const size_t __i = _Facet::id._M_id();
      const locale::facet** __facets = __loc._M_impl->_M_facets;
      return (__i < __loc._M_impl->_M_facets_size

       && dynamic_cast<const _Facet*>(__facets[__i]));



    }
# 130 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_classes.tcc" 3
  template<typename _Facet>
    const _Facet&
    use_facet(const locale& __loc)
    {
      const size_t __i = _Facet::id._M_id();
      const locale::facet** __facets = __loc._M_impl->_M_facets;
      if (__i >= __loc._M_impl->_M_facets_size || !__facets[__i])
        __throw_bad_cast();

      return dynamic_cast<const _Facet&>(*__facets[__i]);



    }



  template<typename _CharT>
    int
    collate<_CharT>::_M_compare(const _CharT*, const _CharT*) const throw ()
    { return 0; }


  template<typename _CharT>
    size_t
    collate<_CharT>::_M_transform(_CharT*, const _CharT*, size_t) const throw ()
    { return 0; }

  template<typename _CharT>
    int
    collate<_CharT>::
    do_compare(const _CharT* __lo1, const _CharT* __hi1,
        const _CharT* __lo2, const _CharT* __hi2) const
    {


      const string_type __one(__lo1, __hi1);
      const string_type __two(__lo2, __hi2);

      const _CharT* __p = __one.c_str();
      const _CharT* __pend = __one.data() + __one.length();
      const _CharT* __q = __two.c_str();
      const _CharT* __qend = __two.data() + __two.length();




      for (;;)
 {
   const int __res = _M_compare(__p, __q);
   if (__res)
     return __res;

   __p += char_traits<_CharT>::length(__p);
   __q += char_traits<_CharT>::length(__q);
   if (__p == __pend && __q == __qend)
     return 0;
   else if (__p == __pend)
     return -1;
   else if (__q == __qend)
     return 1;

   __p++;
   __q++;
 }
    }

  template<typename _CharT>
    typename collate<_CharT>::string_type
    collate<_CharT>::
    do_transform(const _CharT* __lo, const _CharT* __hi) const
    {
      string_type __ret;


      const string_type __str(__lo, __hi);

      const _CharT* __p = __str.c_str();
      const _CharT* __pend = __str.data() + __str.length();

      size_t __len = (__hi - __lo) * 2;

      _CharT* __c = new _CharT[__len];

      try
 {



   for (;;)
     {

       size_t __res = _M_transform(__c, __p, __len);


       if (__res >= __len)
  {
    __len = __res + 1;
    delete [] __c, __c = 0;
    __c = new _CharT[__len];
    __res = _M_transform(__c, __p, __len);
  }

       __ret.append(__c, __res);
       __p += char_traits<_CharT>::length(__p);
       if (__p == __pend)
  break;

       __p++;
       __ret.push_back(_CharT());
     }
 }
      catch(...)
 {
   delete [] __c;
   throw;
 }

      delete [] __c;

      return __ret;
    }

  template<typename _CharT>
    long
    collate<_CharT>::
    do_hash(const _CharT* __lo, const _CharT* __hi) const
    {
      unsigned long __val = 0;
      for (; __lo < __hi; ++__lo)
 __val =
   *__lo + ((__val << 7)
     | (__val >> (__gnu_cxx::__numeric_traits<unsigned long>::
    __digits - 7)));
      return static_cast<long>(__val);
    }




  extern template class collate<char>;
  extern template class collate_byname<char>;

  extern template
    const collate<char>&
    use_facet<collate<char> >(const locale&);

  extern template
    bool
    has_facet<collate<char> >(const locale&);


  extern template class collate<wchar_t>;
  extern template class collate_byname<wchar_t>;

  extern template
    const collate<wchar_t>&
    use_facet<collate<wchar_t> >(const locale&);

  extern template
    bool
    has_facet<collate<wchar_t> >(const locale&);




}
# 788 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_classes.h" 2 3
# 42 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/ios_base.h" 2 3

namespace std __attribute__ ((__visibility__ ("default")))
{






  enum _Ios_Fmtflags
    {
      _S_boolalpha = 1L << 0,
      _S_dec = 1L << 1,
      _S_fixed = 1L << 2,
      _S_hex = 1L << 3,
      _S_internal = 1L << 4,
      _S_left = 1L << 5,
      _S_oct = 1L << 6,
      _S_right = 1L << 7,
      _S_scientific = 1L << 8,
      _S_showbase = 1L << 9,
      _S_showpoint = 1L << 10,
      _S_showpos = 1L << 11,
      _S_skipws = 1L << 12,
      _S_unitbuf = 1L << 13,
      _S_uppercase = 1L << 14,
      _S_adjustfield = _S_left | _S_right | _S_internal,
      _S_basefield = _S_dec | _S_oct | _S_hex,
      _S_floatfield = _S_scientific | _S_fixed,
      _S_ios_fmtflags_end = 1L << 16
    };

  inline _Ios_Fmtflags
  operator&(_Ios_Fmtflags __a, _Ios_Fmtflags __b)
  { return _Ios_Fmtflags(static_cast<int>(__a) & static_cast<int>(__b)); }

  inline _Ios_Fmtflags
  operator|(_Ios_Fmtflags __a, _Ios_Fmtflags __b)
  { return _Ios_Fmtflags(static_cast<int>(__a) | static_cast<int>(__b)); }

  inline _Ios_Fmtflags
  operator^(_Ios_Fmtflags __a, _Ios_Fmtflags __b)
  { return _Ios_Fmtflags(static_cast<int>(__a) ^ static_cast<int>(__b)); }

  inline _Ios_Fmtflags
  operator~(_Ios_Fmtflags __a)
  { return _Ios_Fmtflags(~static_cast<int>(__a)); }

  inline const _Ios_Fmtflags&
  operator|=(_Ios_Fmtflags& __a, _Ios_Fmtflags __b)
  { return __a = __a | __b; }

  inline const _Ios_Fmtflags&
  operator&=(_Ios_Fmtflags& __a, _Ios_Fmtflags __b)
  { return __a = __a & __b; }

  inline const _Ios_Fmtflags&
  operator^=(_Ios_Fmtflags& __a, _Ios_Fmtflags __b)
  { return __a = __a ^ __b; }


  enum _Ios_Openmode
    {
      _S_app = 1L << 0,
      _S_ate = 1L << 1,
      _S_bin = 1L << 2,
      _S_in = 1L << 3,
      _S_out = 1L << 4,
      _S_trunc = 1L << 5,
      _S_ios_openmode_end = 1L << 16
    };

  inline _Ios_Openmode
  operator&(_Ios_Openmode __a, _Ios_Openmode __b)
  { return _Ios_Openmode(static_cast<int>(__a) & static_cast<int>(__b)); }

  inline _Ios_Openmode
  operator|(_Ios_Openmode __a, _Ios_Openmode __b)
  { return _Ios_Openmode(static_cast<int>(__a) | static_cast<int>(__b)); }

  inline _Ios_Openmode
  operator^(_Ios_Openmode __a, _Ios_Openmode __b)
  { return _Ios_Openmode(static_cast<int>(__a) ^ static_cast<int>(__b)); }

  inline _Ios_Openmode
  operator~(_Ios_Openmode __a)
  { return _Ios_Openmode(~static_cast<int>(__a)); }

  inline const _Ios_Openmode&
  operator|=(_Ios_Openmode& __a, _Ios_Openmode __b)
  { return __a = __a | __b; }

  inline const _Ios_Openmode&
  operator&=(_Ios_Openmode& __a, _Ios_Openmode __b)
  { return __a = __a & __b; }

  inline const _Ios_Openmode&
  operator^=(_Ios_Openmode& __a, _Ios_Openmode __b)
  { return __a = __a ^ __b; }


  enum _Ios_Iostate
    {
      _S_goodbit = 0,
      _S_badbit = 1L << 0,
      _S_eofbit = 1L << 1,
      _S_failbit = 1L << 2,
      _S_ios_iostate_end = 1L << 16
    };

  inline _Ios_Iostate
  operator&(_Ios_Iostate __a, _Ios_Iostate __b)
  { return _Ios_Iostate(static_cast<int>(__a) & static_cast<int>(__b)); }

  inline _Ios_Iostate
  operator|(_Ios_Iostate __a, _Ios_Iostate __b)
  { return _Ios_Iostate(static_cast<int>(__a) | static_cast<int>(__b)); }

  inline _Ios_Iostate
  operator^(_Ios_Iostate __a, _Ios_Iostate __b)
  { return _Ios_Iostate(static_cast<int>(__a) ^ static_cast<int>(__b)); }

  inline _Ios_Iostate
  operator~(_Ios_Iostate __a)
  { return _Ios_Iostate(~static_cast<int>(__a)); }

  inline const _Ios_Iostate&
  operator|=(_Ios_Iostate& __a, _Ios_Iostate __b)
  { return __a = __a | __b; }

  inline const _Ios_Iostate&
  operator&=(_Ios_Iostate& __a, _Ios_Iostate __b)
  { return __a = __a & __b; }

  inline const _Ios_Iostate&
  operator^=(_Ios_Iostate& __a, _Ios_Iostate __b)
  { return __a = __a ^ __b; }


  enum _Ios_Seekdir
    {
      _S_beg = 0,
      _S_cur = 1,
      _S_end = 2,
      _S_ios_seekdir_end = 1L << 16
    };
# 199 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/ios_base.h" 3
  class ios_base
  {
  public:







    class failure : public exception
    {
    public:


      explicit
      failure(const string& __str) throw();



      virtual
      ~failure() throw();

      virtual const char*
      what() const throw();

    private:
      string _M_msg;
    };
# 255 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/ios_base.h" 3
    typedef _Ios_Fmtflags fmtflags;


    static const fmtflags boolalpha = _S_boolalpha;


    static const fmtflags dec = _S_dec;


    static const fmtflags fixed = _S_fixed;


    static const fmtflags hex = _S_hex;




    static const fmtflags internal = _S_internal;



    static const fmtflags left = _S_left;


    static const fmtflags oct = _S_oct;



    static const fmtflags right = _S_right;


    static const fmtflags scientific = _S_scientific;



    static const fmtflags showbase = _S_showbase;



    static const fmtflags showpoint = _S_showpoint;


    static const fmtflags showpos = _S_showpos;


    static const fmtflags skipws = _S_skipws;


    static const fmtflags unitbuf = _S_unitbuf;



    static const fmtflags uppercase = _S_uppercase;


    static const fmtflags adjustfield = _S_adjustfield;


    static const fmtflags basefield = _S_basefield;


    static const fmtflags floatfield = _S_floatfield;
# 330 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/ios_base.h" 3
    typedef _Ios_Iostate iostate;



    static const iostate badbit = _S_badbit;


    static const iostate eofbit = _S_eofbit;




    static const iostate failbit = _S_failbit;


    static const iostate goodbit = _S_goodbit;
# 361 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/ios_base.h" 3
    typedef _Ios_Openmode openmode;


    static const openmode app = _S_app;


    static const openmode ate = _S_ate;




    static const openmode binary = _S_bin;


    static const openmode in = _S_in;


    static const openmode out = _S_out;


    static const openmode trunc = _S_trunc;
# 393 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/ios_base.h" 3
    typedef _Ios_Seekdir seekdir;


    static const seekdir beg = _S_beg;


    static const seekdir cur = _S_cur;


    static const seekdir end = _S_end;


    typedef int io_state;
    typedef int open_mode;
    typedef int seek_dir;

    typedef std::streampos streampos;
    typedef std::streamoff streamoff;
# 419 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/ios_base.h" 3
    enum event
    {
      erase_event,
      imbue_event,
      copyfmt_event
    };
# 436 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/ios_base.h" 3
    typedef void (*event_callback) (event __e, ios_base& __b, int __i);
# 448 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/ios_base.h" 3
    void
    register_callback(event_callback __fn, int __index);

  protected:
    streamsize _M_precision;
    streamsize _M_width;
    fmtflags _M_flags;
    iostate _M_exception;
    iostate _M_streambuf_state;



    struct _Callback_list
    {

      _Callback_list* _M_next;
      ios_base::event_callback _M_fn;
      int _M_index;
      _Atomic_word _M_refcount;

      _Callback_list(ios_base::event_callback __fn, int __index,
       _Callback_list* __cb)
      : _M_next(__cb), _M_fn(__fn), _M_index(__index), _M_refcount(0) { }

      void
      _M_add_reference() { __gnu_cxx::__atomic_add_dispatch(&_M_refcount, 1); }


      int
      _M_remove_reference()
      {

        ;
        int __res = __gnu_cxx::__exchange_and_add_dispatch(&_M_refcount, -1);
        if (__res == 0)
          {
            ;
          }
        return __res;
      }
    };

     _Callback_list* _M_callbacks;

    void
    _M_call_callbacks(event __ev) throw();

    void
    _M_dispose_callbacks(void) throw();


    struct _Words
    {
      void* _M_pword;
      long _M_iword;
      _Words() : _M_pword(0), _M_iword(0) { }
    };


    _Words _M_word_zero;



    enum { _S_local_word_size = 8 };
    _Words _M_local_word[_S_local_word_size];


    int _M_word_size;
    _Words* _M_word;

    _Words&
    _M_grow_words(int __index, bool __iword);


    locale _M_ios_locale;

    void
    _M_init() throw();

  public:





    class Init
    {
      friend class ios_base;
    public:
      Init();
      ~Init();

    private:
      static _Atomic_word _S_refcount;
      static bool _S_synced_with_stdio;
    };






    fmtflags
    flags() const
    { return _M_flags; }
# 561 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/ios_base.h" 3
    fmtflags
    flags(fmtflags __fmtfl)
    {
      fmtflags __old = _M_flags;
      _M_flags = __fmtfl;
      return __old;
    }
# 577 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/ios_base.h" 3
    fmtflags
    setf(fmtflags __fmtfl)
    {
      fmtflags __old = _M_flags;
      _M_flags |= __fmtfl;
      return __old;
    }
# 594 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/ios_base.h" 3
    fmtflags
    setf(fmtflags __fmtfl, fmtflags __mask)
    {
      fmtflags __old = _M_flags;
      _M_flags &= ~__mask;
      _M_flags |= (__fmtfl & __mask);
      return __old;
    }







    void
    unsetf(fmtflags __mask)
    { _M_flags &= ~__mask; }
# 620 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/ios_base.h" 3
    streamsize
    precision() const
    { return _M_precision; }






    streamsize
    precision(streamsize __prec)
    {
      streamsize __old = _M_precision;
      _M_precision = __prec;
      return __old;
    }







    streamsize
    width() const
    { return _M_width; }






    streamsize
    width(streamsize __wide)
    {
      streamsize __old = _M_width;
      _M_width = __wide;
      return __old;
    }
# 671 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/ios_base.h" 3
    static bool
    sync_with_stdio(bool __sync = true);
# 683 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/ios_base.h" 3
    locale
    imbue(const locale& __loc) throw();
# 694 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/ios_base.h" 3
    locale
    getloc() const
    { return _M_ios_locale; }
# 705 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/ios_base.h" 3
    const locale&
    _M_getloc() const
    { return _M_ios_locale; }
# 724 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/ios_base.h" 3
    static int
    xalloc() throw();
# 740 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/ios_base.h" 3
    long&
    iword(int __ix)
    {
      _Words& __word = (__ix < _M_word_size)
   ? _M_word[__ix] : _M_grow_words(__ix, true);
      return __word._M_iword;
    }
# 761 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/ios_base.h" 3
    void*&
    pword(int __ix)
    {
      _Words& __word = (__ix < _M_word_size)
   ? _M_word[__ix] : _M_grow_words(__ix, false);
      return __word._M_pword;
    }
# 778 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/ios_base.h" 3
    virtual ~ios_base();

  protected:
    ios_base() throw ();



  private:
    ios_base(const ios_base&);

    ios_base&
    operator=(const ios_base&);
  };



  inline ios_base&
  boolalpha(ios_base& __base)
  {
    __base.setf(ios_base::boolalpha);
    return __base;
  }


  inline ios_base&
  noboolalpha(ios_base& __base)
  {
    __base.unsetf(ios_base::boolalpha);
    return __base;
  }


  inline ios_base&
  showbase(ios_base& __base)
  {
    __base.setf(ios_base::showbase);
    return __base;
  }


  inline ios_base&
  noshowbase(ios_base& __base)
  {
    __base.unsetf(ios_base::showbase);
    return __base;
  }


  inline ios_base&
  showpoint(ios_base& __base)
  {
    __base.setf(ios_base::showpoint);
    return __base;
  }


  inline ios_base&
  noshowpoint(ios_base& __base)
  {
    __base.unsetf(ios_base::showpoint);
    return __base;
  }


  inline ios_base&
  showpos(ios_base& __base)
  {
    __base.setf(ios_base::showpos);
    return __base;
  }


  inline ios_base&
  noshowpos(ios_base& __base)
  {
    __base.unsetf(ios_base::showpos);
    return __base;
  }


  inline ios_base&
  skipws(ios_base& __base)
  {
    __base.setf(ios_base::skipws);
    return __base;
  }


  inline ios_base&
  noskipws(ios_base& __base)
  {
    __base.unsetf(ios_base::skipws);
    return __base;
  }


  inline ios_base&
  uppercase(ios_base& __base)
  {
    __base.setf(ios_base::uppercase);
    return __base;
  }


  inline ios_base&
  nouppercase(ios_base& __base)
  {
    __base.unsetf(ios_base::uppercase);
    return __base;
  }


  inline ios_base&
  unitbuf(ios_base& __base)
  {
     __base.setf(ios_base::unitbuf);
     return __base;
  }


  inline ios_base&
  nounitbuf(ios_base& __base)
  {
     __base.unsetf(ios_base::unitbuf);
     return __base;
  }



  inline ios_base&
  internal(ios_base& __base)
  {
     __base.setf(ios_base::internal, ios_base::adjustfield);
     return __base;
  }


  inline ios_base&
  left(ios_base& __base)
  {
    __base.setf(ios_base::left, ios_base::adjustfield);
    return __base;
  }


  inline ios_base&
  right(ios_base& __base)
  {
    __base.setf(ios_base::right, ios_base::adjustfield);
    return __base;
  }



  inline ios_base&
  dec(ios_base& __base)
  {
    __base.setf(ios_base::dec, ios_base::basefield);
    return __base;
  }


  inline ios_base&
  hex(ios_base& __base)
  {
    __base.setf(ios_base::hex, ios_base::basefield);
    return __base;
  }


  inline ios_base&
  oct(ios_base& __base)
  {
    __base.setf(ios_base::oct, ios_base::basefield);
    return __base;
  }



  inline ios_base&
  fixed(ios_base& __base)
  {
    __base.setf(ios_base::fixed, ios_base::floatfield);
    return __base;
  }


  inline ios_base&
  scientific(ios_base& __base)
  {
    __base.setf(ios_base::scientific, ios_base::floatfield);
    return __base;
  }


}
# 43 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ios" 2 3
# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/streambuf" 1 3
# 36 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/streambuf" 3
       
# 37 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/streambuf" 3
# 45 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/streambuf" 3
namespace std __attribute__ ((__visibility__ ("default")))
{


  template<typename _CharT, typename _Traits>
    streamsize
    __copy_streambufs_eof(basic_streambuf<_CharT, _Traits>*,
     basic_streambuf<_CharT, _Traits>*, bool&);
# 119 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/streambuf" 3
  template<typename _CharT, typename _Traits>
    class basic_streambuf
    {
    public:






      typedef _CharT char_type;
      typedef _Traits traits_type;
      typedef typename traits_type::int_type int_type;
      typedef typename traits_type::pos_type pos_type;
      typedef typename traits_type::off_type off_type;




      typedef basic_streambuf<char_type, traits_type> __streambuf_type;


      friend class basic_ios<char_type, traits_type>;
      friend class basic_istream<char_type, traits_type>;
      friend class basic_ostream<char_type, traits_type>;
      friend class istreambuf_iterator<char_type, traits_type>;
      friend class ostreambuf_iterator<char_type, traits_type>;

      friend streamsize
      __copy_streambufs_eof<>(basic_streambuf*, basic_streambuf*, bool&);

      template<bool _IsMove, typename _CharT2>
        friend typename __gnu_cxx::__enable_if<__is_char<_CharT2>::__value,
            _CharT2*>::__type
        __copy_move_a2(istreambuf_iterator<_CharT2>,
         istreambuf_iterator<_CharT2>, _CharT2*);

      template<typename _CharT2>
        friend typename __gnu_cxx::__enable_if<__is_char<_CharT2>::__value,
      istreambuf_iterator<_CharT2> >::__type
        find(istreambuf_iterator<_CharT2>, istreambuf_iterator<_CharT2>,
      const _CharT2&);

      template<typename _CharT2, typename _Traits2>
        friend basic_istream<_CharT2, _Traits2>&
        operator>>(basic_istream<_CharT2, _Traits2>&, _CharT2*);

      template<typename _CharT2, typename _Traits2, typename _Alloc>
        friend basic_istream<_CharT2, _Traits2>&
        operator>>(basic_istream<_CharT2, _Traits2>&,
     basic_string<_CharT2, _Traits2, _Alloc>&);

      template<typename _CharT2, typename _Traits2, typename _Alloc>
        friend basic_istream<_CharT2, _Traits2>&
        getline(basic_istream<_CharT2, _Traits2>&,
  basic_string<_CharT2, _Traits2, _Alloc>&, _CharT2);

    protected:







      char_type* _M_in_beg;
      char_type* _M_in_cur;
      char_type* _M_in_end;
      char_type* _M_out_beg;
      char_type* _M_out_cur;
      char_type* _M_out_end;


      locale _M_buf_locale;

  public:

      virtual
      ~basic_streambuf()
      { }
# 208 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/streambuf" 3
      locale
      pubimbue(const locale& __loc)
      {
 locale __tmp(this->getloc());
 this->imbue(__loc);
 _M_buf_locale = __loc;
 return __tmp;
      }
# 225 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/streambuf" 3
      locale
      getloc() const
      { return _M_buf_locale; }
# 238 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/streambuf" 3
      basic_streambuf*
      pubsetbuf(char_type* __s, streamsize __n)
      { return this->setbuf(__s, __n); }
# 250 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/streambuf" 3
      pos_type
      pubseekoff(off_type __off, ios_base::seekdir __way,
   ios_base::openmode __mode = ios_base::in | ios_base::out)
      { return this->seekoff(__off, __way, __mode); }
# 262 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/streambuf" 3
      pos_type
      pubseekpos(pos_type __sp,
   ios_base::openmode __mode = ios_base::in | ios_base::out)
      { return this->seekpos(__sp, __mode); }




      int
      pubsync() { return this->sync(); }
# 283 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/streambuf" 3
      streamsize
      in_avail()
      {
 const streamsize __ret = this->egptr() - this->gptr();
 return __ret ? __ret : this->showmanyc();
      }
# 297 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/streambuf" 3
      int_type
      snextc()
      {
 int_type __ret = traits_type::eof();
 if (__builtin_expect(!traits_type::eq_int_type(this->sbumpc(),
             __ret), true))
   __ret = this->sgetc();
 return __ret;
      }
# 315 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/streambuf" 3
      int_type
      sbumpc()
      {
 int_type __ret;
 if (__builtin_expect(this->gptr() < this->egptr(), true))
   {
     __ret = traits_type::to_int_type(*this->gptr());
     this->gbump(1);
   }
 else
   __ret = this->uflow();
 return __ret;
      }
# 337 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/streambuf" 3
      int_type
      sgetc()
      {
 int_type __ret;
 if (__builtin_expect(this->gptr() < this->egptr(), true))
   __ret = traits_type::to_int_type(*this->gptr());
 else
   __ret = this->underflow();
 return __ret;
      }
# 356 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/streambuf" 3
      streamsize
      sgetn(char_type* __s, streamsize __n)
      { return this->xsgetn(__s, __n); }
# 371 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/streambuf" 3
      int_type
      sputbackc(char_type __c)
      {
 int_type __ret;
 const bool __testpos = this->eback() < this->gptr();
 if (__builtin_expect(!__testpos ||
        !traits_type::eq(__c, this->gptr()[-1]), false))
   __ret = this->pbackfail(traits_type::to_int_type(__c));
 else
   {
     this->gbump(-1);
     __ret = traits_type::to_int_type(*this->gptr());
   }
 return __ret;
      }
# 396 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/streambuf" 3
      int_type
      sungetc()
      {
 int_type __ret;
 if (__builtin_expect(this->eback() < this->gptr(), true))
   {
     this->gbump(-1);
     __ret = traits_type::to_int_type(*this->gptr());
   }
 else
   __ret = this->pbackfail();
 return __ret;
      }
# 423 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/streambuf" 3
      int_type
      sputc(char_type __c)
      {
 int_type __ret;
 if (__builtin_expect(this->pptr() < this->epptr(), true))
   {
     *this->pptr() = __c;
     this->pbump(1);
     __ret = traits_type::to_int_type(__c);
   }
 else
   __ret = this->overflow(traits_type::to_int_type(__c));
 return __ret;
      }
# 449 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/streambuf" 3
      streamsize
      sputn(const char_type* __s, streamsize __n)
      { return this->xsputn(__s, __n); }

    protected:
# 463 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/streambuf" 3
      basic_streambuf()
      : _M_in_beg(0), _M_in_cur(0), _M_in_end(0),
      _M_out_beg(0), _M_out_cur(0), _M_out_end(0),
      _M_buf_locale(locale())
      { }
# 481 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/streambuf" 3
      char_type*
      eback() const { return _M_in_beg; }

      char_type*
      gptr() const { return _M_in_cur; }

      char_type*
      egptr() const { return _M_in_end; }
# 497 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/streambuf" 3
      void
      gbump(int __n) { _M_in_cur += __n; }
# 508 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/streambuf" 3
      void
      setg(char_type* __gbeg, char_type* __gnext, char_type* __gend)
      {
 _M_in_beg = __gbeg;
 _M_in_cur = __gnext;
 _M_in_end = __gend;
      }
# 528 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/streambuf" 3
      char_type*
      pbase() const { return _M_out_beg; }

      char_type*
      pptr() const { return _M_out_cur; }

      char_type*
      epptr() const { return _M_out_end; }
# 544 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/streambuf" 3
      void
      pbump(int __n) { _M_out_cur += __n; }
# 554 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/streambuf" 3
      void
      setp(char_type* __pbeg, char_type* __pend)
      {
 _M_out_beg = _M_out_cur = __pbeg;
 _M_out_end = __pend;
      }
# 575 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/streambuf" 3
      virtual void
      imbue(const locale& __loc)
      { }
# 590 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/streambuf" 3
      virtual basic_streambuf<char_type,_Traits>*
      setbuf(char_type*, streamsize)
      { return this; }
# 601 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/streambuf" 3
      virtual pos_type
      seekoff(off_type, ios_base::seekdir,
       ios_base::openmode = ios_base::in | ios_base::out)
      { return pos_type(off_type(-1)); }
# 613 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/streambuf" 3
      virtual pos_type
      seekpos(pos_type,
       ios_base::openmode = ios_base::in | ios_base::out)
      { return pos_type(off_type(-1)); }
# 626 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/streambuf" 3
      virtual int
      sync() { return 0; }
# 648 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/streambuf" 3
      virtual streamsize
      showmanyc() { return 0; }
# 664 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/streambuf" 3
      virtual streamsize
      xsgetn(char_type* __s, streamsize __n);
# 686 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/streambuf" 3
      virtual int_type
      underflow()
      { return traits_type::eof(); }
# 699 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/streambuf" 3
      virtual int_type
      uflow()
      {
 int_type __ret = traits_type::eof();
 const bool __testeof = traits_type::eq_int_type(this->underflow(),
       __ret);
 if (!__testeof)
   {
     __ret = traits_type::to_int_type(*this->gptr());
     this->gbump(1);
   }
 return __ret;
      }
# 723 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/streambuf" 3
      virtual int_type
      pbackfail(int_type __c = traits_type::eof())
      { return traits_type::eof(); }
# 741 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/streambuf" 3
      virtual streamsize
      xsputn(const char_type* __s, streamsize __n);
# 767 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/streambuf" 3
      virtual int_type
      overflow(int_type __c = traits_type::eof())
      { return traits_type::eof(); }



    public:
# 782 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/streambuf" 3
      void
      stossc()
      {
 if (this->gptr() < this->egptr())
   this->gbump(1);
 else
   this->uflow();
      }



      void
      __safe_gbump(streamsize __n) { _M_in_cur += __n; }

      void
      __safe_pbump(streamsize __n) { _M_out_cur += __n; }

    private:


      basic_streambuf(const basic_streambuf& __sb)
      : _M_in_beg(__sb._M_in_beg), _M_in_cur(__sb._M_in_cur),
      _M_in_end(__sb._M_in_end), _M_out_beg(__sb._M_out_beg),
      _M_out_cur(__sb._M_out_cur), _M_out_end(__sb._M_out_cur),
      _M_buf_locale(__sb._M_buf_locale)
      { }

      basic_streambuf&
      operator=(const basic_streambuf&) { return *this; };
    };


  template<>
    streamsize
    __copy_streambufs_eof(basic_streambuf<char>* __sbin,
     basic_streambuf<char>* __sbout, bool& __ineof);

  template<>
    streamsize
    __copy_streambufs_eof(basic_streambuf<wchar_t>* __sbin,
     basic_streambuf<wchar_t>* __sbout, bool& __ineof);



}

# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/streambuf.tcc" 1 3
# 37 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/streambuf.tcc" 3
       
# 38 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/streambuf.tcc" 3

namespace std __attribute__ ((__visibility__ ("default")))
{


  template<typename _CharT, typename _Traits>
    streamsize
    basic_streambuf<_CharT, _Traits>::
    xsgetn(char_type* __s, streamsize __n)
    {
      streamsize __ret = 0;
      while (__ret < __n)
 {
   const streamsize __buf_len = this->egptr() - this->gptr();
   if (__buf_len)
     {
       const streamsize __remaining = __n - __ret;
       const streamsize __len = std::min(__buf_len, __remaining);
       traits_type::copy(__s, this->gptr(), __len);
       __ret += __len;
       __s += __len;
       this->__safe_gbump(__len);
     }

   if (__ret < __n)
     {
       const int_type __c = this->uflow();
       if (!traits_type::eq_int_type(__c, traits_type::eof()))
  {
    traits_type::assign(*__s++, traits_type::to_char_type(__c));
    ++__ret;
  }
       else
  break;
     }
 }
      return __ret;
    }

  template<typename _CharT, typename _Traits>
    streamsize
    basic_streambuf<_CharT, _Traits>::
    xsputn(const char_type* __s, streamsize __n)
    {
      streamsize __ret = 0;
      while (__ret < __n)
 {
   const streamsize __buf_len = this->epptr() - this->pptr();
   if (__buf_len)
     {
       const streamsize __remaining = __n - __ret;
       const streamsize __len = std::min(__buf_len, __remaining);
       traits_type::copy(this->pptr(), __s, __len);
       __ret += __len;
       __s += __len;
       this->__safe_pbump(__len);
     }

   if (__ret < __n)
     {
       int_type __c = this->overflow(traits_type::to_int_type(*__s));
       if (!traits_type::eq_int_type(__c, traits_type::eof()))
  {
    ++__ret;
    ++__s;
  }
       else
  break;
     }
 }
      return __ret;
    }




  template<typename _CharT, typename _Traits>
    streamsize
    __copy_streambufs_eof(basic_streambuf<_CharT, _Traits>* __sbin,
     basic_streambuf<_CharT, _Traits>* __sbout,
     bool& __ineof)
    {
      streamsize __ret = 0;
      __ineof = true;
      typename _Traits::int_type __c = __sbin->sgetc();
      while (!_Traits::eq_int_type(__c, _Traits::eof()))
 {
   __c = __sbout->sputc(_Traits::to_char_type(__c));
   if (_Traits::eq_int_type(__c, _Traits::eof()))
     {
       __ineof = false;
       break;
     }
   ++__ret;
   __c = __sbin->snextc();
 }
      return __ret;
    }

  template<typename _CharT, typename _Traits>
    inline streamsize
    __copy_streambufs(basic_streambuf<_CharT, _Traits>* __sbin,
        basic_streambuf<_CharT, _Traits>* __sbout)
    {
      bool __ineof;
      return __copy_streambufs_eof(__sbin, __sbout, __ineof);
    }




  extern template class basic_streambuf<char>;
  extern template
    streamsize
    __copy_streambufs(basic_streambuf<char>*,
        basic_streambuf<char>*);
  extern template
    streamsize
    __copy_streambufs_eof(basic_streambuf<char>*,
     basic_streambuf<char>*, bool&);


  extern template class basic_streambuf<wchar_t>;
  extern template
    streamsize
    __copy_streambufs(basic_streambuf<wchar_t>*,
        basic_streambuf<wchar_t>*);
  extern template
    streamsize
    __copy_streambufs_eof(basic_streambuf<wchar_t>*,
     basic_streambuf<wchar_t>*, bool&);




}
# 829 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/streambuf" 2 3
# 44 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ios" 2 3
# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_ios.h" 1 3
# 33 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_ios.h" 3
       
# 34 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_ios.h" 3



# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 1 3
# 37 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
       
# 38 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3

# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/cwctype" 1 3
# 39 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/cwctype" 3
       
# 40 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/cwctype" 3
# 50 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/cwctype" 3
# 1 "/usr/include/wctype.h" 1 3 4
# 34 "/usr/include/wctype.h" 3 4
# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/lib64/gcc/x86_64-suse-linux/4.9.2/include/stddef.h" 1 3 4
# 35 "/usr/include/wctype.h" 2 3 4
# 50 "/usr/include/wctype.h" 3 4



typedef unsigned long int wctype_t;

# 72 "/usr/include/wctype.h" 3 4
enum
{
  __ISwupper = 0,
  __ISwlower = 1,
  __ISwalpha = 2,
  __ISwdigit = 3,
  __ISwxdigit = 4,
  __ISwspace = 5,
  __ISwprint = 6,
  __ISwgraph = 7,
  __ISwblank = 8,
  __ISwcntrl = 9,
  __ISwpunct = 10,
  __ISwalnum = 11,

  _ISwupper = ((__ISwupper) < 8 ? (int) ((1UL << (__ISwupper)) << 24) : ((__ISwupper) < 16 ? (int) ((1UL << (__ISwupper)) << 8) : ((__ISwupper) < 24 ? (int) ((1UL << (__ISwupper)) >> 8) : (int) ((1UL << (__ISwupper)) >> 24)))),
  _ISwlower = ((__ISwlower) < 8 ? (int) ((1UL << (__ISwlower)) << 24) : ((__ISwlower) < 16 ? (int) ((1UL << (__ISwlower)) << 8) : ((__ISwlower) < 24 ? (int) ((1UL << (__ISwlower)) >> 8) : (int) ((1UL << (__ISwlower)) >> 24)))),
  _ISwalpha = ((__ISwalpha) < 8 ? (int) ((1UL << (__ISwalpha)) << 24) : ((__ISwalpha) < 16 ? (int) ((1UL << (__ISwalpha)) << 8) : ((__ISwalpha) < 24 ? (int) ((1UL << (__ISwalpha)) >> 8) : (int) ((1UL << (__ISwalpha)) >> 24)))),
  _ISwdigit = ((__ISwdigit) < 8 ? (int) ((1UL << (__ISwdigit)) << 24) : ((__ISwdigit) < 16 ? (int) ((1UL << (__ISwdigit)) << 8) : ((__ISwdigit) < 24 ? (int) ((1UL << (__ISwdigit)) >> 8) : (int) ((1UL << (__ISwdigit)) >> 24)))),
  _ISwxdigit = ((__ISwxdigit) < 8 ? (int) ((1UL << (__ISwxdigit)) << 24) : ((__ISwxdigit) < 16 ? (int) ((1UL << (__ISwxdigit)) << 8) : ((__ISwxdigit) < 24 ? (int) ((1UL << (__ISwxdigit)) >> 8) : (int) ((1UL << (__ISwxdigit)) >> 24)))),
  _ISwspace = ((__ISwspace) < 8 ? (int) ((1UL << (__ISwspace)) << 24) : ((__ISwspace) < 16 ? (int) ((1UL << (__ISwspace)) << 8) : ((__ISwspace) < 24 ? (int) ((1UL << (__ISwspace)) >> 8) : (int) ((1UL << (__ISwspace)) >> 24)))),
  _ISwprint = ((__ISwprint) < 8 ? (int) ((1UL << (__ISwprint)) << 24) : ((__ISwprint) < 16 ? (int) ((1UL << (__ISwprint)) << 8) : ((__ISwprint) < 24 ? (int) ((1UL << (__ISwprint)) >> 8) : (int) ((1UL << (__ISwprint)) >> 24)))),
  _ISwgraph = ((__ISwgraph) < 8 ? (int) ((1UL << (__ISwgraph)) << 24) : ((__ISwgraph) < 16 ? (int) ((1UL << (__ISwgraph)) << 8) : ((__ISwgraph) < 24 ? (int) ((1UL << (__ISwgraph)) >> 8) : (int) ((1UL << (__ISwgraph)) >> 24)))),
  _ISwblank = ((__ISwblank) < 8 ? (int) ((1UL << (__ISwblank)) << 24) : ((__ISwblank) < 16 ? (int) ((1UL << (__ISwblank)) << 8) : ((__ISwblank) < 24 ? (int) ((1UL << (__ISwblank)) >> 8) : (int) ((1UL << (__ISwblank)) >> 24)))),
  _ISwcntrl = ((__ISwcntrl) < 8 ? (int) ((1UL << (__ISwcntrl)) << 24) : ((__ISwcntrl) < 16 ? (int) ((1UL << (__ISwcntrl)) << 8) : ((__ISwcntrl) < 24 ? (int) ((1UL << (__ISwcntrl)) >> 8) : (int) ((1UL << (__ISwcntrl)) >> 24)))),
  _ISwpunct = ((__ISwpunct) < 8 ? (int) ((1UL << (__ISwpunct)) << 24) : ((__ISwpunct) < 16 ? (int) ((1UL << (__ISwpunct)) << 8) : ((__ISwpunct) < 24 ? (int) ((1UL << (__ISwpunct)) >> 8) : (int) ((1UL << (__ISwpunct)) >> 24)))),
  _ISwalnum = ((__ISwalnum) < 8 ? (int) ((1UL << (__ISwalnum)) << 24) : ((__ISwalnum) < 16 ? (int) ((1UL << (__ISwalnum)) << 8) : ((__ISwalnum) < 24 ? (int) ((1UL << (__ISwalnum)) >> 8) : (int) ((1UL << (__ISwalnum)) >> 24))))
};



extern "C" {








extern int iswalnum (wint_t __wc) throw ();





extern int iswalpha (wint_t __wc) throw ();


extern int iswcntrl (wint_t __wc) throw ();



extern int iswdigit (wint_t __wc) throw ();



extern int iswgraph (wint_t __wc) throw ();




extern int iswlower (wint_t __wc) throw ();


extern int iswprint (wint_t __wc) throw ();




extern int iswpunct (wint_t __wc) throw ();




extern int iswspace (wint_t __wc) throw ();




extern int iswupper (wint_t __wc) throw ();




extern int iswxdigit (wint_t __wc) throw ();





extern int iswblank (wint_t __wc) throw ();
# 172 "/usr/include/wctype.h" 3 4
extern wctype_t wctype (__const char *__property) throw ();



extern int iswctype (wint_t __wc, wctype_t __desc) throw ();










typedef __const __int32_t *wctrans_t;







extern wint_t towlower (wint_t __wc) throw ();


extern wint_t towupper (wint_t __wc) throw ();


}
# 214 "/usr/include/wctype.h" 3 4
extern "C" {




extern wctrans_t wctrans (__const char *__property) throw ();


extern wint_t towctrans (wint_t __wc, wctrans_t __desc) throw ();








extern int iswalnum_l (wint_t __wc, __locale_t __locale) throw ();





extern int iswalpha_l (wint_t __wc, __locale_t __locale) throw ();


extern int iswcntrl_l (wint_t __wc, __locale_t __locale) throw ();



extern int iswdigit_l (wint_t __wc, __locale_t __locale) throw ();



extern int iswgraph_l (wint_t __wc, __locale_t __locale) throw ();




extern int iswlower_l (wint_t __wc, __locale_t __locale) throw ();


extern int iswprint_l (wint_t __wc, __locale_t __locale) throw ();




extern int iswpunct_l (wint_t __wc, __locale_t __locale) throw ();




extern int iswspace_l (wint_t __wc, __locale_t __locale) throw ();




extern int iswupper_l (wint_t __wc, __locale_t __locale) throw ();




extern int iswxdigit_l (wint_t __wc, __locale_t __locale) throw ();




extern int iswblank_l (wint_t __wc, __locale_t __locale) throw ();



extern wctype_t wctype_l (__const char *__property, __locale_t __locale)
     throw ();



extern int iswctype_l (wint_t __wc, wctype_t __desc, __locale_t __locale)
     throw ();







extern wint_t towlower_l (wint_t __wc, __locale_t __locale) throw ();


extern wint_t towupper_l (wint_t __wc, __locale_t __locale) throw ();



extern wctrans_t wctrans_l (__const char *__property, __locale_t __locale)
     throw ();


extern wint_t towctrans_l (wint_t __wc, wctrans_t __desc,
      __locale_t __locale) throw ();



}
# 51 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/cwctype" 2 3
# 80 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/cwctype" 3
namespace std
{
  using ::wctrans_t;
  using ::wctype_t;
  using ::wint_t;

  using ::iswalnum;
  using ::iswalpha;

  using ::iswblank;

  using ::iswcntrl;
  using ::iswctype;
  using ::iswdigit;
  using ::iswgraph;
  using ::iswlower;
  using ::iswprint;
  using ::iswpunct;
  using ::iswspace;
  using ::iswupper;
  using ::iswxdigit;
  using ::towctrans;
  using ::towlower;
  using ::towupper;
  using ::wctrans;
  using ::wctype;
}
# 40 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 2 3
# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/cctype" 1 3
# 39 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/cctype" 3
       
# 40 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/cctype" 3
# 41 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 2 3
# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/x86_64-suse-linux/bits/ctype_base.h" 1 3
# 36 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/x86_64-suse-linux/bits/ctype_base.h" 3
namespace std __attribute__ ((__visibility__ ("default")))
{



  struct ctype_base
  {

    typedef const int* __to_type;



    typedef unsigned short mask;
    static const mask upper = _ISupper;
    static const mask lower = _ISlower;
    static const mask alpha = _ISalpha;
    static const mask digit = _ISdigit;
    static const mask xdigit = _ISxdigit;
    static const mask space = _ISspace;
    static const mask print = _ISprint;
    static const mask graph = _ISalpha | _ISdigit | _ISpunct;
    static const mask cntrl = _IScntrl;
    static const mask punct = _ISpunct;
    static const mask alnum = _ISalpha | _ISdigit;
  };


}
# 42 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 2 3






# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/streambuf_iterator.h" 1 3
# 33 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/streambuf_iterator.h" 3
       
# 34 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/streambuf_iterator.h" 3




namespace std __attribute__ ((__visibility__ ("default")))
{

# 49 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/streambuf_iterator.h" 3
  template<typename _CharT, typename _Traits>
    class istreambuf_iterator
    : public iterator<input_iterator_tag, _CharT, typename _Traits::off_type,
                      _CharT*,




        _CharT&>

    {
    public:



      typedef _CharT char_type;
      typedef _Traits traits_type;
      typedef typename _Traits::int_type int_type;
      typedef basic_streambuf<_CharT, _Traits> streambuf_type;
      typedef basic_istream<_CharT, _Traits> istream_type;


      template<typename _CharT2>
 friend typename __gnu_cxx::__enable_if<__is_char<_CharT2>::__value,
                      ostreambuf_iterator<_CharT2> >::__type
 copy(istreambuf_iterator<_CharT2>, istreambuf_iterator<_CharT2>,
      ostreambuf_iterator<_CharT2>);

      template<bool _IsMove, typename _CharT2>
 friend typename __gnu_cxx::__enable_if<__is_char<_CharT2>::__value,
            _CharT2*>::__type
 __copy_move_a2(istreambuf_iterator<_CharT2>,
         istreambuf_iterator<_CharT2>, _CharT2*);

      template<typename _CharT2>
 friend typename __gnu_cxx::__enable_if<__is_char<_CharT2>::__value,
               istreambuf_iterator<_CharT2> >::__type
 find(istreambuf_iterator<_CharT2>, istreambuf_iterator<_CharT2>,
      const _CharT2&);

    private:







      mutable streambuf_type* _M_sbuf;
      mutable int_type _M_c;

    public:

      istreambuf_iterator() throw()
      : _M_sbuf(0), _M_c(traits_type::eof()) { }
# 112 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/streambuf_iterator.h" 3
      istreambuf_iterator(istream_type& __s) throw()
      : _M_sbuf(__s.rdbuf()), _M_c(traits_type::eof()) { }


      istreambuf_iterator(streambuf_type* __s) throw()
      : _M_sbuf(__s), _M_c(traits_type::eof()) { }




      char_type
      operator*() const
      {







 return traits_type::to_char_type(_M_get());
      }


      istreambuf_iterator&
      operator++()
      {


                        ;
 if (_M_sbuf)
   {
     _M_sbuf->sbumpc();
     _M_c = traits_type::eof();
   }
 return *this;
      }


      istreambuf_iterator
      operator++(int)
      {


                        ;

 istreambuf_iterator __old = *this;
 if (_M_sbuf)
   {
     __old._M_c = _M_sbuf->sbumpc();
     _M_c = traits_type::eof();
   }
 return __old;
      }





      bool
      equal(const istreambuf_iterator& __b) const
      { return _M_at_eof() == __b._M_at_eof(); }

    private:
      int_type
      _M_get() const
      {
 const int_type __eof = traits_type::eof();
 int_type __ret = __eof;
 if (_M_sbuf)
   {
     if (!traits_type::eq_int_type(_M_c, __eof))
       __ret = _M_c;
     else if (!traits_type::eq_int_type((__ret = _M_sbuf->sgetc()),
            __eof))
       _M_c = __ret;
     else
       _M_sbuf = 0;
   }
 return __ret;
      }

      bool
      _M_at_eof() const
      {
 const int_type __eof = traits_type::eof();
 return traits_type::eq_int_type(_M_get(), __eof);
      }
    };

  template<typename _CharT, typename _Traits>
    inline bool
    operator==(const istreambuf_iterator<_CharT, _Traits>& __a,
        const istreambuf_iterator<_CharT, _Traits>& __b)
    { return __a.equal(__b); }

  template<typename _CharT, typename _Traits>
    inline bool
    operator!=(const istreambuf_iterator<_CharT, _Traits>& __a,
        const istreambuf_iterator<_CharT, _Traits>& __b)
    { return !__a.equal(__b); }


  template<typename _CharT, typename _Traits>
    class ostreambuf_iterator
    : public iterator<output_iterator_tag, void, void, void, void>
    {
    public:



      typedef _CharT char_type;
      typedef _Traits traits_type;
      typedef basic_streambuf<_CharT, _Traits> streambuf_type;
      typedef basic_ostream<_CharT, _Traits> ostream_type;


      template<typename _CharT2>
 friend typename __gnu_cxx::__enable_if<__is_char<_CharT2>::__value,
                      ostreambuf_iterator<_CharT2> >::__type
 copy(istreambuf_iterator<_CharT2>, istreambuf_iterator<_CharT2>,
      ostreambuf_iterator<_CharT2>);

    private:
      streambuf_type* _M_sbuf;
      bool _M_failed;

    public:

      ostreambuf_iterator(ostream_type& __s) throw()
      : _M_sbuf(__s.rdbuf()), _M_failed(!_M_sbuf) { }


      ostreambuf_iterator(streambuf_type* __s) throw()
      : _M_sbuf(__s), _M_failed(!_M_sbuf) { }


      ostreambuf_iterator&
      operator=(_CharT __c)
      {
 if (!_M_failed &&
     _Traits::eq_int_type(_M_sbuf->sputc(__c), _Traits::eof()))
   _M_failed = true;
 return *this;
      }


      ostreambuf_iterator&
      operator*()
      { return *this; }


      ostreambuf_iterator&
      operator++(int)
      { return *this; }


      ostreambuf_iterator&
      operator++()
      { return *this; }


      bool
      failed() const throw()
      { return _M_failed; }

      ostreambuf_iterator&
      _M_put(const _CharT* __ws, streamsize __len)
      {
 if (__builtin_expect(!_M_failed, true)
     && __builtin_expect(this->_M_sbuf->sputn(__ws, __len) != __len,
    false))
   _M_failed = true;
 return *this;
      }
    };


  template<typename _CharT>
    typename __gnu_cxx::__enable_if<__is_char<_CharT>::__value,
                           ostreambuf_iterator<_CharT> >::__type
    copy(istreambuf_iterator<_CharT> __first,
  istreambuf_iterator<_CharT> __last,
  ostreambuf_iterator<_CharT> __result)
    {
      if (__first._M_sbuf && !__last._M_sbuf && !__result._M_failed)
 {
   bool __ineof;
   __copy_streambufs_eof(__first._M_sbuf, __result._M_sbuf, __ineof);
   if (!__ineof)
     __result._M_failed = true;
 }
      return __result;
    }

  template<bool _IsMove, typename _CharT>
    typename __gnu_cxx::__enable_if<__is_char<_CharT>::__value,
            ostreambuf_iterator<_CharT> >::__type
    __copy_move_a2(_CharT* __first, _CharT* __last,
     ostreambuf_iterator<_CharT> __result)
    {
      const streamsize __num = __last - __first;
      if (__num > 0)
 __result._M_put(__first, __num);
      return __result;
    }

  template<bool _IsMove, typename _CharT>
    typename __gnu_cxx::__enable_if<__is_char<_CharT>::__value,
        ostreambuf_iterator<_CharT> >::__type
    __copy_move_a2(const _CharT* __first, const _CharT* __last,
     ostreambuf_iterator<_CharT> __result)
    {
      const streamsize __num = __last - __first;
      if (__num > 0)
 __result._M_put(__first, __num);
      return __result;
    }

  template<bool _IsMove, typename _CharT>
    typename __gnu_cxx::__enable_if<__is_char<_CharT>::__value,
            _CharT*>::__type
    __copy_move_a2(istreambuf_iterator<_CharT> __first,
     istreambuf_iterator<_CharT> __last, _CharT* __result)
    {
      typedef istreambuf_iterator<_CharT> __is_iterator_type;
      typedef typename __is_iterator_type::traits_type traits_type;
      typedef typename __is_iterator_type::streambuf_type streambuf_type;
      typedef typename traits_type::int_type int_type;

      if (__first._M_sbuf && !__last._M_sbuf)
 {
   streambuf_type* __sb = __first._M_sbuf;
   int_type __c = __sb->sgetc();
   while (!traits_type::eq_int_type(__c, traits_type::eof()))
     {
       const streamsize __n = __sb->egptr() - __sb->gptr();
       if (__n > 1)
  {
    traits_type::copy(__result, __sb->gptr(), __n);
    __sb->__safe_gbump(__n);
    __result += __n;
    __c = __sb->underflow();
  }
       else
  {
    *__result++ = traits_type::to_char_type(__c);
    __c = __sb->snextc();
  }
     }
 }
      return __result;
    }

  template<typename _CharT>
    typename __gnu_cxx::__enable_if<__is_char<_CharT>::__value,
          istreambuf_iterator<_CharT> >::__type
    find(istreambuf_iterator<_CharT> __first,
  istreambuf_iterator<_CharT> __last, const _CharT& __val)
    {
      typedef istreambuf_iterator<_CharT> __is_iterator_type;
      typedef typename __is_iterator_type::traits_type traits_type;
      typedef typename __is_iterator_type::streambuf_type streambuf_type;
      typedef typename traits_type::int_type int_type;

      if (__first._M_sbuf && !__last._M_sbuf)
 {
   const int_type __ival = traits_type::to_int_type(__val);
   streambuf_type* __sb = __first._M_sbuf;
   int_type __c = __sb->sgetc();
   while (!traits_type::eq_int_type(__c, traits_type::eof())
   && !traits_type::eq_int_type(__c, __ival))
     {
       streamsize __n = __sb->egptr() - __sb->gptr();
       if (__n > 1)
  {
    const _CharT* __p = traits_type::find(__sb->gptr(),
       __n, __val);
    if (__p)
      __n = __p - __sb->gptr();
    __sb->__safe_gbump(__n);
    __c = __sb->sgetc();
  }
       else
  __c = __sb->snextc();
     }

   if (!traits_type::eq_int_type(__c, traits_type::eof()))
     __first._M_c = __c;
   else
     __first._M_sbuf = 0;
 }
      return __first;
    }




}
# 49 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 2 3

namespace std __attribute__ ((__visibility__ ("default")))
{

# 64 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
  template<typename _Tp>
    void
    __convert_to_v(const char*, _Tp&, ios_base::iostate&,
     const __c_locale&) throw();


  template<>
    void
    __convert_to_v(const char*, float&, ios_base::iostate&,
     const __c_locale&) throw();

  template<>
    void
    __convert_to_v(const char*, double&, ios_base::iostate&,
     const __c_locale&) throw();

  template<>
    void
    __convert_to_v(const char*, long double&, ios_base::iostate&,
     const __c_locale&) throw();



  template<typename _CharT, typename _Traits>
    struct __pad
    {
      static void
      _S_pad(ios_base& __io, _CharT __fill, _CharT* __news,
      const _CharT* __olds, streamsize __newlen, streamsize __oldlen);
    };






  template<typename _CharT>
    _CharT*
    __add_grouping(_CharT* __s, _CharT __sep,
     const char* __gbeg, size_t __gsize,
     const _CharT* __first, const _CharT* __last);




  template<typename _CharT>
    inline
    ostreambuf_iterator<_CharT>
    __write(ostreambuf_iterator<_CharT> __s, const _CharT* __ws, int __len)
    {
      __s._M_put(__ws, __len);
      return __s;
    }


  template<typename _CharT, typename _OutIter>
    inline
    _OutIter
    __write(_OutIter __s, const _CharT* __ws, int __len)
    {
      for (int __j = 0; __j < __len; __j++, ++__s)
 *__s = __ws[__j];
      return __s;
    }
# 142 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
  template<typename _CharT>
    class __ctype_abstract_base : public locale::facet, public ctype_base
    {
    public:


      typedef _CharT char_type;
# 161 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      bool
      is(mask __m, char_type __c) const
      { return this->do_is(__m, __c); }
# 178 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      const char_type*
      is(const char_type *__lo, const char_type *__hi, mask *__vec) const
      { return this->do_is(__lo, __hi, __vec); }
# 194 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      const char_type*
      scan_is(mask __m, const char_type* __lo, const char_type* __hi) const
      { return this->do_scan_is(__m, __lo, __hi); }
# 210 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      const char_type*
      scan_not(mask __m, const char_type* __lo, const char_type* __hi) const
      { return this->do_scan_not(__m, __lo, __hi); }
# 224 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      char_type
      toupper(char_type __c) const
      { return this->do_toupper(__c); }
# 239 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      const char_type*
      toupper(char_type *__lo, const char_type* __hi) const
      { return this->do_toupper(__lo, __hi); }
# 253 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      char_type
      tolower(char_type __c) const
      { return this->do_tolower(__c); }
# 268 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      const char_type*
      tolower(char_type* __lo, const char_type* __hi) const
      { return this->do_tolower(__lo, __hi); }
# 285 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      char_type
      widen(char __c) const
      { return this->do_widen(__c); }
# 304 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      const char*
      widen(const char* __lo, const char* __hi, char_type* __to) const
      { return this->do_widen(__lo, __hi, __to); }
# 323 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      char
      narrow(char_type __c, char __dfault) const
      { return this->do_narrow(__c, __dfault); }
# 345 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      const char_type*
      narrow(const char_type* __lo, const char_type* __hi,
       char __dfault, char* __to) const
      { return this->do_narrow(__lo, __hi, __dfault, __to); }

    protected:
      explicit
      __ctype_abstract_base(size_t __refs = 0): facet(__refs) { }

      virtual
      ~__ctype_abstract_base() { }
# 370 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      virtual bool
      do_is(mask __m, char_type __c) const = 0;
# 389 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      virtual const char_type*
      do_is(const char_type* __lo, const char_type* __hi,
     mask* __vec) const = 0;
# 408 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      virtual const char_type*
      do_scan_is(mask __m, const char_type* __lo,
   const char_type* __hi) const = 0;
# 427 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      virtual const char_type*
      do_scan_not(mask __m, const char_type* __lo,
    const char_type* __hi) const = 0;
# 445 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      virtual char_type
      do_toupper(char_type __c) const = 0;
# 462 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      virtual const char_type*
      do_toupper(char_type* __lo, const char_type* __hi) const = 0;
# 478 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      virtual char_type
      do_tolower(char_type __c) const = 0;
# 495 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      virtual const char_type*
      do_tolower(char_type* __lo, const char_type* __hi) const = 0;
# 514 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      virtual char_type
      do_widen(char __c) const = 0;
# 535 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      virtual const char*
      do_widen(const char* __lo, const char* __hi, char_type* __to) const = 0;
# 556 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      virtual char
      do_narrow(char_type __c, char __dfault) const = 0;
# 581 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      virtual const char_type*
      do_narrow(const char_type* __lo, const char_type* __hi,
  char __dfault, char* __to) const = 0;
    };
# 604 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
  template<typename _CharT>
    class ctype : public __ctype_abstract_base<_CharT>
    {
    public:

      typedef _CharT char_type;
      typedef typename __ctype_abstract_base<_CharT>::mask mask;


      static locale::id id;

      explicit
      ctype(size_t __refs = 0) : __ctype_abstract_base<_CharT>(__refs) { }

   protected:
      virtual
      ~ctype();

      virtual bool
      do_is(mask __m, char_type __c) const;

      virtual const char_type*
      do_is(const char_type* __lo, const char_type* __hi, mask* __vec) const;

      virtual const char_type*
      do_scan_is(mask __m, const char_type* __lo, const char_type* __hi) const;

      virtual const char_type*
      do_scan_not(mask __m, const char_type* __lo,
    const char_type* __hi) const;

      virtual char_type
      do_toupper(char_type __c) const;

      virtual const char_type*
      do_toupper(char_type* __lo, const char_type* __hi) const;

      virtual char_type
      do_tolower(char_type __c) const;

      virtual const char_type*
      do_tolower(char_type* __lo, const char_type* __hi) const;

      virtual char_type
      do_widen(char __c) const;

      virtual const char*
      do_widen(const char* __lo, const char* __hi, char_type* __dest) const;

      virtual char
      do_narrow(char_type, char __dfault) const;

      virtual const char_type*
      do_narrow(const char_type* __lo, const char_type* __hi,
  char __dfault, char* __to) const;
    };

  template<typename _CharT>
    locale::id ctype<_CharT>::id;
# 673 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
  template<>
    class ctype<char> : public locale::facet, public ctype_base
    {
    public:


      typedef char char_type;

    protected:

      __c_locale _M_c_locale_ctype;
      bool _M_del;
      __to_type _M_toupper;
      __to_type _M_tolower;
      const mask* _M_table;
      mutable char _M_widen_ok;
      mutable char _M_widen[1 + static_cast<unsigned char>(-1)];
      mutable char _M_narrow[1 + static_cast<unsigned char>(-1)];
      mutable char _M_narrow_ok;


    public:

      static locale::id id;

      static const size_t table_size = 1 + static_cast<unsigned char>(-1);
# 710 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      explicit
      ctype(const mask* __table = 0, bool __del = false, size_t __refs = 0);
# 723 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      explicit
      ctype(__c_locale __cloc, const mask* __table = 0, bool __del = false,
     size_t __refs = 0);
# 736 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      inline bool
      is(mask __m, char __c) const;
# 751 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      inline const char*
      is(const char* __lo, const char* __hi, mask* __vec) const;
# 765 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      inline const char*
      scan_is(mask __m, const char* __lo, const char* __hi) const;
# 779 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      inline const char*
      scan_not(mask __m, const char* __lo, const char* __hi) const;
# 794 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      char_type
      toupper(char_type __c) const
      { return this->do_toupper(__c); }
# 811 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      const char_type*
      toupper(char_type *__lo, const char_type* __hi) const
      { return this->do_toupper(__lo, __hi); }
# 827 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      char_type
      tolower(char_type __c) const
      { return this->do_tolower(__c); }
# 844 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      const char_type*
      tolower(char_type* __lo, const char_type* __hi) const
      { return this->do_tolower(__lo, __hi); }
# 864 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      char_type
      widen(char __c) const
      {
 if (_M_widen_ok)
   return _M_widen[static_cast<unsigned char>(__c)];
 this->_M_widen_init();
 return this->do_widen(__c);
      }
# 891 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      const char*
      widen(const char* __lo, const char* __hi, char_type* __to) const
      {
 if (_M_widen_ok == 1)
   {
     __builtin_memcpy(__to, __lo, __hi - __lo);
     return __hi;
   }
 if (!_M_widen_ok)
   _M_widen_init();
 return this->do_widen(__lo, __hi, __to);
      }
# 922 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      char
      narrow(char_type __c, char __dfault) const
      {
 if (_M_narrow[static_cast<unsigned char>(__c)])
   return _M_narrow[static_cast<unsigned char>(__c)];
 const char __t = do_narrow(__c, __dfault);
 if (__t != __dfault)
   _M_narrow[static_cast<unsigned char>(__c)] = __t;
 return __t;
      }
# 955 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      const char_type*
      narrow(const char_type* __lo, const char_type* __hi,
      char __dfault, char* __to) const
      {
 if (__builtin_expect(_M_narrow_ok == 1, true))
   {
     __builtin_memcpy(__to, __lo, __hi - __lo);
     return __hi;
   }
 if (!_M_narrow_ok)
   _M_narrow_init();
 return this->do_narrow(__lo, __hi, __dfault, __to);
      }





      const mask*
      table() const throw()
      { return _M_table; }


      static const mask*
      classic_table() throw();
    protected:







      virtual
      ~ctype();
# 1004 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      virtual char_type
      do_toupper(char_type __c) const;
# 1021 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      virtual const char_type*
      do_toupper(char_type* __lo, const char_type* __hi) const;
# 1037 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      virtual char_type
      do_tolower(char_type __c) const;
# 1054 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      virtual const char_type*
      do_tolower(char_type* __lo, const char_type* __hi) const;
# 1074 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      virtual char_type
      do_widen(char __c) const
      { return __c; }
# 1097 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      virtual const char*
      do_widen(const char* __lo, const char* __hi, char_type* __to) const
      {
 __builtin_memcpy(__to, __lo, __hi - __lo);
 return __hi;
      }
# 1123 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      virtual char
      do_narrow(char_type __c, char __dfault) const
      { return __c; }
# 1149 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      virtual const char_type*
      do_narrow(const char_type* __lo, const char_type* __hi,
  char __dfault, char* __to) const
      {
 __builtin_memcpy(__to, __lo, __hi - __lo);
 return __hi;
      }

    private:
      void _M_narrow_init() const;
      void _M_widen_init() const;
    };
# 1174 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
  template<>
    class ctype<wchar_t> : public __ctype_abstract_base<wchar_t>
    {
    public:


      typedef wchar_t char_type;
      typedef wctype_t __wmask_type;

    protected:
      __c_locale _M_c_locale_ctype;


      bool _M_narrow_ok;
      char _M_narrow[128];
      wint_t _M_widen[1 + static_cast<unsigned char>(-1)];


      mask _M_bit[16];
      __wmask_type _M_wmask[16];

    public:


      static locale::id id;
# 1207 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      explicit
      ctype(size_t __refs = 0);
# 1218 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      explicit
      ctype(__c_locale __cloc, size_t __refs = 0);

    protected:
      __wmask_type
      _M_convert_to_wmask(const mask __m) const throw();


      virtual
      ~ctype();
# 1242 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      virtual bool
      do_is(mask __m, char_type __c) const;
# 1261 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      virtual const char_type*
      do_is(const char_type* __lo, const char_type* __hi, mask* __vec) const;
# 1279 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      virtual const char_type*
      do_scan_is(mask __m, const char_type* __lo, const char_type* __hi) const;
# 1297 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      virtual const char_type*
      do_scan_not(mask __m, const char_type* __lo,
    const char_type* __hi) const;
# 1314 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      virtual char_type
      do_toupper(char_type __c) const;
# 1331 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      virtual const char_type*
      do_toupper(char_type* __lo, const char_type* __hi) const;
# 1347 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      virtual char_type
      do_tolower(char_type __c) const;
# 1364 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      virtual const char_type*
      do_tolower(char_type* __lo, const char_type* __hi) const;
# 1384 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      virtual char_type
      do_widen(char __c) const;
# 1406 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      virtual const char*
      do_widen(const char* __lo, const char* __hi, char_type* __to) const;
# 1429 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      virtual char
      do_narrow(char_type __c, char __dfault) const;
# 1455 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      virtual const char_type*
      do_narrow(const char_type* __lo, const char_type* __hi,
  char __dfault, char* __to) const;


      void
      _M_initialize_ctype() throw();
    };



  template<typename _CharT>
    class ctype_byname : public ctype<_CharT>
    {
    public:
      typedef typename ctype<_CharT>::mask mask;

      explicit
      ctype_byname(const char* __s, size_t __refs = 0);

    protected:
      virtual
      ~ctype_byname() { };
    };


  template<>
    class ctype_byname<char> : public ctype<char>
    {
    public:
      explicit
      ctype_byname(const char* __s, size_t __refs = 0);

    protected:
      virtual
      ~ctype_byname();
    };


  template<>
    class ctype_byname<wchar_t> : public ctype<wchar_t>
    {
    public:
      explicit
      ctype_byname(const char* __s, size_t __refs = 0);

    protected:
      virtual
      ~ctype_byname();
    };



}


# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/x86_64-suse-linux/bits/ctype_inline.h" 1 3
# 37 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/x86_64-suse-linux/bits/ctype_inline.h" 3
namespace std __attribute__ ((__visibility__ ("default")))
{


  bool
  ctype<char>::
  is(mask __m, char __c) const
  { return _M_table[static_cast<unsigned char>(__c)] & __m; }

  const char*
  ctype<char>::
  is(const char* __low, const char* __high, mask* __vec) const
  {
    while (__low < __high)
      *__vec++ = _M_table[static_cast<unsigned char>(*__low++)];
    return __high;
  }

  const char*
  ctype<char>::
  scan_is(mask __m, const char* __low, const char* __high) const
  {
    while (__low < __high
    && !(_M_table[static_cast<unsigned char>(*__low)] & __m))
      ++__low;
    return __low;
  }

  const char*
  ctype<char>::
  scan_not(mask __m, const char* __low, const char* __high) const
  {
    while (__low < __high
    && (_M_table[static_cast<unsigned char>(*__low)] & __m) != 0)
      ++__low;
    return __low;
  }


}
# 1512 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 2 3

namespace std __attribute__ ((__visibility__ ("default")))
{



  class __num_base
  {
  public:


    enum
      {
 _S_ominus,
 _S_oplus,
 _S_ox,
 _S_oX,
 _S_odigits,
 _S_odigits_end = _S_odigits + 16,
 _S_oudigits = _S_odigits_end,
 _S_oudigits_end = _S_oudigits + 16,
 _S_oe = _S_odigits + 14,
 _S_oE = _S_oudigits + 14,
 _S_oend = _S_oudigits_end
      };






    static const char* _S_atoms_out;



    static const char* _S_atoms_in;

    enum
    {
      _S_iminus,
      _S_iplus,
      _S_ix,
      _S_iX,
      _S_izero,
      _S_ie = _S_izero + 14,
      _S_iE = _S_izero + 20,
      _S_iend = 26
    };



    static void
    _S_format_float(const ios_base& __io, char* __fptr, char __mod) throw();
  };

  template<typename _CharT>
    struct __numpunct_cache : public locale::facet
    {
      const char* _M_grouping;
      size_t _M_grouping_size;
      bool _M_use_grouping;
      const _CharT* _M_truename;
      size_t _M_truename_size;
      const _CharT* _M_falsename;
      size_t _M_falsename_size;
      _CharT _M_decimal_point;
      _CharT _M_thousands_sep;





      _CharT _M_atoms_out[__num_base::_S_oend];





      _CharT _M_atoms_in[__num_base::_S_iend];

      bool _M_allocated;

      __numpunct_cache(size_t __refs = 0)
      : facet(__refs), _M_grouping(0), _M_grouping_size(0),
 _M_use_grouping(false),
 _M_truename(0), _M_truename_size(0), _M_falsename(0),
 _M_falsename_size(0), _M_decimal_point(_CharT()),
 _M_thousands_sep(_CharT()), _M_allocated(false)
 { }

      ~__numpunct_cache();

      void
      _M_cache(const locale& __loc);

    private:
      __numpunct_cache&
      operator=(const __numpunct_cache&);

      explicit
      __numpunct_cache(const __numpunct_cache&);
    };

  template<typename _CharT>
    __numpunct_cache<_CharT>::~__numpunct_cache()
    {
      if (_M_allocated)
 {
   delete [] _M_grouping;
   delete [] _M_truename;
   delete [] _M_falsename;
 }
    }
# 1640 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
  template<typename _CharT>
    class numpunct : public locale::facet
    {
    public:



      typedef _CharT char_type;
      typedef basic_string<_CharT> string_type;

      typedef __numpunct_cache<_CharT> __cache_type;

    protected:
      __cache_type* _M_data;

    public:

      static locale::id id;






      explicit
      numpunct(size_t __refs = 0)
      : facet(__refs), _M_data(0)
      { _M_initialize_numpunct(); }
# 1678 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      explicit
      numpunct(__cache_type* __cache, size_t __refs = 0)
      : facet(__refs), _M_data(__cache)
      { _M_initialize_numpunct(); }
# 1692 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      explicit
      numpunct(__c_locale __cloc, size_t __refs = 0)
      : facet(__refs), _M_data(0)
      { _M_initialize_numpunct(__cloc); }
# 1706 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      char_type
      decimal_point() const
      { return this->do_decimal_point(); }
# 1719 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      char_type
      thousands_sep() const
      { return this->do_thousands_sep(); }
# 1750 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      string
      grouping() const
      { return this->do_grouping(); }
# 1763 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      string_type
      truename() const
      { return this->do_truename(); }
# 1776 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      string_type
      falsename() const
      { return this->do_falsename(); }

    protected:

      virtual
      ~numpunct();
# 1793 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      virtual char_type
      do_decimal_point() const
      { return _M_data->_M_decimal_point; }
# 1805 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      virtual char_type
      do_thousands_sep() const
      { return _M_data->_M_thousands_sep; }
# 1818 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      virtual string
      do_grouping() const
      { return _M_data->_M_grouping; }
# 1831 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      virtual string_type
      do_truename() const
      { return _M_data->_M_truename; }
# 1844 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      virtual string_type
      do_falsename() const
      { return _M_data->_M_falsename; }


      void
      _M_initialize_numpunct(__c_locale __cloc = 0);
    };

  template<typename _CharT>
    locale::id numpunct<_CharT>::id;

  template<>
    numpunct<char>::~numpunct();

  template<>
    void
    numpunct<char>::_M_initialize_numpunct(__c_locale __cloc);


  template<>
    numpunct<wchar_t>::~numpunct();

  template<>
    void
    numpunct<wchar_t>::_M_initialize_numpunct(__c_locale __cloc);



  template<typename _CharT>
    class numpunct_byname : public numpunct<_CharT>
    {
    public:
      typedef _CharT char_type;
      typedef basic_string<_CharT> string_type;

      explicit
      numpunct_byname(const char* __s, size_t __refs = 0)
      : numpunct<_CharT>(__refs)
      {
 if (__builtin_strcmp(__s, "C") != 0
     && __builtin_strcmp(__s, "POSIX") != 0)
   {
     __c_locale __tmp;
     this->_S_create_c_locale(__tmp, __s);
     this->_M_initialize_numpunct(__tmp);
     this->_S_destroy_c_locale(__tmp);
   }
      }

    protected:
      virtual
      ~numpunct_byname() { }
    };


# 1914 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
  template<typename _CharT, typename _InIter>
    class num_get : public locale::facet
    {
    public:



      typedef _CharT char_type;
      typedef _InIter iter_type;



      static locale::id id;
# 1935 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      explicit
      num_get(size_t __refs = 0) : facet(__refs) { }
# 1961 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      iter_type
      get(iter_type __in, iter_type __end, ios_base& __io,
   ios_base::iostate& __err, bool& __v) const
      { return this->do_get(__in, __end, __io, __err, __v); }
# 1998 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      iter_type
      get(iter_type __in, iter_type __end, ios_base& __io,
   ios_base::iostate& __err, long& __v) const
      { return this->do_get(__in, __end, __io, __err, __v); }

      iter_type
      get(iter_type __in, iter_type __end, ios_base& __io,
   ios_base::iostate& __err, unsigned short& __v) const
      { return this->do_get(__in, __end, __io, __err, __v); }

      iter_type
      get(iter_type __in, iter_type __end, ios_base& __io,
   ios_base::iostate& __err, unsigned int& __v) const
      { return this->do_get(__in, __end, __io, __err, __v); }

      iter_type
      get(iter_type __in, iter_type __end, ios_base& __io,
   ios_base::iostate& __err, unsigned long& __v) const
      { return this->do_get(__in, __end, __io, __err, __v); }


      iter_type
      get(iter_type __in, iter_type __end, ios_base& __io,
   ios_base::iostate& __err, long long& __v) const
      { return this->do_get(__in, __end, __io, __err, __v); }

      iter_type
      get(iter_type __in, iter_type __end, ios_base& __io,
   ios_base::iostate& __err, unsigned long long& __v) const
      { return this->do_get(__in, __end, __io, __err, __v); }
# 2058 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      iter_type
      get(iter_type __in, iter_type __end, ios_base& __io,
   ios_base::iostate& __err, float& __v) const
      { return this->do_get(__in, __end, __io, __err, __v); }

      iter_type
      get(iter_type __in, iter_type __end, ios_base& __io,
   ios_base::iostate& __err, double& __v) const
      { return this->do_get(__in, __end, __io, __err, __v); }

      iter_type
      get(iter_type __in, iter_type __end, ios_base& __io,
   ios_base::iostate& __err, long double& __v) const
      { return this->do_get(__in, __end, __io, __err, __v); }
# 2101 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      iter_type
      get(iter_type __in, iter_type __end, ios_base& __io,
   ios_base::iostate& __err, void*& __v) const
      { return this->do_get(__in, __end, __io, __err, __v); }

    protected:

      virtual ~num_get() { }

      iter_type
      _M_extract_float(iter_type, iter_type, ios_base&, ios_base::iostate&,
         string&) const;

      template<typename _ValueT>
 iter_type
 _M_extract_int(iter_type, iter_type, ios_base&, ios_base::iostate&,
         _ValueT&) const;

      template<typename _CharT2>
      typename __gnu_cxx::__enable_if<__is_char<_CharT2>::__value, int>::__type
 _M_find(const _CharT2*, size_t __len, _CharT2 __c) const
 {
   int __ret = -1;
   if (__len <= 10)
     {
       if (__c >= _CharT2('0') && __c < _CharT2(_CharT2('0') + __len))
  __ret = __c - _CharT2('0');
     }
   else
     {
       if (__c >= _CharT2('0') && __c <= _CharT2('9'))
  __ret = __c - _CharT2('0');
       else if (__c >= _CharT2('a') && __c <= _CharT2('f'))
  __ret = 10 + (__c - _CharT2('a'));
       else if (__c >= _CharT2('A') && __c <= _CharT2('F'))
  __ret = 10 + (__c - _CharT2('A'));
     }
   return __ret;
 }

      template<typename _CharT2>
      typename __gnu_cxx::__enable_if<!__is_char<_CharT2>::__value,
          int>::__type
 _M_find(const _CharT2* __zero, size_t __len, _CharT2 __c) const
 {
   int __ret = -1;
   const char_type* __q = char_traits<_CharT2>::find(__zero, __len, __c);
   if (__q)
     {
       __ret = __q - __zero;
       if (__ret > 15)
  __ret -= 6;
     }
   return __ret;
 }
# 2172 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      virtual iter_type
      do_get(iter_type, iter_type, ios_base&, ios_base::iostate&, bool&) const;

      virtual iter_type
      do_get(iter_type __beg, iter_type __end, ios_base& __io,
      ios_base::iostate& __err, long& __v) const
      { return _M_extract_int(__beg, __end, __io, __err, __v); }

      virtual iter_type
      do_get(iter_type __beg, iter_type __end, ios_base& __io,
      ios_base::iostate& __err, unsigned short& __v) const
      { return _M_extract_int(__beg, __end, __io, __err, __v); }

      virtual iter_type
      do_get(iter_type __beg, iter_type __end, ios_base& __io,
      ios_base::iostate& __err, unsigned int& __v) const
      { return _M_extract_int(__beg, __end, __io, __err, __v); }

      virtual iter_type
      do_get(iter_type __beg, iter_type __end, ios_base& __io,
      ios_base::iostate& __err, unsigned long& __v) const
      { return _M_extract_int(__beg, __end, __io, __err, __v); }


      virtual iter_type
      do_get(iter_type __beg, iter_type __end, ios_base& __io,
      ios_base::iostate& __err, long long& __v) const
      { return _M_extract_int(__beg, __end, __io, __err, __v); }

      virtual iter_type
      do_get(iter_type __beg, iter_type __end, ios_base& __io,
      ios_base::iostate& __err, unsigned long long& __v) const
      { return _M_extract_int(__beg, __end, __io, __err, __v); }


      virtual iter_type
      do_get(iter_type, iter_type, ios_base&, ios_base::iostate&, float&) const;

      virtual iter_type
      do_get(iter_type, iter_type, ios_base&, ios_base::iostate&,
      double&) const;







      virtual iter_type
      do_get(iter_type, iter_type, ios_base&, ios_base::iostate&,
      long double&) const;


      virtual iter_type
      do_get(iter_type, iter_type, ios_base&, ios_base::iostate&, void*&) const;
# 2235 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
    };

  template<typename _CharT, typename _InIter>
    locale::id num_get<_CharT, _InIter>::id;
# 2253 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
  template<typename _CharT, typename _OutIter>
    class num_put : public locale::facet
    {
    public:



      typedef _CharT char_type;
      typedef _OutIter iter_type;



      static locale::id id;
# 2274 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      explicit
      num_put(size_t __refs = 0) : facet(__refs) { }
# 2292 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      iter_type
      put(iter_type __s, ios_base& __io, char_type __fill, bool __v) const
      { return this->do_put(__s, __io, __fill, __v); }
# 2334 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      iter_type
      put(iter_type __s, ios_base& __io, char_type __fill, long __v) const
      { return this->do_put(__s, __io, __fill, __v); }

      iter_type
      put(iter_type __s, ios_base& __io, char_type __fill,
   unsigned long __v) const
      { return this->do_put(__s, __io, __fill, __v); }


      iter_type
      put(iter_type __s, ios_base& __io, char_type __fill, long long __v) const
      { return this->do_put(__s, __io, __fill, __v); }

      iter_type
      put(iter_type __s, ios_base& __io, char_type __fill,
   unsigned long long __v) const
      { return this->do_put(__s, __io, __fill, __v); }
# 2397 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      iter_type
      put(iter_type __s, ios_base& __io, char_type __fill, double __v) const
      { return this->do_put(__s, __io, __fill, __v); }

      iter_type
      put(iter_type __s, ios_base& __io, char_type __fill,
   long double __v) const
      { return this->do_put(__s, __io, __fill, __v); }
# 2422 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      iter_type
      put(iter_type __s, ios_base& __io, char_type __fill,
   const void* __v) const
      { return this->do_put(__s, __io, __fill, __v); }

    protected:
      template<typename _ValueT>
 iter_type
 _M_insert_float(iter_type, ios_base& __io, char_type __fill,
   char __mod, _ValueT __v) const;

      void
      _M_group_float(const char* __grouping, size_t __grouping_size,
       char_type __sep, const char_type* __p, char_type* __new,
       char_type* __cs, int& __len) const;

      template<typename _ValueT>
 iter_type
 _M_insert_int(iter_type, ios_base& __io, char_type __fill,
        _ValueT __v) const;

      void
      _M_group_int(const char* __grouping, size_t __grouping_size,
     char_type __sep, ios_base& __io, char_type* __new,
     char_type* __cs, int& __len) const;

      void
      _M_pad(char_type __fill, streamsize __w, ios_base& __io,
      char_type* __new, const char_type* __cs, int& __len) const;


      virtual
      ~num_put() { };
# 2470 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 3
      virtual iter_type
      do_put(iter_type __s, ios_base& __io, char_type __fill, bool __v) const;

      virtual iter_type
      do_put(iter_type __s, ios_base& __io, char_type __fill, long __v) const
      { return _M_insert_int(__s, __io, __fill, __v); }

      virtual iter_type
      do_put(iter_type __s, ios_base& __io, char_type __fill,
      unsigned long __v) const
      { return _M_insert_int(__s, __io, __fill, __v); }


      virtual iter_type
      do_put(iter_type __s, ios_base& __io, char_type __fill,
      long long __v) const
      { return _M_insert_int(__s, __io, __fill, __v); }

      virtual iter_type
      do_put(iter_type __s, ios_base& __io, char_type __fill,
      unsigned long long __v) const
      { return _M_insert_int(__s, __io, __fill, __v); }


      virtual iter_type
      do_put(iter_type, ios_base&, char_type, double) const;






      virtual iter_type
      do_put(iter_type, ios_base&, char_type, long double) const;


      virtual iter_type
      do_put(iter_type, ios_base&, char_type, const void*) const;







    };

  template <typename _CharT, typename _OutIter>
    locale::id num_put<_CharT, _OutIter>::id;









  template<typename _CharT>
    inline bool
    isspace(_CharT __c, const locale& __loc)
    { return use_facet<ctype<_CharT> >(__loc).is(ctype_base::space, __c); }


  template<typename _CharT>
    inline bool
    isprint(_CharT __c, const locale& __loc)
    { return use_facet<ctype<_CharT> >(__loc).is(ctype_base::print, __c); }


  template<typename _CharT>
    inline bool
    iscntrl(_CharT __c, const locale& __loc)
    { return use_facet<ctype<_CharT> >(__loc).is(ctype_base::cntrl, __c); }


  template<typename _CharT>
    inline bool
    isupper(_CharT __c, const locale& __loc)
    { return use_facet<ctype<_CharT> >(__loc).is(ctype_base::upper, __c); }


  template<typename _CharT>
    inline bool
    islower(_CharT __c, const locale& __loc)
    { return use_facet<ctype<_CharT> >(__loc).is(ctype_base::lower, __c); }


  template<typename _CharT>
    inline bool
    isalpha(_CharT __c, const locale& __loc)
    { return use_facet<ctype<_CharT> >(__loc).is(ctype_base::alpha, __c); }


  template<typename _CharT>
    inline bool
    isdigit(_CharT __c, const locale& __loc)
    { return use_facet<ctype<_CharT> >(__loc).is(ctype_base::digit, __c); }


  template<typename _CharT>
    inline bool
    ispunct(_CharT __c, const locale& __loc)
    { return use_facet<ctype<_CharT> >(__loc).is(ctype_base::punct, __c); }


  template<typename _CharT>
    inline bool
    isxdigit(_CharT __c, const locale& __loc)
    { return use_facet<ctype<_CharT> >(__loc).is(ctype_base::xdigit, __c); }


  template<typename _CharT>
    inline bool
    isalnum(_CharT __c, const locale& __loc)
    { return use_facet<ctype<_CharT> >(__loc).is(ctype_base::alnum, __c); }


  template<typename _CharT>
    inline bool
    isgraph(_CharT __c, const locale& __loc)
    { return use_facet<ctype<_CharT> >(__loc).is(ctype_base::graph, __c); }


  template<typename _CharT>
    inline _CharT
    toupper(_CharT __c, const locale& __loc)
    { return use_facet<ctype<_CharT> >(__loc).toupper(__c); }


  template<typename _CharT>
    inline _CharT
    tolower(_CharT __c, const locale& __loc)
    { return use_facet<ctype<_CharT> >(__loc).tolower(__c); }


}

# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.tcc" 1 3
# 33 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.tcc" 3
       
# 34 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.tcc" 3

namespace std __attribute__ ((__visibility__ ("default")))
{




  template<typename _Facet>
    struct __use_cache
    {
      const _Facet*
      operator() (const locale& __loc) const;
    };


  template<typename _CharT>
    struct __use_cache<__numpunct_cache<_CharT> >
    {
      const __numpunct_cache<_CharT>*
      operator() (const locale& __loc) const
      {
 const size_t __i = numpunct<_CharT>::id._M_id();
 const locale::facet** __caches = __loc._M_impl->_M_caches;
 if (!__caches[__i])
   {
     __numpunct_cache<_CharT>* __tmp = 0;
     try
       {
  __tmp = new __numpunct_cache<_CharT>;
  __tmp->_M_cache(__loc);
       }
     catch(...)
       {
  delete __tmp;
  throw;
       }
     __loc._M_impl->_M_install_cache(__tmp, __i);
   }
 return static_cast<const __numpunct_cache<_CharT>*>(__caches[__i]);
      }
    };

  template<typename _CharT>
    void
    __numpunct_cache<_CharT>::_M_cache(const locale& __loc)
    {
      _M_allocated = true;

      const numpunct<_CharT>& __np = use_facet<numpunct<_CharT> >(__loc);

      char* __grouping = 0;
      _CharT* __truename = 0;
      _CharT* __falsename = 0;
      try
 {
   _M_grouping_size = __np.grouping().size();
   __grouping = new char[_M_grouping_size];
   __np.grouping().copy(__grouping, _M_grouping_size);
   _M_grouping = __grouping;
   _M_use_grouping = (_M_grouping_size
        && static_cast<signed char>(_M_grouping[0]) > 0
        && (_M_grouping[0]
     != __gnu_cxx::__numeric_traits<char>::__max));

   _M_truename_size = __np.truename().size();
   __truename = new _CharT[_M_truename_size];
   __np.truename().copy(__truename, _M_truename_size);
   _M_truename = __truename;

   _M_falsename_size = __np.falsename().size();
   __falsename = new _CharT[_M_falsename_size];
   __np.falsename().copy(__falsename, _M_falsename_size);
   _M_falsename = __falsename;

   _M_decimal_point = __np.decimal_point();
   _M_thousands_sep = __np.thousands_sep();

   const ctype<_CharT>& __ct = use_facet<ctype<_CharT> >(__loc);
   __ct.widen(__num_base::_S_atoms_out,
       __num_base::_S_atoms_out
       + __num_base::_S_oend, _M_atoms_out);
   __ct.widen(__num_base::_S_atoms_in,
       __num_base::_S_atoms_in
       + __num_base::_S_iend, _M_atoms_in);
 }
      catch(...)
 {
   delete [] __grouping;
   delete [] __truename;
   delete [] __falsename;
   throw;
 }
    }
# 136 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.tcc" 3
  __attribute__ ((__pure__)) bool
  __verify_grouping(const char* __grouping, size_t __grouping_size,
      const string& __grouping_tmp) throw ();



  template<typename _CharT, typename _InIter>
    _InIter
    num_get<_CharT, _InIter>::
    _M_extract_float(_InIter __beg, _InIter __end, ios_base& __io,
       ios_base::iostate& __err, string& __xtrc) const
    {
      typedef char_traits<_CharT> __traits_type;
      typedef __numpunct_cache<_CharT> __cache_type;
      __use_cache<__cache_type> __uc;
      const locale& __loc = __io._M_getloc();
      const __cache_type* __lc = __uc(__loc);
      const _CharT* __lit = __lc->_M_atoms_in;
      char_type __c = char_type();


      bool __testeof = __beg == __end;


      if (!__testeof)
 {
   __c = *__beg;
   const bool __plus = __c == __lit[__num_base::_S_iplus];
   if ((__plus || __c == __lit[__num_base::_S_iminus])
       && !(__lc->_M_use_grouping && __c == __lc->_M_thousands_sep)
       && !(__c == __lc->_M_decimal_point))
     {
       __xtrc += __plus ? '+' : '-';
       if (++__beg != __end)
  __c = *__beg;
       else
  __testeof = true;
     }
 }


      bool __found_mantissa = false;
      int __sep_pos = 0;
      while (!__testeof)
 {
   if ((__lc->_M_use_grouping && __c == __lc->_M_thousands_sep)
       || __c == __lc->_M_decimal_point)
     break;
   else if (__c == __lit[__num_base::_S_izero])
     {
       if (!__found_mantissa)
  {
    __xtrc += '0';
    __found_mantissa = true;
  }
       ++__sep_pos;

       if (++__beg != __end)
  __c = *__beg;
       else
  __testeof = true;
     }
   else
     break;
 }


      bool __found_dec = false;
      bool __found_sci = false;
      string __found_grouping;
      if (__lc->_M_use_grouping)
 __found_grouping.reserve(32);
      const char_type* __lit_zero = __lit + __num_base::_S_izero;

      if (!__lc->_M_allocated)

 while (!__testeof)
   {
     const int __digit = _M_find(__lit_zero, 10, __c);
     if (__digit != -1)
       {
  __xtrc += '0' + __digit;
  __found_mantissa = true;
       }
     else if (__c == __lc->_M_decimal_point
       && !__found_dec && !__found_sci)
       {
  __xtrc += '.';
  __found_dec = true;
       }
     else if ((__c == __lit[__num_base::_S_ie]
        || __c == __lit[__num_base::_S_iE])
       && !__found_sci && __found_mantissa)
       {

  __xtrc += 'e';
  __found_sci = true;


  if (++__beg != __end)
    {
      __c = *__beg;
      const bool __plus = __c == __lit[__num_base::_S_iplus];
      if (__plus || __c == __lit[__num_base::_S_iminus])
        __xtrc += __plus ? '+' : '-';
      else
        continue;
    }
  else
    {
      __testeof = true;
      break;
    }
       }
     else
       break;

     if (++__beg != __end)
       __c = *__beg;
     else
       __testeof = true;
   }
      else
 while (!__testeof)
   {


     if (__lc->_M_use_grouping && __c == __lc->_M_thousands_sep)
       {
  if (!__found_dec && !__found_sci)
    {


      if (__sep_pos)
        {
   __found_grouping += static_cast<char>(__sep_pos);
   __sep_pos = 0;
        }
      else
        {


   __xtrc.clear();
   break;
        }
    }
  else
    break;
       }
     else if (__c == __lc->_M_decimal_point)
       {
  if (!__found_dec && !__found_sci)
    {



      if (__found_grouping.size())
        __found_grouping += static_cast<char>(__sep_pos);
      __xtrc += '.';
      __found_dec = true;
    }
  else
    break;
       }
     else
       {
  const char_type* __q =
    __traits_type::find(__lit_zero, 10, __c);
  if (__q)
    {
      __xtrc += '0' + (__q - __lit_zero);
      __found_mantissa = true;
      ++__sep_pos;
    }
  else if ((__c == __lit[__num_base::_S_ie]
     || __c == __lit[__num_base::_S_iE])
    && !__found_sci && __found_mantissa)
    {

      if (__found_grouping.size() && !__found_dec)
        __found_grouping += static_cast<char>(__sep_pos);
      __xtrc += 'e';
      __found_sci = true;


      if (++__beg != __end)
        {
   __c = *__beg;
   const bool __plus = __c == __lit[__num_base::_S_iplus];
   if ((__plus || __c == __lit[__num_base::_S_iminus])
       && !(__lc->_M_use_grouping
     && __c == __lc->_M_thousands_sep)
       && !(__c == __lc->_M_decimal_point))
        __xtrc += __plus ? '+' : '-';
   else
     continue;
        }
      else
        {
   __testeof = true;
   break;
        }
    }
  else
    break;
       }

     if (++__beg != __end)
       __c = *__beg;
     else
       __testeof = true;
   }



      if (__found_grouping.size())
        {

   if (!__found_dec && !__found_sci)
     __found_grouping += static_cast<char>(__sep_pos);

          if (!std::__verify_grouping(__lc->_M_grouping,
          __lc->_M_grouping_size,
          __found_grouping))
     __err = ios_base::failbit;
        }

      return __beg;
    }

  template<typename _CharT, typename _InIter>
    template<typename _ValueT>
      _InIter
      num_get<_CharT, _InIter>::
      _M_extract_int(_InIter __beg, _InIter __end, ios_base& __io,
       ios_base::iostate& __err, _ValueT& __v) const
      {
        typedef char_traits<_CharT> __traits_type;
 using __gnu_cxx::__add_unsigned;
 typedef typename __add_unsigned<_ValueT>::__type __unsigned_type;
 typedef __numpunct_cache<_CharT> __cache_type;
 __use_cache<__cache_type> __uc;
 const locale& __loc = __io._M_getloc();
 const __cache_type* __lc = __uc(__loc);
 const _CharT* __lit = __lc->_M_atoms_in;
 char_type __c = char_type();


 const ios_base::fmtflags __basefield = __io.flags()
                                        & ios_base::basefield;
 const bool __oct = __basefield == ios_base::oct;
 int __base = __oct ? 8 : (__basefield == ios_base::hex ? 16 : 10);


 bool __testeof = __beg == __end;


 bool __negative = false;
 if (!__testeof)
   {
     __c = *__beg;
     __negative = __c == __lit[__num_base::_S_iminus];
     if ((__negative || __c == __lit[__num_base::_S_iplus])
  && !(__lc->_M_use_grouping && __c == __lc->_M_thousands_sep)
  && !(__c == __lc->_M_decimal_point))
       {
  if (++__beg != __end)
    __c = *__beg;
  else
    __testeof = true;
       }
   }



 bool __found_zero = false;
 int __sep_pos = 0;
 while (!__testeof)
   {
     if ((__lc->_M_use_grouping && __c == __lc->_M_thousands_sep)
  || __c == __lc->_M_decimal_point)
       break;
     else if (__c == __lit[__num_base::_S_izero]
       && (!__found_zero || __base == 10))
       {
  __found_zero = true;
  ++__sep_pos;
  if (__basefield == 0)
    __base = 8;
  if (__base == 8)
    __sep_pos = 0;
       }
     else if (__found_zero
       && (__c == __lit[__num_base::_S_ix]
    || __c == __lit[__num_base::_S_iX]))
       {
  if (__basefield == 0)
    __base = 16;
  if (__base == 16)
    {
      __found_zero = false;
      __sep_pos = 0;
    }
  else
    break;
       }
     else
       break;

     if (++__beg != __end)
       {
  __c = *__beg;
  if (!__found_zero)
    break;
       }
     else
       __testeof = true;
   }



 const size_t __len = (__base == 16 ? __num_base::_S_iend
         - __num_base::_S_izero : __base);


 string __found_grouping;
 if (__lc->_M_use_grouping)
   __found_grouping.reserve(32);
 bool __testfail = false;
 bool __testoverflow = false;
 const __unsigned_type __max =
   (__negative && __gnu_cxx::__numeric_traits<_ValueT>::__is_signed)
   ? -__gnu_cxx::__numeric_traits<_ValueT>::__min
   : __gnu_cxx::__numeric_traits<_ValueT>::__max;
 const __unsigned_type __smax = __max / __base;
 __unsigned_type __result = 0;
 int __digit = 0;
 const char_type* __lit_zero = __lit + __num_base::_S_izero;

 if (!__lc->_M_allocated)

   while (!__testeof)
     {
       __digit = _M_find(__lit_zero, __len, __c);
       if (__digit == -1)
  break;

       if (__result > __smax)
  __testoverflow = true;
       else
  {
    __result *= __base;
    __testoverflow |= __result > __max - __digit;
    __result += __digit;
    ++__sep_pos;
  }

       if (++__beg != __end)
  __c = *__beg;
       else
  __testeof = true;
     }
 else
   while (!__testeof)
     {


       if (__lc->_M_use_grouping && __c == __lc->_M_thousands_sep)
  {


    if (__sep_pos)
      {
        __found_grouping += static_cast<char>(__sep_pos);
        __sep_pos = 0;
      }
    else
      {
        __testfail = true;
        break;
      }
  }
       else if (__c == __lc->_M_decimal_point)
  break;
       else
  {
    const char_type* __q =
      __traits_type::find(__lit_zero, __len, __c);
    if (!__q)
      break;

    __digit = __q - __lit_zero;
    if (__digit > 15)
      __digit -= 6;
    if (__result > __smax)
      __testoverflow = true;
    else
      {
        __result *= __base;
        __testoverflow |= __result > __max - __digit;
        __result += __digit;
        ++__sep_pos;
      }
  }

       if (++__beg != __end)
  __c = *__beg;
       else
  __testeof = true;
     }



 if (__found_grouping.size())
   {

     __found_grouping += static_cast<char>(__sep_pos);

     if (!std::__verify_grouping(__lc->_M_grouping,
     __lc->_M_grouping_size,
     __found_grouping))
       __err = ios_base::failbit;
   }



 if ((!__sep_pos && !__found_zero && !__found_grouping.size())
     || __testfail)
   {
     __v = 0;
     __err = ios_base::failbit;
   }
 else if (__testoverflow)
   {
     if (__negative
  && __gnu_cxx::__numeric_traits<_ValueT>::__is_signed)
       __v = __gnu_cxx::__numeric_traits<_ValueT>::__min;
     else
       __v = __gnu_cxx::__numeric_traits<_ValueT>::__max;
     __err = ios_base::failbit;
   }
 else
   __v = __negative ? -__result : __result;

 if (__testeof)
   __err |= ios_base::eofbit;
 return __beg;
      }



  template<typename _CharT, typename _InIter>
    _InIter
    num_get<_CharT, _InIter>::
    do_get(iter_type __beg, iter_type __end, ios_base& __io,
           ios_base::iostate& __err, bool& __v) const
    {
      if (!(__io.flags() & ios_base::boolalpha))
        {



   long __l = -1;
          __beg = _M_extract_int(__beg, __end, __io, __err, __l);
   if (__l == 0 || __l == 1)
     __v = bool(__l);
   else
     {


       __v = true;
       __err = ios_base::failbit;
       if (__beg == __end)
  __err |= ios_base::eofbit;
     }
        }
      else
        {

   typedef __numpunct_cache<_CharT> __cache_type;
   __use_cache<__cache_type> __uc;
   const locale& __loc = __io._M_getloc();
   const __cache_type* __lc = __uc(__loc);

   bool __testf = true;
   bool __testt = true;
   bool __donef = __lc->_M_falsename_size == 0;
   bool __donet = __lc->_M_truename_size == 0;
   bool __testeof = false;
   size_t __n = 0;
   while (!__donef || !__donet)
     {
       if (__beg == __end)
  {
    __testeof = true;
    break;
  }

       const char_type __c = *__beg;

       if (!__donef)
  __testf = __c == __lc->_M_falsename[__n];

       if (!__testf && __donet)
  break;

       if (!__donet)
  __testt = __c == __lc->_M_truename[__n];

       if (!__testt && __donef)
  break;

       if (!__testt && !__testf)
  break;

       ++__n;
       ++__beg;

       __donef = !__testf || __n >= __lc->_M_falsename_size;
       __donet = !__testt || __n >= __lc->_M_truename_size;
     }
   if (__testf && __n == __lc->_M_falsename_size && __n)
     {
       __v = false;
       if (__testt && __n == __lc->_M_truename_size)
  __err = ios_base::failbit;
       else
  __err = __testeof ? ios_base::eofbit : ios_base::goodbit;
     }
   else if (__testt && __n == __lc->_M_truename_size && __n)
     {
       __v = true;
       __err = __testeof ? ios_base::eofbit : ios_base::goodbit;
     }
   else
     {


       __v = false;
       __err = ios_base::failbit;
       if (__testeof)
  __err |= ios_base::eofbit;
     }
 }
      return __beg;
    }

  template<typename _CharT, typename _InIter>
    _InIter
    num_get<_CharT, _InIter>::
    do_get(iter_type __beg, iter_type __end, ios_base& __io,
    ios_base::iostate& __err, float& __v) const
    {
      string __xtrc;
      __xtrc.reserve(32);
      __beg = _M_extract_float(__beg, __end, __io, __err, __xtrc);
      std::__convert_to_v(__xtrc.c_str(), __v, __err, _S_get_c_locale());
      if (__beg == __end)
 __err |= ios_base::eofbit;
      return __beg;
    }

  template<typename _CharT, typename _InIter>
    _InIter
    num_get<_CharT, _InIter>::
    do_get(iter_type __beg, iter_type __end, ios_base& __io,
           ios_base::iostate& __err, double& __v) const
    {
      string __xtrc;
      __xtrc.reserve(32);
      __beg = _M_extract_float(__beg, __end, __io, __err, __xtrc);
      std::__convert_to_v(__xtrc.c_str(), __v, __err, _S_get_c_locale());
      if (__beg == __end)
 __err |= ios_base::eofbit;
      return __beg;
    }
# 730 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.tcc" 3
  template<typename _CharT, typename _InIter>
    _InIter
    num_get<_CharT, _InIter>::
    do_get(iter_type __beg, iter_type __end, ios_base& __io,
           ios_base::iostate& __err, long double& __v) const
    {
      string __xtrc;
      __xtrc.reserve(32);
      __beg = _M_extract_float(__beg, __end, __io, __err, __xtrc);
      std::__convert_to_v(__xtrc.c_str(), __v, __err, _S_get_c_locale());
      if (__beg == __end)
 __err |= ios_base::eofbit;
      return __beg;
    }

  template<typename _CharT, typename _InIter>
    _InIter
    num_get<_CharT, _InIter>::
    do_get(iter_type __beg, iter_type __end, ios_base& __io,
           ios_base::iostate& __err, void*& __v) const
    {

      typedef ios_base::fmtflags fmtflags;
      const fmtflags __fmt = __io.flags();
      __io.flags((__fmt & ~ios_base::basefield) | ios_base::hex);

      typedef __gnu_cxx::__conditional_type<(sizeof(void*)
          <= sizeof(unsigned long)),
 unsigned long, unsigned long long>::__type _UIntPtrType;

      _UIntPtrType __ul;
      __beg = _M_extract_int(__beg, __end, __io, __err, __ul);


      __io.flags(__fmt);

      __v = reinterpret_cast<void*>(__ul);
      return __beg;
    }



  template<typename _CharT, typename _OutIter>
    void
    num_put<_CharT, _OutIter>::
    _M_pad(_CharT __fill, streamsize __w, ios_base& __io,
    _CharT* __new, const _CharT* __cs, int& __len) const
    {


      __pad<_CharT, char_traits<_CharT> >::_S_pad(__io, __fill, __new,
        __cs, __w, __len);
      __len = static_cast<int>(__w);
    }



  template<typename _CharT, typename _ValueT>
    int
    __int_to_char(_CharT* __bufend, _ValueT __v, const _CharT* __lit,
    ios_base::fmtflags __flags, bool __dec)
    {
      _CharT* __buf = __bufend;
      if (__builtin_expect(__dec, true))
 {

   do
     {
       *--__buf = __lit[(__v % 10) + __num_base::_S_odigits];
       __v /= 10;
     }
   while (__v != 0);
 }
      else if ((__flags & ios_base::basefield) == ios_base::oct)
 {

   do
     {
       *--__buf = __lit[(__v & 0x7) + __num_base::_S_odigits];
       __v >>= 3;
     }
   while (__v != 0);
 }
      else
 {

   const bool __uppercase = __flags & ios_base::uppercase;
   const int __case_offset = __uppercase ? __num_base::_S_oudigits
                                         : __num_base::_S_odigits;
   do
     {
       *--__buf = __lit[(__v & 0xf) + __case_offset];
       __v >>= 4;
     }
   while (__v != 0);
 }
      return __bufend - __buf;
    }



  template<typename _CharT, typename _OutIter>
    void
    num_put<_CharT, _OutIter>::
    _M_group_int(const char* __grouping, size_t __grouping_size, _CharT __sep,
   ios_base&, _CharT* __new, _CharT* __cs, int& __len) const
    {
      _CharT* __p = std::__add_grouping(__new, __sep, __grouping,
     __grouping_size, __cs, __cs + __len);
      __len = __p - __new;
    }

  template<typename _CharT, typename _OutIter>
    template<typename _ValueT>
      _OutIter
      num_put<_CharT, _OutIter>::
      _M_insert_int(_OutIter __s, ios_base& __io, _CharT __fill,
      _ValueT __v) const
      {
 using __gnu_cxx::__add_unsigned;
 typedef typename __add_unsigned<_ValueT>::__type __unsigned_type;
 typedef __numpunct_cache<_CharT> __cache_type;
 __use_cache<__cache_type> __uc;
 const locale& __loc = __io._M_getloc();
 const __cache_type* __lc = __uc(__loc);
 const _CharT* __lit = __lc->_M_atoms_out;
 const ios_base::fmtflags __flags = __io.flags();


 const int __ilen = 5 * sizeof(_ValueT);
 _CharT* __cs = static_cast<_CharT*>(__builtin_alloca(sizeof(_CharT)
            * __ilen));



 const ios_base::fmtflags __basefield = __flags & ios_base::basefield;
 const bool __dec = (__basefield != ios_base::oct
       && __basefield != ios_base::hex);
 const __unsigned_type __u = ((__v > 0 || !__dec)
         ? __unsigned_type(__v)
         : -__unsigned_type(__v));
  int __len = __int_to_char(__cs + __ilen, __u, __lit, __flags, __dec);
 __cs += __ilen - __len;


 if (__lc->_M_use_grouping)
   {


     _CharT* __cs2 = static_cast<_CharT*>(__builtin_alloca(sizeof(_CharT)
          * (__len + 1)
          * 2));
     _M_group_int(__lc->_M_grouping, __lc->_M_grouping_size,
    __lc->_M_thousands_sep, __io, __cs2 + 2, __cs, __len);
     __cs = __cs2 + 2;
   }


 if (__builtin_expect(__dec, true))
   {

     if (__v >= 0)
       {
  if (bool(__flags & ios_base::showpos)
      && __gnu_cxx::__numeric_traits<_ValueT>::__is_signed)
    *--__cs = __lit[__num_base::_S_oplus], ++__len;
       }
     else
       *--__cs = __lit[__num_base::_S_ominus], ++__len;
   }
 else if (bool(__flags & ios_base::showbase) && __v)
   {
     if (__basefield == ios_base::oct)
       *--__cs = __lit[__num_base::_S_odigits], ++__len;
     else
       {

  const bool __uppercase = __flags & ios_base::uppercase;
  *--__cs = __lit[__num_base::_S_ox + __uppercase];

  *--__cs = __lit[__num_base::_S_odigits];
  __len += 2;
       }
   }


 const streamsize __w = __io.width();
 if (__w > static_cast<streamsize>(__len))
   {
     _CharT* __cs3 = static_cast<_CharT*>(__builtin_alloca(sizeof(_CharT)
          * __w));
     _M_pad(__fill, __w, __io, __cs3, __cs, __len);
     __cs = __cs3;
   }
 __io.width(0);



 return std::__write(__s, __cs, __len);
      }

  template<typename _CharT, typename _OutIter>
    void
    num_put<_CharT, _OutIter>::
    _M_group_float(const char* __grouping, size_t __grouping_size,
     _CharT __sep, const _CharT* __p, _CharT* __new,
     _CharT* __cs, int& __len) const
    {



      const int __declen = __p ? __p - __cs : __len;
      _CharT* __p2 = std::__add_grouping(__new, __sep, __grouping,
      __grouping_size,
      __cs, __cs + __declen);


      int __newlen = __p2 - __new;
      if (__p)
 {
   char_traits<_CharT>::copy(__p2, __p, __len - __declen);
   __newlen += __len - __declen;
 }
      __len = __newlen;
    }
# 966 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.tcc" 3
  template<typename _CharT, typename _OutIter>
    template<typename _ValueT>
      _OutIter
      num_put<_CharT, _OutIter>::
      _M_insert_float(_OutIter __s, ios_base& __io, _CharT __fill, char __mod,
         _ValueT __v) const
      {
 typedef __numpunct_cache<_CharT> __cache_type;
 __use_cache<__cache_type> __uc;
 const locale& __loc = __io._M_getloc();
 const __cache_type* __lc = __uc(__loc);


 const streamsize __prec = __io.precision() < 0 ? 6 : __io.precision();

 const int __max_digits =
   __gnu_cxx::__numeric_traits<_ValueT>::__digits10;


 int __len;

 char __fbuf[16];
 __num_base::_S_format_float(__io, __fbuf, __mod);




 int __cs_size = __max_digits * 3;
 char* __cs = static_cast<char*>(__builtin_alloca(__cs_size));
 __len = std::__convert_from_v(_S_get_c_locale(), __cs, __cs_size,
          __fbuf, __prec, __v);


 if (__len >= __cs_size)
   {
     __cs_size = __len + 1;
     __cs = static_cast<char*>(__builtin_alloca(__cs_size));
     __len = std::__convert_from_v(_S_get_c_locale(), __cs, __cs_size,
       __fbuf, __prec, __v);
   }
# 1027 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.tcc" 3
 const ctype<_CharT>& __ctype = use_facet<ctype<_CharT> >(__loc);

 _CharT* __ws = static_cast<_CharT*>(__builtin_alloca(sizeof(_CharT)
            * __len));
 __ctype.widen(__cs, __cs + __len, __ws);


 _CharT* __wp = 0;
 const char* __p = char_traits<char>::find(__cs, __len, '.');
 if (__p)
   {
     __wp = __ws + (__p - __cs);
     *__wp = __lc->_M_decimal_point;
   }




 if (__lc->_M_use_grouping
     && (__wp || __len < 3 || (__cs[1] <= '9' && __cs[2] <= '9'
          && __cs[1] >= '0' && __cs[2] >= '0')))
   {


     _CharT* __ws2 = static_cast<_CharT*>(__builtin_alloca(sizeof(_CharT)
          * __len * 2));

     streamsize __off = 0;
     if (__cs[0] == '-' || __cs[0] == '+')
       {
  __off = 1;
  __ws2[0] = __ws[0];
  __len -= 1;
       }

     _M_group_float(__lc->_M_grouping, __lc->_M_grouping_size,
      __lc->_M_thousands_sep, __wp, __ws2 + __off,
      __ws + __off, __len);
     __len += __off;

     __ws = __ws2;
   }


 const streamsize __w = __io.width();
 if (__w > static_cast<streamsize>(__len))
   {
     _CharT* __ws3 = static_cast<_CharT*>(__builtin_alloca(sizeof(_CharT)
          * __w));
     _M_pad(__fill, __w, __io, __ws3, __ws, __len);
     __ws = __ws3;
   }
 __io.width(0);



 return std::__write(__s, __ws, __len);
      }

  template<typename _CharT, typename _OutIter>
    _OutIter
    num_put<_CharT, _OutIter>::
    do_put(iter_type __s, ios_base& __io, char_type __fill, bool __v) const
    {
      const ios_base::fmtflags __flags = __io.flags();
      if ((__flags & ios_base::boolalpha) == 0)
        {
          const long __l = __v;
          __s = _M_insert_int(__s, __io, __fill, __l);
        }
      else
        {
   typedef __numpunct_cache<_CharT> __cache_type;
   __use_cache<__cache_type> __uc;
   const locale& __loc = __io._M_getloc();
   const __cache_type* __lc = __uc(__loc);

   const _CharT* __name = __v ? __lc->_M_truename
                              : __lc->_M_falsename;
   int __len = __v ? __lc->_M_truename_size
                   : __lc->_M_falsename_size;

   const streamsize __w = __io.width();
   if (__w > static_cast<streamsize>(__len))
     {
       const streamsize __plen = __w - __len;
       _CharT* __ps
  = static_cast<_CharT*>(__builtin_alloca(sizeof(_CharT)
       * __plen));

       char_traits<_CharT>::assign(__ps, __plen, __fill);
       __io.width(0);

       if ((__flags & ios_base::adjustfield) == ios_base::left)
  {
    __s = std::__write(__s, __name, __len);
    __s = std::__write(__s, __ps, __plen);
  }
       else
  {
    __s = std::__write(__s, __ps, __plen);
    __s = std::__write(__s, __name, __len);
  }
       return __s;
     }
   __io.width(0);
   __s = std::__write(__s, __name, __len);
 }
      return __s;
    }

  template<typename _CharT, typename _OutIter>
    _OutIter
    num_put<_CharT, _OutIter>::
    do_put(iter_type __s, ios_base& __io, char_type __fill, double __v) const
    { return _M_insert_float(__s, __io, __fill, char(), __v); }
# 1152 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.tcc" 3
  template<typename _CharT, typename _OutIter>
    _OutIter
    num_put<_CharT, _OutIter>::
    do_put(iter_type __s, ios_base& __io, char_type __fill,
    long double __v) const
    { return _M_insert_float(__s, __io, __fill, 'L', __v); }

  template<typename _CharT, typename _OutIter>
    _OutIter
    num_put<_CharT, _OutIter>::
    do_put(iter_type __s, ios_base& __io, char_type __fill,
           const void* __v) const
    {
      const ios_base::fmtflags __flags = __io.flags();
      const ios_base::fmtflags __fmt = ~(ios_base::basefield
      | ios_base::uppercase);
      __io.flags((__flags & __fmt) | (ios_base::hex | ios_base::showbase));

      typedef __gnu_cxx::__conditional_type<(sizeof(const void*)
          <= sizeof(unsigned long)),
 unsigned long, unsigned long long>::__type _UIntPtrType;

      __s = _M_insert_int(__s, __io, __fill,
     reinterpret_cast<_UIntPtrType>(__v));
      __io.flags(__flags);
      return __s;
    }


# 1189 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.tcc" 3
  template<typename _CharT, typename _Traits>
    void
    __pad<_CharT, _Traits>::_S_pad(ios_base& __io, _CharT __fill,
       _CharT* __news, const _CharT* __olds,
       streamsize __newlen, streamsize __oldlen)
    {
      const size_t __plen = static_cast<size_t>(__newlen - __oldlen);
      const ios_base::fmtflags __adjust = __io.flags() & ios_base::adjustfield;


      if (__adjust == ios_base::left)
 {
   _Traits::copy(__news, __olds, __oldlen);
   _Traits::assign(__news + __oldlen, __plen, __fill);
   return;
 }

      size_t __mod = 0;
      if (__adjust == ios_base::internal)
 {



          const locale& __loc = __io._M_getloc();
   const ctype<_CharT>& __ctype = use_facet<ctype<_CharT> >(__loc);

   if (__ctype.widen('-') == __olds[0]
       || __ctype.widen('+') == __olds[0])
     {
       __news[0] = __olds[0];
       __mod = 1;
       ++__news;
     }
   else if (__ctype.widen('0') == __olds[0]
     && __oldlen > 1
     && (__ctype.widen('x') == __olds[1]
         || __ctype.widen('X') == __olds[1]))
     {
       __news[0] = __olds[0];
       __news[1] = __olds[1];
       __mod = 2;
       __news += 2;
     }

 }
      _Traits::assign(__news, __plen, __fill);
      _Traits::copy(__news + __plen, __olds + __mod, __oldlen - __mod);
    }

  template<typename _CharT>
    _CharT*
    __add_grouping(_CharT* __s, _CharT __sep,
     const char* __gbeg, size_t __gsize,
     const _CharT* __first, const _CharT* __last)
    {
      size_t __idx = 0;
      size_t __ctr = 0;

      while (__last - __first > __gbeg[__idx]
      && static_cast<signed char>(__gbeg[__idx]) > 0
      && __gbeg[__idx] != __gnu_cxx::__numeric_traits<char>::__max)
 {
   __last -= __gbeg[__idx];
   __idx < __gsize - 1 ? ++__idx : ++__ctr;
 }

      while (__first != __last)
 *__s++ = *__first++;

      while (__ctr--)
 {
   *__s++ = __sep;
   for (char __i = __gbeg[__idx]; __i > 0; --__i)
     *__s++ = *__first++;
 }

      while (__idx--)
 {
   *__s++ = __sep;
   for (char __i = __gbeg[__idx]; __i > 0; --__i)
     *__s++ = *__first++;
 }

      return __s;
    }




  extern template class numpunct<char>;
  extern template class numpunct_byname<char>;
  extern template class num_get<char>;
  extern template class num_put<char>;
  extern template class ctype_byname<char>;

  extern template
    const ctype<char>&
    use_facet<ctype<char> >(const locale&);

  extern template
    const numpunct<char>&
    use_facet<numpunct<char> >(const locale&);

  extern template
    const num_put<char>&
    use_facet<num_put<char> >(const locale&);

  extern template
    const num_get<char>&
    use_facet<num_get<char> >(const locale&);

  extern template
    bool
    has_facet<ctype<char> >(const locale&);

  extern template
    bool
    has_facet<numpunct<char> >(const locale&);

  extern template
    bool
    has_facet<num_put<char> >(const locale&);

  extern template
    bool
    has_facet<num_get<char> >(const locale&);


  extern template class numpunct<wchar_t>;
  extern template class numpunct_byname<wchar_t>;
  extern template class num_get<wchar_t>;
  extern template class num_put<wchar_t>;
  extern template class ctype_byname<wchar_t>;

  extern template
    const ctype<wchar_t>&
    use_facet<ctype<wchar_t> >(const locale&);

  extern template
    const numpunct<wchar_t>&
    use_facet<numpunct<wchar_t> >(const locale&);

  extern template
    const num_put<wchar_t>&
    use_facet<num_put<wchar_t> >(const locale&);

  extern template
    const num_get<wchar_t>&
    use_facet<num_get<wchar_t> >(const locale&);

 extern template
    bool
    has_facet<ctype<wchar_t> >(const locale&);

  extern template
    bool
    has_facet<numpunct<wchar_t> >(const locale&);

  extern template
    bool
    has_facet<num_put<wchar_t> >(const locale&);

  extern template
    bool
    has_facet<num_get<wchar_t> >(const locale&);




}
# 2609 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/locale_facets.h" 2 3
# 38 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_ios.h" 2 3


namespace std __attribute__ ((__visibility__ ("default")))
{


  template<typename _Facet>
    inline const _Facet&
    __check_facet(const _Facet* __f)
    {
      if (!__f)
 __throw_bad_cast();
      return *__f;
    }
# 65 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_ios.h" 3
  template<typename _CharT, typename _Traits>
    class basic_ios : public ios_base
    {
    public:






      typedef _CharT char_type;
      typedef typename _Traits::int_type int_type;
      typedef typename _Traits::pos_type pos_type;
      typedef typename _Traits::off_type off_type;
      typedef _Traits traits_type;






      typedef ctype<_CharT> __ctype_type;
      typedef num_put<_CharT, ostreambuf_iterator<_CharT, _Traits> >
           __num_put_type;
      typedef num_get<_CharT, istreambuf_iterator<_CharT, _Traits> >
           __num_get_type;



    protected:
      basic_ostream<_CharT, _Traits>* _M_tie;
      mutable char_type _M_fill;
      mutable bool _M_fill_init;
      basic_streambuf<_CharT, _Traits>* _M_streambuf;


      const __ctype_type* _M_ctype;

      const __num_put_type* _M_num_put;

      const __num_get_type* _M_num_get;

    public:







      operator void*() const
      { return this->fail() ? 0 : const_cast<basic_ios*>(this); }

      bool
      operator!() const
      { return this->fail(); }
# 130 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_ios.h" 3
      iostate
      rdstate() const
      { return _M_streambuf_state; }
# 141 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_ios.h" 3
      void
      clear(iostate __state = goodbit);







      void
      setstate(iostate __state)
      { this->clear(this->rdstate() | __state); }




      void
      _M_setstate(iostate __state)
      {


 _M_streambuf_state |= __state;
 if (this->exceptions() & __state)
   throw;
      }







      bool
      good() const
      { return this->rdstate() == 0; }







      bool
      eof() const
      { return (this->rdstate() & eofbit) != 0; }
# 194 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_ios.h" 3
      bool
      fail() const
      { return (this->rdstate() & (badbit | failbit)) != 0; }







      bool
      bad() const
      { return (this->rdstate() & badbit) != 0; }
# 215 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_ios.h" 3
      iostate
      exceptions() const
      { return _M_exception; }
# 250 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_ios.h" 3
      void
      exceptions(iostate __except)
      {
        _M_exception = __except;
        this->clear(_M_streambuf_state);
      }







      explicit
      basic_ios(basic_streambuf<_CharT, _Traits>* __sb)
      : ios_base(), _M_tie(0), _M_fill(), _M_fill_init(false), _M_streambuf(0),
 _M_ctype(0), _M_num_put(0), _M_num_get(0)
      { this->init(__sb); }







      virtual
      ~basic_ios() { }
# 288 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_ios.h" 3
      basic_ostream<_CharT, _Traits>*
      tie() const
      { return _M_tie; }
# 300 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_ios.h" 3
      basic_ostream<_CharT, _Traits>*
      tie(basic_ostream<_CharT, _Traits>* __tiestr)
      {
        basic_ostream<_CharT, _Traits>* __old = _M_tie;
        _M_tie = __tiestr;
        return __old;
      }







      basic_streambuf<_CharT, _Traits>*
      rdbuf() const
      { return _M_streambuf; }
# 340 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_ios.h" 3
      basic_streambuf<_CharT, _Traits>*
      rdbuf(basic_streambuf<_CharT, _Traits>* __sb);
# 354 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_ios.h" 3
      basic_ios&
      copyfmt(const basic_ios& __rhs);







      char_type
      fill() const
      {
 if (!_M_fill_init)
   {
     _M_fill = this->widen(' ');
     _M_fill_init = true;
   }
 return _M_fill;
      }
# 383 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_ios.h" 3
      char_type
      fill(char_type __ch)
      {
 char_type __old = this->fill();
 _M_fill = __ch;
 return __old;
      }
# 403 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_ios.h" 3
      locale
      imbue(const locale& __loc);
# 423 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_ios.h" 3
      char
      narrow(char_type __c, char __dfault) const
      { return __check_facet(_M_ctype).narrow(__c, __dfault); }
# 442 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_ios.h" 3
      char_type
      widen(char __c) const
      { return __check_facet(_M_ctype).widen(__c); }

    protected:







      basic_ios()
      : ios_base(), _M_tie(0), _M_fill(char_type()), _M_fill_init(false),
 _M_streambuf(0), _M_ctype(0), _M_num_put(0), _M_num_get(0)
      { }







      void
      init(basic_streambuf<_CharT, _Traits>* __sb);

      void
      _M_cache_locale(const locale& __loc);
    };


}

# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_ios.tcc" 1 3
# 33 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_ios.tcc" 3
       
# 34 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_ios.tcc" 3

namespace std __attribute__ ((__visibility__ ("default")))
{


  template<typename _CharT, typename _Traits>
    void
    basic_ios<_CharT, _Traits>::clear(iostate __state)
    {
      if (this->rdbuf())
 _M_streambuf_state = __state;
      else
   _M_streambuf_state = __state | badbit;
      if (this->exceptions() & this->rdstate())
 __throw_ios_failure(("basic_ios::clear"));
    }

  template<typename _CharT, typename _Traits>
    basic_streambuf<_CharT, _Traits>*
    basic_ios<_CharT, _Traits>::rdbuf(basic_streambuf<_CharT, _Traits>* __sb)
    {
      basic_streambuf<_CharT, _Traits>* __old = _M_streambuf;
      _M_streambuf = __sb;
      this->clear();
      return __old;
    }

  template<typename _CharT, typename _Traits>
    basic_ios<_CharT, _Traits>&
    basic_ios<_CharT, _Traits>::copyfmt(const basic_ios& __rhs)
    {


      if (this != &__rhs)
 {




   _Words* __words = (__rhs._M_word_size <= _S_local_word_size) ?
                      _M_local_word : new _Words[__rhs._M_word_size];


   _Callback_list* __cb = __rhs._M_callbacks;
   if (__cb)
     __cb->_M_add_reference();
   _M_call_callbacks(erase_event);
   if (_M_word != _M_local_word)
     {
       delete [] _M_word;
       _M_word = 0;
     }
   _M_dispose_callbacks();


   _M_callbacks = __cb;
   for (int __i = 0; __i < __rhs._M_word_size; ++__i)
     __words[__i] = __rhs._M_word[__i];
   _M_word = __words;
   _M_word_size = __rhs._M_word_size;

   this->flags(__rhs.flags());
   this->width(__rhs.width());
   this->precision(__rhs.precision());
   this->tie(__rhs.tie());
   this->fill(__rhs.fill());
   _M_ios_locale = __rhs.getloc();
   _M_cache_locale(_M_ios_locale);

   _M_call_callbacks(copyfmt_event);


   this->exceptions(__rhs.exceptions());
 }
      return *this;
    }


  template<typename _CharT, typename _Traits>
    locale
    basic_ios<_CharT, _Traits>::imbue(const locale& __loc)
    {
      locale __old(this->getloc());
      ios_base::imbue(__loc);
      _M_cache_locale(__loc);
      if (this->rdbuf() != 0)
 this->rdbuf()->pubimbue(__loc);
      return __old;
    }

  template<typename _CharT, typename _Traits>
    void
    basic_ios<_CharT, _Traits>::init(basic_streambuf<_CharT, _Traits>* __sb)
    {

      ios_base::_M_init();


      _M_cache_locale(_M_ios_locale);
# 146 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_ios.tcc" 3
      _M_fill = _CharT();
      _M_fill_init = false;

      _M_tie = 0;
      _M_exception = goodbit;
      _M_streambuf = __sb;
      _M_streambuf_state = __sb ? goodbit : badbit;
    }

  template<typename _CharT, typename _Traits>
    void
    basic_ios<_CharT, _Traits>::_M_cache_locale(const locale& __loc)
    {
      if (__builtin_expect(has_facet<__ctype_type>(__loc), true))
 _M_ctype = &use_facet<__ctype_type>(__loc);
      else
 _M_ctype = 0;

      if (__builtin_expect(has_facet<__num_put_type>(__loc), true))
 _M_num_put = &use_facet<__num_put_type>(__loc);
      else
 _M_num_put = 0;

      if (__builtin_expect(has_facet<__num_get_type>(__loc), true))
 _M_num_get = &use_facet<__num_get_type>(__loc);
      else
 _M_num_get = 0;
    }




  extern template class basic_ios<char>;


  extern template class basic_ios<wchar_t>;




}
# 476 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/basic_ios.h" 2 3
# 45 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ios" 2 3
# 39 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/istream" 2 3
# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ostream" 1 3
# 36 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ostream" 3
       
# 37 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ostream" 3




namespace std __attribute__ ((__visibility__ ("default")))
{

# 57 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ostream" 3
  template<typename _CharT, typename _Traits>
    class basic_ostream : virtual public basic_ios<_CharT, _Traits>
    {
    public:

      typedef _CharT char_type;
      typedef typename _Traits::int_type int_type;
      typedef typename _Traits::pos_type pos_type;
      typedef typename _Traits::off_type off_type;
      typedef _Traits traits_type;


      typedef basic_streambuf<_CharT, _Traits> __streambuf_type;
      typedef basic_ios<_CharT, _Traits> __ios_type;
      typedef basic_ostream<_CharT, _Traits> __ostream_type;
      typedef num_put<_CharT, ostreambuf_iterator<_CharT, _Traits> >
             __num_put_type;
      typedef ctype<_CharT> __ctype_type;
# 83 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ostream" 3
      explicit
      basic_ostream(__streambuf_type* __sb)
      { this->init(__sb); }






      virtual
      ~basic_ostream() { }


      class sentry;
      friend class sentry;
# 107 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ostream" 3
      __ostream_type&
      operator<<(__ostream_type& (*__pf)(__ostream_type&))
      {



 return __pf(*this);
      }

      __ostream_type&
      operator<<(__ios_type& (*__pf)(__ios_type&))
      {



 __pf(*this);
 return *this;
      }

      __ostream_type&
      operator<<(ios_base& (*__pf) (ios_base&))
      {



 __pf(*this);
 return *this;
      }
# 165 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ostream" 3
      __ostream_type&
      operator<<(long __n)
      { return _M_insert(__n); }

      __ostream_type&
      operator<<(unsigned long __n)
      { return _M_insert(__n); }

      __ostream_type&
      operator<<(bool __n)
      { return _M_insert(__n); }

      __ostream_type&
      operator<<(short __n);

      __ostream_type&
      operator<<(unsigned short __n)
      {


 return _M_insert(static_cast<unsigned long>(__n));
      }

      __ostream_type&
      operator<<(int __n);

      __ostream_type&
      operator<<(unsigned int __n)
      {


 return _M_insert(static_cast<unsigned long>(__n));
      }


      __ostream_type&
      operator<<(long long __n)
      { return _M_insert(__n); }

      __ostream_type&
      operator<<(unsigned long long __n)
      { return _M_insert(__n); }
# 219 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ostream" 3
      __ostream_type&
      operator<<(double __f)
      { return _M_insert(__f); }

      __ostream_type&
      operator<<(float __f)
      {


 return _M_insert(static_cast<double>(__f));
      }

      __ostream_type&
      operator<<(long double __f)
      { return _M_insert(__f); }
# 244 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ostream" 3
      __ostream_type&
      operator<<(const void* __p)
      { return _M_insert(__p); }
# 269 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ostream" 3
      __ostream_type&
      operator<<(__streambuf_type* __sb);
# 302 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ostream" 3
      __ostream_type&
      put(char_type __c);






      void
      _M_write(const char_type* __s, streamsize __n)
      {
 const streamsize __put = this->rdbuf()->sputn(__s, __n);
 if (__put != __n)
   this->setstate(ios_base::badbit);
      }
# 334 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ostream" 3
      __ostream_type&
      write(const char_type* __s, streamsize __n);
# 347 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ostream" 3
      __ostream_type&
      flush();
# 357 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ostream" 3
      pos_type
      tellp();
# 368 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ostream" 3
      __ostream_type&
      seekp(pos_type);
# 380 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ostream" 3
       __ostream_type&
      seekp(off_type, ios_base::seekdir);

    protected:
      basic_ostream()
      { this->init(0); }

      template<typename _ValueT>
 __ostream_type&
 _M_insert(_ValueT __v);
    };
# 399 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ostream" 3
  template <typename _CharT, typename _Traits>
    class basic_ostream<_CharT, _Traits>::sentry
    {

      bool _M_ok;
      basic_ostream<_CharT, _Traits>& _M_os;

    public:
# 418 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ostream" 3
      explicit
      sentry(basic_ostream<_CharT, _Traits>& __os);
# 428 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ostream" 3
      ~sentry()
      {

 if (bool(_M_os.flags() & ios_base::unitbuf) && !uncaught_exception())
   {

     if (_M_os.rdbuf() && _M_os.rdbuf()->pubsync() == -1)
       _M_os.setstate(ios_base::badbit);
   }
      }
# 449 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ostream" 3
      operator bool() const
      { return _M_ok; }
    };
# 469 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ostream" 3
  template<typename _CharT, typename _Traits>
    inline basic_ostream<_CharT, _Traits>&
    operator<<(basic_ostream<_CharT, _Traits>& __out, _CharT __c)
    { return __ostream_insert(__out, &__c, 1); }

  template<typename _CharT, typename _Traits>
    inline basic_ostream<_CharT, _Traits>&
    operator<<(basic_ostream<_CharT, _Traits>& __out, char __c)
    { return (__out << __out.widen(__c)); }


  template <class _Traits>
    inline basic_ostream<char, _Traits>&
    operator<<(basic_ostream<char, _Traits>& __out, char __c)
    { return __ostream_insert(__out, &__c, 1); }


  template<class _Traits>
    inline basic_ostream<char, _Traits>&
    operator<<(basic_ostream<char, _Traits>& __out, signed char __c)
    { return (__out << static_cast<char>(__c)); }

  template<class _Traits>
    inline basic_ostream<char, _Traits>&
    operator<<(basic_ostream<char, _Traits>& __out, unsigned char __c)
    { return (__out << static_cast<char>(__c)); }
# 511 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ostream" 3
  template<typename _CharT, typename _Traits>
    inline basic_ostream<_CharT, _Traits>&
    operator<<(basic_ostream<_CharT, _Traits>& __out, const _CharT* __s)
    {
      if (!__s)
 __out.setstate(ios_base::badbit);
      else
 __ostream_insert(__out, __s,
    static_cast<streamsize>(_Traits::length(__s)));
      return __out;
    }

  template<typename _CharT, typename _Traits>
    basic_ostream<_CharT, _Traits> &
    operator<<(basic_ostream<_CharT, _Traits>& __out, const char* __s);


  template<class _Traits>
    inline basic_ostream<char, _Traits>&
    operator<<(basic_ostream<char, _Traits>& __out, const char* __s)
    {
      if (!__s)
 __out.setstate(ios_base::badbit);
      else
 __ostream_insert(__out, __s,
    static_cast<streamsize>(_Traits::length(__s)));
      return __out;
    }


  template<class _Traits>
    inline basic_ostream<char, _Traits>&
    operator<<(basic_ostream<char, _Traits>& __out, const signed char* __s)
    { return (__out << reinterpret_cast<const char*>(__s)); }

  template<class _Traits>
    inline basic_ostream<char, _Traits> &
    operator<<(basic_ostream<char, _Traits>& __out, const unsigned char* __s)
    { return (__out << reinterpret_cast<const char*>(__s)); }
# 562 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ostream" 3
  template<typename _CharT, typename _Traits>
    inline basic_ostream<_CharT, _Traits>&
    endl(basic_ostream<_CharT, _Traits>& __os)
    { return flush(__os.put(__os.widen('\n'))); }
# 574 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ostream" 3
  template<typename _CharT, typename _Traits>
    inline basic_ostream<_CharT, _Traits>&
    ends(basic_ostream<_CharT, _Traits>& __os)
    { return __os.put(_CharT()); }






  template<typename _CharT, typename _Traits>
    inline basic_ostream<_CharT, _Traits>&
    flush(basic_ostream<_CharT, _Traits>& __os)
    { return __os.flush(); }
# 606 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ostream" 3

}

# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/ostream.tcc" 1 3
# 37 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/ostream.tcc" 3
       
# 38 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/ostream.tcc" 3



namespace std __attribute__ ((__visibility__ ("default")))
{


  template<typename _CharT, typename _Traits>
    basic_ostream<_CharT, _Traits>::sentry::
    sentry(basic_ostream<_CharT, _Traits>& __os)
    : _M_ok(false), _M_os(__os)
    {

      if (__os.tie() && __os.good())
 __os.tie()->flush();

      if (__os.good())
 _M_ok = true;
      else
 __os.setstate(ios_base::failbit);
    }

  template<typename _CharT, typename _Traits>
    template<typename _ValueT>
      basic_ostream<_CharT, _Traits>&
      basic_ostream<_CharT, _Traits>::
      _M_insert(_ValueT __v)
      {
 sentry __cerb(*this);
 if (__cerb)
   {
     ios_base::iostate __err = ios_base::goodbit;
     try
       {
  const __num_put_type& __np = __check_facet(this->_M_num_put);
  if (__np.put(*this, *this, this->fill(), __v).failed())
    __err |= ios_base::badbit;
       }
     catch(__cxxabiv1::__forced_unwind&)
       {
  this->_M_setstate(ios_base::badbit);
  throw;
       }
     catch(...)
       { this->_M_setstate(ios_base::badbit); }
     if (__err)
       this->setstate(__err);
   }
 return *this;
      }

  template<typename _CharT, typename _Traits>
    basic_ostream<_CharT, _Traits>&
    basic_ostream<_CharT, _Traits>::
    operator<<(short __n)
    {


      const ios_base::fmtflags __fmt = this->flags() & ios_base::basefield;
      if (__fmt == ios_base::oct || __fmt == ios_base::hex)
 return _M_insert(static_cast<long>(static_cast<unsigned short>(__n)));
      else
 return _M_insert(static_cast<long>(__n));
    }

  template<typename _CharT, typename _Traits>
    basic_ostream<_CharT, _Traits>&
    basic_ostream<_CharT, _Traits>::
    operator<<(int __n)
    {


      const ios_base::fmtflags __fmt = this->flags() & ios_base::basefield;
      if (__fmt == ios_base::oct || __fmt == ios_base::hex)
 return _M_insert(static_cast<long>(static_cast<unsigned int>(__n)));
      else
 return _M_insert(static_cast<long>(__n));
    }

  template<typename _CharT, typename _Traits>
    basic_ostream<_CharT, _Traits>&
    basic_ostream<_CharT, _Traits>::
    operator<<(__streambuf_type* __sbin)
    {
      ios_base::iostate __err = ios_base::goodbit;
      sentry __cerb(*this);
      if (__cerb && __sbin)
 {
   try
     {
       if (!__copy_streambufs(__sbin, this->rdbuf()))
  __err |= ios_base::failbit;
     }
   catch(__cxxabiv1::__forced_unwind&)
     {
       this->_M_setstate(ios_base::badbit);
       throw;
     }
   catch(...)
     { this->_M_setstate(ios_base::failbit); }
 }
      else if (!__sbin)
 __err |= ios_base::badbit;
      if (__err)
 this->setstate(__err);
      return *this;
    }

  template<typename _CharT, typename _Traits>
    basic_ostream<_CharT, _Traits>&
    basic_ostream<_CharT, _Traits>::
    put(char_type __c)
    {






      sentry __cerb(*this);
      if (__cerb)
 {
   ios_base::iostate __err = ios_base::goodbit;
   try
     {
       const int_type __put = this->rdbuf()->sputc(__c);
       if (traits_type::eq_int_type(__put, traits_type::eof()))
  __err |= ios_base::badbit;
     }
   catch(__cxxabiv1::__forced_unwind&)
     {
       this->_M_setstate(ios_base::badbit);
       throw;
     }
   catch(...)
     { this->_M_setstate(ios_base::badbit); }
   if (__err)
     this->setstate(__err);
 }
      return *this;
    }

  template<typename _CharT, typename _Traits>
    basic_ostream<_CharT, _Traits>&
    basic_ostream<_CharT, _Traits>::
    write(const _CharT* __s, streamsize __n)
    {







      sentry __cerb(*this);
      if (__cerb)
 {
   try
     { _M_write(__s, __n); }
   catch(__cxxabiv1::__forced_unwind&)
     {
       this->_M_setstate(ios_base::badbit);
       throw;
     }
   catch(...)
     { this->_M_setstate(ios_base::badbit); }
 }
      return *this;
    }

  template<typename _CharT, typename _Traits>
    basic_ostream<_CharT, _Traits>&
    basic_ostream<_CharT, _Traits>::
    flush()
    {



      ios_base::iostate __err = ios_base::goodbit;
      try
 {
   if (this->rdbuf() && this->rdbuf()->pubsync() == -1)
     __err |= ios_base::badbit;
 }
      catch(__cxxabiv1::__forced_unwind&)
 {
   this->_M_setstate(ios_base::badbit);
   throw;
 }
      catch(...)
 { this->_M_setstate(ios_base::badbit); }
      if (__err)
 this->setstate(__err);
      return *this;
    }

  template<typename _CharT, typename _Traits>
    typename basic_ostream<_CharT, _Traits>::pos_type
    basic_ostream<_CharT, _Traits>::
    tellp()
    {
      pos_type __ret = pos_type(-1);
      try
 {
   if (!this->fail())
     __ret = this->rdbuf()->pubseekoff(0, ios_base::cur, ios_base::out);
 }
      catch(__cxxabiv1::__forced_unwind&)
 {
   this->_M_setstate(ios_base::badbit);
   throw;
 }
      catch(...)
 { this->_M_setstate(ios_base::badbit); }
      return __ret;
    }

  template<typename _CharT, typename _Traits>
    basic_ostream<_CharT, _Traits>&
    basic_ostream<_CharT, _Traits>::
    seekp(pos_type __pos)
    {
      ios_base::iostate __err = ios_base::goodbit;
      try
 {
   if (!this->fail())
     {


       const pos_type __p = this->rdbuf()->pubseekpos(__pos,
            ios_base::out);


       if (__p == pos_type(off_type(-1)))
  __err |= ios_base::failbit;
     }
 }
      catch(__cxxabiv1::__forced_unwind&)
 {
   this->_M_setstate(ios_base::badbit);
   throw;
 }
      catch(...)
 { this->_M_setstate(ios_base::badbit); }
      if (__err)
 this->setstate(__err);
      return *this;
    }

  template<typename _CharT, typename _Traits>
    basic_ostream<_CharT, _Traits>&
    basic_ostream<_CharT, _Traits>::
    seekp(off_type __off, ios_base::seekdir __dir)
    {
      ios_base::iostate __err = ios_base::goodbit;
      try
 {
   if (!this->fail())
     {


       const pos_type __p = this->rdbuf()->pubseekoff(__off, __dir,
            ios_base::out);


       if (__p == pos_type(off_type(-1)))
  __err |= ios_base::failbit;
     }
 }
      catch(__cxxabiv1::__forced_unwind&)
 {
   this->_M_setstate(ios_base::badbit);
   throw;
 }
      catch(...)
 { this->_M_setstate(ios_base::badbit); }
      if (__err)
 this->setstate(__err);
      return *this;
    }

  template<typename _CharT, typename _Traits>
    basic_ostream<_CharT, _Traits>&
    operator<<(basic_ostream<_CharT, _Traits>& __out, const char* __s)
    {
      if (!__s)
 __out.setstate(ios_base::badbit);
      else
 {


   const size_t __clen = char_traits<char>::length(__s);
   try
     {
       struct __ptr_guard
       {
  _CharT *__p;
  __ptr_guard (_CharT *__ip): __p(__ip) { }
  ~__ptr_guard() { delete[] __p; }
  _CharT* __get() { return __p; }
       } __pg (new _CharT[__clen]);

       _CharT *__ws = __pg.__get();
       for (size_t __i = 0; __i < __clen; ++__i)
  __ws[__i] = __out.widen(__s[__i]);
       __ostream_insert(__out, __ws, __clen);
     }
   catch(__cxxabiv1::__forced_unwind&)
     {
       __out._M_setstate(ios_base::badbit);
       throw;
     }
   catch(...)
     { __out._M_setstate(ios_base::badbit); }
 }
      return __out;
    }




  extern template class basic_ostream<char>;
  extern template ostream& endl(ostream&);
  extern template ostream& ends(ostream&);
  extern template ostream& flush(ostream&);
  extern template ostream& operator<<(ostream&, char);
  extern template ostream& operator<<(ostream&, unsigned char);
  extern template ostream& operator<<(ostream&, signed char);
  extern template ostream& operator<<(ostream&, const char*);
  extern template ostream& operator<<(ostream&, const unsigned char*);
  extern template ostream& operator<<(ostream&, const signed char*);

  extern template ostream& ostream::_M_insert(long);
  extern template ostream& ostream::_M_insert(unsigned long);
  extern template ostream& ostream::_M_insert(bool);

  extern template ostream& ostream::_M_insert(long long);
  extern template ostream& ostream::_M_insert(unsigned long long);

  extern template ostream& ostream::_M_insert(double);
  extern template ostream& ostream::_M_insert(long double);
  extern template ostream& ostream::_M_insert(const void*);


  extern template class basic_ostream<wchar_t>;
  extern template wostream& endl(wostream&);
  extern template wostream& ends(wostream&);
  extern template wostream& flush(wostream&);
  extern template wostream& operator<<(wostream&, wchar_t);
  extern template wostream& operator<<(wostream&, char);
  extern template wostream& operator<<(wostream&, const wchar_t*);
  extern template wostream& operator<<(wostream&, const char*);

  extern template wostream& wostream::_M_insert(long);
  extern template wostream& wostream::_M_insert(unsigned long);
  extern template wostream& wostream::_M_insert(bool);

  extern template wostream& wostream::_M_insert(long long);
  extern template wostream& wostream::_M_insert(unsigned long long);

  extern template wostream& wostream::_M_insert(double);
  extern template wostream& wostream::_M_insert(long double);
  extern template wostream& wostream::_M_insert(const void*);




}
# 610 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ostream" 2 3
# 40 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/istream" 2 3

namespace std __attribute__ ((__visibility__ ("default")))
{

# 57 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/istream" 3
  template<typename _CharT, typename _Traits>
    class basic_istream : virtual public basic_ios<_CharT, _Traits>
    {
    public:

      typedef _CharT char_type;
      typedef typename _Traits::int_type int_type;
      typedef typename _Traits::pos_type pos_type;
      typedef typename _Traits::off_type off_type;
      typedef _Traits traits_type;


      typedef basic_streambuf<_CharT, _Traits> __streambuf_type;
      typedef basic_ios<_CharT, _Traits> __ios_type;
      typedef basic_istream<_CharT, _Traits> __istream_type;
      typedef num_get<_CharT, istreambuf_iterator<_CharT, _Traits> >
        __num_get_type;
      typedef ctype<_CharT> __ctype_type;

    protected:





      streamsize _M_gcount;

    public:







      explicit
      basic_istream(__streambuf_type* __sb)
      : _M_gcount(streamsize(0))
      { this->init(__sb); }






      virtual
      ~basic_istream()
      { _M_gcount = streamsize(0); }


      class sentry;
      friend class sentry;
# 119 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/istream" 3
      __istream_type&
      operator>>(__istream_type& (*__pf)(__istream_type&))
      { return __pf(*this); }

      __istream_type&
      operator>>(__ios_type& (*__pf)(__ios_type&))
      {
 __pf(*this);
 return *this;
      }

      __istream_type&
      operator>>(ios_base& (*__pf)(ios_base&))
      {
 __pf(*this);
 return *this;
      }
# 167 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/istream" 3
      __istream_type&
      operator>>(bool& __n)
      { return _M_extract(__n); }

      __istream_type&
      operator>>(short& __n);

      __istream_type&
      operator>>(unsigned short& __n)
      { return _M_extract(__n); }

      __istream_type&
      operator>>(int& __n);

      __istream_type&
      operator>>(unsigned int& __n)
      { return _M_extract(__n); }

      __istream_type&
      operator>>(long& __n)
      { return _M_extract(__n); }

      __istream_type&
      operator>>(unsigned long& __n)
      { return _M_extract(__n); }


      __istream_type&
      operator>>(long long& __n)
      { return _M_extract(__n); }

      __istream_type&
      operator>>(unsigned long long& __n)
      { return _M_extract(__n); }
# 213 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/istream" 3
      __istream_type&
      operator>>(float& __f)
      { return _M_extract(__f); }

      __istream_type&
      operator>>(double& __f)
      { return _M_extract(__f); }

      __istream_type&
      operator>>(long double& __f)
      { return _M_extract(__f); }
# 234 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/istream" 3
      __istream_type&
      operator>>(void*& __p)
      { return _M_extract(__p); }
# 258 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/istream" 3
      __istream_type&
      operator>>(__streambuf_type* __sb);
# 268 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/istream" 3
      streamsize
      gcount() const
      { return _M_gcount; }
# 301 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/istream" 3
      int_type
      get();
# 315 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/istream" 3
      __istream_type&
      get(char_type& __c);
# 342 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/istream" 3
      __istream_type&
      get(char_type* __s, streamsize __n, char_type __delim);
# 353 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/istream" 3
      __istream_type&
      get(char_type* __s, streamsize __n)
      { return this->get(__s, __n, this->widen('\n')); }
# 376 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/istream" 3
      __istream_type&
      get(__streambuf_type& __sb, char_type __delim);
# 386 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/istream" 3
      __istream_type&
      get(__streambuf_type& __sb)
      { return this->get(__sb, this->widen('\n')); }
# 415 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/istream" 3
      __istream_type&
      getline(char_type* __s, streamsize __n, char_type __delim);
# 426 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/istream" 3
      __istream_type&
      getline(char_type* __s, streamsize __n)
      { return this->getline(__s, __n, this->widen('\n')); }
# 450 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/istream" 3
      __istream_type&
      ignore(streamsize __n, int_type __delim);

      __istream_type&
      ignore(streamsize __n);

      __istream_type&
      ignore();
# 467 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/istream" 3
      int_type
      peek();
# 485 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/istream" 3
      __istream_type&
      read(char_type* __s, streamsize __n);
# 504 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/istream" 3
      streamsize
      readsome(char_type* __s, streamsize __n);
# 521 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/istream" 3
      __istream_type&
      putback(char_type __c);
# 537 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/istream" 3
      __istream_type&
      unget();
# 555 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/istream" 3
      int
      sync();
# 570 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/istream" 3
      pos_type
      tellg();
# 585 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/istream" 3
      __istream_type&
      seekg(pos_type);
# 601 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/istream" 3
      __istream_type&
      seekg(off_type, ios_base::seekdir);


    protected:
      basic_istream()
      : _M_gcount(streamsize(0))
      { this->init(0); }

      template<typename _ValueT>
 __istream_type&
 _M_extract(_ValueT& __v);
    };


  template<>
    basic_istream<char>&
    basic_istream<char>::
    getline(char_type* __s, streamsize __n, char_type __delim);

  template<>
    basic_istream<char>&
    basic_istream<char>::
    ignore(streamsize __n);

  template<>
    basic_istream<char>&
    basic_istream<char>::
    ignore(streamsize __n, int_type __delim);


  template<>
    basic_istream<wchar_t>&
    basic_istream<wchar_t>::
    getline(char_type* __s, streamsize __n, char_type __delim);

  template<>
    basic_istream<wchar_t>&
    basic_istream<wchar_t>::
    ignore(streamsize __n);

  template<>
    basic_istream<wchar_t>&
    basic_istream<wchar_t>::
    ignore(streamsize __n, int_type __delim);
# 656 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/istream" 3
  template<typename _CharT, typename _Traits>
    class basic_istream<_CharT, _Traits>::sentry
    {

      bool _M_ok;

    public:

      typedef _Traits traits_type;
      typedef basic_streambuf<_CharT, _Traits> __streambuf_type;
      typedef basic_istream<_CharT, _Traits> __istream_type;
      typedef typename __istream_type::__ctype_type __ctype_type;
      typedef typename _Traits::int_type __int_type;
# 692 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/istream" 3
      explicit
      sentry(basic_istream<_CharT, _Traits>& __is, bool __noskipws = false);
# 705 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/istream" 3
      operator bool() const
      { return _M_ok; }
    };
# 721 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/istream" 3
  template<typename _CharT, typename _Traits>
    basic_istream<_CharT, _Traits>&
    operator>>(basic_istream<_CharT, _Traits>& __in, _CharT& __c);

  template<class _Traits>
    inline basic_istream<char, _Traits>&
    operator>>(basic_istream<char, _Traits>& __in, unsigned char& __c)
    { return (__in >> reinterpret_cast<char&>(__c)); }

  template<class _Traits>
    inline basic_istream<char, _Traits>&
    operator>>(basic_istream<char, _Traits>& __in, signed char& __c)
    { return (__in >> reinterpret_cast<char&>(__c)); }
# 763 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/istream" 3
  template<typename _CharT, typename _Traits>
    basic_istream<_CharT, _Traits>&
    operator>>(basic_istream<_CharT, _Traits>& __in, _CharT* __s);


  template<>
    basic_istream<char>&
    operator>>(basic_istream<char>& __in, char* __s);

  template<class _Traits>
    inline basic_istream<char, _Traits>&
    operator>>(basic_istream<char, _Traits>& __in, unsigned char* __s)
    { return (__in >> reinterpret_cast<char*>(__s)); }

  template<class _Traits>
    inline basic_istream<char, _Traits>&
    operator>>(basic_istream<char, _Traits>& __in, signed char* __s)
    { return (__in >> reinterpret_cast<char*>(__s)); }
# 794 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/istream" 3
  template<typename _CharT, typename _Traits>
    class basic_iostream
    : public basic_istream<_CharT, _Traits>,
      public basic_ostream<_CharT, _Traits>
    {
    public:



      typedef _CharT char_type;
      typedef typename _Traits::int_type int_type;
      typedef typename _Traits::pos_type pos_type;
      typedef typename _Traits::off_type off_type;
      typedef _Traits traits_type;


      typedef basic_istream<_CharT, _Traits> __istream_type;
      typedef basic_ostream<_CharT, _Traits> __ostream_type;







      explicit
      basic_iostream(basic_streambuf<_CharT, _Traits>* __sb)
      : __istream_type(__sb), __ostream_type(__sb) { }




      virtual
      ~basic_iostream() { }

    protected:
      basic_iostream()
      : __istream_type(), __ostream_type() { }
    };
# 854 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/istream" 3
  template<typename _CharT, typename _Traits>
    basic_istream<_CharT, _Traits>&
    ws(basic_istream<_CharT, _Traits>& __is);
# 876 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/istream" 3

}

# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/istream.tcc" 1 3
# 37 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/istream.tcc" 3
       
# 38 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/istream.tcc" 3



namespace std __attribute__ ((__visibility__ ("default")))
{


  template<typename _CharT, typename _Traits>
    basic_istream<_CharT, _Traits>::sentry::
    sentry(basic_istream<_CharT, _Traits>& __in, bool __noskip) : _M_ok(false)
    {
      ios_base::iostate __err = ios_base::goodbit;
      if (__in.good())
 {
   if (__in.tie())
     __in.tie()->flush();
   if (!__noskip && bool(__in.flags() & ios_base::skipws))
     {
       const __int_type __eof = traits_type::eof();
       __streambuf_type* __sb = __in.rdbuf();
       __int_type __c = __sb->sgetc();

       const __ctype_type& __ct = __check_facet(__in._M_ctype);
       while (!traits_type::eq_int_type(__c, __eof)
       && __ct.is(ctype_base::space,
    traits_type::to_char_type(__c)))
  __c = __sb->snextc();




       if (traits_type::eq_int_type(__c, __eof))
  __err |= ios_base::eofbit;
     }
 }

      if (__in.good() && __err == ios_base::goodbit)
 _M_ok = true;
      else
 {
   __err |= ios_base::failbit;
   __in.setstate(__err);
 }
    }

  template<typename _CharT, typename _Traits>
    template<typename _ValueT>
      basic_istream<_CharT, _Traits>&
      basic_istream<_CharT, _Traits>::
      _M_extract(_ValueT& __v)
      {
 sentry __cerb(*this, false);
 if (__cerb)
   {
     ios_base::iostate __err = ios_base::goodbit;
     try
       {
  const __num_get_type& __ng = __check_facet(this->_M_num_get);
  __ng.get(*this, 0, *this, __err, __v);
       }
     catch(__cxxabiv1::__forced_unwind&)
       {
  this->_M_setstate(ios_base::badbit);
  throw;
       }
     catch(...)
       { this->_M_setstate(ios_base::badbit); }
     if (__err)
       this->setstate(__err);
   }
 return *this;
      }

  template<typename _CharT, typename _Traits>
    basic_istream<_CharT, _Traits>&
    basic_istream<_CharT, _Traits>::
    operator>>(short& __n)
    {


      sentry __cerb(*this, false);
      if (__cerb)
 {
   ios_base::iostate __err = ios_base::goodbit;
   try
     {
       long __l;
       const __num_get_type& __ng = __check_facet(this->_M_num_get);
       __ng.get(*this, 0, *this, __err, __l);



       if (__l < __gnu_cxx::__numeric_traits<short>::__min)
  {
    __err |= ios_base::failbit;
    __n = __gnu_cxx::__numeric_traits<short>::__min;
  }
       else if (__l > __gnu_cxx::__numeric_traits<short>::__max)
  {
    __err |= ios_base::failbit;
    __n = __gnu_cxx::__numeric_traits<short>::__max;
  }
       else
  __n = short(__l);
     }
   catch(__cxxabiv1::__forced_unwind&)
     {
       this->_M_setstate(ios_base::badbit);
       throw;
     }
   catch(...)
     { this->_M_setstate(ios_base::badbit); }
   if (__err)
     this->setstate(__err);
 }
      return *this;
    }

  template<typename _CharT, typename _Traits>
    basic_istream<_CharT, _Traits>&
    basic_istream<_CharT, _Traits>::
    operator>>(int& __n)
    {


      sentry __cerb(*this, false);
      if (__cerb)
 {
   ios_base::iostate __err = ios_base::goodbit;
   try
     {
       long __l;
       const __num_get_type& __ng = __check_facet(this->_M_num_get);
       __ng.get(*this, 0, *this, __err, __l);



       if (__l < __gnu_cxx::__numeric_traits<int>::__min)
  {
    __err |= ios_base::failbit;
    __n = __gnu_cxx::__numeric_traits<int>::__min;
  }
       else if (__l > __gnu_cxx::__numeric_traits<int>::__max)
  {
    __err |= ios_base::failbit;
    __n = __gnu_cxx::__numeric_traits<int>::__max;
  }
       else
  __n = int(__l);
     }
   catch(__cxxabiv1::__forced_unwind&)
     {
       this->_M_setstate(ios_base::badbit);
       throw;
     }
   catch(...)
     { this->_M_setstate(ios_base::badbit); }
   if (__err)
     this->setstate(__err);
 }
      return *this;
    }

  template<typename _CharT, typename _Traits>
    basic_istream<_CharT, _Traits>&
    basic_istream<_CharT, _Traits>::
    operator>>(__streambuf_type* __sbout)
    {
      ios_base::iostate __err = ios_base::goodbit;
      sentry __cerb(*this, false);
      if (__cerb && __sbout)
 {
   try
     {
       bool __ineof;
       if (!__copy_streambufs_eof(this->rdbuf(), __sbout, __ineof))
  __err |= ios_base::failbit;
       if (__ineof)
  __err |= ios_base::eofbit;
     }
   catch(__cxxabiv1::__forced_unwind&)
     {
       this->_M_setstate(ios_base::failbit);
       throw;
     }
   catch(...)
     { this->_M_setstate(ios_base::failbit); }
 }
      else if (!__sbout)
 __err |= ios_base::failbit;
      if (__err)
 this->setstate(__err);
      return *this;
    }

  template<typename _CharT, typename _Traits>
    typename basic_istream<_CharT, _Traits>::int_type
    basic_istream<_CharT, _Traits>::
    get(void)
    {
      const int_type __eof = traits_type::eof();
      int_type __c = __eof;
      _M_gcount = 0;
      ios_base::iostate __err = ios_base::goodbit;
      sentry __cerb(*this, true);
      if (__cerb)
 {
   try
     {
       __c = this->rdbuf()->sbumpc();

       if (!traits_type::eq_int_type(__c, __eof))
  _M_gcount = 1;
       else
  __err |= ios_base::eofbit;
     }
   catch(__cxxabiv1::__forced_unwind&)
     {
       this->_M_setstate(ios_base::badbit);
       throw;
     }
   catch(...)
     { this->_M_setstate(ios_base::badbit); }
 }
      if (!_M_gcount)
 __err |= ios_base::failbit;
      if (__err)
 this->setstate(__err);
      return __c;
    }

  template<typename _CharT, typename _Traits>
    basic_istream<_CharT, _Traits>&
    basic_istream<_CharT, _Traits>::
    get(char_type& __c)
    {
      _M_gcount = 0;
      ios_base::iostate __err = ios_base::goodbit;
      sentry __cerb(*this, true);
      if (__cerb)
 {
   try
     {
       const int_type __cb = this->rdbuf()->sbumpc();

       if (!traits_type::eq_int_type(__cb, traits_type::eof()))
  {
    _M_gcount = 1;
    __c = traits_type::to_char_type(__cb);
  }
       else
  __err |= ios_base::eofbit;
     }
   catch(__cxxabiv1::__forced_unwind&)
     {
       this->_M_setstate(ios_base::badbit);
       throw;
     }
   catch(...)
     { this->_M_setstate(ios_base::badbit); }
 }
      if (!_M_gcount)
 __err |= ios_base::failbit;
      if (__err)
 this->setstate(__err);
      return *this;
    }

  template<typename _CharT, typename _Traits>
    basic_istream<_CharT, _Traits>&
    basic_istream<_CharT, _Traits>::
    get(char_type* __s, streamsize __n, char_type __delim)
    {
      _M_gcount = 0;
      ios_base::iostate __err = ios_base::goodbit;
      sentry __cerb(*this, true);
      if (__cerb)
 {
   try
     {
       const int_type __idelim = traits_type::to_int_type(__delim);
       const int_type __eof = traits_type::eof();
       __streambuf_type* __sb = this->rdbuf();
       int_type __c = __sb->sgetc();

       while (_M_gcount + 1 < __n
       && !traits_type::eq_int_type(__c, __eof)
       && !traits_type::eq_int_type(__c, __idelim))
  {
    *__s++ = traits_type::to_char_type(__c);
    ++_M_gcount;
    __c = __sb->snextc();
  }
       if (traits_type::eq_int_type(__c, __eof))
  __err |= ios_base::eofbit;
     }
   catch(__cxxabiv1::__forced_unwind&)
     {
       this->_M_setstate(ios_base::badbit);
       throw;
     }
   catch(...)
     { this->_M_setstate(ios_base::badbit); }
 }


      if (__n > 0)
 *__s = char_type();
      if (!_M_gcount)
 __err |= ios_base::failbit;
      if (__err)
 this->setstate(__err);
      return *this;
    }

  template<typename _CharT, typename _Traits>
    basic_istream<_CharT, _Traits>&
    basic_istream<_CharT, _Traits>::
    get(__streambuf_type& __sb, char_type __delim)
    {
      _M_gcount = 0;
      ios_base::iostate __err = ios_base::goodbit;
      sentry __cerb(*this, true);
      if (__cerb)
 {
   try
     {
       const int_type __idelim = traits_type::to_int_type(__delim);
       const int_type __eof = traits_type::eof();
       __streambuf_type* __this_sb = this->rdbuf();
       int_type __c = __this_sb->sgetc();
       char_type __c2 = traits_type::to_char_type(__c);

       while (!traits_type::eq_int_type(__c, __eof)
       && !traits_type::eq_int_type(__c, __idelim)
       && !traits_type::eq_int_type(__sb.sputc(__c2), __eof))
  {
    ++_M_gcount;
    __c = __this_sb->snextc();
    __c2 = traits_type::to_char_type(__c);
  }
       if (traits_type::eq_int_type(__c, __eof))
  __err |= ios_base::eofbit;
     }
   catch(__cxxabiv1::__forced_unwind&)
     {
       this->_M_setstate(ios_base::badbit);
       throw;
     }
   catch(...)
     { this->_M_setstate(ios_base::badbit); }
 }
      if (!_M_gcount)
 __err |= ios_base::failbit;
      if (__err)
 this->setstate(__err);
      return *this;
    }

  template<typename _CharT, typename _Traits>
    basic_istream<_CharT, _Traits>&
    basic_istream<_CharT, _Traits>::
    getline(char_type* __s, streamsize __n, char_type __delim)
    {
      _M_gcount = 0;
      ios_base::iostate __err = ios_base::goodbit;
      sentry __cerb(*this, true);
      if (__cerb)
        {
          try
            {
              const int_type __idelim = traits_type::to_int_type(__delim);
              const int_type __eof = traits_type::eof();
              __streambuf_type* __sb = this->rdbuf();
              int_type __c = __sb->sgetc();

              while (_M_gcount + 1 < __n
                     && !traits_type::eq_int_type(__c, __eof)
                     && !traits_type::eq_int_type(__c, __idelim))
                {
                  *__s++ = traits_type::to_char_type(__c);
                  __c = __sb->snextc();
                  ++_M_gcount;
                }
              if (traits_type::eq_int_type(__c, __eof))
                __err |= ios_base::eofbit;
              else
                {
                  if (traits_type::eq_int_type(__c, __idelim))
                    {
                      __sb->sbumpc();
                      ++_M_gcount;
                    }
                  else
                    __err |= ios_base::failbit;
                }
            }
   catch(__cxxabiv1::__forced_unwind&)
     {
       this->_M_setstate(ios_base::badbit);
       throw;
     }
          catch(...)
            { this->_M_setstate(ios_base::badbit); }
        }


      if (__n > 0)
 *__s = char_type();
      if (!_M_gcount)
        __err |= ios_base::failbit;
      if (__err)
        this->setstate(__err);
      return *this;
    }




  template<typename _CharT, typename _Traits>
    basic_istream<_CharT, _Traits>&
    basic_istream<_CharT, _Traits>::
    ignore(void)
    {
      _M_gcount = 0;
      sentry __cerb(*this, true);
      if (__cerb)
 {
   ios_base::iostate __err = ios_base::goodbit;
   try
     {
       const int_type __eof = traits_type::eof();
       __streambuf_type* __sb = this->rdbuf();

       if (traits_type::eq_int_type(__sb->sbumpc(), __eof))
  __err |= ios_base::eofbit;
       else
  _M_gcount = 1;
     }
   catch(__cxxabiv1::__forced_unwind&)
     {
       this->_M_setstate(ios_base::badbit);
       throw;
     }
   catch(...)
     { this->_M_setstate(ios_base::badbit); }
   if (__err)
     this->setstate(__err);
 }
      return *this;
    }

  template<typename _CharT, typename _Traits>
    basic_istream<_CharT, _Traits>&
    basic_istream<_CharT, _Traits>::
    ignore(streamsize __n)
    {
      _M_gcount = 0;
      sentry __cerb(*this, true);
      if (__cerb && __n > 0)
        {
          ios_base::iostate __err = ios_base::goodbit;
          try
            {
              const int_type __eof = traits_type::eof();
              __streambuf_type* __sb = this->rdbuf();
              int_type __c = __sb->sgetc();
# 513 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/istream.tcc" 3
       bool __large_ignore = false;
       while (true)
  {
    while (_M_gcount < __n
    && !traits_type::eq_int_type(__c, __eof))
      {
        ++_M_gcount;
        __c = __sb->snextc();
      }
    if (__n == __gnu_cxx::__numeric_traits<streamsize>::__max
        && !traits_type::eq_int_type(__c, __eof))
      {
        _M_gcount =
   __gnu_cxx::__numeric_traits<streamsize>::__min;
        __large_ignore = true;
      }
    else
      break;
  }

       if (__large_ignore)
  _M_gcount = __gnu_cxx::__numeric_traits<streamsize>::__max;

       if (traits_type::eq_int_type(__c, __eof))
                __err |= ios_base::eofbit;
            }
   catch(__cxxabiv1::__forced_unwind&)
     {
       this->_M_setstate(ios_base::badbit);
       throw;
     }
          catch(...)
            { this->_M_setstate(ios_base::badbit); }
          if (__err)
            this->setstate(__err);
        }
      return *this;
    }

  template<typename _CharT, typename _Traits>
    basic_istream<_CharT, _Traits>&
    basic_istream<_CharT, _Traits>::
    ignore(streamsize __n, int_type __delim)
    {
      _M_gcount = 0;
      sentry __cerb(*this, true);
      if (__cerb && __n > 0)
        {
          ios_base::iostate __err = ios_base::goodbit;
          try
            {
              const int_type __eof = traits_type::eof();
              __streambuf_type* __sb = this->rdbuf();
              int_type __c = __sb->sgetc();


       bool __large_ignore = false;
       while (true)
  {
    while (_M_gcount < __n
    && !traits_type::eq_int_type(__c, __eof)
    && !traits_type::eq_int_type(__c, __delim))
      {
        ++_M_gcount;
        __c = __sb->snextc();
      }
    if (__n == __gnu_cxx::__numeric_traits<streamsize>::__max
        && !traits_type::eq_int_type(__c, __eof)
        && !traits_type::eq_int_type(__c, __delim))
      {
        _M_gcount =
   __gnu_cxx::__numeric_traits<streamsize>::__min;
        __large_ignore = true;
      }
    else
      break;
  }

       if (__large_ignore)
  _M_gcount = __gnu_cxx::__numeric_traits<streamsize>::__max;

              if (traits_type::eq_int_type(__c, __eof))
                __err |= ios_base::eofbit;
       else if (traits_type::eq_int_type(__c, __delim))
  {
    if (_M_gcount
        < __gnu_cxx::__numeric_traits<streamsize>::__max)
      ++_M_gcount;
    __sb->sbumpc();
  }
            }
   catch(__cxxabiv1::__forced_unwind&)
     {
       this->_M_setstate(ios_base::badbit);
       throw;
     }
          catch(...)
            { this->_M_setstate(ios_base::badbit); }
          if (__err)
            this->setstate(__err);
        }
      return *this;
    }

  template<typename _CharT, typename _Traits>
    typename basic_istream<_CharT, _Traits>::int_type
    basic_istream<_CharT, _Traits>::
    peek(void)
    {
      int_type __c = traits_type::eof();
      _M_gcount = 0;
      sentry __cerb(*this, true);
      if (__cerb)
 {
   ios_base::iostate __err = ios_base::goodbit;
   try
     {
       __c = this->rdbuf()->sgetc();
       if (traits_type::eq_int_type(__c, traits_type::eof()))
  __err |= ios_base::eofbit;
     }
   catch(__cxxabiv1::__forced_unwind&)
     {
       this->_M_setstate(ios_base::badbit);
       throw;
     }
   catch(...)
     { this->_M_setstate(ios_base::badbit); }
   if (__err)
     this->setstate(__err);
 }
      return __c;
    }

  template<typename _CharT, typename _Traits>
    basic_istream<_CharT, _Traits>&
    basic_istream<_CharT, _Traits>::
    read(char_type* __s, streamsize __n)
    {
      _M_gcount = 0;
      sentry __cerb(*this, true);
      if (__cerb)
 {
   ios_base::iostate __err = ios_base::goodbit;
   try
     {
       _M_gcount = this->rdbuf()->sgetn(__s, __n);
       if (_M_gcount != __n)
  __err |= (ios_base::eofbit | ios_base::failbit);
     }
   catch(__cxxabiv1::__forced_unwind&)
     {
       this->_M_setstate(ios_base::badbit);
       throw;
     }
   catch(...)
     { this->_M_setstate(ios_base::badbit); }
   if (__err)
     this->setstate(__err);
 }
      return *this;
    }

  template<typename _CharT, typename _Traits>
    streamsize
    basic_istream<_CharT, _Traits>::
    readsome(char_type* __s, streamsize __n)
    {
      _M_gcount = 0;
      sentry __cerb(*this, true);
      if (__cerb)
 {
   ios_base::iostate __err = ios_base::goodbit;
   try
     {

       const streamsize __num = this->rdbuf()->in_avail();
       if (__num > 0)
  _M_gcount = this->rdbuf()->sgetn(__s, std::min(__num, __n));
       else if (__num == -1)
  __err |= ios_base::eofbit;
     }
   catch(__cxxabiv1::__forced_unwind&)
     {
       this->_M_setstate(ios_base::badbit);
       throw;
     }
   catch(...)
     { this->_M_setstate(ios_base::badbit); }
   if (__err)
     this->setstate(__err);
 }
      return _M_gcount;
    }

  template<typename _CharT, typename _Traits>
    basic_istream<_CharT, _Traits>&
    basic_istream<_CharT, _Traits>::
    putback(char_type __c)
    {


      _M_gcount = 0;

      this->clear(this->rdstate() & ~ios_base::eofbit);
      sentry __cerb(*this, true);
      if (__cerb)
 {
   ios_base::iostate __err = ios_base::goodbit;
   try
     {
       const int_type __eof = traits_type::eof();
       __streambuf_type* __sb = this->rdbuf();
       if (!__sb
    || traits_type::eq_int_type(__sb->sputbackc(__c), __eof))
  __err |= ios_base::badbit;
     }
   catch(__cxxabiv1::__forced_unwind&)
     {
       this->_M_setstate(ios_base::badbit);
       throw;
     }
   catch(...)
     { this->_M_setstate(ios_base::badbit); }
   if (__err)
     this->setstate(__err);
 }
      return *this;
    }

  template<typename _CharT, typename _Traits>
    basic_istream<_CharT, _Traits>&
    basic_istream<_CharT, _Traits>::
    unget(void)
    {


      _M_gcount = 0;

      this->clear(this->rdstate() & ~ios_base::eofbit);
      sentry __cerb(*this, true);
      if (__cerb)
 {
   ios_base::iostate __err = ios_base::goodbit;
   try
     {
       const int_type __eof = traits_type::eof();
       __streambuf_type* __sb = this->rdbuf();
       if (!__sb
    || traits_type::eq_int_type(__sb->sungetc(), __eof))
  __err |= ios_base::badbit;
     }
   catch(__cxxabiv1::__forced_unwind&)
     {
       this->_M_setstate(ios_base::badbit);
       throw;
     }
   catch(...)
     { this->_M_setstate(ios_base::badbit); }
   if (__err)
     this->setstate(__err);
 }
      return *this;
    }

  template<typename _CharT, typename _Traits>
    int
    basic_istream<_CharT, _Traits>::
    sync(void)
    {


      int __ret = -1;
      sentry __cerb(*this, true);
      if (__cerb)
 {
   ios_base::iostate __err = ios_base::goodbit;
   try
     {
       __streambuf_type* __sb = this->rdbuf();
       if (__sb)
  {
    if (__sb->pubsync() == -1)
      __err |= ios_base::badbit;
    else
      __ret = 0;
  }
     }
   catch(__cxxabiv1::__forced_unwind&)
     {
       this->_M_setstate(ios_base::badbit);
       throw;
     }
   catch(...)
     { this->_M_setstate(ios_base::badbit); }
   if (__err)
     this->setstate(__err);
 }
      return __ret;
    }

  template<typename _CharT, typename _Traits>
    typename basic_istream<_CharT, _Traits>::pos_type
    basic_istream<_CharT, _Traits>::
    tellg(void)
    {


      pos_type __ret = pos_type(-1);
      sentry __cerb(*this, true);
      if (__cerb)
 {
   try
     {
       if (!this->fail())
  __ret = this->rdbuf()->pubseekoff(0, ios_base::cur,
        ios_base::in);
     }
   catch(__cxxabiv1::__forced_unwind&)
     {
       this->_M_setstate(ios_base::badbit);
       throw;
     }
   catch(...)
     { this->_M_setstate(ios_base::badbit); }
 }
      return __ret;
    }

  template<typename _CharT, typename _Traits>
    basic_istream<_CharT, _Traits>&
    basic_istream<_CharT, _Traits>::
    seekg(pos_type __pos)
    {



      this->clear(this->rdstate() & ~ios_base::eofbit);
      sentry __cerb(*this, true);
      if (__cerb)
 {
   ios_base::iostate __err = ios_base::goodbit;
   try
     {
       if (!this->fail())
  {

    const pos_type __p = this->rdbuf()->pubseekpos(__pos,
         ios_base::in);


    if (__p == pos_type(off_type(-1)))
      __err |= ios_base::failbit;
  }
     }
   catch(__cxxabiv1::__forced_unwind&)
     {
       this->_M_setstate(ios_base::badbit);
       throw;
     }
   catch(...)
     { this->_M_setstate(ios_base::badbit); }
   if (__err)
     this->setstate(__err);
 }
      return *this;
    }

  template<typename _CharT, typename _Traits>
    basic_istream<_CharT, _Traits>&
    basic_istream<_CharT, _Traits>::
    seekg(off_type __off, ios_base::seekdir __dir)
    {



      this->clear(this->rdstate() & ~ios_base::eofbit);
      sentry __cerb(*this, true);
      if (__cerb)
 {
   ios_base::iostate __err = ios_base::goodbit;
   try
     {
       if (!this->fail())
  {

    const pos_type __p = this->rdbuf()->pubseekoff(__off, __dir,
         ios_base::in);


    if (__p == pos_type(off_type(-1)))
      __err |= ios_base::failbit;
  }
     }
   catch(__cxxabiv1::__forced_unwind&)
     {
       this->_M_setstate(ios_base::badbit);
       throw;
     }
   catch(...)
     { this->_M_setstate(ios_base::badbit); }
   if (__err)
     this->setstate(__err);
 }
      return *this;
    }


  template<typename _CharT, typename _Traits>
    basic_istream<_CharT, _Traits>&
    operator>>(basic_istream<_CharT, _Traits>& __in, _CharT& __c)
    {
      typedef basic_istream<_CharT, _Traits> __istream_type;
      typedef typename __istream_type::int_type __int_type;

      typename __istream_type::sentry __cerb(__in, false);
      if (__cerb)
 {
   ios_base::iostate __err = ios_base::goodbit;
   try
     {
       const __int_type __cb = __in.rdbuf()->sbumpc();
       if (!_Traits::eq_int_type(__cb, _Traits::eof()))
  __c = _Traits::to_char_type(__cb);
       else
  __err |= (ios_base::eofbit | ios_base::failbit);
     }
   catch(__cxxabiv1::__forced_unwind&)
     {
       __in._M_setstate(ios_base::badbit);
       throw;
     }
   catch(...)
     { __in._M_setstate(ios_base::badbit); }
   if (__err)
     __in.setstate(__err);
 }
      return __in;
    }

  template<typename _CharT, typename _Traits>
    basic_istream<_CharT, _Traits>&
    operator>>(basic_istream<_CharT, _Traits>& __in, _CharT* __s)
    {
      typedef basic_istream<_CharT, _Traits> __istream_type;
      typedef basic_streambuf<_CharT, _Traits> __streambuf_type;
      typedef typename _Traits::int_type int_type;
      typedef _CharT char_type;
      typedef ctype<_CharT> __ctype_type;

      streamsize __extracted = 0;
      ios_base::iostate __err = ios_base::goodbit;
      typename __istream_type::sentry __cerb(__in, false);
      if (__cerb)
 {
   try
     {

       streamsize __num = __in.width();
       if (__num <= 0)
  __num = __gnu_cxx::__numeric_traits<streamsize>::__max;

       const __ctype_type& __ct = use_facet<__ctype_type>(__in.getloc());

       const int_type __eof = _Traits::eof();
       __streambuf_type* __sb = __in.rdbuf();
       int_type __c = __sb->sgetc();

       while (__extracted < __num - 1
       && !_Traits::eq_int_type(__c, __eof)
       && !__ct.is(ctype_base::space,
     _Traits::to_char_type(__c)))
  {
    *__s++ = _Traits::to_char_type(__c);
    ++__extracted;
    __c = __sb->snextc();
  }
       if (_Traits::eq_int_type(__c, __eof))
  __err |= ios_base::eofbit;



       *__s = char_type();
       __in.width(0);
     }
   catch(__cxxabiv1::__forced_unwind&)
     {
       __in._M_setstate(ios_base::badbit);
       throw;
     }
   catch(...)
     { __in._M_setstate(ios_base::badbit); }
 }
      if (!__extracted)
 __err |= ios_base::failbit;
      if (__err)
 __in.setstate(__err);
      return __in;
    }


  template<typename _CharT, typename _Traits>
    basic_istream<_CharT, _Traits>&
    ws(basic_istream<_CharT, _Traits>& __in)
    {
      typedef basic_istream<_CharT, _Traits> __istream_type;
      typedef basic_streambuf<_CharT, _Traits> __streambuf_type;
      typedef typename __istream_type::int_type __int_type;
      typedef ctype<_CharT> __ctype_type;

      const __ctype_type& __ct = use_facet<__ctype_type>(__in.getloc());
      const __int_type __eof = _Traits::eof();
      __streambuf_type* __sb = __in.rdbuf();
      __int_type __c = __sb->sgetc();

      while (!_Traits::eq_int_type(__c, __eof)
      && __ct.is(ctype_base::space, _Traits::to_char_type(__c)))
 __c = __sb->snextc();

       if (_Traits::eq_int_type(__c, __eof))
  __in.setstate(ios_base::eofbit);
      return __in;
    }




  extern template class basic_istream<char>;
  extern template istream& ws(istream&);
  extern template istream& operator>>(istream&, char&);
  extern template istream& operator>>(istream&, char*);
  extern template istream& operator>>(istream&, unsigned char&);
  extern template istream& operator>>(istream&, signed char&);
  extern template istream& operator>>(istream&, unsigned char*);
  extern template istream& operator>>(istream&, signed char*);

  extern template istream& istream::_M_extract(unsigned short&);
  extern template istream& istream::_M_extract(unsigned int&);
  extern template istream& istream::_M_extract(long&);
  extern template istream& istream::_M_extract(unsigned long&);
  extern template istream& istream::_M_extract(bool&);

  extern template istream& istream::_M_extract(long long&);
  extern template istream& istream::_M_extract(unsigned long long&);

  extern template istream& istream::_M_extract(float&);
  extern template istream& istream::_M_extract(double&);
  extern template istream& istream::_M_extract(long double&);
  extern template istream& istream::_M_extract(void*&);

  extern template class basic_iostream<char>;


  extern template class basic_istream<wchar_t>;
  extern template wistream& ws(wistream&);
  extern template wistream& operator>>(wistream&, wchar_t&);
  extern template wistream& operator>>(wistream&, wchar_t*);

  extern template wistream& wistream::_M_extract(unsigned short&);
  extern template wistream& wistream::_M_extract(unsigned int&);
  extern template wistream& wistream::_M_extract(long&);
  extern template wistream& wistream::_M_extract(unsigned long&);
  extern template wistream& wistream::_M_extract(bool&);

  extern template wistream& wistream::_M_extract(long long&);
  extern template wistream& wistream::_M_extract(unsigned long long&);

  extern template wistream& wistream::_M_extract(float&);
  extern template wistream& wistream::_M_extract(double&);
  extern template wistream& wistream::_M_extract(long double&);
  extern template wistream& wistream::_M_extract(void*&);

  extern template class basic_iostream<wchar_t>;




}
# 880 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/istream" 2 3
# 39 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/sstream" 2 3


namespace std __attribute__ ((__visibility__ ("default")))
{

# 63 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/sstream" 3
  template<typename _CharT, typename _Traits, typename _Alloc>
    class basic_stringbuf : public basic_streambuf<_CharT, _Traits>
    {
    public:

      typedef _CharT char_type;
      typedef _Traits traits_type;


      typedef _Alloc allocator_type;
      typedef typename traits_type::int_type int_type;
      typedef typename traits_type::pos_type pos_type;
      typedef typename traits_type::off_type off_type;

      typedef basic_streambuf<char_type, traits_type> __streambuf_type;
      typedef basic_string<char_type, _Traits, _Alloc> __string_type;
      typedef typename __string_type::size_type __size_type;

    protected:

      ios_base::openmode _M_mode;


      __string_type _M_string;

    public:
# 97 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/sstream" 3
      explicit
      basic_stringbuf(ios_base::openmode __mode = ios_base::in | ios_base::out)
      : __streambuf_type(), _M_mode(__mode), _M_string()
      { }
# 110 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/sstream" 3
      explicit
      basic_stringbuf(const __string_type& __str,
        ios_base::openmode __mode = ios_base::in | ios_base::out)
      : __streambuf_type(), _M_mode(), _M_string(__str.data(), __str.size())
      { _M_stringbuf_init(__mode); }
# 125 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/sstream" 3
      __string_type
      str() const
      {
 __string_type __ret;
 if (this->pptr())
   {

     if (this->pptr() > this->egptr())
       __ret = __string_type(this->pbase(), this->pptr());
     else
        __ret = __string_type(this->pbase(), this->egptr());
   }
 else
   __ret = _M_string;
 return __ret;
      }
# 149 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/sstream" 3
      void
      str(const __string_type& __s)
      {

 _M_string.assign(__s.data(), __s.size());
 _M_stringbuf_init(_M_mode);
      }

    protected:

      void
      _M_stringbuf_init(ios_base::openmode __mode)
      {
 _M_mode = __mode;
 __size_type __len = 0;
 if (_M_mode & (ios_base::ate | ios_base::app))
   __len = _M_string.size();
 _M_sync(const_cast<char_type*>(_M_string.data()), 0, __len);
      }

      virtual streamsize
      showmanyc()
      {
 streamsize __ret = -1;
 if (_M_mode & ios_base::in)
   {
     _M_update_egptr();
     __ret = this->egptr() - this->gptr();
   }
 return __ret;
      }

      virtual int_type
      underflow();

      virtual int_type
      pbackfail(int_type __c = traits_type::eof());

      virtual int_type
      overflow(int_type __c = traits_type::eof());
# 201 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/sstream" 3
      virtual __streambuf_type*
      setbuf(char_type* __s, streamsize __n)
      {
 if (__s && __n >= 0)
   {






     _M_string.clear();


     _M_sync(__s, __n, 0);
   }
 return this;
      }

      virtual pos_type
      seekoff(off_type __off, ios_base::seekdir __way,
       ios_base::openmode __mode = ios_base::in | ios_base::out);

      virtual pos_type
      seekpos(pos_type __sp,
       ios_base::openmode __mode = ios_base::in | ios_base::out);




      void
      _M_sync(char_type* __base, __size_type __i, __size_type __o);



      void
      _M_update_egptr()
      {
 const bool __testin = _M_mode & ios_base::in;
 if (this->pptr() && this->pptr() > this->egptr())
   {
     if (__testin)
       this->setg(this->eback(), this->gptr(), this->pptr());
     else
       this->setg(this->pptr(), this->pptr(), this->pptr());
   }
      }



      void
      _M_pbump(char_type* __pbeg, char_type* __pend, off_type __off);
    };
# 271 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/sstream" 3
  template<typename _CharT, typename _Traits, typename _Alloc>
    class basic_istringstream : public basic_istream<_CharT, _Traits>
    {
    public:

      typedef _CharT char_type;
      typedef _Traits traits_type;


      typedef _Alloc allocator_type;
      typedef typename traits_type::int_type int_type;
      typedef typename traits_type::pos_type pos_type;
      typedef typename traits_type::off_type off_type;


      typedef basic_string<_CharT, _Traits, _Alloc> __string_type;
      typedef basic_stringbuf<_CharT, _Traits, _Alloc> __stringbuf_type;
      typedef basic_istream<char_type, traits_type> __istream_type;

    private:
      __stringbuf_type _M_stringbuf;

    public:
# 307 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/sstream" 3
      explicit
      basic_istringstream(ios_base::openmode __mode = ios_base::in)
      : __istream_type(), _M_stringbuf(__mode | ios_base::in)
      { this->init(&_M_stringbuf); }
# 325 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/sstream" 3
      explicit
      basic_istringstream(const __string_type& __str,
     ios_base::openmode __mode = ios_base::in)
      : __istream_type(), _M_stringbuf(__str, __mode | ios_base::in)
      { this->init(&_M_stringbuf); }







      ~basic_istringstream()
      { }
# 347 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/sstream" 3
      __stringbuf_type*
      rdbuf() const
      { return const_cast<__stringbuf_type*>(&_M_stringbuf); }





      __string_type
      str() const
      { return _M_stringbuf.str(); }







      void
      str(const __string_type& __s)
      { _M_stringbuf.str(__s); }
    };
# 386 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/sstream" 3
  template <typename _CharT, typename _Traits, typename _Alloc>
    class basic_ostringstream : public basic_ostream<_CharT, _Traits>
    {
    public:

      typedef _CharT char_type;
      typedef _Traits traits_type;


      typedef _Alloc allocator_type;
      typedef typename traits_type::int_type int_type;
      typedef typename traits_type::pos_type pos_type;
      typedef typename traits_type::off_type off_type;


      typedef basic_string<_CharT, _Traits, _Alloc> __string_type;
      typedef basic_stringbuf<_CharT, _Traits, _Alloc> __stringbuf_type;
      typedef basic_ostream<char_type, traits_type> __ostream_type;

    private:
      __stringbuf_type _M_stringbuf;

    public:
# 422 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/sstream" 3
      explicit
      basic_ostringstream(ios_base::openmode __mode = ios_base::out)
      : __ostream_type(), _M_stringbuf(__mode | ios_base::out)
      { this->init(&_M_stringbuf); }
# 440 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/sstream" 3
      explicit
      basic_ostringstream(const __string_type& __str,
     ios_base::openmode __mode = ios_base::out)
      : __ostream_type(), _M_stringbuf(__str, __mode | ios_base::out)
      { this->init(&_M_stringbuf); }







      ~basic_ostringstream()
      { }
# 462 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/sstream" 3
      __stringbuf_type*
      rdbuf() const
      { return const_cast<__stringbuf_type*>(&_M_stringbuf); }





      __string_type
      str() const
      { return _M_stringbuf.str(); }







      void
      str(const __string_type& __s)
      { _M_stringbuf.str(__s); }
    };
# 501 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/sstream" 3
  template <typename _CharT, typename _Traits, typename _Alloc>
    class basic_stringstream : public basic_iostream<_CharT, _Traits>
    {
    public:

      typedef _CharT char_type;
      typedef _Traits traits_type;


      typedef _Alloc allocator_type;
      typedef typename traits_type::int_type int_type;
      typedef typename traits_type::pos_type pos_type;
      typedef typename traits_type::off_type off_type;


      typedef basic_string<_CharT, _Traits, _Alloc> __string_type;
      typedef basic_stringbuf<_CharT, _Traits, _Alloc> __stringbuf_type;
      typedef basic_iostream<char_type, traits_type> __iostream_type;

    private:
      __stringbuf_type _M_stringbuf;

    public:
# 536 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/sstream" 3
      explicit
      basic_stringstream(ios_base::openmode __m = ios_base::out | ios_base::in)
      : __iostream_type(), _M_stringbuf(__m)
      { this->init(&_M_stringbuf); }
# 552 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/sstream" 3
      explicit
      basic_stringstream(const __string_type& __str,
    ios_base::openmode __m = ios_base::out | ios_base::in)
      : __iostream_type(), _M_stringbuf(__str, __m)
      { this->init(&_M_stringbuf); }







      ~basic_stringstream()
      { }
# 574 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/sstream" 3
      __stringbuf_type*
      rdbuf() const
      { return const_cast<__stringbuf_type*>(&_M_stringbuf); }





      __string_type
      str() const
      { return _M_stringbuf.str(); }







      void
      str(const __string_type& __s)
      { _M_stringbuf.str(__s); }
    };


}

# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/sstream.tcc" 1 3
# 37 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/sstream.tcc" 3
       
# 38 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/sstream.tcc" 3

namespace std __attribute__ ((__visibility__ ("default")))
{


  template <class _CharT, class _Traits, class _Alloc>
    typename basic_stringbuf<_CharT, _Traits, _Alloc>::int_type
    basic_stringbuf<_CharT, _Traits, _Alloc>::
    pbackfail(int_type __c)
    {
      int_type __ret = traits_type::eof();
      if (this->eback() < this->gptr())
 {


   const bool __testeof = traits_type::eq_int_type(__c, __ret);
   if (!__testeof)
     {
       const bool __testeq = traits_type::eq(traits_type::
          to_char_type(__c),
          this->gptr()[-1]);
       const bool __testout = this->_M_mode & ios_base::out;
       if (__testeq || __testout)
  {
    this->gbump(-1);
    if (!__testeq)
      *this->gptr() = traits_type::to_char_type(__c);
    __ret = __c;
  }
     }
   else
     {
       this->gbump(-1);
       __ret = traits_type::not_eof(__c);
     }
 }
      return __ret;
    }

  template <class _CharT, class _Traits, class _Alloc>
    typename basic_stringbuf<_CharT, _Traits, _Alloc>::int_type
    basic_stringbuf<_CharT, _Traits, _Alloc>::
    overflow(int_type __c)
    {
      const bool __testout = this->_M_mode & ios_base::out;
      if (__builtin_expect(!__testout, false))
 return traits_type::eof();

      const bool __testeof = traits_type::eq_int_type(__c, traits_type::eof());
      if (__builtin_expect(__testeof, false))
 return traits_type::not_eof(__c);

      const __size_type __capacity = _M_string.capacity();
      const __size_type __max_size = _M_string.max_size();
      const bool __testput = this->pptr() < this->epptr();
      if (__builtin_expect(!__testput && __capacity == __max_size, false))
 return traits_type::eof();



      const char_type __conv = traits_type::to_char_type(__c);
      if (!__testput)
 {
# 110 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/sstream.tcc" 3
   const __size_type __opt_len = std::max(__size_type(2 * __capacity),
       __size_type(512));
   const __size_type __len = std::min(__opt_len, __max_size);
   __string_type __tmp;
   __tmp.reserve(__len);
   if (this->pbase())
     __tmp.assign(this->pbase(), this->epptr() - this->pbase());
   __tmp.push_back(__conv);
   _M_string.swap(__tmp);
   _M_sync(const_cast<char_type*>(_M_string.data()),
    this->gptr() - this->eback(), this->pptr() - this->pbase());
 }
      else
 *this->pptr() = __conv;
      this->pbump(1);
      return __c;
    }

  template <class _CharT, class _Traits, class _Alloc>
    typename basic_stringbuf<_CharT, _Traits, _Alloc>::int_type
    basic_stringbuf<_CharT, _Traits, _Alloc>::
    underflow()
    {
      int_type __ret = traits_type::eof();
      const bool __testin = this->_M_mode & ios_base::in;
      if (__testin)
 {

   _M_update_egptr();

   if (this->gptr() < this->egptr())
     __ret = traits_type::to_int_type(*this->gptr());
 }
      return __ret;
    }

  template <class _CharT, class _Traits, class _Alloc>
    typename basic_stringbuf<_CharT, _Traits, _Alloc>::pos_type
    basic_stringbuf<_CharT, _Traits, _Alloc>::
    seekoff(off_type __off, ios_base::seekdir __way, ios_base::openmode __mode)
    {
      pos_type __ret = pos_type(off_type(-1));
      bool __testin = (ios_base::in & this->_M_mode & __mode) != 0;
      bool __testout = (ios_base::out & this->_M_mode & __mode) != 0;
      const bool __testboth = __testin && __testout && __way != ios_base::cur;
      __testin &= !(__mode & ios_base::out);
      __testout &= !(__mode & ios_base::in);



      const char_type* __beg = __testin ? this->eback() : this->pbase();
      if ((__beg || !__off) && (__testin || __testout || __testboth))
 {
   _M_update_egptr();

   off_type __newoffi = __off;
   off_type __newoffo = __newoffi;
   if (__way == ios_base::cur)
     {
       __newoffi += this->gptr() - __beg;
       __newoffo += this->pptr() - __beg;
     }
   else if (__way == ios_base::end)
     __newoffo = __newoffi += this->egptr() - __beg;

   if ((__testin || __testboth)
       && __newoffi >= 0
       && this->egptr() - __beg >= __newoffi)
     {
       this->setg(this->eback(), this->eback() + __newoffi,
    this->egptr());
       __ret = pos_type(__newoffi);
     }
   if ((__testout || __testboth)
       && __newoffo >= 0
       && this->egptr() - __beg >= __newoffo)
     {
       _M_pbump(this->pbase(), this->epptr(), __newoffo);
       __ret = pos_type(__newoffo);
     }
 }
      return __ret;
    }

  template <class _CharT, class _Traits, class _Alloc>
    typename basic_stringbuf<_CharT, _Traits, _Alloc>::pos_type
    basic_stringbuf<_CharT, _Traits, _Alloc>::
    seekpos(pos_type __sp, ios_base::openmode __mode)
    {
      pos_type __ret = pos_type(off_type(-1));
      const bool __testin = (ios_base::in & this->_M_mode & __mode) != 0;
      const bool __testout = (ios_base::out & this->_M_mode & __mode) != 0;

      const char_type* __beg = __testin ? this->eback() : this->pbase();
      if ((__beg || !off_type(__sp)) && (__testin || __testout))
 {
   _M_update_egptr();

   const off_type __pos(__sp);
   const bool __testpos = (0 <= __pos
      && __pos <= this->egptr() - __beg);
   if (__testpos)
     {
       if (__testin)
  this->setg(this->eback(), this->eback() + __pos,
      this->egptr());
       if (__testout)
  _M_pbump(this->pbase(), this->epptr(), __pos);
       __ret = __sp;
     }
 }
      return __ret;
    }

  template <class _CharT, class _Traits, class _Alloc>
    void
    basic_stringbuf<_CharT, _Traits, _Alloc>::
    _M_sync(char_type* __base, __size_type __i, __size_type __o)
    {
      const bool __testin = _M_mode & ios_base::in;
      const bool __testout = _M_mode & ios_base::out;
      char_type* __endg = __base + _M_string.size();
      char_type* __endp = __base + _M_string.capacity();

      if (__base != _M_string.data())
 {

   __endg += __i;
   __i = 0;
   __endp = __endg;
 }

      if (__testin)
 this->setg(__base, __base + __i, __endg);
      if (__testout)
 {
   _M_pbump(__base, __endp, __o);



   if (!__testin)
     this->setg(__endg, __endg, __endg);
 }
    }

  template <class _CharT, class _Traits, class _Alloc>
    void
    basic_stringbuf<_CharT, _Traits, _Alloc>::
    _M_pbump(char_type* __pbeg, char_type* __pend, off_type __off)
    {
      this->setp(__pbeg, __pend);
      while (__off > __gnu_cxx::__numeric_traits<int>::__max)
 {
   this->pbump(__gnu_cxx::__numeric_traits<int>::__max);
   __off -= __gnu_cxx::__numeric_traits<int>::__max;
 }
      this->pbump(__off);
    }




  extern template class basic_stringbuf<char>;
  extern template class basic_istringstream<char>;
  extern template class basic_ostringstream<char>;
  extern template class basic_stringstream<char>;


  extern template class basic_stringbuf<wchar_t>;
  extern template class basic_istringstream<wchar_t>;
  extern template class basic_ostringstream<wchar_t>;
  extern template class basic_stringstream<wchar_t>;




}
# 601 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/sstream" 2 3
# 27 "lte_portability.h" 2


# 1 "/usr/include/inttypes.h" 1 3 4
# 274 "/usr/include/inttypes.h" 3 4
extern "C" {




typedef struct
  {
    long int quot;
    long int rem;
  } imaxdiv_t;
# 298 "/usr/include/inttypes.h" 3 4
extern intmax_t imaxabs (intmax_t __n) throw () __attribute__ ((__const__));


extern imaxdiv_t imaxdiv (intmax_t __numer, intmax_t __denom)
      throw () __attribute__ ((__const__));


extern intmax_t strtoimax (__const char *__restrict __nptr,
      char **__restrict __endptr, int __base) throw ();


extern uintmax_t strtoumax (__const char *__restrict __nptr,
       char ** __restrict __endptr, int __base) throw ();


extern intmax_t wcstoimax (__const wchar_t *__restrict __nptr,
      wchar_t **__restrict __endptr, int __base)
     throw ();


extern uintmax_t wcstoumax (__const wchar_t *__restrict __nptr,
       wchar_t ** __restrict __endptr, int __base)
     throw ();
# 442 "/usr/include/inttypes.h" 3 4
}
# 30 "lte_portability.h" 2
# 39 "lte_portability.h"
  typedef struct stat lte_stat_t;




extern "C" {


int lte_vsnprintf(char* buf, lte_size_t max_count, const char* fmt, va_list arg_list);
int lte_snprintf(char* buf, lte_size_t max_count, const char* fmt, ...);

typedef FILE* lte_hfile_t;
typedef int lte_fd_t;

static __inline
lte_fd_t lte_open(const char * filename, lte_int_t oflags, int mode)
{
    return open(filename, oflags, mode);
}

static __inline
lte_int_t lte_read(lte_fd_t fd, void* buf, lte_uint_t maxcnt)
{
    return read(fd, buf, maxcnt);
}

static __inline
lte_int_t lte_write(lte_fd_t fd, const void* buf, lte_uint_t maxcnt)
{
    return write(fd, buf, maxcnt);
}

static __inline
lte_int_t lte_close(lte_fd_t fd)
{
    return close(fd);
}

static __inline
lte_int_t lte_fstat(lte_fd_t fd, lte_stat_t *buf)
{
    return fstat(fd, buf);
}

static __inline
lte_hfile_t lte_fopen(const char* file, const char* mode)
{
    return fopen(file, mode);
}

static __inline
lte_int_t lte_fclose(lte_hfile_t hfile)
{
    return fclose(hfile);
}

static __inline
char* lte_fgets(char* str, lte_int_t n, lte_hfile_t hfile)
{
    return fgets(str, n, hfile);
}

static __inline
int lte_vfprintf(lte_hfile_t hfile, const char* fmt, va_list arg_list)
{
    return vfprintf(hfile, fmt, arg_list);
}

int lte_fprintf(lte_hfile_t hfile, const char* fmt, ...);

lte_bool_t lte_preadq(lte_fd_t fd, void* buf, lte_size64_t ntoread, lte_size64_t* pnread = __null);

lte_bool_t lte_pwriteq(lte_fd_t fd, const void* buf, lte_size64_t ntowrite, lte_size64_t* pnwritten = __null);

lte_bool_t lte_pread(lte_fd_t fd, void* buf, lte_size_t ntoread, lte_size_t* pnread = __null);

lte_bool_t lte_pwrite(lte_fd_t fd, const void* buf, lte_size_t ntowrite, lte_size_t* pnwritten = __null);

static __inline
lte_uint32_t lte_strtoul(const char* str, char** end, int radix)
{
    return strtoul(str, end, radix);
}

static __inline
lte_uint64_t lte_strtoull(const char* str, char** end, int radix)
{
    return strtoull(str, end, radix);
}


static __inline
int lte_stricmp(const char* s1, const char* s2)
{
    return strcasecmp(s1, s2);
}
static __inline
int lte_strnicmp(const char* s1, const char* s2, lte_size_t n)
{
    return strncasecmp(s1, s2, n);
}
# 152 "lte_portability.h"
static __inline
lte_size_t lte_strlen(const char* s)
{
    return strlen(s);
}

static __inline
char* lte_strchr(char* str, int c)
{
    return strchr(str, c);
}

static __inline
char* lte_strncpy(char* destination, const char* source, lte_size_t n)
{
    return strncpy(destination, source, n);
}



}




template<class T>
inline T __lte_offset(T v, lte_size_t align) { return v & (((T)0)+(align-1)) ; }

template<class T>
inline lte_size_t __lte_offset(T* v, lte_size_t align) { return (reinterpret_cast<char*>(v)-reinterpret_cast<char*>(0)) & (align-1); }

template<class T>
inline T __lte_align(T v, lte_size_t align) { return v & ~(reinterpret_cast<char*>((reinterpret_cast<char*>(0)+(align-1)))-reinterpret_cast<char*>(0)); }

template<class T>
inline T* __lte_align(T* v, lte_size_t align) { return (reinterpret_cast<char*>(0)+(__lte_align((reinterpret_cast<char*>(v)-reinterpret_cast<char*>(0)), align))); }

template<class T>
inline T __lte_align_up(T v, lte_size_t align) { return (v+(align-1)) & ~(reinterpret_cast<char*>((reinterpret_cast<char*>(0)+(align-1)))-reinterpret_cast<char*>(0)); }

template<class T>
inline T* __lte_align_up(T* v, lte_size_t align) { return (reinterpret_cast<char*>(0)+(__lte_align_up((reinterpret_cast<char*>(v)-reinterpret_cast<char*>(0)), align))); }



void lte_format_string_va(std::string& s, const char *fmt, va_list arg_list);

void lte_format_string(std::string& s, const char *fmt, ...);

std::string& lte_addr2str(std::string& s, lte_addr_t addr);

std::string& lte_addr2STR(std::string& s, lte_addr_t addr);

std::string& lte_addr2str_fix(std::string& s, lte_addr_t addr);

std::string& lte_addr2STR_fix(std::string& s, lte_addr_t addr);

static __inline const char* lte_addr2cstr(std::string& s, lte_addr_t addr)
{
    return lte_addr2str(s, addr).c_str();
}

static __inline const char* lte_addr2CSTR(std::string& s, lte_addr_t addr)
{
    return lte_addr2STR(s, addr).c_str();
}

static __inline const char* lte_addr2cstr_fix(std::string& s, lte_addr_t addr)
{
    return lte_addr2str_fix(s, addr).c_str();
}

static __inline const char* lte_addr2CSTR_fix(std::string& s, lte_addr_t addr)
{
    return lte_addr2STR_fix(s, addr).c_str();
}
# 18 "lte_strtab.h" 2
# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/vector" 1 3
# 58 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/vector" 3
       
# 59 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/vector" 3



# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_construct.h" 1 3
# 61 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_construct.h" 3
# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ext/alloc_traits.h" 1 3
# 32 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ext/alloc_traits.h" 3
       
# 33 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ext/alloc_traits.h" 3
# 41 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ext/alloc_traits.h" 3
namespace __gnu_cxx __attribute__ ((__visibility__ ("default")))
{

# 94 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ext/alloc_traits.h" 3
template<typename _Alloc>
  struct __alloc_traits



  {
    typedef _Alloc allocator_type;
# 172 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/ext/alloc_traits.h" 3
    typedef typename _Alloc::pointer pointer;
    typedef typename _Alloc::const_pointer const_pointer;
    typedef typename _Alloc::value_type value_type;
    typedef typename _Alloc::reference reference;
    typedef typename _Alloc::const_reference const_reference;
    typedef typename _Alloc::size_type size_type;
    typedef typename _Alloc::difference_type difference_type;

    static pointer
    allocate(_Alloc& __a, size_type __n)
    { return __a.allocate(__n); }

    static void deallocate(_Alloc& __a, pointer __p, size_type __n)
    { __a.deallocate(__p, __n); }

    template<typename _Tp>
      static void construct(_Alloc& __a, pointer __p, const _Tp& __arg)
      { __a.construct(__p, __arg); }

    static void destroy(_Alloc& __a, pointer __p)
    { __a.destroy(__p); }

    static size_type max_size(const _Alloc& __a)
    { return __a.max_size(); }

    static const _Alloc& _S_select_on_copy(const _Alloc& __a) { return __a; }

    static void _S_on_swap(_Alloc& __a, _Alloc& __b)
    {


      std::__alloc_swap<_Alloc>::_S_do_it(__a, __b);
    }

    template<typename _Tp>
      struct rebind
      { typedef typename _Alloc::template rebind<_Tp>::other other; };

  };


}
# 62 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_construct.h" 2 3

namespace std __attribute__ ((__visibility__ ("default")))
{

# 77 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_construct.h" 3
  template<typename _T1, typename _T2>
    inline void
    _Construct(_T1* __p, const _T2& __value)
    {


      ::new(static_cast<void*>(__p)) _T1(__value);
    }





  template<typename _Tp>
    inline void
    _Destroy(_Tp* __pointer)
    { __pointer->~_Tp(); }

  template<bool>
    struct _Destroy_aux
    {
      template<typename _ForwardIterator>
        static void
        __destroy(_ForwardIterator __first, _ForwardIterator __last)
 {
   for (; __first != __last; ++__first)
     std::_Destroy(std::__addressof(*__first));
 }
    };

  template<>
    struct _Destroy_aux<true>
    {
      template<typename _ForwardIterator>
        static void
        __destroy(_ForwardIterator, _ForwardIterator) { }
    };






  template<typename _ForwardIterator>
    inline void
    _Destroy(_ForwardIterator __first, _ForwardIterator __last)
    {
      typedef typename iterator_traits<_ForwardIterator>::value_type
                       _Value_type;
      std::_Destroy_aux<__has_trivial_destructor(_Value_type)>::
 __destroy(__first, __last);
    }







  template<typename _ForwardIterator, typename _Allocator>
    void
    _Destroy(_ForwardIterator __first, _ForwardIterator __last,
      _Allocator& __alloc)
    {
      typedef __gnu_cxx::__alloc_traits<_Allocator> __traits;
      for (; __first != __last; ++__first)
 __traits::destroy(__alloc, std::__addressof(*__first));
    }

  template<typename _ForwardIterator, typename _Tp>
    inline void
    _Destroy(_ForwardIterator __first, _ForwardIterator __last,
      allocator<_Tp>&)
    {
      _Destroy(__first, __last);
    }


}
# 63 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/vector" 2 3
# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_uninitialized.h" 1 3
# 59 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_uninitialized.h" 3
namespace std __attribute__ ((__visibility__ ("default")))
{


  template<bool _TrivialValueTypes>
    struct __uninitialized_copy
    {
      template<typename _InputIterator, typename _ForwardIterator>
        static _ForwardIterator
        __uninit_copy(_InputIterator __first, _InputIterator __last,
        _ForwardIterator __result)
        {
   _ForwardIterator __cur = __result;
   try
     {
       for (; __first != __last; ++__first, ++__cur)
  std::_Construct(std::__addressof(*__cur), *__first);
       return __cur;
     }
   catch(...)
     {
       std::_Destroy(__result, __cur);
       throw;
     }
 }
    };

  template<>
    struct __uninitialized_copy<true>
    {
      template<typename _InputIterator, typename _ForwardIterator>
        static _ForwardIterator
        __uninit_copy(_InputIterator __first, _InputIterator __last,
        _ForwardIterator __result)
        { return std::copy(__first, __last, __result); }
    };
# 105 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_uninitialized.h" 3
  template<typename _InputIterator, typename _ForwardIterator>
    inline _ForwardIterator
    uninitialized_copy(_InputIterator __first, _InputIterator __last,
         _ForwardIterator __result)
    {
      typedef typename iterator_traits<_InputIterator>::value_type
 _ValueType1;
      typedef typename iterator_traits<_ForwardIterator>::value_type
 _ValueType2;

      const bool __assignable = true;






      return std::__uninitialized_copy<__is_trivial(_ValueType1)
           && __is_trivial(_ValueType2)
           && __assignable>::
 __uninit_copy(__first, __last, __result);
    }


  template<bool _TrivialValueType>
    struct __uninitialized_fill
    {
      template<typename _ForwardIterator, typename _Tp>
        static void
        __uninit_fill(_ForwardIterator __first, _ForwardIterator __last,
        const _Tp& __x)
        {
   _ForwardIterator __cur = __first;
   try
     {
       for (; __cur != __last; ++__cur)
  std::_Construct(std::__addressof(*__cur), __x);
     }
   catch(...)
     {
       std::_Destroy(__first, __cur);
       throw;
     }
 }
    };

  template<>
    struct __uninitialized_fill<true>
    {
      template<typename _ForwardIterator, typename _Tp>
        static void
        __uninit_fill(_ForwardIterator __first, _ForwardIterator __last,
        const _Tp& __x)
        { std::fill(__first, __last, __x); }
    };
# 170 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_uninitialized.h" 3
  template<typename _ForwardIterator, typename _Tp>
    inline void
    uninitialized_fill(_ForwardIterator __first, _ForwardIterator __last,
         const _Tp& __x)
    {
      typedef typename iterator_traits<_ForwardIterator>::value_type
 _ValueType;

      const bool __assignable = true;





      std::__uninitialized_fill<__is_trivial(_ValueType) && __assignable>::
 __uninit_fill(__first, __last, __x);
    }


  template<bool _TrivialValueType>
    struct __uninitialized_fill_n
    {
      template<typename _ForwardIterator, typename _Size, typename _Tp>
        static void
        __uninit_fill_n(_ForwardIterator __first, _Size __n,
   const _Tp& __x)
        {
   _ForwardIterator __cur = __first;
   try
     {
       for (; __n > 0; --__n, ++__cur)
  std::_Construct(std::__addressof(*__cur), __x);
     }
   catch(...)
     {
       std::_Destroy(__first, __cur);
       throw;
     }
 }
    };

  template<>
    struct __uninitialized_fill_n<true>
    {
      template<typename _ForwardIterator, typename _Size, typename _Tp>
        static void
        __uninit_fill_n(_ForwardIterator __first, _Size __n,
   const _Tp& __x)
        { std::fill_n(__first, __n, __x); }
    };
# 230 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_uninitialized.h" 3
  template<typename _ForwardIterator, typename _Size, typename _Tp>
    inline void
    uninitialized_fill_n(_ForwardIterator __first, _Size __n, const _Tp& __x)
    {
      typedef typename iterator_traits<_ForwardIterator>::value_type
 _ValueType;

      const bool __assignable = true;





      std::__uninitialized_fill_n<__is_trivial(_ValueType) && __assignable>::
 __uninit_fill_n(__first, __n, __x);
    }







  template<typename _InputIterator, typename _ForwardIterator,
    typename _Allocator>
    _ForwardIterator
    __uninitialized_copy_a(_InputIterator __first, _InputIterator __last,
      _ForwardIterator __result, _Allocator& __alloc)
    {
      _ForwardIterator __cur = __result;
      try
 {
   typedef __gnu_cxx::__alloc_traits<_Allocator> __traits;
   for (; __first != __last; ++__first, ++__cur)
     __traits::construct(__alloc, std::__addressof(*__cur), *__first);
   return __cur;
 }
      catch(...)
 {
   std::_Destroy(__result, __cur, __alloc);
   throw;
 }
    }

  template<typename _InputIterator, typename _ForwardIterator, typename _Tp>
    inline _ForwardIterator
    __uninitialized_copy_a(_InputIterator __first, _InputIterator __last,
      _ForwardIterator __result, allocator<_Tp>&)
    { return std::uninitialized_copy(__first, __last, __result); }

  template<typename _InputIterator, typename _ForwardIterator,
    typename _Allocator>
    inline _ForwardIterator
    __uninitialized_move_a(_InputIterator __first, _InputIterator __last,
      _ForwardIterator __result, _Allocator& __alloc)
    {
      return std::__uninitialized_copy_a((__first),
      (__last),
      __result, __alloc);
    }

  template<typename _InputIterator, typename _ForwardIterator,
    typename _Allocator>
    inline _ForwardIterator
    __uninitialized_move_if_noexcept_a(_InputIterator __first,
           _InputIterator __last,
           _ForwardIterator __result,
           _Allocator& __alloc)
    {
      return std::__uninitialized_copy_a
 ((__first),
  (__last), __result, __alloc);
    }

  template<typename _ForwardIterator, typename _Tp, typename _Allocator>
    void
    __uninitialized_fill_a(_ForwardIterator __first, _ForwardIterator __last,
      const _Tp& __x, _Allocator& __alloc)
    {
      _ForwardIterator __cur = __first;
      try
 {
   typedef __gnu_cxx::__alloc_traits<_Allocator> __traits;
   for (; __cur != __last; ++__cur)
     __traits::construct(__alloc, std::__addressof(*__cur), __x);
 }
      catch(...)
 {
   std::_Destroy(__first, __cur, __alloc);
   throw;
 }
    }

  template<typename _ForwardIterator, typename _Tp, typename _Tp2>
    inline void
    __uninitialized_fill_a(_ForwardIterator __first, _ForwardIterator __last,
      const _Tp& __x, allocator<_Tp2>&)
    { std::uninitialized_fill(__first, __last, __x); }

  template<typename _ForwardIterator, typename _Size, typename _Tp,
    typename _Allocator>
    void
    __uninitialized_fill_n_a(_ForwardIterator __first, _Size __n,
        const _Tp& __x, _Allocator& __alloc)
    {
      _ForwardIterator __cur = __first;
      try
 {
   typedef __gnu_cxx::__alloc_traits<_Allocator> __traits;
   for (; __n > 0; --__n, ++__cur)
     __traits::construct(__alloc, std::__addressof(*__cur), __x);
 }
      catch(...)
 {
   std::_Destroy(__first, __cur, __alloc);
   throw;
 }
    }

  template<typename _ForwardIterator, typename _Size, typename _Tp,
    typename _Tp2>
    inline void
    __uninitialized_fill_n_a(_ForwardIterator __first, _Size __n,
        const _Tp& __x, allocator<_Tp2>&)
    { std::uninitialized_fill_n(__first, __n, __x); }
# 366 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_uninitialized.h" 3
  template<typename _InputIterator1, typename _InputIterator2,
    typename _ForwardIterator, typename _Allocator>
    inline _ForwardIterator
    __uninitialized_copy_move(_InputIterator1 __first1,
         _InputIterator1 __last1,
         _InputIterator2 __first2,
         _InputIterator2 __last2,
         _ForwardIterator __result,
         _Allocator& __alloc)
    {
      _ForwardIterator __mid = std::__uninitialized_copy_a(__first1, __last1,
          __result,
          __alloc);
      try
 {
   return std::__uninitialized_move_a(__first2, __last2, __mid, __alloc);
 }
      catch(...)
 {
   std::_Destroy(__result, __mid, __alloc);
   throw;
 }
    }





  template<typename _InputIterator1, typename _InputIterator2,
    typename _ForwardIterator, typename _Allocator>
    inline _ForwardIterator
    __uninitialized_move_copy(_InputIterator1 __first1,
         _InputIterator1 __last1,
         _InputIterator2 __first2,
         _InputIterator2 __last2,
         _ForwardIterator __result,
         _Allocator& __alloc)
    {
      _ForwardIterator __mid = std::__uninitialized_move_a(__first1, __last1,
          __result,
          __alloc);
      try
 {
   return std::__uninitialized_copy_a(__first2, __last2, __mid, __alloc);
 }
      catch(...)
 {
   std::_Destroy(__result, __mid, __alloc);
   throw;
 }
    }




  template<typename _ForwardIterator, typename _Tp, typename _InputIterator,
    typename _Allocator>
    inline _ForwardIterator
    __uninitialized_fill_move(_ForwardIterator __result, _ForwardIterator __mid,
         const _Tp& __x, _InputIterator __first,
         _InputIterator __last, _Allocator& __alloc)
    {
      std::__uninitialized_fill_a(__result, __mid, __x, __alloc);
      try
 {
   return std::__uninitialized_move_a(__first, __last, __mid, __alloc);
 }
      catch(...)
 {
   std::_Destroy(__result, __mid, __alloc);
   throw;
 }
    }




  template<typename _InputIterator, typename _ForwardIterator, typename _Tp,
    typename _Allocator>
    inline void
    __uninitialized_move_fill(_InputIterator __first1, _InputIterator __last1,
         _ForwardIterator __first2,
         _ForwardIterator __last2, const _Tp& __x,
         _Allocator& __alloc)
    {
      _ForwardIterator __mid2 = std::__uninitialized_move_a(__first1, __last1,
           __first2,
           __alloc);
      try
 {
   std::__uninitialized_fill_a(__mid2, __last2, __x, __alloc);
 }
      catch(...)
 {
   std::_Destroy(__first2, __mid2, __alloc);
   throw;
 }
    }
# 679 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_uninitialized.h" 3

}
# 64 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/vector" 2 3
# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_vector.h" 1 3
# 66 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_vector.h" 3
namespace std __attribute__ ((__visibility__ ("default")))
{



  template<typename _Tp, typename _Alloc>
    struct _Vector_base
    {
      typedef typename __gnu_cxx::__alloc_traits<_Alloc>::template
        rebind<_Tp>::other _Tp_alloc_type;
      typedef typename __gnu_cxx::__alloc_traits<_Tp_alloc_type>::pointer
        pointer;

      struct _Vector_impl
      : public _Tp_alloc_type
      {
 pointer _M_start;
 pointer _M_finish;
 pointer _M_end_of_storage;

 _Vector_impl()
 : _Tp_alloc_type(), _M_start(0), _M_finish(0), _M_end_of_storage(0)
 { }

 _Vector_impl(_Tp_alloc_type const& __a)
 : _Tp_alloc_type(__a), _M_start(0), _M_finish(0), _M_end_of_storage(0)
 { }
# 101 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_vector.h" 3
 void _M_swap_data(_Vector_impl& __x)
 {
   std::swap(_M_start, __x._M_start);
   std::swap(_M_finish, __x._M_finish);
   std::swap(_M_end_of_storage, __x._M_end_of_storage);
 }
      };

    public:
      typedef _Alloc allocator_type;

      _Tp_alloc_type&
      _M_get_Tp_allocator()
      { return *static_cast<_Tp_alloc_type*>(&this->_M_impl); }

      const _Tp_alloc_type&
      _M_get_Tp_allocator() const
      { return *static_cast<const _Tp_alloc_type*>(&this->_M_impl); }

      allocator_type
      get_allocator() const
      { return allocator_type(_M_get_Tp_allocator()); }

      _Vector_base()
      : _M_impl() { }

      _Vector_base(const allocator_type& __a)
      : _M_impl(__a) { }

      _Vector_base(size_t __n)
      : _M_impl()
      { _M_create_storage(__n); }

      _Vector_base(size_t __n, const allocator_type& __a)
      : _M_impl(__a)
      { _M_create_storage(__n); }
# 159 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_vector.h" 3
      ~_Vector_base()
      { _M_deallocate(this->_M_impl._M_start, this->_M_impl._M_end_of_storage
        - this->_M_impl._M_start); }

    public:
      _Vector_impl _M_impl;

      pointer
      _M_allocate(size_t __n)
      {
 typedef __gnu_cxx::__alloc_traits<_Tp_alloc_type> _Tr;
 return __n != 0 ? _Tr::allocate(_M_impl, __n) : 0;
      }

      void
      _M_deallocate(pointer __p, size_t __n)
      {
 typedef __gnu_cxx::__alloc_traits<_Tp_alloc_type> _Tr;
 if (__p)
   _Tr::deallocate(_M_impl, __p, __n);
      }

    private:
      void
      _M_create_storage(size_t __n)
      {
 this->_M_impl._M_start = this->_M_allocate(__n);
 this->_M_impl._M_finish = this->_M_impl._M_start;
 this->_M_impl._M_end_of_storage = this->_M_impl._M_start + __n;
      }
    };
# 213 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_vector.h" 3
  template<typename _Tp, typename _Alloc = std::allocator<_Tp> >
    class vector : protected _Vector_base<_Tp, _Alloc>
    {

      typedef typename _Alloc::value_type _Alloc_value_type;
     
     

      typedef _Vector_base<_Tp, _Alloc> _Base;
      typedef typename _Base::_Tp_alloc_type _Tp_alloc_type;
      typedef __gnu_cxx::__alloc_traits<_Tp_alloc_type> _Alloc_traits;

    public:
      typedef _Tp value_type;
      typedef typename _Base::pointer pointer;
      typedef typename _Alloc_traits::const_pointer const_pointer;
      typedef typename _Alloc_traits::reference reference;
      typedef typename _Alloc_traits::const_reference const_reference;
      typedef __gnu_cxx::__normal_iterator<pointer, vector> iterator;
      typedef __gnu_cxx::__normal_iterator<const_pointer, vector>
      const_iterator;
      typedef std::reverse_iterator<const_iterator> const_reverse_iterator;
      typedef std::reverse_iterator<iterator> reverse_iterator;
      typedef size_t size_type;
      typedef ptrdiff_t difference_type;
      typedef _Alloc allocator_type;

    protected:
      using _Base::_M_allocate;
      using _Base::_M_deallocate;
      using _Base::_M_impl;
      using _Base::_M_get_Tp_allocator;

    public:






      vector()



      : _Base() { }





      explicit
      vector(const allocator_type& __a)
      : _Base(__a) { }
# 302 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_vector.h" 3
      explicit
      vector(size_type __n, const value_type& __value = value_type(),
      const allocator_type& __a = allocator_type())
      : _Base(__n, __a)
      { _M_fill_initialize(__n, __value); }
# 318 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_vector.h" 3
      vector(const vector& __x)
      : _Base(__x.size(),
        _Alloc_traits::_S_select_on_copy(__x._M_get_Tp_allocator()))
      { this->_M_impl._M_finish =
   std::__uninitialized_copy_a(__x.begin(), __x.end(),
          this->_M_impl._M_start,
          _M_get_Tp_allocator());
      }
# 406 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_vector.h" 3
      template<typename _InputIterator>
        vector(_InputIterator __first, _InputIterator __last,
        const allocator_type& __a = allocator_type())
 : _Base(__a)
        {

   typedef typename std::__is_integer<_InputIterator>::__type _Integral;
   _M_initialize_dispatch(__first, __last, _Integral());
 }
# 423 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_vector.h" 3
      ~vector()
      { std::_Destroy(this->_M_impl._M_start, this->_M_impl._M_finish,
        _M_get_Tp_allocator()); }
# 435 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_vector.h" 3
      vector&
      operator=(const vector& __x);
# 487 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_vector.h" 3
      void
      assign(size_type __n, const value_type& __val)
      { _M_fill_assign(__n, __val); }
# 510 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_vector.h" 3
      template<typename _InputIterator>
        void
        assign(_InputIterator __first, _InputIterator __last)
        {

   typedef typename std::__is_integer<_InputIterator>::__type _Integral;
   _M_assign_dispatch(__first, __last, _Integral());
 }
# 538 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_vector.h" 3
      using _Base::get_allocator;







      iterator
      begin()
      { return iterator(this->_M_impl._M_start); }






      const_iterator
      begin() const
      { return const_iterator(this->_M_impl._M_start); }






      iterator
      end()
      { return iterator(this->_M_impl._M_finish); }






      const_iterator
      end() const
      { return const_iterator(this->_M_impl._M_finish); }






      reverse_iterator
      rbegin()
      { return reverse_iterator(end()); }






      const_reverse_iterator
      rbegin() const
      { return const_reverse_iterator(end()); }






      reverse_iterator
      rend()
      { return reverse_iterator(begin()); }






      const_reverse_iterator
      rend() const
      { return const_reverse_iterator(begin()); }
# 653 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_vector.h" 3
      size_type
      size() const
      { return size_type(this->_M_impl._M_finish - this->_M_impl._M_start); }


      size_type
      max_size() const
      { return _Alloc_traits::max_size(_M_get_Tp_allocator()); }
# 712 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_vector.h" 3
      void
      resize(size_type __new_size, value_type __x = value_type())
      {
 if (__new_size > size())
   insert(end(), __new_size - size(), __x);
 else if (__new_size < size())
   _M_erase_at_end(this->_M_impl._M_start + __new_size);
      }
# 733 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_vector.h" 3
      size_type
      capacity() const
      { return size_type(this->_M_impl._M_end_of_storage
    - this->_M_impl._M_start); }





      bool
      empty() const
      { return begin() == end(); }
# 763 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_vector.h" 3
      void
      reserve(size_type __n);
# 778 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_vector.h" 3
      reference
      operator[](size_type __n)
      { return *(this->_M_impl._M_start + __n); }
# 793 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_vector.h" 3
      const_reference
      operator[](size_type __n) const
      { return *(this->_M_impl._M_start + __n); }

    protected:

      void
      _M_range_check(size_type __n) const
      {
 if (__n >= this->size())
   __throw_out_of_range_fmt(("vector::_M_range_check: __n " "(which is %zu) >= this->size() " "(which is %zu)")

                            ,
       __n, this->size());
      }

    public:
# 821 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_vector.h" 3
      reference
      at(size_type __n)
      {
 _M_range_check(__n);
 return (*this)[__n];
      }
# 839 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_vector.h" 3
      const_reference
      at(size_type __n) const
      {
 _M_range_check(__n);
 return (*this)[__n];
      }





      reference
      front()
      { return *begin(); }





      const_reference
      front() const
      { return *begin(); }





      reference
      back()
      { return *(end() - 1); }





      const_reference
      back() const
      { return *(end() - 1); }
# 888 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_vector.h" 3
      pointer

      data()
      { return _M_data_ptr(this->_M_impl._M_start); }




      const_pointer

      data() const
      { return _M_data_ptr(this->_M_impl._M_start); }
# 912 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_vector.h" 3
      void
      push_back(const value_type& __x)
      {
 if (this->_M_impl._M_finish != this->_M_impl._M_end_of_storage)
   {
     _Alloc_traits::construct(this->_M_impl, this->_M_impl._M_finish,
                              __x);
     ++this->_M_impl._M_finish;
   }
 else



   _M_insert_aux(end(), __x);

      }
# 948 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_vector.h" 3
      void
      pop_back()
      {
 --this->_M_impl._M_finish;
 _Alloc_traits::destroy(this->_M_impl, this->_M_impl._M_finish);
      }
# 997 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_vector.h" 3
      iterator
      insert(iterator __position, const value_type& __x);
# 1071 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_vector.h" 3
      void
      insert(iterator __position, size_type __n, const value_type& __x)
      { _M_fill_insert(__position, __n, __x); }
# 1118 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_vector.h" 3
      template<typename _InputIterator>
        void
        insert(iterator __position, _InputIterator __first,
        _InputIterator __last)
        {

   typedef typename std::__is_integer<_InputIterator>::__type _Integral;
   _M_insert_dispatch(__position, __first, __last, _Integral());
 }
# 1144 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_vector.h" 3
      iterator




      erase(iterator __position)
      { return _M_erase(__position); }
# 1171 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_vector.h" 3
      iterator
# 1180 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_vector.h" 3
      erase(iterator __first, iterator __last)
      { return _M_erase(__first, __last); }
# 1193 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_vector.h" 3
      void
      swap(vector& __x)



      {
 this->_M_impl._M_swap_data(__x._M_impl);
 _Alloc_traits::_S_on_swap(_M_get_Tp_allocator(),
                           __x._M_get_Tp_allocator());
      }







      void
      clear()
      { _M_erase_at_end(this->_M_impl._M_start); }

    protected:




      template<typename _ForwardIterator>
        pointer
        _M_allocate_and_copy(size_type __n,
        _ForwardIterator __first, _ForwardIterator __last)
        {
   pointer __result = this->_M_allocate(__n);
   try
     {
       std::__uninitialized_copy_a(__first, __last, __result,
       _M_get_Tp_allocator());
       return __result;
     }
   catch(...)
     {
       _M_deallocate(__result, __n);
       throw;
     }
 }
# 1245 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_vector.h" 3
      template<typename _Integer>
        void
        _M_initialize_dispatch(_Integer __n, _Integer __value, __true_type)
        {
   this->_M_impl._M_start = _M_allocate(static_cast<size_type>(__n));
   this->_M_impl._M_end_of_storage =
     this->_M_impl._M_start + static_cast<size_type>(__n);
   _M_fill_initialize(static_cast<size_type>(__n), __value);
 }


      template<typename _InputIterator>
        void
        _M_initialize_dispatch(_InputIterator __first, _InputIterator __last,
          __false_type)
        {
   typedef typename std::iterator_traits<_InputIterator>::
     iterator_category _IterCategory;
   _M_range_initialize(__first, __last, _IterCategory());
 }


      template<typename _InputIterator>
        void
        _M_range_initialize(_InputIterator __first,
       _InputIterator __last, std::input_iterator_tag)
        {
   for (; __first != __last; ++__first)



     push_back(*__first);

 }


      template<typename _ForwardIterator>
        void
        _M_range_initialize(_ForwardIterator __first,
       _ForwardIterator __last, std::forward_iterator_tag)
        {
   const size_type __n = std::distance(__first, __last);
   this->_M_impl._M_start = this->_M_allocate(__n);
   this->_M_impl._M_end_of_storage = this->_M_impl._M_start + __n;
   this->_M_impl._M_finish =
     std::__uninitialized_copy_a(__first, __last,
     this->_M_impl._M_start,
     _M_get_Tp_allocator());
 }



      void
      _M_fill_initialize(size_type __n, const value_type& __value)
      {
 std::__uninitialized_fill_n_a(this->_M_impl._M_start, __n, __value,
          _M_get_Tp_allocator());
 this->_M_impl._M_finish = this->_M_impl._M_end_of_storage;
      }
# 1323 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_vector.h" 3
      template<typename _Integer>
        void
        _M_assign_dispatch(_Integer __n, _Integer __val, __true_type)
        { _M_fill_assign(__n, __val); }


      template<typename _InputIterator>
        void
        _M_assign_dispatch(_InputIterator __first, _InputIterator __last,
      __false_type)
        {
   typedef typename std::iterator_traits<_InputIterator>::
     iterator_category _IterCategory;
   _M_assign_aux(__first, __last, _IterCategory());
 }


      template<typename _InputIterator>
        void
        _M_assign_aux(_InputIterator __first, _InputIterator __last,
        std::input_iterator_tag);


      template<typename _ForwardIterator>
        void
        _M_assign_aux(_ForwardIterator __first, _ForwardIterator __last,
        std::forward_iterator_tag);



      void
      _M_fill_assign(size_type __n, const value_type& __val);
# 1363 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_vector.h" 3
      template<typename _Integer>
        void
        _M_insert_dispatch(iterator __pos, _Integer __n, _Integer __val,
      __true_type)
        { _M_fill_insert(__pos, __n, __val); }


      template<typename _InputIterator>
        void
        _M_insert_dispatch(iterator __pos, _InputIterator __first,
      _InputIterator __last, __false_type)
        {
   typedef typename std::iterator_traits<_InputIterator>::
     iterator_category _IterCategory;
   _M_range_insert(__pos, __first, __last, _IterCategory());
 }


      template<typename _InputIterator>
        void
        _M_range_insert(iterator __pos, _InputIterator __first,
   _InputIterator __last, std::input_iterator_tag);


      template<typename _ForwardIterator>
        void
        _M_range_insert(iterator __pos, _ForwardIterator __first,
   _ForwardIterator __last, std::forward_iterator_tag);



      void
      _M_fill_insert(iterator __pos, size_type __n, const value_type& __x);
# 1408 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_vector.h" 3
      void
      _M_insert_aux(iterator __position, const value_type& __x);
# 1421 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_vector.h" 3
      size_type
      _M_check_len(size_type __n, const char* __s) const
      {
 if (max_size() - size() < __n)
   __throw_length_error((__s));

 const size_type __len = size() + std::max(size(), __n);
 return (__len < size() || __len > max_size()) ? max_size() : __len;
      }





      void
      _M_erase_at_end(pointer __pos)
      {
 std::_Destroy(__pos, this->_M_impl._M_finish, _M_get_Tp_allocator());
 this->_M_impl._M_finish = __pos;
      }

      iterator
      _M_erase(iterator __position);

      iterator
      _M_erase(iterator __first, iterator __last);
# 1491 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_vector.h" 3
      template<typename _Ptr>
 _Ptr
 _M_data_ptr(_Ptr __ptr) const
 { return __ptr; }

    };
# 1509 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_vector.h" 3
  template<typename _Tp, typename _Alloc>
    inline bool
    operator==(const vector<_Tp, _Alloc>& __x, const vector<_Tp, _Alloc>& __y)
    { return (__x.size() == __y.size()
       && std::equal(__x.begin(), __x.end(), __y.begin())); }
# 1526 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_vector.h" 3
  template<typename _Tp, typename _Alloc>
    inline bool
    operator<(const vector<_Tp, _Alloc>& __x, const vector<_Tp, _Alloc>& __y)
    { return std::lexicographical_compare(__x.begin(), __x.end(),
       __y.begin(), __y.end()); }


  template<typename _Tp, typename _Alloc>
    inline bool
    operator!=(const vector<_Tp, _Alloc>& __x, const vector<_Tp, _Alloc>& __y)
    { return !(__x == __y); }


  template<typename _Tp, typename _Alloc>
    inline bool
    operator>(const vector<_Tp, _Alloc>& __x, const vector<_Tp, _Alloc>& __y)
    { return __y < __x; }


  template<typename _Tp, typename _Alloc>
    inline bool
    operator<=(const vector<_Tp, _Alloc>& __x, const vector<_Tp, _Alloc>& __y)
    { return !(__y < __x); }


  template<typename _Tp, typename _Alloc>
    inline bool
    operator>=(const vector<_Tp, _Alloc>& __x, const vector<_Tp, _Alloc>& __y)
    { return !(__x < __y); }


  template<typename _Tp, typename _Alloc>
    inline void
    swap(vector<_Tp, _Alloc>& __x, vector<_Tp, _Alloc>& __y)
    { __x.swap(__y); }


}
# 65 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/vector" 2 3
# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_bvector.h" 1 3
# 63 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_bvector.h" 3
namespace std __attribute__ ((__visibility__ ("default")))
{


  typedef unsigned long _Bit_type;
  enum { _S_word_bit = int(8 * sizeof(_Bit_type)) };

  struct _Bit_reference
  {
    _Bit_type * _M_p;
    _Bit_type _M_mask;

    _Bit_reference(_Bit_type * __x, _Bit_type __y)
    : _M_p(__x), _M_mask(__y) { }

    _Bit_reference() : _M_p(0), _M_mask(0) { }

    operator bool() const
    { return !!(*_M_p & _M_mask); }

    _Bit_reference&
    operator=(bool __x)
    {
      if (__x)
 *_M_p |= _M_mask;
      else
 *_M_p &= ~_M_mask;
      return *this;
    }

    _Bit_reference&
    operator=(const _Bit_reference& __x)
    { return *this = bool(__x); }

    bool
    operator==(const _Bit_reference& __x) const
    { return bool(*this) == bool(__x); }

    bool
    operator<(const _Bit_reference& __x) const
    { return !bool(*this) && bool(__x); }

    void
    flip()
    { *_M_p ^= _M_mask; }
  };
# 136 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_bvector.h" 3
  struct _Bit_iterator_base
  : public std::iterator<std::random_access_iterator_tag, bool>
  {
    _Bit_type * _M_p;
    unsigned int _M_offset;

    _Bit_iterator_base(_Bit_type * __x, unsigned int __y)
    : _M_p(__x), _M_offset(__y) { }

    void
    _M_bump_up()
    {
      if (_M_offset++ == int(_S_word_bit) - 1)
 {
   _M_offset = 0;
   ++_M_p;
 }
    }

    void
    _M_bump_down()
    {
      if (_M_offset-- == 0)
 {
   _M_offset = int(_S_word_bit) - 1;
   --_M_p;
 }
    }

    void
    _M_incr(ptrdiff_t __i)
    {
      difference_type __n = __i + _M_offset;
      _M_p += __n / int(_S_word_bit);
      __n = __n % int(_S_word_bit);
      if (__n < 0)
 {
   __n += int(_S_word_bit);
   --_M_p;
 }
      _M_offset = static_cast<unsigned int>(__n);
    }

    bool
    operator==(const _Bit_iterator_base& __i) const
    { return _M_p == __i._M_p && _M_offset == __i._M_offset; }

    bool
    operator<(const _Bit_iterator_base& __i) const
    {
      return _M_p < __i._M_p
      || (_M_p == __i._M_p && _M_offset < __i._M_offset);
    }

    bool
    operator!=(const _Bit_iterator_base& __i) const
    { return !(*this == __i); }

    bool
    operator>(const _Bit_iterator_base& __i) const
    { return __i < *this; }

    bool
    operator<=(const _Bit_iterator_base& __i) const
    { return !(__i < *this); }

    bool
    operator>=(const _Bit_iterator_base& __i) const
    { return !(*this < __i); }
  };

  inline ptrdiff_t
  operator-(const _Bit_iterator_base& __x, const _Bit_iterator_base& __y)
  {
    return (int(_S_word_bit) * (__x._M_p - __y._M_p)
     + __x._M_offset - __y._M_offset);
  }

  struct _Bit_iterator : public _Bit_iterator_base
  {
    typedef _Bit_reference reference;
    typedef _Bit_reference* pointer;
    typedef _Bit_iterator iterator;

    _Bit_iterator() : _Bit_iterator_base(0, 0) { }

    _Bit_iterator(_Bit_type * __x, unsigned int __y)
    : _Bit_iterator_base(__x, __y) { }

    iterator
    _M_const_cast() const
    { return *this; }

    reference
    operator*() const
    { return reference(_M_p, 1UL << _M_offset); }

    iterator&
    operator++()
    {
      _M_bump_up();
      return *this;
    }

    iterator
    operator++(int)
    {
      iterator __tmp = *this;
      _M_bump_up();
      return __tmp;
    }

    iterator&
    operator--()
    {
      _M_bump_down();
      return *this;
    }

    iterator
    operator--(int)
    {
      iterator __tmp = *this;
      _M_bump_down();
      return __tmp;
    }

    iterator&
    operator+=(difference_type __i)
    {
      _M_incr(__i);
      return *this;
    }

    iterator&
    operator-=(difference_type __i)
    {
      *this += -__i;
      return *this;
    }

    iterator
    operator+(difference_type __i) const
    {
      iterator __tmp = *this;
      return __tmp += __i;
    }

    iterator
    operator-(difference_type __i) const
    {
      iterator __tmp = *this;
      return __tmp -= __i;
    }

    reference
    operator[](difference_type __i) const
    { return *(*this + __i); }
  };

  inline _Bit_iterator
  operator+(ptrdiff_t __n, const _Bit_iterator& __x)
  { return __x + __n; }

  struct _Bit_const_iterator : public _Bit_iterator_base
  {
    typedef bool reference;
    typedef bool const_reference;
    typedef const bool* pointer;
    typedef _Bit_const_iterator const_iterator;

    _Bit_const_iterator() : _Bit_iterator_base(0, 0) { }

    _Bit_const_iterator(_Bit_type * __x, unsigned int __y)
    : _Bit_iterator_base(__x, __y) { }

    _Bit_const_iterator(const _Bit_iterator& __x)
    : _Bit_iterator_base(__x._M_p, __x._M_offset) { }

    _Bit_iterator
    _M_const_cast() const
    { return _Bit_iterator(_M_p, _M_offset); }

    const_reference
    operator*() const
    { return _Bit_reference(_M_p, 1UL << _M_offset); }

    const_iterator&
    operator++()
    {
      _M_bump_up();
      return *this;
    }

    const_iterator
    operator++(int)
    {
      const_iterator __tmp = *this;
      _M_bump_up();
      return __tmp;
    }

    const_iterator&
    operator--()
    {
      _M_bump_down();
      return *this;
    }

    const_iterator
    operator--(int)
    {
      const_iterator __tmp = *this;
      _M_bump_down();
      return __tmp;
    }

    const_iterator&
    operator+=(difference_type __i)
    {
      _M_incr(__i);
      return *this;
    }

    const_iterator&
    operator-=(difference_type __i)
    {
      *this += -__i;
      return *this;
    }

    const_iterator
    operator+(difference_type __i) const
    {
      const_iterator __tmp = *this;
      return __tmp += __i;
    }

    const_iterator
    operator-(difference_type __i) const
    {
      const_iterator __tmp = *this;
      return __tmp -= __i;
    }

    const_reference
    operator[](difference_type __i) const
    { return *(*this + __i); }
  };

  inline _Bit_const_iterator
  operator+(ptrdiff_t __n, const _Bit_const_iterator& __x)
  { return __x + __n; }

  inline void
  __fill_bvector(_Bit_iterator __first, _Bit_iterator __last, bool __x)
  {
    for (; __first != __last; ++__first)
      *__first = __x;
  }

  inline void
  fill(_Bit_iterator __first, _Bit_iterator __last, const bool& __x)
  {
    if (__first._M_p != __last._M_p)
      {
 std::fill(__first._M_p + 1, __last._M_p, __x ? ~0 : 0);
 __fill_bvector(__first, _Bit_iterator(__first._M_p + 1, 0), __x);
 __fill_bvector(_Bit_iterator(__last._M_p, 0), __last, __x);
      }
    else
      __fill_bvector(__first, __last, __x);
  }

  template<typename _Alloc>
    struct _Bvector_base
    {
      typedef typename _Alloc::template rebind<_Bit_type>::other
        _Bit_alloc_type;

      struct _Bvector_impl
      : public _Bit_alloc_type
      {
 _Bit_iterator _M_start;
 _Bit_iterator _M_finish;
 _Bit_type* _M_end_of_storage;

 _Bvector_impl()
 : _Bit_alloc_type(), _M_start(), _M_finish(), _M_end_of_storage(0)
 { }

 _Bvector_impl(const _Bit_alloc_type& __a)
 : _Bit_alloc_type(__a), _M_start(), _M_finish(), _M_end_of_storage(0)
 { }







      };

    public:
      typedef _Alloc allocator_type;

      _Bit_alloc_type&
      _M_get_Bit_allocator()
      { return *static_cast<_Bit_alloc_type*>(&this->_M_impl); }

      const _Bit_alloc_type&
      _M_get_Bit_allocator() const
      { return *static_cast<const _Bit_alloc_type*>(&this->_M_impl); }

      allocator_type
      get_allocator() const
      { return allocator_type(_M_get_Bit_allocator()); }

      _Bvector_base()
      : _M_impl() { }

      _Bvector_base(const allocator_type& __a)
      : _M_impl(__a) { }
# 473 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_bvector.h" 3
      ~_Bvector_base()
      { this->_M_deallocate(); }

    protected:
      _Bvector_impl _M_impl;

      _Bit_type*
      _M_allocate(size_t __n)
      { return _M_impl.allocate(_S_nword(__n)); }

      void
      _M_deallocate()
      {
 if (_M_impl._M_start._M_p)
   _M_impl.deallocate(_M_impl._M_start._M_p,
        _M_impl._M_end_of_storage - _M_impl._M_start._M_p);
      }

      static size_t
      _S_nword(size_t __n)
      { return (__n + int(_S_word_bit) - 1) / int(_S_word_bit); }
    };


}




namespace std __attribute__ ((__visibility__ ("default")))
{

# 525 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_bvector.h" 3
template<typename _Alloc>
  class vector<bool, _Alloc> : protected _Bvector_base<_Alloc>
  {
    typedef _Bvector_base<_Alloc> _Base;





  public:
    typedef bool value_type;
    typedef size_t size_type;
    typedef ptrdiff_t difference_type;
    typedef _Bit_reference reference;
    typedef bool const_reference;
    typedef _Bit_reference* pointer;
    typedef const bool* const_pointer;
    typedef _Bit_iterator iterator;
    typedef _Bit_const_iterator const_iterator;
    typedef std::reverse_iterator<const_iterator> const_reverse_iterator;
    typedef std::reverse_iterator<iterator> reverse_iterator;
    typedef _Alloc allocator_type;

    allocator_type get_allocator() const
    { return _Base::get_allocator(); }

  protected:
    using _Base::_M_allocate;
    using _Base::_M_deallocate;
    using _Base::_S_nword;
    using _Base::_M_get_Bit_allocator;

  public:
    vector()
    : _Base() { }

    explicit
    vector(const allocator_type& __a)
    : _Base(__a) { }
# 580 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_bvector.h" 3
    explicit
    vector(size_type __n, const bool& __value = bool(),
    const allocator_type& __a = allocator_type())
    : _Base(__a)
    {
      _M_initialize(__n);
      std::fill(this->_M_impl._M_start._M_p, this->_M_impl._M_end_of_storage,
  __value ? ~0 : 0);
    }


    vector(const vector& __x)
    : _Base(__x._M_get_Bit_allocator())
    {
      _M_initialize(__x.size());
      _M_copy_aligned(__x.begin(), __x.end(), this->_M_impl._M_start);
    }
# 619 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_bvector.h" 3
    template<typename _InputIterator>
      vector(_InputIterator __first, _InputIterator __last,
      const allocator_type& __a = allocator_type())
      : _Base(__a)
      {
 typedef typename std::__is_integer<_InputIterator>::__type _Integral;
 _M_initialize_dispatch(__first, __last, _Integral());
      }


    ~vector() { }

    vector&
    operator=(const vector& __x)
    {
      if (&__x == this)
 return *this;
      if (__x.size() > capacity())
 {
   this->_M_deallocate();
   _M_initialize(__x.size());
 }
      this->_M_impl._M_finish = _M_copy_aligned(__x.begin(), __x.end(),
      begin());
      return *this;
    }
# 669 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_bvector.h" 3
    void
    assign(size_type __n, const bool& __x)
    { _M_fill_assign(__n, __x); }
# 680 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_bvector.h" 3
    template<typename _InputIterator>
      void
      assign(_InputIterator __first, _InputIterator __last)
      {
 typedef typename std::__is_integer<_InputIterator>::__type _Integral;
 _M_assign_dispatch(__first, __last, _Integral());
      }
# 695 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_bvector.h" 3
    iterator
    begin()
    { return this->_M_impl._M_start; }

    const_iterator
    begin() const
    { return this->_M_impl._M_start; }

    iterator
    end()
    { return this->_M_impl._M_finish; }

    const_iterator
    end() const
    { return this->_M_impl._M_finish; }

    reverse_iterator
    rbegin()
    { return reverse_iterator(end()); }

    const_reverse_iterator
    rbegin() const
    { return const_reverse_iterator(end()); }

    reverse_iterator
    rend()
    { return reverse_iterator(begin()); }

    const_reverse_iterator
    rend() const
    { return const_reverse_iterator(begin()); }
# 745 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_bvector.h" 3
    size_type
    size() const
    { return size_type(end() - begin()); }

    size_type
    max_size() const
    {
      const size_type __isize =
 __gnu_cxx::__numeric_traits<difference_type>::__max
 - int(_S_word_bit) + 1;
      const size_type __asize = _M_get_Bit_allocator().max_size();
      return (__asize <= __isize / int(_S_word_bit)
       ? __asize * int(_S_word_bit) : __isize);
    }

    size_type
    capacity() const
    { return size_type(const_iterator(this->_M_impl._M_end_of_storage, 0)
         - begin()); }

    bool
    empty() const
    { return begin() == end(); }

    reference
    operator[](size_type __n)
    {
      return *iterator(this->_M_impl._M_start._M_p
         + __n / int(_S_word_bit), __n % int(_S_word_bit));
    }

    const_reference
    operator[](size_type __n) const
    {
      return *const_iterator(this->_M_impl._M_start._M_p
        + __n / int(_S_word_bit), __n % int(_S_word_bit));
    }

  protected:
    void
    _M_range_check(size_type __n) const
    {
      if (__n >= this->size())
 __throw_out_of_range_fmt(("vector<bool>::_M_range_check: __n " "(which is %zu) >= this->size() " "(which is %zu)")

                          ,
     __n, this->size());
    }

  public:
    reference
    at(size_type __n)
    { _M_range_check(__n); return (*this)[__n]; }

    const_reference
    at(size_type __n) const
    { _M_range_check(__n); return (*this)[__n]; }

    void
    reserve(size_type __n)
    {
      if (__n > max_size())
 __throw_length_error(("vector::reserve"));
      if (capacity() < __n)
 _M_reallocate(__n);
    }

    reference
    front()
    { return *begin(); }

    const_reference
    front() const
    { return *begin(); }

    reference
    back()
    { return *(end() - 1); }

    const_reference
    back() const
    { return *(end() - 1); }






    void
    data() { }

    void
    push_back(bool __x)
    {
      if (this->_M_impl._M_finish._M_p != this->_M_impl._M_end_of_storage)
        *this->_M_impl._M_finish++ = __x;
      else
        _M_insert_aux(end(), __x);
    }

    void
    swap(vector& __x)
    {
      std::swap(this->_M_impl._M_start, __x._M_impl._M_start);
      std::swap(this->_M_impl._M_finish, __x._M_impl._M_finish);
      std::swap(this->_M_impl._M_end_of_storage,
  __x._M_impl._M_end_of_storage);



      std::__alloc_swap<typename _Base::_Bit_alloc_type>::
 _S_do_it(_M_get_Bit_allocator(), __x._M_get_Bit_allocator());
    }


    static void
    swap(reference __x, reference __y)
    {
      bool __tmp = __x;
      __x = __y;
      __y = __tmp;
    }

    iterator



    insert(iterator __position, const bool& __x = bool())

    {
      const difference_type __n = __position - begin();
      if (this->_M_impl._M_finish._M_p != this->_M_impl._M_end_of_storage
   && __position == end())
        *this->_M_impl._M_finish++ = __x;
      else
        _M_insert_aux(__position._M_const_cast(), __x);
      return begin() + __n;
    }
# 897 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_bvector.h" 3
    template<typename _InputIterator>
      void
      insert(iterator __position,
      _InputIterator __first, _InputIterator __last)
      {
 typedef typename std::__is_integer<_InputIterator>::__type _Integral;
 _M_insert_dispatch(__position, __first, __last, _Integral());
      }
# 916 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_bvector.h" 3
    void
    insert(iterator __position, size_type __n, const bool& __x)
    { _M_fill_insert(__position, __n, __x); }
# 927 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_bvector.h" 3
    void
    pop_back()
    { --this->_M_impl._M_finish; }

    iterator



    erase(iterator __position)

    { return _M_erase(__position._M_const_cast()); }

    iterator



    erase(iterator __first, iterator __last)

    { return _M_erase(__first._M_const_cast(), __last._M_const_cast()); }

    void
    resize(size_type __new_size, bool __x = bool())
    {
      if (__new_size < size())
        _M_erase_at_end(begin() + difference_type(__new_size));
      else
        insert(end(), __new_size - size(), __x);
    }







    void
    flip()
    {
      for (_Bit_type * __p = this->_M_impl._M_start._M_p;
    __p != this->_M_impl._M_end_of_storage; ++__p)
        *__p = ~*__p;
    }

    void
    clear()
    { _M_erase_at_end(begin()); }
# 986 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_bvector.h" 3
  protected:

    iterator
    _M_copy_aligned(const_iterator __first, const_iterator __last,
      iterator __result)
    {
      _Bit_type* __q = std::copy(__first._M_p, __last._M_p, __result._M_p);
      return std::copy(const_iterator(__last._M_p, 0), __last,
         iterator(__q, 0));
    }

    void
    _M_initialize(size_type __n)
    {
      _Bit_type* __q = this->_M_allocate(__n);
      this->_M_impl._M_end_of_storage = __q + _S_nword(__n);
      this->_M_impl._M_start = iterator(__q, 0);
      this->_M_impl._M_finish = this->_M_impl._M_start + difference_type(__n);
    }

    void
    _M_reallocate(size_type __n);
# 1018 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_bvector.h" 3
    template<typename _Integer>
      void
      _M_initialize_dispatch(_Integer __n, _Integer __x, __true_type)
      {
 _M_initialize(static_cast<size_type>(__n));
 std::fill(this->_M_impl._M_start._M_p,
    this->_M_impl._M_end_of_storage, __x ? ~0 : 0);
      }

    template<typename _InputIterator>
      void
      _M_initialize_dispatch(_InputIterator __first, _InputIterator __last,
        __false_type)
      { _M_initialize_range(__first, __last,
       std::__iterator_category(__first)); }

    template<typename _InputIterator>
      void
      _M_initialize_range(_InputIterator __first, _InputIterator __last,
     std::input_iterator_tag)
      {
 for (; __first != __last; ++__first)
   push_back(*__first);
      }

    template<typename _ForwardIterator>
      void
      _M_initialize_range(_ForwardIterator __first, _ForwardIterator __last,
     std::forward_iterator_tag)
      {
 const size_type __n = std::distance(__first, __last);
 _M_initialize(__n);
 std::copy(__first, __last, this->_M_impl._M_start);
      }



    template<typename _Integer>
      void
      _M_assign_dispatch(_Integer __n, _Integer __val, __true_type)
      { _M_fill_assign(__n, __val); }

    template<class _InputIterator>
      void
      _M_assign_dispatch(_InputIterator __first, _InputIterator __last,
    __false_type)
      { _M_assign_aux(__first, __last, std::__iterator_category(__first)); }

    void
    _M_fill_assign(size_t __n, bool __x)
    {
      if (__n > size())
 {
   std::fill(this->_M_impl._M_start._M_p,
      this->_M_impl._M_end_of_storage, __x ? ~0 : 0);
   insert(end(), __n - size(), __x);
 }
      else
 {
   _M_erase_at_end(begin() + __n);
   std::fill(this->_M_impl._M_start._M_p,
      this->_M_impl._M_end_of_storage, __x ? ~0 : 0);
 }
    }

    template<typename _InputIterator>
      void
      _M_assign_aux(_InputIterator __first, _InputIterator __last,
      std::input_iterator_tag)
      {
 iterator __cur = begin();
 for (; __first != __last && __cur != end(); ++__cur, ++__first)
   *__cur = *__first;
 if (__first == __last)
   _M_erase_at_end(__cur);
 else
   insert(end(), __first, __last);
      }

    template<typename _ForwardIterator>
      void
      _M_assign_aux(_ForwardIterator __first, _ForwardIterator __last,
      std::forward_iterator_tag)
      {
 const size_type __len = std::distance(__first, __last);
 if (__len < size())
   _M_erase_at_end(std::copy(__first, __last, begin()));
 else
   {
     _ForwardIterator __mid = __first;
     std::advance(__mid, size());
     std::copy(__first, __mid, begin());
     insert(end(), __mid, __last);
   }
      }





    template<typename _Integer>
      void
      _M_insert_dispatch(iterator __pos, _Integer __n, _Integer __x,
    __true_type)
      { _M_fill_insert(__pos, __n, __x); }

    template<typename _InputIterator>
      void
      _M_insert_dispatch(iterator __pos,
    _InputIterator __first, _InputIterator __last,
    __false_type)
      { _M_insert_range(__pos, __first, __last,
   std::__iterator_category(__first)); }

    void
    _M_fill_insert(iterator __position, size_type __n, bool __x);

    template<typename _InputIterator>
      void
      _M_insert_range(iterator __pos, _InputIterator __first,
        _InputIterator __last, std::input_iterator_tag)
      {
 for (; __first != __last; ++__first)
   {
     __pos = insert(__pos, *__first);
     ++__pos;
   }
      }

    template<typename _ForwardIterator>
      void
      _M_insert_range(iterator __position, _ForwardIterator __first,
        _ForwardIterator __last, std::forward_iterator_tag);

    void
    _M_insert_aux(iterator __position, bool __x);

    size_type
    _M_check_len(size_type __n, const char* __s) const
    {
      if (max_size() - size() < __n)
 __throw_length_error((__s));

      const size_type __len = size() + std::max(size(), __n);
      return (__len < size() || __len > max_size()) ? max_size() : __len;
    }

    void
    _M_erase_at_end(iterator __pos)
    { this->_M_impl._M_finish = __pos; }

    iterator
    _M_erase(iterator __pos);

    iterator
    _M_erase(iterator __first, iterator __last);
  };


}
# 66 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/vector" 2 3



# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/vector.tcc" 1 3
# 59 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/vector.tcc" 3
namespace std __attribute__ ((__visibility__ ("default")))
{


  template<typename _Tp, typename _Alloc>
    void
    vector<_Tp, _Alloc>::
    reserve(size_type __n)
    {
      if (__n > this->max_size())
 __throw_length_error(("vector::reserve"));
      if (this->capacity() < __n)
 {
   const size_type __old_size = size();
   pointer __tmp = _M_allocate_and_copy(__n,
     (this->_M_impl._M_start),
     (this->_M_impl._M_finish));
   std::_Destroy(this->_M_impl._M_start, this->_M_impl._M_finish,
   _M_get_Tp_allocator());
   _M_deallocate(this->_M_impl._M_start,
   this->_M_impl._M_end_of_storage
   - this->_M_impl._M_start);
   this->_M_impl._M_start = __tmp;
   this->_M_impl._M_finish = __tmp + __old_size;
   this->_M_impl._M_end_of_storage = this->_M_impl._M_start + __n;
 }
    }
# 105 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/vector.tcc" 3
  template<typename _Tp, typename _Alloc>
    typename vector<_Tp, _Alloc>::iterator
    vector<_Tp, _Alloc>::



    insert(iterator __position, const value_type& __x)

    {
      const size_type __n = __position - begin();
      if (this->_M_impl._M_finish != this->_M_impl._M_end_of_storage
   && __position == end())
 {
   _Alloc_traits::construct(this->_M_impl, this->_M_impl._M_finish, __x);
   ++this->_M_impl._M_finish;
 }
      else
 {
# 133 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/vector.tcc" 3
     _M_insert_aux(__position, __x);

 }
      return iterator(this->_M_impl._M_start + __n);
    }

  template<typename _Tp, typename _Alloc>
    typename vector<_Tp, _Alloc>::iterator
    vector<_Tp, _Alloc>::
    _M_erase(iterator __position)
    {
      if (__position + 1 != end())
 std::copy(__position + 1, end(), __position);
      --this->_M_impl._M_finish;
      _Alloc_traits::destroy(this->_M_impl, this->_M_impl._M_finish);
      return __position;
    }

  template<typename _Tp, typename _Alloc>
    typename vector<_Tp, _Alloc>::iterator
    vector<_Tp, _Alloc>::
    _M_erase(iterator __first, iterator __last)
    {
      if (__first != __last)
 {
   if (__last != end())
     std::copy(__last, end(), __first);
   _M_erase_at_end(__first.base() + (end() - __last));
 }
      return __first;
    }

  template<typename _Tp, typename _Alloc>
    vector<_Tp, _Alloc>&
    vector<_Tp, _Alloc>::
    operator=(const vector<_Tp, _Alloc>& __x)
    {
      if (&__x != this)
 {
# 191 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/vector.tcc" 3
   const size_type __xlen = __x.size();
   if (__xlen > capacity())
     {
       pointer __tmp = _M_allocate_and_copy(__xlen, __x.begin(),
         __x.end());
       std::_Destroy(this->_M_impl._M_start, this->_M_impl._M_finish,
       _M_get_Tp_allocator());
       _M_deallocate(this->_M_impl._M_start,
       this->_M_impl._M_end_of_storage
       - this->_M_impl._M_start);
       this->_M_impl._M_start = __tmp;
       this->_M_impl._M_end_of_storage = this->_M_impl._M_start + __xlen;
     }
   else if (size() >= __xlen)
     {
       std::_Destroy(std::copy(__x.begin(), __x.end(), begin()),
       end(), _M_get_Tp_allocator());
     }
   else
     {
       std::copy(__x._M_impl._M_start, __x._M_impl._M_start + size(),
   this->_M_impl._M_start);
       std::__uninitialized_copy_a(__x._M_impl._M_start + size(),
       __x._M_impl._M_finish,
       this->_M_impl._M_finish,
       _M_get_Tp_allocator());
     }
   this->_M_impl._M_finish = this->_M_impl._M_start + __xlen;
 }
      return *this;
    }

  template<typename _Tp, typename _Alloc>
    void
    vector<_Tp, _Alloc>::
    _M_fill_assign(size_t __n, const value_type& __val)
    {
      if (__n > capacity())
 {
   vector __tmp(__n, __val, _M_get_Tp_allocator());
   __tmp._M_impl._M_swap_data(this->_M_impl);
 }
      else if (__n > size())
 {
   std::fill(begin(), end(), __val);
   std::__uninitialized_fill_n_a(this->_M_impl._M_finish,
     __n - size(), __val,
     _M_get_Tp_allocator());
   this->_M_impl._M_finish += __n - size();
 }
      else
        _M_erase_at_end(std::fill_n(this->_M_impl._M_start, __n, __val));
    }

  template<typename _Tp, typename _Alloc>
    template<typename _InputIterator>
      void
      vector<_Tp, _Alloc>::
      _M_assign_aux(_InputIterator __first, _InputIterator __last,
      std::input_iterator_tag)
      {
 pointer __cur(this->_M_impl._M_start);
 for (; __first != __last && __cur != this->_M_impl._M_finish;
      ++__cur, ++__first)
   *__cur = *__first;
 if (__first == __last)
   _M_erase_at_end(__cur);
 else
   insert(end(), __first, __last);
      }

  template<typename _Tp, typename _Alloc>
    template<typename _ForwardIterator>
      void
      vector<_Tp, _Alloc>::
      _M_assign_aux(_ForwardIterator __first, _ForwardIterator __last,
      std::forward_iterator_tag)
      {
 const size_type __len = std::distance(__first, __last);

 if (__len > capacity())
   {
     pointer __tmp(_M_allocate_and_copy(__len, __first, __last));
     std::_Destroy(this->_M_impl._M_start, this->_M_impl._M_finish,
     _M_get_Tp_allocator());
     _M_deallocate(this->_M_impl._M_start,
     this->_M_impl._M_end_of_storage
     - this->_M_impl._M_start);
     this->_M_impl._M_start = __tmp;
     this->_M_impl._M_finish = this->_M_impl._M_start + __len;
     this->_M_impl._M_end_of_storage = this->_M_impl._M_finish;
   }
 else if (size() >= __len)
   _M_erase_at_end(std::copy(__first, __last, this->_M_impl._M_start));
 else
   {
     _ForwardIterator __mid = __first;
     std::advance(__mid, size());
     std::copy(__first, __mid, this->_M_impl._M_start);
     this->_M_impl._M_finish =
       std::__uninitialized_copy_a(__mid, __last,
       this->_M_impl._M_finish,
       _M_get_Tp_allocator());
   }
      }
# 324 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/vector.tcc" 3
  template<typename _Tp, typename _Alloc>
    void
    vector<_Tp, _Alloc>::
    _M_insert_aux(iterator __position, const _Tp& __x)

    {
      if (this->_M_impl._M_finish != this->_M_impl._M_end_of_storage)
 {
   _Alloc_traits::construct(this->_M_impl, this->_M_impl._M_finish,
              (*(this->_M_impl._M_finish - 1))
                            );
   ++this->_M_impl._M_finish;

   _Tp __x_copy = __x;

   std::copy_backward(__position.base(), this->_M_impl._M_finish - 2, this->_M_impl._M_finish - 1)

                                  ;

   *__position = __x_copy;



 }
      else
 {
   const size_type __len =
     _M_check_len(size_type(1), "vector::_M_insert_aux");
   const size_type __elems_before = __position - begin();
   pointer __new_start(this->_M_allocate(__len));
   pointer __new_finish(__new_start);
   try
     {




       _Alloc_traits::construct(this->_M_impl,
                         __new_start + __elems_before,



                                __x);

       __new_finish = 0;

       __new_finish
  = std::__uninitialized_move_if_noexcept_a
  (this->_M_impl._M_start, __position.base(),
   __new_start, _M_get_Tp_allocator());

       ++__new_finish;

       __new_finish
  = std::__uninitialized_move_if_noexcept_a
  (__position.base(), this->_M_impl._M_finish,
   __new_finish, _M_get_Tp_allocator());
     }
          catch(...)
     {
       if (!__new_finish)
  _Alloc_traits::destroy(this->_M_impl,
                         __new_start + __elems_before);
       else
  std::_Destroy(__new_start, __new_finish, _M_get_Tp_allocator());
       _M_deallocate(__new_start, __len);
       throw;
     }
   std::_Destroy(this->_M_impl._M_start, this->_M_impl._M_finish,
   _M_get_Tp_allocator());
   _M_deallocate(this->_M_impl._M_start,
   this->_M_impl._M_end_of_storage
   - this->_M_impl._M_start);
   this->_M_impl._M_start = __new_start;
   this->_M_impl._M_finish = __new_finish;
   this->_M_impl._M_end_of_storage = __new_start + __len;
 }
    }
# 447 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/vector.tcc" 3
  template<typename _Tp, typename _Alloc>
    void
    vector<_Tp, _Alloc>::
    _M_fill_insert(iterator __position, size_type __n, const value_type& __x)
    {
      if (__n != 0)
 {
   if (size_type(this->_M_impl._M_end_of_storage
   - this->_M_impl._M_finish) >= __n)
     {
       value_type __x_copy = __x;
       const size_type __elems_after = end() - __position;
       pointer __old_finish(this->_M_impl._M_finish);
       if (__elems_after > __n)
  {
    std::__uninitialized_move_a(this->_M_impl._M_finish - __n,
           this->_M_impl._M_finish,
           this->_M_impl._M_finish,
           _M_get_Tp_allocator());
    this->_M_impl._M_finish += __n;
    std::copy_backward(__position.base(), __old_finish - __n, __old_finish)
                                        ;
    std::fill(__position.base(), __position.base() + __n,
       __x_copy);
  }
       else
  {
    std::__uninitialized_fill_n_a(this->_M_impl._M_finish,
      __n - __elems_after,
      __x_copy,
      _M_get_Tp_allocator());
    this->_M_impl._M_finish += __n - __elems_after;
    std::__uninitialized_move_a(__position.base(), __old_finish,
           this->_M_impl._M_finish,
           _M_get_Tp_allocator());
    this->_M_impl._M_finish += __elems_after;
    std::fill(__position.base(), __old_finish, __x_copy);
  }
     }
   else
     {
       const size_type __len =
  _M_check_len(__n, "vector::_M_fill_insert");
       const size_type __elems_before = __position - begin();
       pointer __new_start(this->_M_allocate(__len));
       pointer __new_finish(__new_start);
       try
  {

    std::__uninitialized_fill_n_a(__new_start + __elems_before,
      __n, __x,
      _M_get_Tp_allocator());
    __new_finish = 0;

    __new_finish
      = std::__uninitialized_move_if_noexcept_a
      (this->_M_impl._M_start, __position.base(),
       __new_start, _M_get_Tp_allocator());

    __new_finish += __n;

    __new_finish
      = std::__uninitialized_move_if_noexcept_a
      (__position.base(), this->_M_impl._M_finish,
       __new_finish, _M_get_Tp_allocator());
  }
       catch(...)
  {
    if (!__new_finish)
      std::_Destroy(__new_start + __elems_before,
      __new_start + __elems_before + __n,
      _M_get_Tp_allocator());
    else
      std::_Destroy(__new_start, __new_finish,
      _M_get_Tp_allocator());
    _M_deallocate(__new_start, __len);
    throw;
  }
       std::_Destroy(this->_M_impl._M_start, this->_M_impl._M_finish,
       _M_get_Tp_allocator());
       _M_deallocate(this->_M_impl._M_start,
       this->_M_impl._M_end_of_storage
       - this->_M_impl._M_start);
       this->_M_impl._M_start = __new_start;
       this->_M_impl._M_finish = __new_finish;
       this->_M_impl._M_end_of_storage = __new_start + __len;
     }
 }
    }
# 599 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/vector.tcc" 3
  template<typename _Tp, typename _Alloc>
    template<typename _InputIterator>
      void
      vector<_Tp, _Alloc>::
      _M_range_insert(iterator __pos, _InputIterator __first,
        _InputIterator __last, std::input_iterator_tag)
      {
 for (; __first != __last; ++__first)
   {
     __pos = insert(__pos, *__first);
     ++__pos;
   }
      }

  template<typename _Tp, typename _Alloc>
    template<typename _ForwardIterator>
      void
      vector<_Tp, _Alloc>::
      _M_range_insert(iterator __position, _ForwardIterator __first,
        _ForwardIterator __last, std::forward_iterator_tag)
      {
 if (__first != __last)
   {
     const size_type __n = std::distance(__first, __last);
     if (size_type(this->_M_impl._M_end_of_storage
     - this->_M_impl._M_finish) >= __n)
       {
  const size_type __elems_after = end() - __position;
  pointer __old_finish(this->_M_impl._M_finish);
  if (__elems_after > __n)
    {
      std::__uninitialized_move_a(this->_M_impl._M_finish - __n,
      this->_M_impl._M_finish,
      this->_M_impl._M_finish,
      _M_get_Tp_allocator());
      this->_M_impl._M_finish += __n;
      std::copy_backward(__position.base(), __old_finish - __n, __old_finish)
                                          ;
      std::copy(__first, __last, __position);
    }
  else
    {
      _ForwardIterator __mid = __first;
      std::advance(__mid, __elems_after);
      std::__uninitialized_copy_a(__mid, __last,
      this->_M_impl._M_finish,
      _M_get_Tp_allocator());
      this->_M_impl._M_finish += __n - __elems_after;
      std::__uninitialized_move_a(__position.base(),
      __old_finish,
      this->_M_impl._M_finish,
      _M_get_Tp_allocator());
      this->_M_impl._M_finish += __elems_after;
      std::copy(__first, __mid, __position);
    }
       }
     else
       {
  const size_type __len =
    _M_check_len(__n, "vector::_M_range_insert");
  pointer __new_start(this->_M_allocate(__len));
  pointer __new_finish(__new_start);
  try
    {
      __new_finish
        = std::__uninitialized_move_if_noexcept_a
        (this->_M_impl._M_start, __position.base(),
         __new_start, _M_get_Tp_allocator());
      __new_finish
        = std::__uninitialized_copy_a(__first, __last,
          __new_finish,
          _M_get_Tp_allocator());
      __new_finish
        = std::__uninitialized_move_if_noexcept_a
        (__position.base(), this->_M_impl._M_finish,
         __new_finish, _M_get_Tp_allocator());
    }
  catch(...)
    {
      std::_Destroy(__new_start, __new_finish,
      _M_get_Tp_allocator());
      _M_deallocate(__new_start, __len);
      throw;
    }
  std::_Destroy(this->_M_impl._M_start, this->_M_impl._M_finish,
         _M_get_Tp_allocator());
  _M_deallocate(this->_M_impl._M_start,
         this->_M_impl._M_end_of_storage
         - this->_M_impl._M_start);
  this->_M_impl._M_start = __new_start;
  this->_M_impl._M_finish = __new_finish;
  this->_M_impl._M_end_of_storage = __new_start + __len;
       }
   }
      }



  template<typename _Alloc>
    void
    vector<bool, _Alloc>::
    _M_reallocate(size_type __n)
    {
      _Bit_type* __q = this->_M_allocate(__n);
      this->_M_impl._M_finish = _M_copy_aligned(begin(), end(),
      iterator(__q, 0));
      this->_M_deallocate();
      this->_M_impl._M_start = iterator(__q, 0);
      this->_M_impl._M_end_of_storage = __q + _S_nword(__n);
    }

  template<typename _Alloc>
    void
    vector<bool, _Alloc>::
    _M_fill_insert(iterator __position, size_type __n, bool __x)
    {
      if (__n == 0)
 return;
      if (capacity() - size() >= __n)
 {
   std::copy_backward(__position, end(),
        this->_M_impl._M_finish + difference_type(__n));
   std::fill(__position, __position + difference_type(__n), __x);
   this->_M_impl._M_finish += difference_type(__n);
 }
      else
 {
   const size_type __len =
     _M_check_len(__n, "vector<bool>::_M_fill_insert");
   _Bit_type * __q = this->_M_allocate(__len);
   iterator __i = _M_copy_aligned(begin(), __position,
      iterator(__q, 0));
   std::fill(__i, __i + difference_type(__n), __x);
   this->_M_impl._M_finish = std::copy(__position, end(),
           __i + difference_type(__n));
   this->_M_deallocate();
   this->_M_impl._M_end_of_storage = __q + _S_nword(__len);
   this->_M_impl._M_start = iterator(__q, 0);
 }
    }

  template<typename _Alloc>
    template<typename _ForwardIterator>
      void
      vector<bool, _Alloc>::
      _M_insert_range(iterator __position, _ForwardIterator __first,
        _ForwardIterator __last, std::forward_iterator_tag)
      {
 if (__first != __last)
   {
     size_type __n = std::distance(__first, __last);
     if (capacity() - size() >= __n)
       {
  std::copy_backward(__position, end(),
       this->_M_impl._M_finish
       + difference_type(__n));
  std::copy(__first, __last, __position);
  this->_M_impl._M_finish += difference_type(__n);
       }
     else
       {
  const size_type __len =
    _M_check_len(__n, "vector<bool>::_M_insert_range");
  _Bit_type * __q = this->_M_allocate(__len);
  iterator __i = _M_copy_aligned(begin(), __position,
            iterator(__q, 0));
  __i = std::copy(__first, __last, __i);
  this->_M_impl._M_finish = std::copy(__position, end(), __i);
  this->_M_deallocate();
  this->_M_impl._M_end_of_storage = __q + _S_nword(__len);
  this->_M_impl._M_start = iterator(__q, 0);
       }
   }
      }

  template<typename _Alloc>
    void
    vector<bool, _Alloc>::
    _M_insert_aux(iterator __position, bool __x)
    {
      if (this->_M_impl._M_finish._M_p != this->_M_impl._M_end_of_storage)
 {
   std::copy_backward(__position, this->_M_impl._M_finish,
        this->_M_impl._M_finish + 1);
   *__position = __x;
   ++this->_M_impl._M_finish;
 }
      else
 {
   const size_type __len =
     _M_check_len(size_type(1), "vector<bool>::_M_insert_aux");
   _Bit_type * __q = this->_M_allocate(__len);
   iterator __i = _M_copy_aligned(begin(), __position,
      iterator(__q, 0));
   *__i++ = __x;
   this->_M_impl._M_finish = std::copy(__position, end(), __i);
   this->_M_deallocate();
   this->_M_impl._M_end_of_storage = __q + _S_nword(__len);
   this->_M_impl._M_start = iterator(__q, 0);
 }
    }

  template<typename _Alloc>
    typename vector<bool, _Alloc>::iterator
    vector<bool, _Alloc>::
    _M_erase(iterator __position)
    {
      if (__position + 1 != end())
        std::copy(__position + 1, end(), __position);
      --this->_M_impl._M_finish;
      return __position;
    }

  template<typename _Alloc>
    typename vector<bool, _Alloc>::iterator
    vector<bool, _Alloc>::
    _M_erase(iterator __first, iterator __last)
    {
      if (__first != __last)
 _M_erase_at_end(std::copy(__last, end(), __first));
      return __first;
    }
# 840 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/vector.tcc" 3

}
# 70 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/vector" 2 3
# 19 "lte_strtab.h" 2

class elf_table_t {
protected:
    std::vector<char> table;
    std::vector<lte_size_t> index;

protected:
    const char* ptr() const { return table.size() ? &(table[0]) : __null; }
          char* ptr() { return table.size() ? &(table[0]) : __null; }

public:
    elf_table_t(){}
    ~elf_table_t(){}

public:
    lte_size_t push_back(const void* p, lte_size_t size, int c = 0);
    void pop_back(lte_size_t n = 1);

    template<typename T> T& get(lte_size_t offs)
    {
        ((((offs + sizeof(T)) < table_size())==0)?lte_assert("(offs + sizeof(T)) < table_size()", 0, "lte_strtab.h", 39),((void)(0)):((void)(0)));
        return *(T*)&table[offs];
    }
    template<typename T> void set(lte_size_t offs, const T& v)
    {
        get<T>(offs) = v;
    }

    lte_uint8_t& byte(lte_size_t offs) { return get<lte_uint8_t>(offs); }
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
        (((i < count())==0)?lte_assert("i < count()", 0, "lte_strtab.h", 69),((void)(0)):((void)(0)));
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
# 17 "lte_entry_point.h" 2


struct lte_thread_state_t : lte_x86_state_t {
   lte_uint64_t icount;
};

enum {
   E32_GFUNC = (((1) << 4) + ((2) & 0xf)),
   E64_GFUNC = ((((1)) << 4) + (((2)) & 0xf)),
   E32_LOBJECT = (((0) << 4) + ((1) & 0xf)),
   E64_LOBJECT = ((((0)) << 4) + (((1)) & 0xf)),
};

class entry_point_t {
public:
   typedef Elf_SymInfo_t sym;
   typedef Elf_Rela_t rela;

protected:
   elf_table_t m_state;
   std::vector<sym> m_code_symbols;
   std::vector<sym> m_data_symbols;
   std::vector<rela> m_code_rela;
   std::vector<rela> m_data_rela;
   lte_uint8_t* m_entry;
   lte_uint8_t* m_entry_buffer;
   lte_addr_t m_entry_va;
   lte_addr_t m_entry_data_va;
   lte_size_t m_entry_size;
   lte_addr_t m_start_offs;
   lte_addr_t m_start_size;
   lte_uint32_t m_threads_num;
   lte_size_t m_thread_state_offs;
   lte_size_t m_thread_state_size;
   lte_size_t m_thread_state_align;
   lte_size_t m_thread_ip_offs;
   lte_size_t m_dmap_offs;
   lte_uint32_t m_dmap_pages_num;
   lte_size_t m_pstart_cbk_sym;
   lte_size_t m_pexit_cbk_sym;
   lte_size_t m_tstart_cbk_sym;

protected:
   template<typename T> void add(const T& sym_data);
   template<typename T> void add(lte_uint32_t tid, const T& sym_data, const char* sym_name, unsigned char sym_info);
   void add(lte_uint32_t tid, const void* sym_data, lte_size_t sym_data_size, const char* sym_name, unsigned char sym_info);
   void add(const void* sym_data, lte_size_t sym_data_size, const char* sym_name, unsigned char sym_info);
   void add_padding(lte_size_t size, int c = 0) { m_state.push_back(__null, size, c); }

   void clear_initial_state();

public:
   entry_point_t();
   virtual ~entry_point_t();

   static entry_point_t* create_entry_point(Elf_Class_t e_class = 1, lte_uint32_t threads_num = 0);
   static entry_point_t* create_entry_point(Elf_Class_t e_class, void* ptr, lte_size_t size);

   virtual void setup(lte_uint32_t threads_num, lte_thread_state_t* states, void* dmap_pages, lte_uint32_t dmap_pages_num) = 0;
   virtual void relocate_code(lte_addr_t va) = 0;
   virtual void relocate_data(lte_addr_t va) = 0;
   virtual void relocate_dmap_data(lte_uint64_t offs) = 0;
   virtual void enable_modify_ldt(bool enable) = 0;
   virtual void set_proc_start_callback(const char* name) = 0;
   virtual void set_proc_exit_callback(const char* name) = 0;
   virtual void set_thread_start_callback(const char* name) = 0;
   virtual void set_callback_stack_size(lte_uint32_t size) = 0;
   virtual void set_roi_mark_thread(lte_uint32_t tid) = 0;
   virtual void set_start_roi_mark(lte_uint32_t tag, lte_uint32_t type) = 0;
   virtual void set_magic2_tag(lte_uint32_t tag, lte_uint32_t type) = 0;

   lte_addr_t get_start_va() const
   {
      return get_code_va() + m_start_offs;
   }

   lte_addr_t get_code_va() const
   {
      return m_entry_va;
   }
   lte_size_t get_code_size() const
   {
      return m_entry_size;
   }
   const lte_uint8_t* get_code_bytes() const
   {
      return m_entry;
   }

   lte_addr_t get_data_va() const
   {
      return m_entry_data_va;
   }
   lte_size_t get_data_size() const
   {
      return m_state.table_size();
   }
   const lte_uint8_t* get_data_bytes() const
   {
      return (const lte_uint8_t*)m_state.table_ptr();
   }

   const sym* get_code_sym_first() const
   {
      return m_code_symbols.size() ? &m_code_symbols[0] : __null;
   }
   const sym* get_code_sym_end() const
   {
      return m_code_symbols.size() ? (&m_code_symbols[0] + m_code_symbols.size()): __null;
   }
   lte_size_t get_code_syms_count() const
   {
      return m_code_symbols.size();
   }

   const sym* get_data_sym_first() const
   {
      return m_data_symbols.size() ? &m_data_symbols[0] : __null;
   }
   const sym* get_data_sym_end() const
   {
      return m_data_symbols.size() ? (&m_data_symbols[0] + m_data_symbols.size()): __null;
   }
   lte_size_t get_data_syms_count() const
   {
      return m_data_symbols.size();
   }
};

class entry_point32_t : public entry_point_t {
protected:
   void setup_initial_state(lte_uint32_t threads_num, lte_thread_state_t* states, void* dmap_pages, lte_uint32_t dmap_pages_num);

public:
   entry_point32_t(lte_uint32_t threads_num);
   entry_point32_t(void* ptr, lte_size_t size);
   ~entry_point32_t();

   void setup(lte_uint32_t threads_num, lte_thread_state_t* states, void* dmap_pages, lte_uint32_t dmap_pages_num);
   void relocate_code(lte_addr_t va);
   void relocate_data(lte_addr_t va);
   void relocate_dmap_data(lte_uint64_t offs);
   void enable_modify_ldt(bool enable);
   void set_proc_start_callback(const char* name);
   void set_proc_exit_callback(const char* name);
   void set_thread_start_callback(const char* name);
   void set_callback_stack_size(lte_uint32_t size);
   void set_roi_mark_thread(lte_uint32_t tid);
   void set_start_roi_mark(lte_uint32_t tag, lte_uint32_t type);
   void set_magic2_tag(lte_uint32_t tag, lte_uint32_t type);
};

class entry_point64_t : public entry_point_t {
protected:
   void setup_initial_state(lte_uint32_t threads_num, lte_thread_state_t* states, void* dmap_pages, lte_uint32_t dmap_pages_num);

public:
   entry_point64_t(lte_uint32_t threads_num);
   entry_point64_t(void* ptr, lte_size_t size);
   ~entry_point64_t();

   void setup(lte_uint32_t threads_num, lte_thread_state_t* states, void* dmap_pages, lte_uint32_t dmap_pages_num);
   void relocate_code(lte_addr_t va);
   void relocate_data(lte_addr_t va);
   void relocate_dmap_data(lte_uint64_t offs);
   void enable_modify_ldt(bool enable);
   void set_proc_start_callback(const char* name);
   void set_proc_exit_callback(const char* name);
   void set_thread_start_callback(const char* name);
   void set_callback_stack_size(lte_uint32_t size);
   void set_roi_mark_thread(lte_uint32_t tid);
   void set_start_roi_mark(lte_uint32_t tag, lte_uint32_t type);
   void set_magic2_tag(lte_uint32_t tag, lte_uint32_t type);
};
# 2 "lte_entry_point.cpp" 2


# 1 "lte_config.h" 1
# 16 "lte_config.h"
# 1 "lte_elf.h" 1
# 19 "lte_elf.h"
# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/map" 1 3
# 58 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/map" 3
       
# 59 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/map" 3

# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_tree.h" 1 3
# 70 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_tree.h" 3
namespace std __attribute__ ((__visibility__ ("default")))
{

# 90 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_tree.h" 3
  enum _Rb_tree_color { _S_red = false, _S_black = true };

  struct _Rb_tree_node_base
  {
    typedef _Rb_tree_node_base* _Base_ptr;
    typedef const _Rb_tree_node_base* _Const_Base_ptr;

    _Rb_tree_color _M_color;
    _Base_ptr _M_parent;
    _Base_ptr _M_left;
    _Base_ptr _M_right;

    static _Base_ptr
    _S_minimum(_Base_ptr __x)
    {
      while (__x->_M_left != 0) __x = __x->_M_left;
      return __x;
    }

    static _Const_Base_ptr
    _S_minimum(_Const_Base_ptr __x)
    {
      while (__x->_M_left != 0) __x = __x->_M_left;
      return __x;
    }

    static _Base_ptr
    _S_maximum(_Base_ptr __x)
    {
      while (__x->_M_right != 0) __x = __x->_M_right;
      return __x;
    }

    static _Const_Base_ptr
    _S_maximum(_Const_Base_ptr __x)
    {
      while (__x->_M_right != 0) __x = __x->_M_right;
      return __x;
    }
  };

  template<typename _Val>
    struct _Rb_tree_node : public _Rb_tree_node_base
    {
      typedef _Rb_tree_node<_Val>* _Link_type;


      _Val _M_value_field;

      _Val*
      _M_valptr()
      { return std::__addressof(_M_value_field); }

      const _Val*
      _M_valptr() const
      { return std::__addressof(_M_value_field); }
# 157 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_tree.h" 3
    };

  __attribute__ ((__pure__)) _Rb_tree_node_base*
  _Rb_tree_increment(_Rb_tree_node_base* __x) throw ();

  __attribute__ ((__pure__)) const _Rb_tree_node_base*
  _Rb_tree_increment(const _Rb_tree_node_base* __x) throw ();

  __attribute__ ((__pure__)) _Rb_tree_node_base*
  _Rb_tree_decrement(_Rb_tree_node_base* __x) throw ();

  __attribute__ ((__pure__)) const _Rb_tree_node_base*
  _Rb_tree_decrement(const _Rb_tree_node_base* __x) throw ();

  template<typename _Tp>
    struct _Rb_tree_iterator
    {
      typedef _Tp value_type;
      typedef _Tp& reference;
      typedef _Tp* pointer;

      typedef bidirectional_iterator_tag iterator_category;
      typedef ptrdiff_t difference_type;

      typedef _Rb_tree_iterator<_Tp> _Self;
      typedef _Rb_tree_node_base::_Base_ptr _Base_ptr;
      typedef _Rb_tree_node<_Tp>* _Link_type;

      _Rb_tree_iterator()
      : _M_node() { }

      explicit
      _Rb_tree_iterator(_Link_type __x)
      : _M_node(__x) { }

      reference
      operator*() const
      { return *static_cast<_Link_type>(_M_node)->_M_valptr(); }

      pointer
      operator->() const
      { return static_cast<_Link_type> (_M_node)->_M_valptr(); }

      _Self&
      operator++()
      {
 _M_node = _Rb_tree_increment(_M_node);
 return *this;
      }

      _Self
      operator++(int)
      {
 _Self __tmp = *this;
 _M_node = _Rb_tree_increment(_M_node);
 return __tmp;
      }

      _Self&
      operator--()
      {
 _M_node = _Rb_tree_decrement(_M_node);
 return *this;
      }

      _Self
      operator--(int)
      {
 _Self __tmp = *this;
 _M_node = _Rb_tree_decrement(_M_node);
 return __tmp;
      }

      bool
      operator==(const _Self& __x) const
      { return _M_node == __x._M_node; }

      bool
      operator!=(const _Self& __x) const
      { return _M_node != __x._M_node; }

      _Base_ptr _M_node;
  };

  template<typename _Tp>
    struct _Rb_tree_const_iterator
    {
      typedef _Tp value_type;
      typedef const _Tp& reference;
      typedef const _Tp* pointer;

      typedef _Rb_tree_iterator<_Tp> iterator;

      typedef bidirectional_iterator_tag iterator_category;
      typedef ptrdiff_t difference_type;

      typedef _Rb_tree_const_iterator<_Tp> _Self;
      typedef _Rb_tree_node_base::_Const_Base_ptr _Base_ptr;
      typedef const _Rb_tree_node<_Tp>* _Link_type;

      _Rb_tree_const_iterator()
      : _M_node() { }

      explicit
      _Rb_tree_const_iterator(_Link_type __x)
      : _M_node(__x) { }

      _Rb_tree_const_iterator(const iterator& __it)
      : _M_node(__it._M_node) { }

      iterator
      _M_const_cast() const
      { return iterator(static_cast<typename iterator::_Link_type>
   (const_cast<typename iterator::_Base_ptr>(_M_node))); }

      reference
      operator*() const
      { return *static_cast<_Link_type>(_M_node)->_M_valptr(); }

      pointer
      operator->() const
      { return static_cast<_Link_type>(_M_node)->_M_valptr(); }

      _Self&
      operator++()
      {
 _M_node = _Rb_tree_increment(_M_node);
 return *this;
      }

      _Self
      operator++(int)
      {
 _Self __tmp = *this;
 _M_node = _Rb_tree_increment(_M_node);
 return __tmp;
      }

      _Self&
      operator--()
      {
 _M_node = _Rb_tree_decrement(_M_node);
 return *this;
      }

      _Self
      operator--(int)
      {
 _Self __tmp = *this;
 _M_node = _Rb_tree_decrement(_M_node);
 return __tmp;
      }

      bool
      operator==(const _Self& __x) const
      { return _M_node == __x._M_node; }

      bool
      operator!=(const _Self& __x) const
      { return _M_node != __x._M_node; }

      _Base_ptr _M_node;
    };

  template<typename _Val>
    inline bool
    operator==(const _Rb_tree_iterator<_Val>& __x,
               const _Rb_tree_const_iterator<_Val>& __y)
    { return __x._M_node == __y._M_node; }

  template<typename _Val>
    inline bool
    operator!=(const _Rb_tree_iterator<_Val>& __x,
               const _Rb_tree_const_iterator<_Val>& __y)
    { return __x._M_node != __y._M_node; }

  void
  _Rb_tree_insert_and_rebalance(const bool __insert_left,
                                _Rb_tree_node_base* __x,
                                _Rb_tree_node_base* __p,
                                _Rb_tree_node_base& __header) throw ();

  _Rb_tree_node_base*
  _Rb_tree_rebalance_for_erase(_Rb_tree_node_base* const __z,
          _Rb_tree_node_base& __header) throw ();


  template<typename _Key, typename _Val, typename _KeyOfValue,
           typename _Compare, typename _Alloc = allocator<_Val> >
    class _Rb_tree
    {
      typedef typename __gnu_cxx::__alloc_traits<_Alloc>::template
        rebind<_Rb_tree_node<_Val> >::other _Node_allocator;

      typedef __gnu_cxx::__alloc_traits<_Node_allocator> _Alloc_traits;

    protected:
      typedef _Rb_tree_node_base* _Base_ptr;
      typedef const _Rb_tree_node_base* _Const_Base_ptr;

    public:
      typedef _Key key_type;
      typedef _Val value_type;
      typedef value_type* pointer;
      typedef const value_type* const_pointer;
      typedef value_type& reference;
      typedef const value_type& const_reference;
      typedef _Rb_tree_node<_Val>* _Link_type;
      typedef const _Rb_tree_node<_Val>* _Const_Link_type;
      typedef size_t size_type;
      typedef ptrdiff_t difference_type;
      typedef _Alloc allocator_type;

      _Node_allocator&
      _M_get_Node_allocator()
      { return *static_cast<_Node_allocator*>(&this->_M_impl); }

      const _Node_allocator&
      _M_get_Node_allocator() const
      { return *static_cast<const _Node_allocator*>(&this->_M_impl); }

      allocator_type
      get_allocator() const
      { return allocator_type(_M_get_Node_allocator()); }

    protected:
      _Link_type
      _M_get_node()
      { return _Alloc_traits::allocate(_M_get_Node_allocator(), 1); }

      void
      _M_put_node(_Link_type __p)
      { _Alloc_traits::deallocate(_M_get_Node_allocator(), __p, 1); }


      _Link_type
      _M_create_node(const value_type& __x)
      {
 _Link_type __tmp = _M_get_node();
 try
   { get_allocator().construct(__tmp->_M_valptr(), __x); }
 catch(...)
   {
     _M_put_node(__tmp);
     throw;
   }
 return __tmp;
      }

      void
      _M_destroy_node(_Link_type __p)
      {
 get_allocator().destroy(__p->_M_valptr());
 _M_put_node(__p);
      }
# 442 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_tree.h" 3
      _Link_type
      _M_clone_node(_Const_Link_type __x)
      {
 _Link_type __tmp = _M_create_node(*__x->_M_valptr());
 __tmp->_M_color = __x->_M_color;
 __tmp->_M_left = 0;
 __tmp->_M_right = 0;
 return __tmp;
      }

    protected:
      template<typename _Key_compare,
        bool _Is_pod_comparator = __is_pod(_Key_compare)>
        struct _Rb_tree_impl : public _Node_allocator
        {
   _Key_compare _M_key_compare;
   _Rb_tree_node_base _M_header;
   size_type _M_node_count;

   _Rb_tree_impl()
   : _Node_allocator(), _M_key_compare(), _M_header(),
     _M_node_count(0)
   { _M_initialize(); }

   _Rb_tree_impl(const _Key_compare& __comp, const _Node_allocator& __a)
   : _Node_allocator(__a), _M_key_compare(__comp), _M_header(),
     _M_node_count(0)
   { _M_initialize(); }
# 478 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_tree.h" 3
 private:
   void
   _M_initialize()
   {
     this->_M_header._M_color = _S_red;
     this->_M_header._M_parent = 0;
     this->_M_header._M_left = &this->_M_header;
     this->_M_header._M_right = &this->_M_header;
   }
 };

      _Rb_tree_impl<_Compare> _M_impl;

    protected:
      _Base_ptr&
      _M_root()
      { return this->_M_impl._M_header._M_parent; }

      _Const_Base_ptr
      _M_root() const
      { return this->_M_impl._M_header._M_parent; }

      _Base_ptr&
      _M_leftmost()
      { return this->_M_impl._M_header._M_left; }

      _Const_Base_ptr
      _M_leftmost() const
      { return this->_M_impl._M_header._M_left; }

      _Base_ptr&
      _M_rightmost()
      { return this->_M_impl._M_header._M_right; }

      _Const_Base_ptr
      _M_rightmost() const
      { return this->_M_impl._M_header._M_right; }

      _Link_type
      _M_begin()
      { return static_cast<_Link_type>(this->_M_impl._M_header._M_parent); }

      _Const_Link_type
      _M_begin() const
      {
 return static_cast<_Const_Link_type>
   (this->_M_impl._M_header._M_parent);
      }

      _Link_type
      _M_end()
      { return reinterpret_cast<_Link_type>(&this->_M_impl._M_header); }

      _Const_Link_type
      _M_end() const
      { return reinterpret_cast<_Const_Link_type>(&this->_M_impl._M_header); }

      static const_reference
      _S_value(_Const_Link_type __x)
      { return *__x->_M_valptr(); }

      static const _Key&
      _S_key(_Const_Link_type __x)
      { return _KeyOfValue()(_S_value(__x)); }

      static _Link_type
      _S_left(_Base_ptr __x)
      { return static_cast<_Link_type>(__x->_M_left); }

      static _Const_Link_type
      _S_left(_Const_Base_ptr __x)
      { return static_cast<_Const_Link_type>(__x->_M_left); }

      static _Link_type
      _S_right(_Base_ptr __x)
      { return static_cast<_Link_type>(__x->_M_right); }

      static _Const_Link_type
      _S_right(_Const_Base_ptr __x)
      { return static_cast<_Const_Link_type>(__x->_M_right); }

      static const_reference
      _S_value(_Const_Base_ptr __x)
      { return *static_cast<_Const_Link_type>(__x)->_M_valptr(); }

      static const _Key&
      _S_key(_Const_Base_ptr __x)
      { return _KeyOfValue()(_S_value(__x)); }

      static _Base_ptr
      _S_minimum(_Base_ptr __x)
      { return _Rb_tree_node_base::_S_minimum(__x); }

      static _Const_Base_ptr
      _S_minimum(_Const_Base_ptr __x)
      { return _Rb_tree_node_base::_S_minimum(__x); }

      static _Base_ptr
      _S_maximum(_Base_ptr __x)
      { return _Rb_tree_node_base::_S_maximum(__x); }

      static _Const_Base_ptr
      _S_maximum(_Const_Base_ptr __x)
      { return _Rb_tree_node_base::_S_maximum(__x); }

    public:
      typedef _Rb_tree_iterator<value_type> iterator;
      typedef _Rb_tree_const_iterator<value_type> const_iterator;

      typedef std::reverse_iterator<iterator> reverse_iterator;
      typedef std::reverse_iterator<const_iterator> const_reverse_iterator;

    private:
      pair<_Base_ptr, _Base_ptr>
      _M_get_insert_unique_pos(const key_type& __k);

      pair<_Base_ptr, _Base_ptr>
      _M_get_insert_equal_pos(const key_type& __k);

      pair<_Base_ptr, _Base_ptr>
      _M_get_insert_hint_unique_pos(const_iterator __pos,
        const key_type& __k);

      pair<_Base_ptr, _Base_ptr>
      _M_get_insert_hint_equal_pos(const_iterator __pos,
       const key_type& __k);
# 627 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_tree.h" 3
      iterator
      _M_insert_(_Base_ptr __x, _Base_ptr __y,
   const value_type& __v);



      iterator
      _M_insert_lower(_Base_ptr __y, const value_type& __v);

      iterator
      _M_insert_equal_lower(const value_type& __x);


      _Link_type
      _M_copy(_Const_Link_type __x, _Link_type __p);

      void
      _M_erase(_Link_type __x);

      iterator
      _M_lower_bound(_Link_type __x, _Link_type __y,
       const _Key& __k);

      const_iterator
      _M_lower_bound(_Const_Link_type __x, _Const_Link_type __y,
       const _Key& __k) const;

      iterator
      _M_upper_bound(_Link_type __x, _Link_type __y,
       const _Key& __k);

      const_iterator
      _M_upper_bound(_Const_Link_type __x, _Const_Link_type __y,
       const _Key& __k) const;

    public:

      _Rb_tree() { }

      _Rb_tree(const _Compare& __comp,
        const allocator_type& __a = allocator_type())
      : _M_impl(__comp, _Node_allocator(__a)) { }

      _Rb_tree(const _Rb_tree& __x)
      : _M_impl(__x._M_impl._M_key_compare,
         _Alloc_traits::_S_select_on_copy(__x._M_get_Node_allocator()))
      {
 if (__x._M_root() != 0)
   {
     _M_root() = _M_copy(__x._M_begin(), _M_end());
     _M_leftmost() = _S_minimum(_M_root());
     _M_rightmost() = _S_maximum(_M_root());
     _M_impl._M_node_count = __x._M_impl._M_node_count;
   }
      }
# 714 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_tree.h" 3
      ~_Rb_tree()
      { _M_erase(_M_begin()); }

      _Rb_tree&
      operator=(const _Rb_tree& __x);


      _Compare
      key_comp() const
      { return _M_impl._M_key_compare; }

      iterator
      begin()
      {
 return iterator(static_cast<_Link_type>
   (this->_M_impl._M_header._M_left));
      }

      const_iterator
      begin() const
      {
 return const_iterator(static_cast<_Const_Link_type>
         (this->_M_impl._M_header._M_left));
      }

      iterator
      end()
      { return iterator(static_cast<_Link_type>(&this->_M_impl._M_header)); }

      const_iterator
      end() const
      {
 return const_iterator(static_cast<_Const_Link_type>
         (&this->_M_impl._M_header));
      }

      reverse_iterator
      rbegin()
      { return reverse_iterator(end()); }

      const_reverse_iterator
      rbegin() const
      { return const_reverse_iterator(end()); }

      reverse_iterator
      rend()
      { return reverse_iterator(begin()); }

      const_reverse_iterator
      rend() const
      { return const_reverse_iterator(begin()); }

      bool
      empty() const
      { return _M_impl._M_node_count == 0; }

      size_type
      size() const
      { return _M_impl._M_node_count; }

      size_type
      max_size() const
      { return _Alloc_traits::max_size(_M_get_Node_allocator()); }

      void



      swap(_Rb_tree& __t);
# 819 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_tree.h" 3
      pair<iterator, bool>
      _M_insert_unique(const value_type& __x);

      iterator
      _M_insert_equal(const value_type& __x);

      iterator
      _M_insert_unique_(const_iterator __position, const value_type& __x);

      iterator
      _M_insert_equal_(const_iterator __position, const value_type& __x);


      template<typename _InputIterator>
        void
        _M_insert_unique(_InputIterator __first, _InputIterator __last);

      template<typename _InputIterator>
        void
        _M_insert_equal(_InputIterator __first, _InputIterator __last);

    private:
      void
      _M_erase_aux(const_iterator __position);

      void
      _M_erase_aux(const_iterator __first, const_iterator __last);

    public:
# 872 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_tree.h" 3
      void
      erase(iterator __position)
      { _M_erase_aux(__position); }

      void
      erase(const_iterator __position)
      { _M_erase_aux(__position); }

      size_type
      erase(const key_type& __x);
# 894 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_tree.h" 3
      void
      erase(iterator __first, iterator __last)
      { _M_erase_aux(__first, __last); }

      void
      erase(const_iterator __first, const_iterator __last)
      { _M_erase_aux(__first, __last); }

      void
      erase(const key_type* __first, const key_type* __last);

      void
      clear()
      {
        _M_erase(_M_begin());
        _M_leftmost() = _M_end();
        _M_root() = 0;
        _M_rightmost() = _M_end();
        _M_impl._M_node_count = 0;
      }


      iterator
      find(const key_type& __k);

      const_iterator
      find(const key_type& __k) const;

      size_type
      count(const key_type& __k) const;

      iterator
      lower_bound(const key_type& __k)
      { return _M_lower_bound(_M_begin(), _M_end(), __k); }

      const_iterator
      lower_bound(const key_type& __k) const
      { return _M_lower_bound(_M_begin(), _M_end(), __k); }

      iterator
      upper_bound(const key_type& __k)
      { return _M_upper_bound(_M_begin(), _M_end(), __k); }

      const_iterator
      upper_bound(const key_type& __k) const
      { return _M_upper_bound(_M_begin(), _M_end(), __k); }

      pair<iterator, iterator>
      equal_range(const key_type& __k);

      pair<const_iterator, const_iterator>
      equal_range(const key_type& __k) const;


      bool
      __rb_verify() const;
# 965 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_tree.h" 3
    };

  template<typename _Key, typename _Val, typename _KeyOfValue,
           typename _Compare, typename _Alloc>
    inline bool
    operator==(const _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>& __x,
        const _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>& __y)
    {
      return __x.size() == __y.size()
      && std::equal(__x.begin(), __x.end(), __y.begin());
    }

  template<typename _Key, typename _Val, typename _KeyOfValue,
           typename _Compare, typename _Alloc>
    inline bool
    operator<(const _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>& __x,
       const _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>& __y)
    {
      return std::lexicographical_compare(__x.begin(), __x.end(),
       __y.begin(), __y.end());
    }

  template<typename _Key, typename _Val, typename _KeyOfValue,
           typename _Compare, typename _Alloc>
    inline bool
    operator!=(const _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>& __x,
        const _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>& __y)
    { return !(__x == __y); }

  template<typename _Key, typename _Val, typename _KeyOfValue,
           typename _Compare, typename _Alloc>
    inline bool
    operator>(const _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>& __x,
       const _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>& __y)
    { return __y < __x; }

  template<typename _Key, typename _Val, typename _KeyOfValue,
           typename _Compare, typename _Alloc>
    inline bool
    operator<=(const _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>& __x,
        const _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>& __y)
    { return !(__y < __x); }

  template<typename _Key, typename _Val, typename _KeyOfValue,
           typename _Compare, typename _Alloc>
    inline bool
    operator>=(const _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>& __x,
        const _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>& __y)
    { return !(__x < __y); }

  template<typename _Key, typename _Val, typename _KeyOfValue,
           typename _Compare, typename _Alloc>
    inline void
    swap(_Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>& __x,
  _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>& __y)
    { __x.swap(__y); }
# 1092 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_tree.h" 3
  template<typename _Key, typename _Val, typename _KeyOfValue,
           typename _Compare, typename _Alloc>
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>&
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
    operator=(const _Rb_tree& __x)
    {
      if (this != &__x)
 {

   clear();
# 1114 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_tree.h" 3
   _M_impl._M_key_compare = __x._M_impl._M_key_compare;
   if (__x._M_root() != 0)
     {
       _M_root() = _M_copy(__x._M_begin(), _M_end());
       _M_leftmost() = _S_minimum(_M_root());
       _M_rightmost() = _S_maximum(_M_root());
       _M_impl._M_node_count = __x._M_impl._M_node_count;
     }
 }
      return *this;
    }

  template<typename _Key, typename _Val, typename _KeyOfValue,
           typename _Compare, typename _Alloc>



    typename _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::iterator
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::



    _M_insert_(_Base_ptr __x, _Base_ptr __p, const _Val& __v)

    {
      bool __insert_left = (__x != 0 || __p == _M_end()
       || _M_impl._M_key_compare(_KeyOfValue()(__v),
            _S_key(__p)));

      _Link_type __z = _M_create_node((__v));

      _Rb_tree_insert_and_rebalance(__insert_left, __z, __p,
        this->_M_impl._M_header);
      ++_M_impl._M_node_count;
      return iterator(__z);
    }

  template<typename _Key, typename _Val, typename _KeyOfValue,
           typename _Compare, typename _Alloc>



    typename _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::iterator
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::



    _M_insert_lower(_Base_ptr __p, const _Val& __v)

    {
      bool __insert_left = (__p == _M_end()
       || !_M_impl._M_key_compare(_S_key(__p),
             _KeyOfValue()(__v)));

      _Link_type __z = _M_create_node((__v));

      _Rb_tree_insert_and_rebalance(__insert_left, __z, __p,
        this->_M_impl._M_header);
      ++_M_impl._M_node_count;
      return iterator(__z);
    }

  template<typename _Key, typename _Val, typename _KeyOfValue,
           typename _Compare, typename _Alloc>



    typename _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::iterator
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::



    _M_insert_equal_lower(const _Val& __v)

    {
      _Link_type __x = _M_begin();
      _Link_type __y = _M_end();
      while (__x != 0)
 {
   __y = __x;
   __x = !_M_impl._M_key_compare(_S_key(__x), _KeyOfValue()(__v)) ?
         _S_left(__x) : _S_right(__x);
 }
      return _M_insert_lower(__y, (__v));
    }

  template<typename _Key, typename _Val, typename _KoV,
           typename _Compare, typename _Alloc>
    typename _Rb_tree<_Key, _Val, _KoV, _Compare, _Alloc>::_Link_type
    _Rb_tree<_Key, _Val, _KoV, _Compare, _Alloc>::
    _M_copy(_Const_Link_type __x, _Link_type __p)
    {

      _Link_type __top = _M_clone_node(__x);
      __top->_M_parent = __p;

      try
 {
   if (__x->_M_right)
     __top->_M_right = _M_copy(_S_right(__x), __top);
   __p = __top;
   __x = _S_left(__x);

   while (__x != 0)
     {
       _Link_type __y = _M_clone_node(__x);
       __p->_M_left = __y;
       __y->_M_parent = __p;
       if (__x->_M_right)
  __y->_M_right = _M_copy(_S_right(__x), __y);
       __p = __y;
       __x = _S_left(__x);
     }
 }
      catch(...)
 {
   _M_erase(__top);
   throw;
 }
      return __top;
    }

  template<typename _Key, typename _Val, typename _KeyOfValue,
           typename _Compare, typename _Alloc>
    void
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
    _M_erase(_Link_type __x)
    {

      while (__x != 0)
 {
   _M_erase(_S_right(__x));
   _Link_type __y = _S_left(__x);
   _M_destroy_node(__x);
   __x = __y;
 }
    }

  template<typename _Key, typename _Val, typename _KeyOfValue,
           typename _Compare, typename _Alloc>
    typename _Rb_tree<_Key, _Val, _KeyOfValue,
        _Compare, _Alloc>::iterator
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
    _M_lower_bound(_Link_type __x, _Link_type __y,
     const _Key& __k)
    {
      while (__x != 0)
 if (!_M_impl._M_key_compare(_S_key(__x), __k))
   __y = __x, __x = _S_left(__x);
 else
   __x = _S_right(__x);
      return iterator(__y);
    }

  template<typename _Key, typename _Val, typename _KeyOfValue,
           typename _Compare, typename _Alloc>
    typename _Rb_tree<_Key, _Val, _KeyOfValue,
        _Compare, _Alloc>::const_iterator
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
    _M_lower_bound(_Const_Link_type __x, _Const_Link_type __y,
     const _Key& __k) const
    {
      while (__x != 0)
 if (!_M_impl._M_key_compare(_S_key(__x), __k))
   __y = __x, __x = _S_left(__x);
 else
   __x = _S_right(__x);
      return const_iterator(__y);
    }

  template<typename _Key, typename _Val, typename _KeyOfValue,
           typename _Compare, typename _Alloc>
    typename _Rb_tree<_Key, _Val, _KeyOfValue,
        _Compare, _Alloc>::iterator
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
    _M_upper_bound(_Link_type __x, _Link_type __y,
     const _Key& __k)
    {
      while (__x != 0)
 if (_M_impl._M_key_compare(__k, _S_key(__x)))
   __y = __x, __x = _S_left(__x);
 else
   __x = _S_right(__x);
      return iterator(__y);
    }

  template<typename _Key, typename _Val, typename _KeyOfValue,
           typename _Compare, typename _Alloc>
    typename _Rb_tree<_Key, _Val, _KeyOfValue,
        _Compare, _Alloc>::const_iterator
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
    _M_upper_bound(_Const_Link_type __x, _Const_Link_type __y,
     const _Key& __k) const
    {
      while (__x != 0)
 if (_M_impl._M_key_compare(__k, _S_key(__x)))
   __y = __x, __x = _S_left(__x);
 else
   __x = _S_right(__x);
      return const_iterator(__y);
    }

  template<typename _Key, typename _Val, typename _KeyOfValue,
           typename _Compare, typename _Alloc>
    pair<typename _Rb_tree<_Key, _Val, _KeyOfValue,
      _Compare, _Alloc>::iterator,
  typename _Rb_tree<_Key, _Val, _KeyOfValue,
      _Compare, _Alloc>::iterator>
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
    equal_range(const _Key& __k)
    {
      _Link_type __x = _M_begin();
      _Link_type __y = _M_end();
      while (__x != 0)
 {
   if (_M_impl._M_key_compare(_S_key(__x), __k))
     __x = _S_right(__x);
   else if (_M_impl._M_key_compare(__k, _S_key(__x)))
     __y = __x, __x = _S_left(__x);
   else
     {
       _Link_type __xu(__x), __yu(__y);
       __y = __x, __x = _S_left(__x);
       __xu = _S_right(__xu);
       return pair<iterator,
            iterator>(_M_lower_bound(__x, __y, __k),
        _M_upper_bound(__xu, __yu, __k));
     }
 }
      return pair<iterator, iterator>(iterator(__y),
          iterator(__y));
    }

  template<typename _Key, typename _Val, typename _KeyOfValue,
           typename _Compare, typename _Alloc>
    pair<typename _Rb_tree<_Key, _Val, _KeyOfValue,
      _Compare, _Alloc>::const_iterator,
  typename _Rb_tree<_Key, _Val, _KeyOfValue,
      _Compare, _Alloc>::const_iterator>
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
    equal_range(const _Key& __k) const
    {
      _Const_Link_type __x = _M_begin();
      _Const_Link_type __y = _M_end();
      while (__x != 0)
 {
   if (_M_impl._M_key_compare(_S_key(__x), __k))
     __x = _S_right(__x);
   else if (_M_impl._M_key_compare(__k, _S_key(__x)))
     __y = __x, __x = _S_left(__x);
   else
     {
       _Const_Link_type __xu(__x), __yu(__y);
       __y = __x, __x = _S_left(__x);
       __xu = _S_right(__xu);
       return pair<const_iterator,
            const_iterator>(_M_lower_bound(__x, __y, __k),
       _M_upper_bound(__xu, __yu, __k));
     }
 }
      return pair<const_iterator, const_iterator>(const_iterator(__y),
        const_iterator(__y));
    }

  template<typename _Key, typename _Val, typename _KeyOfValue,
           typename _Compare, typename _Alloc>
    void
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
    swap(_Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>& __t)



    {
      if (_M_root() == 0)
 {
   if (__t._M_root() != 0)
     {
       _M_root() = __t._M_root();
       _M_leftmost() = __t._M_leftmost();
       _M_rightmost() = __t._M_rightmost();
       _M_root()->_M_parent = _M_end();

       __t._M_root() = 0;
       __t._M_leftmost() = __t._M_end();
       __t._M_rightmost() = __t._M_end();
     }
 }
      else if (__t._M_root() == 0)
 {
   __t._M_root() = _M_root();
   __t._M_leftmost() = _M_leftmost();
   __t._M_rightmost() = _M_rightmost();
   __t._M_root()->_M_parent = __t._M_end();

   _M_root() = 0;
   _M_leftmost() = _M_end();
   _M_rightmost() = _M_end();
 }
      else
 {
   std::swap(_M_root(),__t._M_root());
   std::swap(_M_leftmost(),__t._M_leftmost());
   std::swap(_M_rightmost(),__t._M_rightmost());

   _M_root()->_M_parent = _M_end();
   __t._M_root()->_M_parent = __t._M_end();
 }

      std::swap(this->_M_impl._M_node_count, __t._M_impl._M_node_count);
      std::swap(this->_M_impl._M_key_compare, __t._M_impl._M_key_compare);

      _Alloc_traits::_S_on_swap(_M_get_Node_allocator(),
    __t._M_get_Node_allocator());
    }

  template<typename _Key, typename _Val, typename _KeyOfValue,
           typename _Compare, typename _Alloc>
    pair<typename _Rb_tree<_Key, _Val, _KeyOfValue,
      _Compare, _Alloc>::_Base_ptr,
  typename _Rb_tree<_Key, _Val, _KeyOfValue,
      _Compare, _Alloc>::_Base_ptr>
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
    _M_get_insert_unique_pos(const key_type& __k)
    {
      typedef pair<_Base_ptr, _Base_ptr> _Res;
      _Link_type __x = _M_begin();
      _Link_type __y = _M_end();
      bool __comp = true;
      while (__x != 0)
 {
   __y = __x;
   __comp = _M_impl._M_key_compare(__k, _S_key(__x));
   __x = __comp ? _S_left(__x) : _S_right(__x);
 }
      iterator __j = iterator(__y);
      if (__comp)
 {
   if (__j == begin())
     return _Res(__x, __y);
   else
     --__j;
 }
      if (_M_impl._M_key_compare(_S_key(__j._M_node), __k))
 return _Res(__x, __y);
      return _Res(__j._M_node, 0);
    }

  template<typename _Key, typename _Val, typename _KeyOfValue,
           typename _Compare, typename _Alloc>
    pair<typename _Rb_tree<_Key, _Val, _KeyOfValue,
      _Compare, _Alloc>::_Base_ptr,
  typename _Rb_tree<_Key, _Val, _KeyOfValue,
      _Compare, _Alloc>::_Base_ptr>
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
    _M_get_insert_equal_pos(const key_type& __k)
    {
      typedef pair<_Base_ptr, _Base_ptr> _Res;
      _Link_type __x = _M_begin();
      _Link_type __y = _M_end();
      while (__x != 0)
 {
   __y = __x;
   __x = _M_impl._M_key_compare(__k, _S_key(__x)) ?
         _S_left(__x) : _S_right(__x);
 }
      return _Res(__x, __y);
    }

  template<typename _Key, typename _Val, typename _KeyOfValue,
           typename _Compare, typename _Alloc>



    pair<typename _Rb_tree<_Key, _Val, _KeyOfValue,
      _Compare, _Alloc>::iterator, bool>
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::



    _M_insert_unique(const _Val& __v)

    {
      typedef pair<iterator, bool> _Res;
      pair<_Base_ptr, _Base_ptr> __res
 = _M_get_insert_unique_pos(_KeyOfValue()(__v));

      if (__res.second)
 return _Res(_M_insert_(__res.first, __res.second,
          (__v)),
      true);

      return _Res(iterator(static_cast<_Link_type>(__res.first)), false);
    }

  template<typename _Key, typename _Val, typename _KeyOfValue,
           typename _Compare, typename _Alloc>



    typename _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::iterator
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::



    _M_insert_equal(const _Val& __v)

    {
      pair<_Base_ptr, _Base_ptr> __res
 = _M_get_insert_equal_pos(_KeyOfValue()(__v));
      return _M_insert_(__res.first, __res.second, (__v));
    }

  template<typename _Key, typename _Val, typename _KeyOfValue,
           typename _Compare, typename _Alloc>
    pair<typename _Rb_tree<_Key, _Val, _KeyOfValue,
      _Compare, _Alloc>::_Base_ptr,
         typename _Rb_tree<_Key, _Val, _KeyOfValue,
      _Compare, _Alloc>::_Base_ptr>
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
    _M_get_insert_hint_unique_pos(const_iterator __position,
      const key_type& __k)
    {
      iterator __pos = __position._M_const_cast();
      typedef pair<_Base_ptr, _Base_ptr> _Res;


      if (__pos._M_node == _M_end())
 {
   if (size() > 0
       && _M_impl._M_key_compare(_S_key(_M_rightmost()), __k))
     return _Res(0, _M_rightmost());
   else
     return _M_get_insert_unique_pos(__k);
 }
      else if (_M_impl._M_key_compare(__k, _S_key(__pos._M_node)))
 {

   iterator __before = __pos;
   if (__pos._M_node == _M_leftmost())
     return _Res(_M_leftmost(), _M_leftmost());
   else if (_M_impl._M_key_compare(_S_key((--__before)._M_node), __k))
     {
       if (_S_right(__before._M_node) == 0)
  return _Res(0, __before._M_node);
       else
  return _Res(__pos._M_node, __pos._M_node);
     }
   else
     return _M_get_insert_unique_pos(__k);
 }
      else if (_M_impl._M_key_compare(_S_key(__pos._M_node), __k))
 {

   iterator __after = __pos;
   if (__pos._M_node == _M_rightmost())
     return _Res(0, _M_rightmost());
   else if (_M_impl._M_key_compare(__k, _S_key((++__after)._M_node)))
     {
       if (_S_right(__pos._M_node) == 0)
  return _Res(0, __pos._M_node);
       else
  return _Res(__after._M_node, __after._M_node);
     }
   else
     return _M_get_insert_unique_pos(__k);
 }
      else

 return _Res(__pos._M_node, 0);
    }

  template<typename _Key, typename _Val, typename _KeyOfValue,
           typename _Compare, typename _Alloc>



    typename _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::iterator
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::



    _M_insert_unique_(const_iterator __position, const _Val& __v)

    {
      pair<_Base_ptr, _Base_ptr> __res
 = _M_get_insert_hint_unique_pos(__position, _KeyOfValue()(__v));

      if (__res.second)
 return _M_insert_(__res.first, __res.second,
     (__v));
      return iterator(static_cast<_Link_type>(__res.first));
    }

  template<typename _Key, typename _Val, typename _KeyOfValue,
           typename _Compare, typename _Alloc>
    pair<typename _Rb_tree<_Key, _Val, _KeyOfValue,
      _Compare, _Alloc>::_Base_ptr,
         typename _Rb_tree<_Key, _Val, _KeyOfValue,
      _Compare, _Alloc>::_Base_ptr>
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
    _M_get_insert_hint_equal_pos(const_iterator __position, const key_type& __k)
    {
      iterator __pos = __position._M_const_cast();
      typedef pair<_Base_ptr, _Base_ptr> _Res;


      if (__pos._M_node == _M_end())
 {
   if (size() > 0
       && !_M_impl._M_key_compare(__k, _S_key(_M_rightmost())))
     return _Res(0, _M_rightmost());
   else
     return _M_get_insert_equal_pos(__k);
 }
      else if (!_M_impl._M_key_compare(_S_key(__pos._M_node), __k))
 {

   iterator __before = __pos;
   if (__pos._M_node == _M_leftmost())
     return _Res(_M_leftmost(), _M_leftmost());
   else if (!_M_impl._M_key_compare(__k, _S_key((--__before)._M_node)))
     {
       if (_S_right(__before._M_node) == 0)
  return _Res(0, __before._M_node);
       else
  return _Res(__pos._M_node, __pos._M_node);
     }
   else
     return _M_get_insert_equal_pos(__k);
 }
      else
 {

   iterator __after = __pos;
   if (__pos._M_node == _M_rightmost())
     return _Res(0, _M_rightmost());
   else if (!_M_impl._M_key_compare(_S_key((++__after)._M_node), __k))
     {
       if (_S_right(__pos._M_node) == 0)
  return _Res(0, __pos._M_node);
       else
  return _Res(__after._M_node, __after._M_node);
     }
   else
     return _Res(0, 0);
 }
    }

  template<typename _Key, typename _Val, typename _KeyOfValue,
           typename _Compare, typename _Alloc>



    typename _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::iterator
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::



    _M_insert_equal_(const_iterator __position, const _Val& __v)

    {
      pair<_Base_ptr, _Base_ptr> __res
 = _M_get_insert_hint_equal_pos(__position, _KeyOfValue()(__v));

      if (__res.second)
 return _M_insert_(__res.first, __res.second,
     (__v));

      return _M_insert_equal_lower((__v));
    }
# 1835 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_tree.h" 3
  template<typename _Key, typename _Val, typename _KoV,
           typename _Cmp, typename _Alloc>
    template<class _II>
      void
      _Rb_tree<_Key, _Val, _KoV, _Cmp, _Alloc>::
      _M_insert_unique(_II __first, _II __last)
      {
 for (; __first != __last; ++__first)
   _M_insert_unique_(end(), *__first);
      }

  template<typename _Key, typename _Val, typename _KoV,
           typename _Cmp, typename _Alloc>
    template<class _II>
      void
      _Rb_tree<_Key, _Val, _KoV, _Cmp, _Alloc>::
      _M_insert_equal(_II __first, _II __last)
      {
 for (; __first != __last; ++__first)
   _M_insert_equal_(end(), *__first);
      }

  template<typename _Key, typename _Val, typename _KeyOfValue,
           typename _Compare, typename _Alloc>
    void
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
    _M_erase_aux(const_iterator __position)
    {
      _Link_type __y =
 static_cast<_Link_type>(_Rb_tree_rebalance_for_erase
    (const_cast<_Base_ptr>(__position._M_node),
     this->_M_impl._M_header));
      _M_destroy_node(__y);
      --_M_impl._M_node_count;
    }

  template<typename _Key, typename _Val, typename _KeyOfValue,
           typename _Compare, typename _Alloc>
    void
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
    _M_erase_aux(const_iterator __first, const_iterator __last)
    {
      if (__first == begin() && __last == end())
 clear();
      else
 while (__first != __last)
   erase(__first++);
    }

  template<typename _Key, typename _Val, typename _KeyOfValue,
           typename _Compare, typename _Alloc>
    typename _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::size_type
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
    erase(const _Key& __x)
    {
      pair<iterator, iterator> __p = equal_range(__x);
      const size_type __old_size = size();
      erase(__p.first, __p.second);
      return __old_size - size();
    }

  template<typename _Key, typename _Val, typename _KeyOfValue,
           typename _Compare, typename _Alloc>
    void
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
    erase(const _Key* __first, const _Key* __last)
    {
      while (__first != __last)
 erase(*__first++);
    }

  template<typename _Key, typename _Val, typename _KeyOfValue,
           typename _Compare, typename _Alloc>
    typename _Rb_tree<_Key, _Val, _KeyOfValue,
        _Compare, _Alloc>::iterator
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
    find(const _Key& __k)
    {
      iterator __j = _M_lower_bound(_M_begin(), _M_end(), __k);
      return (__j == end()
       || _M_impl._M_key_compare(__k,
     _S_key(__j._M_node))) ? end() : __j;
    }

  template<typename _Key, typename _Val, typename _KeyOfValue,
           typename _Compare, typename _Alloc>
    typename _Rb_tree<_Key, _Val, _KeyOfValue,
        _Compare, _Alloc>::const_iterator
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
    find(const _Key& __k) const
    {
      const_iterator __j = _M_lower_bound(_M_begin(), _M_end(), __k);
      return (__j == end()
       || _M_impl._M_key_compare(__k,
     _S_key(__j._M_node))) ? end() : __j;
    }

  template<typename _Key, typename _Val, typename _KeyOfValue,
           typename _Compare, typename _Alloc>
    typename _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::size_type
    _Rb_tree<_Key, _Val, _KeyOfValue, _Compare, _Alloc>::
    count(const _Key& __k) const
    {
      pair<const_iterator, const_iterator> __p = equal_range(__k);
      const size_type __n = std::distance(__p.first, __p.second);
      return __n;
    }

  __attribute__ ((__pure__)) unsigned int
  _Rb_tree_black_count(const _Rb_tree_node_base* __node,
                       const _Rb_tree_node_base* __root) throw ();

  template<typename _Key, typename _Val, typename _KeyOfValue,
           typename _Compare, typename _Alloc>
    bool
    _Rb_tree<_Key,_Val,_KeyOfValue,_Compare,_Alloc>::__rb_verify() const
    {
      if (_M_impl._M_node_count == 0 || begin() == end())
 return _M_impl._M_node_count == 0 && begin() == end()
        && this->_M_impl._M_header._M_left == _M_end()
        && this->_M_impl._M_header._M_right == _M_end();

      unsigned int __len = _Rb_tree_black_count(_M_leftmost(), _M_root());
      for (const_iterator __it = begin(); __it != end(); ++__it)
 {
   _Const_Link_type __x = static_cast<_Const_Link_type>(__it._M_node);
   _Const_Link_type __L = _S_left(__x);
   _Const_Link_type __R = _S_right(__x);

   if (__x->_M_color == _S_red)
     if ((__L && __L->_M_color == _S_red)
  || (__R && __R->_M_color == _S_red))
       return false;

   if (__L && _M_impl._M_key_compare(_S_key(__x), _S_key(__L)))
     return false;
   if (__R && _M_impl._M_key_compare(_S_key(__R), _S_key(__x)))
     return false;

   if (!__L && !__R && _Rb_tree_black_count(__x, _M_root()) != __len)
     return false;
 }

      if (_M_leftmost() != _Rb_tree_node_base::_S_minimum(_M_root()))
 return false;
      if (_M_rightmost() != _Rb_tree_node_base::_S_maximum(_M_root()))
 return false;
      return true;
    }


}
# 61 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/map" 2 3
# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_map.h" 1 3
# 66 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_map.h" 3
namespace std __attribute__ ((__visibility__ ("default")))
{

# 94 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_map.h" 3
  template <typename _Key, typename _Tp, typename _Compare = std::less<_Key>,
            typename _Alloc = std::allocator<std::pair<const _Key, _Tp> > >
    class map
    {
    public:
      typedef _Key key_type;
      typedef _Tp mapped_type;
      typedef std::pair<const _Key, _Tp> value_type;
      typedef _Compare key_compare;
      typedef _Alloc allocator_type;

    private:

      typedef typename _Alloc::value_type _Alloc_value_type;
     
     

     

    public:
      class value_compare
      : public std::binary_function<value_type, value_type, bool>
      {
 friend class map<_Key, _Tp, _Compare, _Alloc>;
      protected:
 _Compare comp;

 value_compare(_Compare __c)
 : comp(__c) { }

      public:
 bool operator()(const value_type& __x, const value_type& __y) const
 { return comp(__x.first, __y.first); }
      };

    private:

      typedef typename __gnu_cxx::__alloc_traits<_Alloc>::template
 rebind<value_type>::other _Pair_alloc_type;

      typedef _Rb_tree<key_type, value_type, _Select1st<value_type>,
         key_compare, _Pair_alloc_type> _Rep_type;


      _Rep_type _M_t;

      typedef __gnu_cxx::__alloc_traits<_Pair_alloc_type> _Alloc_traits;

    public:


      typedef typename _Alloc_traits::pointer pointer;
      typedef typename _Alloc_traits::const_pointer const_pointer;
      typedef typename _Alloc_traits::reference reference;
      typedef typename _Alloc_traits::const_reference const_reference;
      typedef typename _Rep_type::iterator iterator;
      typedef typename _Rep_type::const_iterator const_iterator;
      typedef typename _Rep_type::size_type size_type;
      typedef typename _Rep_type::difference_type difference_type;
      typedef typename _Rep_type::reverse_iterator reverse_iterator;
      typedef typename _Rep_type::const_reverse_iterator const_reverse_iterator;







      map()
      : _M_t() { }






      explicit
      map(const _Compare& __comp,
   const allocator_type& __a = allocator_type())
      : _M_t(__comp, _Pair_alloc_type(__a)) { }
# 182 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_map.h" 3
      map(const map& __x)
      : _M_t(__x._M_t) { }
# 252 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_map.h" 3
      template<typename _InputIterator>
        map(_InputIterator __first, _InputIterator __last)
 : _M_t()
        { _M_t._M_insert_unique(__first, __last); }
# 269 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_map.h" 3
      template<typename _InputIterator>
        map(_InputIterator __first, _InputIterator __last,
     const _Compare& __comp,
     const allocator_type& __a = allocator_type())
 : _M_t(__comp, _Pair_alloc_type(__a))
        { _M_t._M_insert_unique(__first, __last); }
# 292 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_map.h" 3
      map&
      operator=(const map& __x)
      {
 _M_t = __x._M_t;
 return *this;
      }
# 344 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_map.h" 3
      allocator_type
      get_allocator() const
      { return allocator_type(_M_t.get_allocator()); }







      iterator
      begin()
      { return _M_t.begin(); }






      const_iterator
      begin() const
      { return _M_t.begin(); }






      iterator
      end()
      { return _M_t.end(); }






      const_iterator
      end() const
      { return _M_t.end(); }






      reverse_iterator
      rbegin()
      { return _M_t.rbegin(); }






      const_reverse_iterator
      rbegin() const
      { return _M_t.rbegin(); }






      reverse_iterator
      rend()
      { return _M_t.rend(); }






      const_reverse_iterator
      rend() const
      { return _M_t.rend(); }
# 463 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_map.h" 3
      bool
      empty() const
      { return _M_t.empty(); }


      size_type
      size() const
      { return _M_t.size(); }


      size_type
      max_size() const
      { return _M_t.max_size(); }
# 490 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_map.h" 3
      mapped_type&
      operator[](const key_type& __k)
      {



 iterator __i = lower_bound(__k);

 if (__i == end() || key_comp()(__k, (*__i).first))





          __i = insert(__i, value_type(__k, mapped_type()));

 return (*__i).second;
      }
# 535 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_map.h" 3
      mapped_type&
      at(const key_type& __k)
      {
 iterator __i = lower_bound(__k);
 if (__i == end() || key_comp()(__k, (*__i).first))
   __throw_out_of_range(("map::at"));
 return (*__i).second;
      }

      const mapped_type&
      at(const key_type& __k) const
      {
 const_iterator __i = lower_bound(__k);
 if (__i == end() || key_comp()(__k, (*__i).first))
   __throw_out_of_range(("map::at"));
 return (*__i).second;
      }
# 628 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_map.h" 3
      std::pair<iterator, bool>
      insert(const value_type& __x)
      { return _M_t._M_insert_unique(__x); }
# 677 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_map.h" 3
      iterator



      insert(iterator __position, const value_type& __x)

      { return _M_t._M_insert_unique_(__position, __x); }
# 703 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_map.h" 3
      template<typename _InputIterator>
        void
        insert(_InputIterator __first, _InputIterator __last)
        { _M_t._M_insert_unique(__first, __last); }
# 744 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_map.h" 3
      void
      erase(iterator __position)
      { _M_t.erase(__position); }
# 760 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_map.h" 3
      size_type
      erase(const key_type& __x)
      { return _M_t.erase(__x); }
# 796 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_map.h" 3
      void
      erase(iterator __first, iterator __last)
      { _M_t.erase(__first, __last); }
# 812 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_map.h" 3
      void
      swap(map& __x)



      { _M_t.swap(__x._M_t); }







      void
      clear()
      { _M_t.clear(); }






      key_compare
      key_comp() const
      { return _M_t.key_comp(); }





      value_compare
      value_comp() const
      { return value_compare(_M_t.key_comp()); }
# 858 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_map.h" 3
      iterator
      find(const key_type& __x)
      { return _M_t.find(__x); }
# 873 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_map.h" 3
      const_iterator
      find(const key_type& __x) const
      { return _M_t.find(__x); }
# 885 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_map.h" 3
      size_type
      count(const key_type& __x) const
      { return _M_t.find(__x) == _M_t.end() ? 0 : 1; }
# 900 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_map.h" 3
      iterator
      lower_bound(const key_type& __x)
      { return _M_t.lower_bound(__x); }
# 915 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_map.h" 3
      const_iterator
      lower_bound(const key_type& __x) const
      { return _M_t.lower_bound(__x); }







      iterator
      upper_bound(const key_type& __x)
      { return _M_t.upper_bound(__x); }







      const_iterator
      upper_bound(const key_type& __x) const
      { return _M_t.upper_bound(__x); }
# 954 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_map.h" 3
      std::pair<iterator, iterator>
      equal_range(const key_type& __x)
      { return _M_t.equal_range(__x); }
# 973 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_map.h" 3
      std::pair<const_iterator, const_iterator>
      equal_range(const key_type& __x) const
      { return _M_t.equal_range(__x); }

      template<typename _K1, typename _T1, typename _C1, typename _A1>
        friend bool
        operator==(const map<_K1, _T1, _C1, _A1>&,
     const map<_K1, _T1, _C1, _A1>&);

      template<typename _K1, typename _T1, typename _C1, typename _A1>
        friend bool
        operator<(const map<_K1, _T1, _C1, _A1>&,
    const map<_K1, _T1, _C1, _A1>&);
    };
# 998 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_map.h" 3
  template<typename _Key, typename _Tp, typename _Compare, typename _Alloc>
    inline bool
    operator==(const map<_Key, _Tp, _Compare, _Alloc>& __x,
               const map<_Key, _Tp, _Compare, _Alloc>& __y)
    { return __x._M_t == __y._M_t; }
# 1015 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_map.h" 3
  template<typename _Key, typename _Tp, typename _Compare, typename _Alloc>
    inline bool
    operator<(const map<_Key, _Tp, _Compare, _Alloc>& __x,
              const map<_Key, _Tp, _Compare, _Alloc>& __y)
    { return __x._M_t < __y._M_t; }


  template<typename _Key, typename _Tp, typename _Compare, typename _Alloc>
    inline bool
    operator!=(const map<_Key, _Tp, _Compare, _Alloc>& __x,
               const map<_Key, _Tp, _Compare, _Alloc>& __y)
    { return !(__x == __y); }


  template<typename _Key, typename _Tp, typename _Compare, typename _Alloc>
    inline bool
    operator>(const map<_Key, _Tp, _Compare, _Alloc>& __x,
              const map<_Key, _Tp, _Compare, _Alloc>& __y)
    { return __y < __x; }


  template<typename _Key, typename _Tp, typename _Compare, typename _Alloc>
    inline bool
    operator<=(const map<_Key, _Tp, _Compare, _Alloc>& __x,
               const map<_Key, _Tp, _Compare, _Alloc>& __y)
    { return !(__y < __x); }


  template<typename _Key, typename _Tp, typename _Compare, typename _Alloc>
    inline bool
    operator>=(const map<_Key, _Tp, _Compare, _Alloc>& __x,
               const map<_Key, _Tp, _Compare, _Alloc>& __y)
    { return !(__x < __y); }


  template<typename _Key, typename _Tp, typename _Compare, typename _Alloc>
    inline void
    swap(map<_Key, _Tp, _Compare, _Alloc>& __x,
  map<_Key, _Tp, _Compare, _Alloc>& __y)
    { __x.swap(__y); }


}
# 62 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/map" 2 3
# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_multimap.h" 1 3
# 64 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_multimap.h" 3
namespace std __attribute__ ((__visibility__ ("default")))
{

# 92 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_multimap.h" 3
  template <typename _Key, typename _Tp,
     typename _Compare = std::less<_Key>,
     typename _Alloc = std::allocator<std::pair<const _Key, _Tp> > >
    class multimap
    {
    public:
      typedef _Key key_type;
      typedef _Tp mapped_type;
      typedef std::pair<const _Key, _Tp> value_type;
      typedef _Compare key_compare;
      typedef _Alloc allocator_type;

    private:

      typedef typename _Alloc::value_type _Alloc_value_type;
     
     

     

    public:
      class value_compare
      : public std::binary_function<value_type, value_type, bool>
      {
 friend class multimap<_Key, _Tp, _Compare, _Alloc>;
      protected:
 _Compare comp;

 value_compare(_Compare __c)
 : comp(__c) { }

      public:
 bool operator()(const value_type& __x, const value_type& __y) const
 { return comp(__x.first, __y.first); }
      };

    private:

      typedef typename __gnu_cxx::__alloc_traits<_Alloc>::template
 rebind<value_type>::other _Pair_alloc_type;

      typedef _Rb_tree<key_type, value_type, _Select1st<value_type>,
         key_compare, _Pair_alloc_type> _Rep_type;

      _Rep_type _M_t;

      typedef __gnu_cxx::__alloc_traits<_Pair_alloc_type> _Alloc_traits;

    public:


      typedef typename _Alloc_traits::pointer pointer;
      typedef typename _Alloc_traits::const_pointer const_pointer;
      typedef typename _Alloc_traits::reference reference;
      typedef typename _Alloc_traits::const_reference const_reference;
      typedef typename _Rep_type::iterator iterator;
      typedef typename _Rep_type::const_iterator const_iterator;
      typedef typename _Rep_type::size_type size_type;
      typedef typename _Rep_type::difference_type difference_type;
      typedef typename _Rep_type::reverse_iterator reverse_iterator;
      typedef typename _Rep_type::const_reverse_iterator const_reverse_iterator;







      multimap()
      : _M_t() { }






      explicit
      multimap(const _Compare& __comp,
        const allocator_type& __a = allocator_type())
      : _M_t(__comp, _Pair_alloc_type(__a)) { }
# 180 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_multimap.h" 3
      multimap(const multimap& __x)
      : _M_t(__x._M_t) { }
# 248 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_multimap.h" 3
      template<typename _InputIterator>
        multimap(_InputIterator __first, _InputIterator __last)
 : _M_t()
        { _M_t._M_insert_equal(__first, __last); }
# 264 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_multimap.h" 3
      template<typename _InputIterator>
        multimap(_InputIterator __first, _InputIterator __last,
   const _Compare& __comp,
   const allocator_type& __a = allocator_type())
 : _M_t(__comp, _Pair_alloc_type(__a))
        { _M_t._M_insert_equal(__first, __last); }
# 287 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_multimap.h" 3
      multimap&
      operator=(const multimap& __x)
      {
 _M_t = __x._M_t;
 return *this;
      }
# 339 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_multimap.h" 3
      allocator_type
      get_allocator() const
      { return allocator_type(_M_t.get_allocator()); }







      iterator
      begin()
      { return _M_t.begin(); }






      const_iterator
      begin() const
      { return _M_t.begin(); }






      iterator
      end()
      { return _M_t.end(); }






      const_iterator
      end() const
      { return _M_t.end(); }






      reverse_iterator
      rbegin()
      { return _M_t.rbegin(); }






      const_reverse_iterator
      rbegin() const
      { return _M_t.rbegin(); }






      reverse_iterator
      rend()
      { return _M_t.rend(); }






      const_reverse_iterator
      rend() const
      { return _M_t.rend(); }
# 456 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_multimap.h" 3
      bool
      empty() const
      { return _M_t.empty(); }


      size_type
      size() const
      { return _M_t.size(); }


      size_type
      max_size() const
      { return _M_t.max_size(); }
# 536 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_multimap.h" 3
      iterator
      insert(const value_type& __x)
      { return _M_t._M_insert_equal(__x); }
# 569 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_multimap.h" 3
      iterator



      insert(iterator __position, const value_type& __x)

      { return _M_t._M_insert_equal_(__position, __x); }
# 596 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_multimap.h" 3
      template<typename _InputIterator>
        void
        insert(_InputIterator __first, _InputIterator __last)
        { _M_t._M_insert_equal(__first, __last); }
# 650 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_multimap.h" 3
      void
      erase(iterator __position)
      { _M_t.erase(__position); }
# 666 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_multimap.h" 3
      size_type
      erase(const key_type& __x)
      { return _M_t.erase(__x); }
# 706 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_multimap.h" 3
      void
      erase(iterator __first, iterator __last)
      { _M_t.erase(__first, __last); }
# 722 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_multimap.h" 3
      void
      swap(multimap& __x)



      { _M_t.swap(__x._M_t); }







      void
      clear()
      { _M_t.clear(); }






      key_compare
      key_comp() const
      { return _M_t.key_comp(); }





      value_compare
      value_comp() const
      { return value_compare(_M_t.key_comp()); }
# 768 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_multimap.h" 3
      iterator
      find(const key_type& __x)
      { return _M_t.find(__x); }
# 783 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_multimap.h" 3
      const_iterator
      find(const key_type& __x) const
      { return _M_t.find(__x); }






      size_type
      count(const key_type& __x) const
      { return _M_t.count(__x); }
# 807 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_multimap.h" 3
      iterator
      lower_bound(const key_type& __x)
      { return _M_t.lower_bound(__x); }
# 822 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_multimap.h" 3
      const_iterator
      lower_bound(const key_type& __x) const
      { return _M_t.lower_bound(__x); }







      iterator
      upper_bound(const key_type& __x)
      { return _M_t.upper_bound(__x); }







      const_iterator
      upper_bound(const key_type& __x) const
      { return _M_t.upper_bound(__x); }
# 859 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_multimap.h" 3
      std::pair<iterator, iterator>
      equal_range(const key_type& __x)
      { return _M_t.equal_range(__x); }
# 876 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_multimap.h" 3
      std::pair<const_iterator, const_iterator>
      equal_range(const key_type& __x) const
      { return _M_t.equal_range(__x); }

      template<typename _K1, typename _T1, typename _C1, typename _A1>
        friend bool
        operator==(const multimap<_K1, _T1, _C1, _A1>&,
     const multimap<_K1, _T1, _C1, _A1>&);

      template<typename _K1, typename _T1, typename _C1, typename _A1>
        friend bool
        operator<(const multimap<_K1, _T1, _C1, _A1>&,
    const multimap<_K1, _T1, _C1, _A1>&);
  };
# 901 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_multimap.h" 3
  template<typename _Key, typename _Tp, typename _Compare, typename _Alloc>
    inline bool
    operator==(const multimap<_Key, _Tp, _Compare, _Alloc>& __x,
               const multimap<_Key, _Tp, _Compare, _Alloc>& __y)
    { return __x._M_t == __y._M_t; }
# 918 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/bits/stl_multimap.h" 3
  template<typename _Key, typename _Tp, typename _Compare, typename _Alloc>
    inline bool
    operator<(const multimap<_Key, _Tp, _Compare, _Alloc>& __x,
              const multimap<_Key, _Tp, _Compare, _Alloc>& __y)
    { return __x._M_t < __y._M_t; }


  template<typename _Key, typename _Tp, typename _Compare, typename _Alloc>
    inline bool
    operator!=(const multimap<_Key, _Tp, _Compare, _Alloc>& __x,
               const multimap<_Key, _Tp, _Compare, _Alloc>& __y)
    { return !(__x == __y); }


  template<typename _Key, typename _Tp, typename _Compare, typename _Alloc>
    inline bool
    operator>(const multimap<_Key, _Tp, _Compare, _Alloc>& __x,
              const multimap<_Key, _Tp, _Compare, _Alloc>& __y)
    { return __y < __x; }


  template<typename _Key, typename _Tp, typename _Compare, typename _Alloc>
    inline bool
    operator<=(const multimap<_Key, _Tp, _Compare, _Alloc>& __x,
               const multimap<_Key, _Tp, _Compare, _Alloc>& __y)
    { return !(__y < __x); }


  template<typename _Key, typename _Tp, typename _Compare, typename _Alloc>
    inline bool
    operator>=(const multimap<_Key, _Tp, _Compare, _Alloc>& __x,
               const multimap<_Key, _Tp, _Compare, _Alloc>& __y)
    { return !(__x < __y); }


  template<typename _Key, typename _Tp, typename _Compare, typename _Alloc>
    inline void
    swap(multimap<_Key, _Tp, _Compare, _Alloc>& __x,
         multimap<_Key, _Tp, _Compare, _Alloc>& __y)
    { __x.swap(__y); }


}
# 63 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/map" 2 3
# 20 "lte_elf.h" 2







const lte_uint32_t ELF_MAX_PHDR_SIZE = 0x10000;
const lte_uint32_t ELF_PAGE_SIZE = 0x1000;

extern unsigned char ELF_ST_INFO(Elf_Class_t e_class, int bind, int type);
extern unsigned char ELF_ST_BIND(Elf_Class_t e_class, int val);
extern unsigned char ELF_ST_TYPE(Elf_Class_t e_class, int val);

class elf_data_t {
   public:
      Elf64_Xword offs;
      Elf64_Xword flags;
      elf_data_t* next;
      elf_data_t* head;
   public:
      elf_data_t() : offs(0), flags(0), next(__null), head(this) {}

      virtual ~elf_data_t() {}

      virtual const Elf_Byte_t* get_data() const = 0;
      virtual Elf64_Xword get_size() const = 0;
      Elf64_Xword get_offs() const { return offs; }
      elf_data_t* get_last();
};

class elf_memdata_t : public elf_data_t {
public:
    const Elf_Byte_t* data;
    Elf64_Xword size;
public:
    elf_memdata_t() : data(__null), size(0) {}

    const Elf_Byte_t* get_data() const { return data; }
    Elf64_Xword get_size() const { return size; }
};

class elf_mempage_t : public elf_data_t {
   public:
      Elf_Byte_t data[4096];

      const Elf_Byte_t* get_data() const { return data; }
      Elf64_Xword get_size() const { return sizeof(data); }
};

class elf_t {
   public:
      class strtab : public elf_data_t, public elf_strtab_t {
         public:
            strtab(){}
            const Elf_Byte_t* get_data() const { return (const Elf_Byte_t*)table_ptr(); }
            Elf64_Xword get_size() const { return table_size(); }
      };

      class section {
         protected:
            friend class elf_t;
            template<class T1, class T2> static void set_item(T1& dst, const T2& src) { dst = (T1)src; }
         protected:
            elf_t* m_elf;
            Elf64_Section m_sh_index;
            elf_memdata_t m_data;
         public:
            section(elf_t* elf, Elf64_Section index);
            virtual ~section(){}

            Elf64_Section get_index() const
            {
               return m_sh_index;
            }
            const char* get_name() const
            {
               (((m_elf != __null)==0)?lte_assert("m_elf != NULL", 0, "lte_elf.h", 97),((void)(0)):((void)(0)));
               return m_elf->shstrtab()[0] + get_sh_name();
            }
            const elf_data_t* get_data() const { return &m_data; }
            elf_data_t* get_data() { return &m_data; }
            void set_data(elf_data_t* data);
            void set_data(const Elf_Byte_t* data, Elf64_Xword size);

            virtual const void* get_shdr() const = 0;
            virtual Elf64_Half get_shdr_size() const = 0;

            virtual Elf64_Word get_sh_name() const = 0;
            virtual void set_sh_name(Elf64_Word name) = 0;
            virtual Elf64_Word get_sh_type() const = 0;
            virtual void set_sh_type(Elf64_Word type) = 0;
            virtual Elf64_Xword get_sh_flags() const = 0;
            virtual void set_sh_flags(Elf64_Xword flags) = 0;
            virtual Elf64_Addr get_sh_addr() const = 0;
            virtual void set_sh_addr(Elf64_Addr addr) = 0;
            virtual Elf64_Off get_sh_offset() const = 0;
            virtual void set_sh_offset(Elf64_Off offset) = 0;
            virtual Elf64_Xword get_sh_size() const = 0;
            virtual void set_sh_size(Elf64_Xword size) = 0;
            virtual Elf64_Word get_sh_link() const = 0;
            virtual void set_sh_link(Elf64_Word link) = 0;
            virtual Elf64_Word get_sh_info() const = 0;
            virtual void set_sh_info(Elf64_Word info) = 0;
            virtual Elf64_Xword get_sh_addralign() const = 0;
            virtual void set_sh_addralign(Elf64_Xword addralign) = 0;
            virtual Elf64_Xword get_sh_entsize() const = 0;
            virtual void set_sh_entsize(Elf64_Xword entsize) = 0;

            Elf64_Xword set_sh_size();
      };

      class datatab : public elf_data_t {
         public:
            typedef lte_uint32_t index_type;
         protected:
            std::vector<Elf_Byte_t> m_table;
            lte_size_t m_entry_size;
            index_type m_entries_num;

         protected:
            template<class T1, class T2> static void set_item(T1& dst, const T2& src) { dst = (T1)src; }

            lte_size_t get_entry_offs(index_type ndx) const { return (ndx * m_entry_size); }
            Elf_Byte_t* get_entry(index_type ndx)
            {
               (((get_entry_offs(ndx) < m_table.size())==0)?lte_assert("get_entry_offs(ndx) < m_table.size()", 0, "lte_elf.h", 146),((void)(0)):((void)(0)));
               return &m_table[get_entry_offs(ndx)];
            }
            const Elf_Byte_t* get_entry(index_type ndx) const
            {
               (((get_entry_offs(ndx) < m_table.size())==0)?lte_assert("get_entry_offs(ndx) < m_table.size()", 0, "lte_elf.h", 151),((void)(0)):((void)(0)));
               return &m_table[get_entry_offs(ndx)];
            }

         public:
            datatab(lte_size_t entry_size) : m_entry_size(entry_size), m_entries_num(0) {}

            const Elf_Byte_t* get_data() const
            {
               (((m_table.size())==0)?lte_assert("m_table.size()", 0, "lte_elf.h", 160),((void)(0)):((void)(0)));
               return &m_table[0];
            }
            Elf64_Xword get_size() const { return m_table.size(); }
            index_type get_entries_num() const { return m_entries_num; }
            lte_size_t get_entry_size() const { return m_entry_size; }
      };

      class symtab : public datatab {
         public:
            symtab(lte_size_t symbol_size) : datatab(symbol_size) {}

            virtual index_type get_last_of_bind(unsigned char bind) const = 0;
            virtual Elf64_Word get_st_name(index_type ndx) const = 0;
            virtual void set_st_name(index_type ndx, Elf64_Word name) = 0;
            virtual Elf64_Addr get_st_value(index_type ndx) const = 0;
            virtual void set_st_value(index_type ndx, Elf64_Addr value) = 0;
            virtual Elf64_Xword get_st_size(index_type ndx) const = 0;
            virtual void set_st_size(index_type ndx, Elf64_Xword size) = 0;
            virtual unsigned char get_st_info(index_type ndx) const = 0;
            virtual void set_st_info(index_type ndx, unsigned char info) = 0;
            virtual unsigned char get_st_other(index_type ndx) const = 0;
            virtual void set_st_other(index_type ndx, unsigned char other) = 0;
            virtual Elf64_Section get_st_shndx(index_type ndx) const = 0;
            virtual void set_st_shndx(index_type ndx, Elf64_Section shndx) = 0;
            virtual void set(index_type ndx, Elf64_Word name, Elf64_Addr value, Elf64_Xword size, unsigned char info, unsigned char other, Elf64_Section shndx) = 0;

            void push_back(Elf64_Word name, Elf64_Addr value, Elf64_Xword size, unsigned char info, unsigned char other, Elf64_Section shndx)
            {
               index_type ndx = m_entries_num;
               resize(ndx);
               set(ndx, name, value, size, info, other, shndx);
            }

            void resize(index_type symbols_num)
            {
               index_type entries_num = m_entries_num;
               m_table.resize(get_entry_offs(m_entries_num = symbols_num + 1));

               if(!entries_num)
                  set(0, 0, 0, 0, 0, 0, 0);
            }
      };

      class phdrstab : public datatab {
         public:
            phdrstab(lte_size_t phdr_size) : datatab(phdr_size) {}

            void resize(index_type phdrs_num)
            {
               m_table.resize(get_entry_offs(m_entries_num = phdrs_num));
            }

            virtual Elf64_Word get_p_type(index_type ndx) const = 0;
            virtual void set_p_type(index_type ndx, Elf64_Word type) = 0;
            virtual Elf64_Word get_p_flags(index_type ndx) const = 0;
            virtual void set_p_flags(index_type ndx, Elf64_Word flags) = 0;
            virtual Elf64_Off get_p_offset(index_type ndx) const = 0;
            virtual void set_p_offset(index_type ndx, Elf64_Off offset) = 0;
            virtual Elf64_Addr get_p_vaddr(index_type ndx) const = 0;
            virtual void set_p_vaddr(index_type ndx, Elf64_Addr vaddr) = 0;
            virtual Elf64_Addr get_p_paddr(index_type ndx) const = 0;
            virtual void set_p_paddr(index_type ndx, Elf64_Addr paddr) = 0;
            virtual Elf64_Xword get_p_filesz(index_type ndx) const = 0;
            virtual void set_p_filesz(index_type ndx, Elf64_Xword filesz) = 0;
            virtual Elf64_Xword get_p_memsz(index_type ndx) const = 0;
            virtual void set_p_memsz(index_type ndx, Elf64_Xword memsz) = 0;
            virtual Elf64_Xword get_p_align(index_type ndx) const = 0;
            virtual void set_p_align(index_type ndx, Elf64_Xword align) = 0;
      };

      class relatab : public datatab {
         public:
            relatab(lte_size_t rela_size) : datatab(rela_size) {}

            void resize(index_type rela_num)
            {
               m_table.resize(get_entry_offs(m_entries_num = rela_num));
            }

            virtual Elf64_Addr get_r_offset(index_type ndx) const = 0;
            virtual void set_r_offset(index_type ndx, Elf64_Addr offset) = 0;
            virtual Elf64_Xword get_r_info(index_type ndx) const = 0;
            virtual void set_r_info(index_type ndx, Elf32_Word sym, Elf32_Word type) = 0;
            virtual Elf64_Sxword get_r_addend(index_type ndx) const = 0;
            virtual void set_r_addend(index_type ndx, Elf64_Sxword addend) = 0;

            void push_back(Elf64_Addr offset, Elf32_Word sym, Elf32_Word type, Elf64_Sxword addend)
            {
               index_type index = m_entries_num;
               resize(index + 1);
               set_r_offset(index, offset);
               set_r_info(index, sym, type);
               set_r_addend(index, addend);
            }
      };

   protected:
      std::map<std::string, section*> m_sections_map;
      std::vector<section*> m_sections;
      std::vector<char*> m_sections_data;
      strtab m_shstrtab;
      lte_size_t m_ehdr_size;
      lte_size_t m_max_phnum;;

   public:
      typedef std::vector<section*>::iterator section_iterator;

   protected:
      template<class T1, class T2> static void set_item(T1& dst, const T2& src) { dst = (T1)src; }

      virtual section* create_section(Elf64_Section index, Elf64_Word name, Elf64_Word type, Elf64_Word flags) = 0;
      virtual void create_pheaders(lte_uint_t phdrs_num) = 0;

      void create_null_section();
      void create_shstrtab();

      Elf64_Off do_layout(int* pfd);

      virtual const void* get_ehdr() const = 0;
      virtual phdrstab& get_phdrs() = 0;
      virtual const phdrstab& get_phdrs() const = 0;

      virtual void set_e_phoff(Elf64_Off phoff) = 0;
      virtual void set_e_shoff(Elf64_Off shoff) = 0;
      virtual void set_e_shnum(Elf64_Half shnum) = 0;
      virtual void set_e_shstrndx(Elf64_Half shstrndx) = 0;

   public:
      elf_t();
      virtual ~elf_t();

      static elf_t* create(Elf_Class_t elf_class = 1, Elf64_Half elf_type = 1);
      static elf_t* create(const char* fname, bool only_headers = false);
      virtual symtab* create_symtab() = 0;
      virtual relatab* create_relatab() = 0;

      section_iterator section_begin() { return m_sections.begin(); }
      section_iterator section_end() { return m_sections.end(); }

      void clear(bool no_null_section = false);
      Elf64_Off layout();
      Elf64_Off write(int fd);
      Elf64_Off write(const char* fname);
      virtual Elf64_Off read(int fd) = 0;
      virtual bool read_headers(int fd) = 0;

      section* create_section(const char* name, Elf64_Word type, Elf64_Word flags = 0);
      section* get_section(const char* name);
      section* get_section(Elf64_Addr addr, Elf64_Xword flag);
      section* get_section(Elf64_Section index) { return m_sections[index-1]; }

      const strtab& shstrtab() const { return m_shstrtab; }
      lte_size_t get_ehdr_size() const { return m_ehdr_size; }
      Elf64_Half get_max_phnum() const { return m_max_phnum; }

      virtual const unsigned char* get_e_ident() const = 0;
      virtual Elf64_Half get_e_type() const = 0;
      virtual void set_e_type(Elf64_Half type) = 0;
      virtual Elf64_Half get_e_machine() const = 0;
      virtual void set_e_machine(Elf64_Half machine) = 0;
      virtual Elf64_Word get_e_version() const = 0;
      virtual void set_e_version(Elf64_Word version) = 0;
      virtual Elf64_Addr get_e_entry() const = 0;
      virtual void set_e_entry(Elf64_Addr entry) = 0;
      virtual Elf64_Off get_e_phoff() const = 0;
      virtual Elf64_Off get_e_shoff() const = 0;
      virtual Elf64_Word get_e_flags() const = 0;
      virtual void set_e_flags(Elf64_Word flags) = 0;
      virtual Elf64_Half get_e_ehsize() const = 0;
      virtual Elf64_Half get_e_phentsize() const = 0;
      virtual Elf64_Half get_e_phnum() const = 0;
      virtual Elf64_Half get_e_shentsize() const = 0;
      virtual Elf64_Half get_e_shnum() const = 0;
      virtual Elf64_Half get_e_shstrndx() const = 0;

      unsigned char get_e_class() const { return get_e_ident()[4]; }
};

class elf64_t : public elf_t {
   public:
      class section64 : public section {
         protected:
            Elf64_Shdr m_shdr;
         protected:
            const void* get_shdr() const { return &m_shdr; }
            Elf64_Half get_shdr_size() const { return sizeof(m_shdr); }
         public:
            section64(elf_t* elf, Elf64_Section index, Elf64_Word name, Elf64_Word type = 0, Elf64_Word flags = 0);


            Elf64_Word get_sh_name() const { return m_shdr.sh_name; }
            void set_sh_name(Elf64_Word name) { set_item(m_shdr.sh_name, name); }
            Elf64_Word get_sh_type() const { return m_shdr.sh_type; }
            void set_sh_type(Elf64_Word type) { set_item(m_shdr.sh_type, type); }
            Elf64_Xword get_sh_flags() const { return m_shdr.sh_flags; }
            void set_sh_flags(Elf64_Xword flags) { set_item(m_shdr.sh_flags, flags); }
            Elf64_Addr get_sh_addr() const { return m_shdr.sh_addr; }
            void set_sh_addr(Elf64_Addr addr) { set_item(m_shdr.sh_addr, addr); }
            Elf64_Off get_sh_offset() const { return m_shdr.sh_offset; }
            void set_sh_offset(Elf64_Off offset) { set_item(m_shdr.sh_offset, offset); }
            Elf64_Xword get_sh_size() const { return m_shdr.sh_size; }
            void set_sh_size(Elf64_Xword size) { set_item(m_shdr.sh_size, size); }
            Elf64_Word get_sh_link() const { return m_shdr.sh_link; }
            void set_sh_link(Elf64_Word link) { set_item(m_shdr.sh_link, link); }
            Elf64_Word get_sh_info() const { return m_shdr.sh_info; }
            void set_sh_info(Elf64_Word info) { set_item(m_shdr.sh_info, info); }
            Elf64_Xword get_sh_addralign() const { return m_shdr.sh_addralign; }
            void set_sh_addralign(Elf64_Xword addralign) { set_item(m_shdr.sh_addralign, addralign); }
            Elf64_Xword get_sh_entsize() const { return m_shdr.sh_entsize; }
            void set_sh_entsize(Elf64_Xword entsize) { set_item(m_shdr.sh_entsize, entsize); }
      };

      class symtab64 : public symtab {
         public:
            symtab64(index_type symbols_num = 0) : symtab(sizeof(Elf64_Sym)) { resize(symbols_num); }

            Elf64_Sym* get(index_type ndx) { return reinterpret_cast<Elf64_Sym*>(get_entry(ndx)); }
            const Elf64_Sym* get(index_type ndx) const { return reinterpret_cast<const Elf64_Sym*>(get_entry(ndx)); }

            index_type get_last_of_bind(unsigned char bind) const;
            Elf64_Word get_st_name(index_type ndx) const { return get(ndx)->st_name; }
            void set_st_name(index_type ndx, Elf64_Word name) { set_item(get(ndx)->st_name, name); }
            Elf64_Addr get_st_value(index_type ndx) const { return get(ndx)->st_value; }
            void set_st_value(index_type ndx, Elf64_Addr value) { set_item(get(ndx)->st_value, value); }
            Elf64_Xword get_st_size(index_type ndx) const { return get(ndx)->st_size; }
            void set_st_size(index_type ndx, Elf64_Xword size) { set_item(get(ndx)->st_size, size); }
            unsigned char get_st_info(index_type ndx) const { return get(ndx)->st_info; }
            void set_st_info(index_type ndx, unsigned char info) { set_item(get(ndx)->st_info, info); }
            unsigned char get_st_other(index_type ndx) const { return get(ndx)->st_other; }
            void set_st_other(index_type ndx, unsigned char other) { set_item(get(ndx)->st_other, other); }
            Elf64_Section get_st_shndx(index_type ndx) const { return get(ndx)->st_shndx; }
            void set_st_shndx(index_type ndx, Elf64_Section shndx) { set_item(get(ndx)->st_shndx, shndx); }

            void set(index_type ndx, Elf64_Word name, Elf64_Addr value, Elf64_Xword size, unsigned char info, unsigned char other, Elf64_Section shndx)
            {
               Elf64_Sym* sym = get(ndx);
               set_item(sym->st_name, name);
               set_item(sym->st_info, info);
               set_item(sym->st_other, other);
               set_item(sym->st_shndx, shndx);
               set_item(sym->st_value, value);
               set_item(sym->st_size, size);
            }
      };

      class phdrstab64 : public phdrstab {
         public:
            phdrstab64(lte_uint_t phdrs_num = 0) : phdrstab(sizeof(Elf64_Phdr)) { resize(phdrs_num); }

            Elf64_Phdr* get(index_type ndx) { return reinterpret_cast<Elf64_Phdr*>(get_entry(ndx)); }
            const Elf64_Phdr* get(index_type ndx) const { return reinterpret_cast<const Elf64_Phdr*>(get_entry(ndx)); }

            Elf64_Word get_p_type(index_type ndx) const { return get(ndx)->p_type; }
            void set_p_type(index_type ndx, Elf64_Word type) { set_item(get(ndx)->p_type, type); }
            Elf64_Word get_p_flags(index_type ndx) const { return get(ndx)->p_flags; }
            void set_p_flags(index_type ndx, Elf64_Word flags) { set_item(get(ndx)->p_flags, flags); }
            Elf64_Off get_p_offset(index_type ndx) const { return get(ndx)->p_offset; }
            void set_p_offset(index_type ndx, Elf64_Off offset) { set_item(get(ndx)->p_offset, offset); }
            Elf64_Addr get_p_vaddr(index_type ndx) const { return get(ndx)->p_vaddr; }
            void set_p_vaddr(index_type ndx, Elf64_Addr vaddr) { set_item(get(ndx)->p_vaddr, vaddr); }
            Elf64_Addr get_p_paddr(index_type ndx) const { return get(ndx)->p_paddr; }
            void set_p_paddr(index_type ndx, Elf64_Addr paddr) { set_item(get(ndx)->p_paddr, paddr); }
            Elf64_Xword get_p_filesz(index_type ndx) const { return get(ndx)->p_filesz; }
            void set_p_filesz(index_type ndx, Elf64_Xword filesz) { set_item(get(ndx)->p_filesz, filesz); }
            Elf64_Xword get_p_memsz(index_type ndx) const { return get(ndx)->p_memsz; }
            void set_p_memsz(index_type ndx, Elf64_Xword memsz) { set_item(get(ndx)->p_memsz, memsz); }
            Elf64_Xword get_p_align(index_type ndx) const { return get(ndx)->p_align; }
            void set_p_align(index_type ndx, Elf64_Xword align) { set_item(get(ndx)->p_align, align); }
      };

      class relatab64 : public relatab {
         public:
            relatab64(lte_uint_t rela_num = 0) : relatab(sizeof(Elf64_Rela)) { resize(rela_num); }

            Elf64_Rela* get(index_type ndx) { return reinterpret_cast<Elf64_Rela*>(get_entry(ndx)); }
            const Elf64_Rela* get(index_type ndx) const { return reinterpret_cast<const Elf64_Rela*>(get_entry(ndx)); }

            Elf64_Addr get_r_offset(index_type ndx) const { return get(ndx)->r_offset; }
            void set_r_offset(index_type ndx, Elf64_Addr offset) { set_item(get(ndx)->r_offset, offset); }
            Elf64_Xword get_r_info(index_type ndx) const { return get(ndx)->r_info; }
            void set_r_info(index_type ndx, Elf32_Word sym, Elf32_Word type) { set_item(get(ndx)->r_info, ((((Elf64_Xword) (sym)) << 32) + (type))); }
            Elf64_Sxword get_r_addend(index_type ndx) const { return get(ndx)->r_addend; }
            void set_r_addend(index_type ndx, Elf64_Sxword addend) { set_item(get(ndx)->r_addend, addend); }
      };

   protected:
      Elf64_Ehdr m_ehdr;
      phdrstab64 m_phdr;

   protected:
      section* create_section(Elf64_Section index, Elf64_Word name, Elf64_Word type, Elf64_Word flags)
      {
         return new section64(this, index, name, type, flags);
      }
      void create_pheaders(lte_uint_t phdrs_num);

      const void* get_ehdr() const { return &m_ehdr; }
      phdrstab& get_phdrs() { return m_phdr; }
      const phdrstab& get_phdrs() const { return m_phdr; }

      void set_e_phoff(Elf64_Off phoff) { set_item(m_ehdr.e_phoff, phoff); }
      void set_e_shoff(Elf64_Off shoff) { set_item(m_ehdr.e_shoff, shoff); }
      void set_e_shnum(Elf64_Half shnum) { set_item(m_ehdr.e_shnum, shnum); }
      void set_e_shstrndx(Elf64_Half shstrndx) { set_item(m_ehdr.e_shstrndx, shstrndx); }

   public:
      elf64_t(Elf64_Half e_type = 1);

      symtab* create_symtab() { return new symtab64(); }
      relatab* create_relatab() { return new relatab64(); }

      Elf64_Off read(int fd);
      bool read_headers(int fd);

      const unsigned char* get_e_ident() const { return m_ehdr.e_ident; }
      Elf64_Half get_e_type() const { return m_ehdr.e_type; }
      void set_e_type(Elf64_Half type) { set_item(m_ehdr.e_type, type); }
      Elf64_Half get_e_machine() const { return m_ehdr.e_machine; }
      void set_e_machine(Elf64_Half machine) { set_item(m_ehdr.e_machine, machine); }
      Elf64_Word get_e_version() const { return m_ehdr.e_version; }
      void set_e_version(Elf64_Word version) { set_item(m_ehdr.e_version, version); }
      Elf64_Addr get_e_entry() const { return m_ehdr.e_entry; }
      void set_e_entry(Elf64_Addr entry) { set_item(m_ehdr.e_entry, entry); }
      Elf64_Off get_e_phoff() const { return m_ehdr.e_phoff; }
      Elf64_Off get_e_shoff() const { return m_ehdr.e_shoff; }
      Elf64_Word get_e_flags() const { return m_ehdr.e_flags; }
      void set_e_flags(Elf64_Word flags) { set_item(m_ehdr.e_flags, flags); }
      Elf64_Half get_e_ehsize() const { return m_ehdr.e_ehsize; }
      Elf64_Half get_e_phentsize() const { return m_ehdr.e_phentsize; }
      Elf64_Half get_e_phnum() const { return m_ehdr.e_phnum; }
      Elf64_Half get_e_shentsize() const { return m_ehdr.e_shentsize; }
      Elf64_Half get_e_shnum() const { return m_ehdr.e_shnum; }
      Elf64_Half get_e_shstrndx() const { return m_ehdr.e_shstrndx; }

};

class elf32_t : public elf_t {
   public:
      class section32 : public section {
         protected:
            Elf32_Shdr m_shdr;
         protected:
            const void* get_shdr() const { return &m_shdr; }
            Elf64_Half get_shdr_size() const { return sizeof(m_shdr); }
         public:
            section32(elf_t* elf, Elf64_Section index, Elf64_Word name, Elf64_Word type = 0, Elf64_Word flags = 0);

            Elf64_Word get_sh_name() const { return m_shdr.sh_name; }
            void set_sh_name(Elf64_Word name) { set_item(m_shdr.sh_name, name); }
            Elf64_Word get_sh_type() const { return m_shdr.sh_type; }
            void set_sh_type(Elf64_Word type) { set_item(m_shdr.sh_type, type); }
            Elf64_Xword get_sh_flags() const { return m_shdr.sh_flags; }
            void set_sh_flags(Elf64_Xword flags) { set_item(m_shdr.sh_flags, flags); }
            Elf64_Addr get_sh_addr() const { return m_shdr.sh_addr; }
            void set_sh_addr(Elf64_Addr addr) { set_item(m_shdr.sh_addr, addr); }
            Elf64_Off get_sh_offset() const { return m_shdr.sh_offset; }
            void set_sh_offset(Elf64_Off offset) { set_item(m_shdr.sh_offset, offset); }
            Elf64_Xword get_sh_size() const { return m_shdr.sh_size; }
            void set_sh_size(Elf64_Xword size) { set_item(m_shdr.sh_size, size); }
            Elf64_Word get_sh_link() const { return m_shdr.sh_link; }
            void set_sh_link(Elf64_Word link) { set_item(m_shdr.sh_link, link); }
            Elf64_Word get_sh_info() const { return m_shdr.sh_info; }
            void set_sh_info(Elf64_Word info) { set_item(m_shdr.sh_info, info); }
            Elf64_Xword get_sh_addralign() const { return m_shdr.sh_addralign; }
            void set_sh_addralign(Elf64_Xword addralign) { set_item(m_shdr.sh_addralign, addralign); }
            Elf64_Xword get_sh_entsize() const { return m_shdr.sh_entsize; }
            void set_sh_entsize(Elf64_Xword entsize) { set_item(m_shdr.sh_entsize, entsize); }
      };

      class symtab32 : public symtab {
         public:
            symtab32(index_type symbols_num = 0) : symtab(sizeof(Elf32_Sym)) { resize(symbols_num); }

            Elf32_Sym* get(index_type ndx) { return reinterpret_cast<Elf32_Sym*>(get_entry(ndx)); }
            const Elf32_Sym* get(index_type ndx) const { return reinterpret_cast<const Elf32_Sym*>(get_entry(ndx)); }

            index_type get_last_of_bind(unsigned char bind) const;
            Elf64_Word get_st_name(index_type ndx) const { return get(ndx)->st_name; }
            void set_st_name(index_type ndx, Elf64_Word name) { set_item(get(ndx)->st_name, name); }
            Elf64_Addr get_st_value(index_type ndx) const { return get(ndx)->st_value; }
            void set_st_value(index_type ndx, Elf64_Addr value) { set_item(get(ndx)->st_value, value); }
            Elf64_Xword get_st_size(index_type ndx) const { return get(ndx)->st_size; }
            void set_st_size(index_type ndx, Elf64_Xword size) { set_item(get(ndx)->st_size, size); }
            unsigned char get_st_info(index_type ndx) const { return get(ndx)->st_info; }
            void set_st_info(index_type ndx, unsigned char info) { set_item(get(ndx)->st_info, info); }
            unsigned char get_st_other(index_type ndx) const { return get(ndx)->st_other; }
            void set_st_other(index_type ndx, unsigned char other) { set_item(get(ndx)->st_other, other); }
            Elf64_Section get_st_shndx(index_type ndx) const { return get(ndx)->st_shndx; }
            void set_st_shndx(index_type ndx, Elf64_Section shndx) { set_item(get(ndx)->st_shndx, shndx); }

            void set(index_type ndx, Elf64_Word name, Elf64_Addr value, Elf64_Xword size, unsigned char info, unsigned char other, Elf64_Section shndx)
            {
               Elf32_Sym* sym = get(ndx);
               set_item(sym->st_name, name);
               set_item(sym->st_info, info);
               set_item(sym->st_other, other);
               set_item(sym->st_shndx, shndx);
               set_item(sym->st_value, value);
               set_item(sym->st_size, size);
            }
      };

      class phdrstab32 : public phdrstab {
         public:
            phdrstab32(lte_uint_t phdrs_num = 0) : phdrstab(sizeof(Elf32_Phdr)) { resize(phdrs_num); }

            Elf32_Phdr* get(index_type ndx) { return reinterpret_cast<Elf32_Phdr*>(get_entry(ndx)); }
            const Elf32_Phdr* get(index_type ndx) const { return reinterpret_cast<const Elf32_Phdr*>(get_entry(ndx)); }

            Elf64_Word get_p_type(index_type ndx) const { return get(ndx)->p_type; }
            void set_p_type(index_type ndx, Elf64_Word type) { set_item(get(ndx)->p_type, type); }
            Elf64_Word get_p_flags(index_type ndx) const { return get(ndx)->p_flags; }
            void set_p_flags(index_type ndx, Elf64_Word flags) { set_item(get(ndx)->p_flags, flags); }
            Elf64_Off get_p_offset(index_type ndx) const { return get(ndx)->p_offset; }
            void set_p_offset(index_type ndx, Elf64_Off offset) { set_item(get(ndx)->p_offset, offset); }
            Elf64_Addr get_p_vaddr(index_type ndx) const { return get(ndx)->p_vaddr; }
            void set_p_vaddr(index_type ndx, Elf64_Addr vaddr) { set_item(get(ndx)->p_vaddr, vaddr); }
            Elf64_Addr get_p_paddr(index_type ndx) const { return get(ndx)->p_paddr; }
            void set_p_paddr(index_type ndx, Elf64_Addr paddr) { set_item(get(ndx)->p_paddr, paddr); }
            Elf64_Xword get_p_filesz(index_type ndx) const { return get(ndx)->p_filesz; }
            void set_p_filesz(index_type ndx, Elf64_Xword filesz) { set_item(get(ndx)->p_filesz, filesz); }
            Elf64_Xword get_p_memsz(index_type ndx) const { return get(ndx)->p_memsz; }
            void set_p_memsz(index_type ndx, Elf64_Xword memsz) { set_item(get(ndx)->p_memsz, memsz); }
            Elf64_Xword get_p_align(index_type ndx) const { return get(ndx)->p_align; }
            void set_p_align(index_type ndx, Elf64_Xword align) { set_item(get(ndx)->p_align, align); }
      };

      class relatab32 : public relatab {
         public:
            relatab32(lte_uint_t rela_num = 0) : relatab(sizeof(Elf32_Rela)) { resize(rela_num); }

            Elf32_Rela* get(index_type ndx) { return reinterpret_cast<Elf32_Rela*>(get_entry(ndx)); }
            const Elf32_Rela* get(index_type ndx) const { return reinterpret_cast<const Elf32_Rela*>(get_entry(ndx)); }

            Elf64_Addr get_r_offset(index_type ndx) const { return get(ndx)->r_offset; }
            void set_r_offset(index_type ndx, Elf64_Addr offset) { set_item(get(ndx)->r_offset, offset); }
            Elf64_Xword get_r_info(index_type ndx) const { return get(ndx)->r_info; }
            void set_r_info(index_type ndx, Elf32_Word sym, Elf32_Word type) { set_item(get(ndx)->r_info, (((sym) << 8) + ((type) & 0xff))); }
            Elf64_Sxword get_r_addend(index_type ndx) const { return get(ndx)->r_addend; }
            void set_r_addend(index_type ndx, Elf64_Sxword addend) { set_item(get(ndx)->r_addend, addend); }
      };

   protected:
      Elf32_Ehdr m_ehdr;
      phdrstab32 m_phdr;

   protected:
      section* create_section(Elf64_Section index, Elf64_Word name, Elf64_Word type, Elf64_Word flags)
      {
         return new section32(this, index, name, type, flags);
      }
      void create_pheaders(lte_uint_t phdrs_num);

      const void* get_ehdr() const { return &m_ehdr; }
      phdrstab& get_phdrs() { return m_phdr; }
      const phdrstab& get_phdrs() const { return m_phdr; }

      void set_e_phoff(Elf64_Off phoff) { set_item(m_ehdr.e_phoff, phoff); }
      void set_e_shoff(Elf64_Off shoff) { set_item(m_ehdr.e_shoff, shoff); }
      void set_e_shnum(Elf64_Half shnum) { set_item(m_ehdr.e_shnum, shnum); }
      void set_e_shstrndx(Elf64_Half shstrndx) { set_item(m_ehdr.e_shstrndx, shstrndx); }

   public:
      elf32_t(Elf64_Half e_type = 1);

      symtab* create_symtab() { return new symtab32(); }
      relatab* create_relatab() { return new relatab32(); }

      Elf64_Off read(int fd);
      bool read_headers(int fd);

      const unsigned char* get_e_ident() const { return m_ehdr.e_ident; }
      Elf64_Half get_e_type() const { return m_ehdr.e_type; }
      void set_e_type(Elf64_Half type) { set_item(m_ehdr.e_type, type); }
      Elf64_Half get_e_machine() const { return m_ehdr.e_machine; }
      void set_e_machine(Elf64_Half machine) { set_item(m_ehdr.e_machine, machine); }
      Elf64_Word get_e_version() const { return m_ehdr.e_version; }
      void set_e_version(Elf64_Word version) { set_item(m_ehdr.e_version, version); }
      Elf64_Addr get_e_entry() const { return m_ehdr.e_entry; }
      void set_e_entry(Elf64_Addr entry) { set_item(m_ehdr.e_entry, entry); }
      Elf64_Off get_e_phoff() const { return m_ehdr.e_phoff; }
      Elf64_Off get_e_shoff() const { return m_ehdr.e_shoff; }
      Elf64_Word get_e_flags() const { return m_ehdr.e_flags; }
      void set_e_flags(Elf64_Word flags) { set_item(m_ehdr.e_flags, flags); }
      Elf64_Half get_e_ehsize() const { return m_ehdr.e_ehsize; }
      Elf64_Half get_e_phentsize() const { return m_ehdr.e_phentsize; }
      Elf64_Half get_e_phnum() const { return m_ehdr.e_phnum; }
      Elf64_Half get_e_shentsize() const { return m_ehdr.e_shentsize; }
      Elf64_Half get_e_shnum() const { return m_ehdr.e_shnum; }
      Elf64_Half get_e_shstrndx() const { return m_ehdr.e_shstrndx; }

};
# 17 "lte_config.h" 2


enum roi_type_t {
   ROI_TYPE_SNIPER,
   ROI_TYPE_SSC,
   ROI_TYPE_SIMICS,
   ROI_TYPE_SIZE,
};

class config_t {
   private:
      const char* m_executable;
      const char* m_mem_image_file;
      const char* m_mem_layout_file;
      const char* m_ld_script_file;
      const char* m_arch_desc_file;
      const char* m_arch_state_file;
      const char* m_exe_file;
      const char* m_obj_file;
      const char* m_arch_state_out_file;
      std::string m_default_exe_file;
      Elf32_Word m_dseg_flags;
      Elf32_Word m_tseg_flags;
      lte_uint64_t m_thread_min_icount;
      lte_addr_t m_remap_limit;
      lte_addr_t m_user_space_limit;
      lte_uint32_t m_cbk_stack_size;
      bool m_user_space_limit_set;
      bool m_no_modify_ldt;
      bool m_no_modify_ldt_set;
      bool m_no_stack_remap;
      bool m_no_startup;
      bool m_no_futexes;
      bool m_no_monitor_thread;
      bool m_verbose;
      const char* m_pstart_cbk;
      const char* m_pexit_cbk;
      const char* m_tstart_cbk;
      lte_uint32_t m_roi_start_tag[ROI_TYPE_SIZE];
      lte_uint32_t m_roi_start_mask;
      lte_uint32_t m_roi_thread_id;
      lte_uint32_t m_magic2_tag[ROI_TYPE_SIZE];
      lte_uint32_t m_magic2_mask;
      std::vector<const char*> m_nonopt_vec;
      char const* const* m_nonopt_argv;
      int m_nonopt_argc;

   public:
      config_t();

      config_t(int argc, char* argv[])
      {
         init(argc, argv);
      }

      void init(int argc, char* argv[]);

      void usage(const char* exe_name) const;

      void help_msg(const char* exe_name) const;

      const char* get_mem_image_file_name() const
      {
         return m_mem_image_file;
      }
      const char* get_mem_layout_file_name() const
      {
         return m_mem_layout_file;
      }
      const char* get_arch_state_file_name() const
      {
         return m_arch_state_file;
      }
      const char* get_arch_desc_file_name() const
      {
         return m_arch_desc_file;
      }
      const char* get_arch_state_out_file_name() const
      {
         return m_arch_state_out_file;
      }
      const char* get_ld_script_file_name() const
      {
         return m_ld_script_file;
      }
      const char* get_exe_file_name() const
      {
         return m_exe_file;
      }
      const char* get_obj_file_name() const
      {
         return m_obj_file;
      }
      char const* const* get_nonopt_argv() const
      {
         return m_nonopt_argv;
      }
      int get_nonopt_argc() const
      {
         return m_nonopt_argc;
      }
      const char* get_process_cbk_name() const
      {
         return m_pstart_cbk;
      }
      const char* get_process_exit_cbk_name() const
      {
         return m_pexit_cbk;
      }
      const char* get_thread_cbk_name() const
      {
         return m_tstart_cbk;
      }
      lte_uint64_t get_thread_min_icount() const
      {
         return m_thread_min_icount;
      }
      lte_addr_t get_remap_limit() const
      {
         return m_remap_limit;
      }
      lte_uint32_t get_cbk_stack_size() const
      {
         return m_cbk_stack_size;
      }
      Elf32_Word get_data_seg_flags() const
      {
         return m_dseg_flags;
      }
      Elf32_Word get_text_seg_flags() const
      {
         return m_tseg_flags;
      }
      bool no_startup_code() const
      {
         return m_no_startup;
      }
      bool no_stack_remap() const
      {
         return m_no_stack_remap;
      }
      bool no_futexes() const
      {
         return m_no_futexes;
      }
      bool no_monitor_thread() const
      {
         return m_no_monitor_thread;
      }
      bool is_verbose() const
      {
         return m_verbose;
      }
      lte_uint32_t get_roi_start_tag(roi_type_t type) const
      {
         return m_roi_start_tag[type];
      }
      lte_uint32_t get_magic2_tag(roi_type_t type) const
      {
         return m_magic2_tag[type];
      }
      lte_uint32_t get_roi_thread_id() const
      {
         return m_roi_thread_id;
      }
      bool no_modify_ldt(unsigned char arch_mode) const;

      lte_addr_t get_user_space_limit(unsigned char arch_mode) const;
};

inline config_t& get_config()
{
   static config_t cfg;
   return cfg;
}
# 5 "lte_entry_point.cpp" 2

# 1 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/iostream" 1 3
# 36 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/iostream" 3
       
# 37 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/iostream" 3





namespace std __attribute__ ((__visibility__ ("default")))
{

# 60 "/nfs/hd/itools/em64t_SLES11/pkgs/gcc/4.9.2/include/c++/4.9.2/iostream" 3
  extern istream cin;
  extern ostream cout;
  extern ostream cerr;
  extern ostream clog;


  extern wistream wcin;
  extern wostream wcout;
  extern wostream wcerr;
  extern wostream wclog;




  static ios_base::Init __ioinit;


}
# 7 "lte_entry_point.cpp" 2






const lte_uint8_t FXRSTOR_OPCODE = 0x0c;
const lte_uint8_t XRSTOR_OPCODE = 0x2c;
# 48 "lte_entry_point.cpp"
struct entry64_data_t {




   lte_uint32_t num_threads;
   lte_uint32_t futex1;
   lte_uint64_t control_mask;
   lte_uint32_t futex2;
} __attribute__((packed));

static lte_uint8_t s_entry64[] = {

         0x49, 0xbc, 0x00, 0x00, 0x00, 0x00, 0x00,
         0x00, 0x00, 0x00,
         0xeb, 0x16,

         0x49, 0xbc, 0x00, 0x00, 0x00, 0x00, 0x00,
         0x00, 0x00, 0x00,
         0xeb, 0x0a,

         0x49, 0xbc, 0x00, 0x00, 0x00, 0x00, 0x00,
         0x00, 0x00, 0x00,

         0x49, 0x89, 0xe6,
         0xbd, 0x00, 0x00, 0x40, 0x00,
         0x31, 0xff,
         0x89, 0xee,
         0xba, 0x07, 0x00, 0x00, 0x00,
         0x41, 0xba, 0x22, 0x01, 0x00, 0x00,
         0xb8, 0x09, 0x00, 0x00, 0x00,
         0x0f, 0x05,
         0x48, 0x8d, 0x64, 0x05, 0x00,
         0x48, 0x89, 0xdf,
         0x49, 0x8d, 0x76, 0x08,
         0x49, 0x8b, 0x56, 0xf8,
         0x41, 0xff, 0xd4,
         0x49, 0x89, 0xc4,
         0x48, 0x89, 0xe7,
         0x89, 0xee,
         0x48, 0x29, 0xef,
         0xb8, 0x0b, 0x00, 0x00, 0x00,
         0x0f, 0x05,
         0x4c, 0x89, 0xf4,
         0xc3,

         0xbf, 0x11, 0x0f, 0x04, 0x00,
         0x48, 0x89, 0xe6,
         0xb8, 0x38, 0x00, 0x00, 0x00,
         0x0f, 0x05,
         0x48, 0x85, 0xc0,
         0x74, 0x1d,
         0x89, 0xc7,
         0x31, 0xf6,
         0xba, 0x00, 0x00, 0x00, 0x00,
         0x4d, 0x31, 0xd2,
         0xb8, 0x3d, 0x00, 0x00, 0x00,
         0x0f, 0x05,
         0xe8, 0x77, 0xff, 0xff, 0xff,
         0xe9, 0xb8, 0x00, 0x00, 0x00,

         0xe8, 0xbc, 0x00, 0x00, 0x00,
         0x48, 0x8b, 0x7c, 0x24, 0x08,
         0x31, 0xf6,
         0xb8, 0x02, 0x00, 0x00, 0x00,
         0x0f, 0x05,
         0x49, 0x89, 0xc4,
         0x48, 0xbd, 0x00, 0x00, 0x00, 0x00, 0x00,
         0x00, 0x00, 0x00,
         0x49, 0xbe, 0x00, 0x00, 0x00, 0x00, 0x00,
         0x00, 0x00, 0x00,
         0xbb, 0x00, 0x00, 0x00, 0x00,

         0x48, 0x8b, 0x7d, 0x00,
         0xbe, 0x00, 0x10, 0x00, 0x00,
         0xb8, 0x0b, 0x00, 0x00, 0x00,
         0x0f, 0x05,
         0x48, 0x8b, 0x7d, 0x00,
         0xbe, 0x00, 0x10, 0x00, 0x00,
         0xba, 0x07, 0x00, 0x00, 0x00,
         0x41, 0xba, 0x12, 0x00, 0x00, 0x00,
         0x4d, 0x89, 0xe0,
         0x4d, 0x89, 0xf1,
         0xb8, 0x09, 0x00, 0x00, 0x00,
         0x0f, 0x05,
         0x49, 0x81, 0xc6, 0x00, 0x10, 0x00, 0x00,
         0x48, 0x83, 0xc5, 0x08,
         0x83, 0xeb, 0x01,
         0x75, 0xbf,
         0x4c, 0x89, 0xe7,
         0xb8, 0x03, 0x00, 0x00, 0x00,
         0x0f, 0x05,

         0xbb, 0x01, 0x00, 0x00, 0x00,
         0x48, 0xbc, 0x00, 0x10, 0x60, 0x00, 0x00,
         0x00, 0x00, 0x00,
         0x4c, 0x8d, 0x7c, 0x24, 0xff,
         0xe8, 0xd3, 0xfe, 0xff, 0xff,

         0xff, 0xcb,
         0x0f, 0x84, 0x84, 0x00, 0x00, 0x00,
         0xbf, 0x11, 0x0f, 0x05, 0x00,
         0x48, 0x89, 0xe6,
         0xb8, 0x38, 0x00, 0x00, 0x00,
         0x0f, 0x05,
         0x48, 0x85, 0xc0,
         0x74, 0x70,
         0x48, 0x81, 0xc4, 0xc0, 0x0b, 0x00, 0x00,
         0xeb, 0xdb,

         0x31, 0xff,
         0xb8, 0x3c, 0x00, 0x00, 0x00,
         0x0f, 0x05,

         0x4c, 0x8b, 0x74, 0x24, 0x08,
         0x48, 0x8b, 0x7c, 0x24, 0x10,
         0x4d, 0x31, 0xed,
         0xeb, 0x16,

         0x49, 0xff, 0xce,
         0x74, 0x19,

         0xe8, 0x29, 0x00, 0x00, 0x00,
         0x75, 0x06,
         0x49, 0x83, 0xcd, 0x01,
         0xeb, 0xee,

         0x85, 0xc0,
         0x74, 0xea,

         0x0f, 0xb6, 0x07,
         0x48, 0xff, 0xc7,
         0xeb, 0xf4,

         0x48, 0xbf, 0x00, 0x00, 0x00, 0x00, 0x00,
         0x00, 0x00, 0x00,
         0x4c, 0x87, 0x2f,
         0xc3,

         0x2d, 0x66, 0x75, 0x74, 0x65, 0x78, 0x00,

         0x48, 0x8d, 0x35, 0xf2, 0xff, 0xff, 0xff,

         0x0f, 0xb6, 0x07,
         0x0f, 0xb6, 0x16,
         0x48, 0xff, 0xc7,
         0x48, 0xff, 0xc6,
         0x29, 0xc2,
         0x75, 0x04,
         0x85, 0xc0,
         0x75, 0xec,

         0xc3,

         0xe8, 0x5a, 0xfe, 0xff, 0xff,
         0x4d, 0x89, 0xe5,
         0xb8, 0x03, 0x00, 0x00, 0x00,
         0xba, 0x00, 0x00, 0x00, 0x00,
         0x0f, 0xae, 0x2c, 0x24,
         0x48, 0x81, 0xc4, 0xf0, 0x0a, 0x00, 0x00,
         0xb8, 0x9a, 0x00, 0x00, 0x00,
         0xbf, 0x01, 0x00, 0x00, 0x00,
         0x48, 0x89, 0xe6,
         0xba, 0x10, 0x00, 0x00, 0x00,
         0x0f, 0x05,
         0x48, 0x85, 0xc0,
         0x0f, 0x85, 0x5f, 0xff, 0xff, 0xff,
         0x8e, 0x64, 0x24, 0x10,
         0xb8, 0x9e, 0x00, 0x00, 0x00,
         0xbf, 0x02, 0x10, 0x00, 0x00,
         0x48, 0x8b, 0x74, 0x24, 0x14,
         0x0f, 0x05,
         0x48, 0x85, 0xc0,
         0x0f, 0x85, 0x41, 0xff, 0xff, 0xff,
         0xb8, 0x9a, 0x00, 0x00, 0x00,
         0xbf, 0x01, 0x00, 0x00, 0x00,
         0x48, 0x8d, 0x74, 0x24, 0x1c,
         0xba, 0x10, 0x00, 0x00, 0x00,
         0x0f, 0x05,
         0x48, 0x85, 0xc0,
         0x0f, 0x85, 0x22, 0xff, 0xff, 0xff,
         0x8e, 0x6c, 0x24, 0x2c,
         0xb8, 0x9e, 0x00, 0x00, 0x00,
         0xbf, 0x01, 0x10, 0x00, 0x00,
         0x48, 0x8b, 0x74, 0x24, 0x30,
         0x0f, 0x05,
         0x48, 0x85, 0xc0,
         0x0f, 0x85, 0x04, 0xff, 0xff, 0xff,
         0x48, 0x83, 0xc4, 0x38,
         0x41, 0xf7, 0x47, 0x08, 0x01, 0x00, 0x00,
         0x00,
         0x74, 0x68,
         0x85, 0xdb,
         0x74, 0x42,
         0xf0, 0x41, 0x83, 0x2f, 0x01,
         0x75, 0x09,
         0x49, 0x8d, 0x7f, 0x04,
         0xe8, 0x14, 0x00, 0x00, 0x00,

         0x49, 0x8d, 0x7f, 0x10,
         0xe8, 0x02, 0x00, 0x00, 0x00,
         0xeb, 0x72,

         0xbe, 0x80, 0x00, 0x00, 0x00,
         0x31, 0xd2,
         0xeb, 0x0d,

         0xbe, 0x81, 0x00, 0x00, 0x00,
         0xba, 0x7f, 0xff, 0xff, 0xff,
         0xf0, 0x09, 0x37,

         0x4d, 0x31, 0xd2,
         0x4d, 0x31, 0xc0,
         0x4d, 0x31, 0xc9,
         0xb8, 0xca, 0x00, 0x00, 0x00,
         0x0f, 0x05,
         0xc3,

         0xf0, 0x41, 0x83, 0x2f, 0x01,
         0x74, 0x09,
         0x49, 0x8d, 0x7f, 0x04,
         0xe8, 0xc9, 0xff, 0xff, 0xff,

         0x49, 0x8d, 0x7f, 0x10,
         0xb8, 0x11, 0x47, 0x01, 0x00,
         0x0f, 0xa2,
         0xe8, 0xc2, 0xff, 0xff, 0xff,
         0xeb, 0x29,

         0x31, 0xed,
         0xf7, 0xd5,
         0xf0, 0x41, 0x01, 0x2f,
         0x85, 0xdb,
         0x74, 0x0a,

         0x41, 0x85, 0x6f, 0x04,
         0x75, 0x17,
         0xf3, 0x90,
         0xeb, 0xf6,

         0x41, 0x85, 0x2f,
         0xf3, 0x90,
         0x75, 0xf9,
         0xb8, 0x11, 0x47, 0x02, 0x00,
         0x0f, 0xa2,
         0xf0, 0x41, 0x09, 0x6f, 0x04,

         0x4d, 0x85, 0xed,
         0x74, 0x3d,
         0x41, 0x8b, 0x5d, 0x00,

         0x89, 0xdf,
         0xbe, 0x03, 0x24, 0x00, 0x00,
         0xba, 0x01, 0x00, 0x00, 0x00,
         0xb8, 0x10, 0x00, 0x00, 0x00,
         0x0f, 0x05,

         0x89, 0xdf,
         0xbe, 0x00, 0x24, 0x00, 0x00,
         0xba, 0x01, 0x00, 0x00, 0x00,
         0xb8, 0x10, 0x00, 0x00, 0x00,
         0x0f, 0x05,

         0x89, 0xdf,
         0xbe, 0x02, 0x24, 0x00, 0x00,
         0xba, 0x01, 0x00, 0x00, 0x00,
         0xb8, 0x10, 0x00, 0x00, 0x00,
         0x0f, 0x05,

         0x5f,
         0x5e,
         0x5d,
         0x41, 0x58,
         0x41, 0x59,
         0x41, 0x5a,
         0x41, 0x5b,
         0x41, 0x5c,
         0x41, 0x5d,
         0x41, 0x5e,
         0x41, 0x5f,
         0x85, 0xdb,
         0x75, 0x17,

         0xb8, 0x01, 0x00, 0x00, 0x00,
         0x66, 0x87, 0xdb,
         0xbb, 0x01, 0x00, 0x00, 0x00,
         0x64, 0x67, 0x90,
         0xb8, 0x11, 0x47, 0x01, 0x00,
         0x0f, 0xa2,

         0x5a,
         0x59,
         0x5b,
         0x58,
         0x9d,
         0xc3,

         0x5c,
         0xff, 0x25, 0x00, 0x00, 0x00, 0x00,
         0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
};

typedef enum {
   E64_ON_PSTART_OFFS = 0x00,
   E64_ON_PSTART_CBKADDR_OFFS = 0x02,
   E64_ON_PEXIT_OFFS = 0x0c,
   E64_ON_PEXIT_CBKADDR_OFFS = 0x0e,
   E64_ON_TSTART_OFFS = 0x18,
   E64_ON_TSTART_CBKADDR_OFFS = 0x1a,
   E64_CBK_OFFS = 0x22,
   E64_CBK_STACK_SIZE_OFFS = 0x26,
   E64_MONITOR_THREAD_OFFS = 0x69,
   E64_ON_PEXIT_CALLOP_OFFS = 0x90,
   E64_ON_PEXIT_ADDR_OFFS = 0x91,
   E64_PARSEARGS_CALLOP_OFFS = 0x9a,
   E64_REMAP_OFFS = 0x9f,
   E64_DMAP_PAGES_OFFS = 0xb2,
   E64_DMAP_FILE_OFFSET_OFFS = 0xbc,
   E64_DMAP_PAGES_NUM_OFFS = 0xc5,
   E64_PARSEARGSNR_CALLOP_OFFS = 0x10f,
   E64_START_OFFS = 0x114,
   E64_THREAD_NUM_OFFS = 0x115,
   E64_ARCH_STATE_ADDR_OFFS = 0x11b,
   E64_ENTRY_POINT_DATA_OFFS = 0x127,
   E64_ON_PSTART_CALLOP_OFFS = 0x128,
   E64_ON_PSTART_ADDR_OFFS = 0x129,
   E64_CREATE_THREAD_OFFS = 0x12d,
   E64_THREAD_INIT_JMP1_OFFS = 0x12f,
   E64_THREAD_INIT_JMP2_OFFS = 0x147,
   E64_CPU_STATE_SIZE_OFFS = 0x14c,
   E64_EXIT_OFFS = 0x152,
   E64_PARSE_ARGS_OFFS = 0x15b,
   E64_CONTROL_MASK_ADDR_OFFS = 0x18a,
   E64_THREAD_START_OFFS = 0x1b9,
   E64_ON_TSTART_CALLOP_OFFS = 0x1b9,
   E64_ON_TSTART_ADDR_OFFS = 0x1ba,
   E64_THREAD_START_NOCBK_OFFS = 0x1c1,
   E64_XFEATURES_LO_OFFS = 0x1c2,
   E64_XFEATURES_HI_OFFS = 0x1c7,
   E64_FXRSTOR_OPCODE_OFFS = 0x1cd,
   E64_MODIFY_LDT_FS_OFFS = 0x1e8,
   E64_MODIFY_LDT_GS_OFFS = 0x225,
   E64_SYNC_CODE_OFFS = 0x252,
   E64_FUTEX_NUM_WAITERS = 0x28a,
   E64_SIM_M1_TAG1_SIMICS_OFFS = 0x2b7,
   E64_SIM_M1_TAG2_SIMICS_OFFS = 0x2e2,
   E64_SYNC_CODE_END_OFFS = 0x2ed,
   E64_SIM_ROI_CHECK = 0x342,
   E64_SIM_ROI_TAG_SNIPER_OFFS = 0x347,
   E64_SIM_ROI_TAG_SSC_OFFS = 0x34f,
   E64_SIM_ROI_TAG_SIMICS_OFFS = 0x357,
   E64_THREAD_ENTRY_TABLE_OFFS = 0x363,
   E64_THREAD_START_ADDR_OFFS = 0x36a,
   E64_SIZE = sizeof(s_entry64),
   E64_ON_PSTART_SIZE = E64_ON_PEXIT_OFFS-E64_ON_PSTART_OFFS,
   E64_ON_PEXIT_SIZE = E64_ON_TSTART_OFFS-E64_ON_PEXIT_OFFS,
   E64_ON_TSTART_SIZE = E64_CBK_OFFS-E64_ON_TSTART_OFFS,
   E64_CBK_SIZE = E64_MONITOR_THREAD_OFFS-E64_CBK_OFFS,
   E64_MONITOR_THREAD_SIZE = E64_PARSEARGS_CALLOP_OFFS-E64_MONITOR_THREAD_OFFS,
   E64_PARSEARGS_CALLOP_SIZE = 5,
   E64_PARSEARGSNR_CALLOP_SIZE = E64_PARSEARGS_CALLOP_SIZE,
   E64_REMAP_SIZE = E64_START_OFFS-E64_REMAP_OFFS,
   E64_START_SIZE = E64_EXIT_OFFS-E64_START_OFFS,
   E64_EXIT_SIZE = E64_THREAD_START_OFFS-E64_EXIT_OFFS,
   E64_PARSE_ARGS_SIZE = E64_THREAD_START_OFFS-E64_PARSE_ARGS_OFFS,
   E64_SYNC_CODE_SIZE = (E64_SYNC_CODE_END_OFFS-E64_SYNC_CODE_OFFS),
   E64_THREAD_START_SIZE = E64_THREAD_ENTRY_TABLE_OFFS-E64_THREAD_START_OFFS,
   E64_THREAD_ENTRY_SIZE = E64_SIZE-E64_THREAD_ENTRY_TABLE_OFFS,
   E64_THREAD_START_ADDR_SIZE = 8
} entry64_layout_enum_t;

struct thread_entry64_t { union {
   struct { lte_uint8_t pad_ip[E64_THREAD_START_ADDR_OFFS-E64_THREAD_ENTRY_TABLE_OFFS]; lte_uint64_t ip; } __attribute__((packed));
} __attribute__((packed)); } __attribute__((packed));

typedef struct {
   lte_uint8_t opcode;
   lte_uint32_t offset;
} __attribute__((packed)) lte_callop_t;

typedef struct {
   lte_uint8_t opcode;
   lte_uint32_t offset;
} __attribute__((packed)) lte_jmpop_t;

typedef struct {
   lte_uint16_t opcode;
   lte_uint32_t offset;
} __attribute__((packed)) lte_jcop_t;

typedef struct {
   lte_uint8_t opcode;
   lte_uint8_t offset;
} __attribute__((packed)) lte_jcsop_t;

struct entry64_t { union {
   struct { lte_uint8_t pad_on_pstart_cbk[E64_ON_PSTART_CBKADDR_OFFS]; lte_uint64_t on_pstart_cbk; } __attribute__((packed));
   struct { lte_uint8_t pad_on_pexit_cbk[E64_ON_PEXIT_CBKADDR_OFFS]; lte_uint64_t on_pexit_cbk; } __attribute__((packed));
   struct { lte_uint8_t pad_on_tstart_cbk[E64_ON_TSTART_CBKADDR_OFFS]; lte_uint64_t on_tstart_cbk; } __attribute__((packed));
   struct { lte_uint8_t pad_cbk_stack_size[E64_CBK_STACK_SIZE_OFFS]; lte_uint32_t cbk_stack_size; } __attribute__((packed));
   struct { lte_uint8_t pad_monitor_thread_start[E64_MONITOR_THREAD_OFFS]; uint8_t monitor_thread_start; } __attribute__((packed));
   struct { lte_uint8_t pad_on_pexit[E64_ON_PEXIT_CALLOP_OFFS]; lte_callop_t on_pexit; } __attribute__((packed));
   struct { lte_uint8_t pad_parse_argv_call_dmap[E64_PARSEARGS_CALLOP_OFFS]; lte_callop_t parse_argv_call_dmap; } __attribute__((packed));
   struct { lte_uint8_t pad_remap_pages_start[E64_REMAP_OFFS]; lte_jmpop_t remap_pages_start; } __attribute__((packed));
   struct { lte_uint8_t pad_dmap_pages[E64_DMAP_PAGES_OFFS]; lte_uint64_t dmap_pages; } __attribute__((packed));
   struct { lte_uint8_t pad_dmap_file_offset[E64_DMAP_FILE_OFFSET_OFFS]; lte_uint64_t dmap_file_offset; } __attribute__((packed));
   struct { lte_uint8_t pad_dmap_pages_num[E64_DMAP_PAGES_NUM_OFFS]; lte_uint32_t dmap_pages_num; } __attribute__((packed));
   struct { lte_uint8_t pad_parse_argv_call_nodmap[E64_PARSEARGSNR_CALLOP_OFFS]; lte_callop_t parse_argv_call_nodmap; } __attribute__((packed));
   struct { lte_uint8_t pad_threads_num[E64_THREAD_NUM_OFFS]; lte_uint32_t threads_num; } __attribute__((packed));
   struct { lte_uint8_t pad_arch_state_addr[E64_ARCH_STATE_ADDR_OFFS]; lte_uint64_t arch_state_addr; } __attribute__((packed));
   struct { lte_uint8_t pad_entry_point_data_offs[E64_ENTRY_POINT_DATA_OFFS]; lte_uint8_t entry_point_data_offs; } __attribute__((packed));
   struct { lte_uint8_t pad_on_pstart[E64_ON_PSTART_CALLOP_OFFS]; lte_callop_t on_pstart; } __attribute__((packed));
   struct { lte_uint8_t pad_thread_init_jmp1[E64_THREAD_INIT_JMP1_OFFS]; lte_jcop_t thread_init_jmp1; } __attribute__((packed));
   struct { lte_uint8_t pad_thread_init_jmp2[E64_THREAD_INIT_JMP2_OFFS]; lte_jcsop_t thread_init_jmp2; } __attribute__((packed));
   struct { lte_uint8_t pad_arch_state_size[E64_CPU_STATE_SIZE_OFFS]; lte_uint32_t arch_state_size; } __attribute__((packed));
   struct { lte_uint8_t pad_control_mask_addr[E64_CONTROL_MASK_ADDR_OFFS]; lte_uint64_t control_mask_addr; } __attribute__((packed));
   struct { lte_uint8_t pad_on_tstart[E64_ON_TSTART_CALLOP_OFFS]; lte_callop_t on_tstart; } __attribute__((packed));
   struct { lte_uint8_t pad_xfeature_lo[E64_XFEATURES_LO_OFFS]; lte_uint32_t xfeature_lo; } __attribute__((packed));
   struct { lte_uint8_t pad_xfeature_hi[E64_XFEATURES_HI_OFFS]; lte_uint32_t xfeature_hi; } __attribute__((packed));
   struct { lte_uint8_t pad_fxrstor[E64_FXRSTOR_OPCODE_OFFS]; lte_uint8_t fxrstor; } __attribute__((packed));
   struct { lte_uint8_t pad_modify_ldt_fs[E64_MODIFY_LDT_FS_OFFS]; lte_uint16_t modify_ldt_fs; } __attribute__((packed));
   struct { lte_uint8_t pad_modify_ldt_gs[E64_MODIFY_LDT_GS_OFFS]; lte_uint16_t modify_ldt_gs; } __attribute__((packed));
   struct { lte_uint8_t pad_futex_num_waiters[E64_FUTEX_NUM_WAITERS]; lte_uint32_t futex_num_waiters; } __attribute__((packed));
   struct { lte_uint8_t pad_magic1_tag1_simics[E64_SIM_M1_TAG1_SIMICS_OFFS]; lte_uint32_t magic1_tag1_simics; } __attribute__((packed));
   struct { lte_uint8_t pad_magic1_tag2_simics[E64_SIM_M1_TAG2_SIMICS_OFFS]; lte_uint32_t magic1_tag2_simics; } __attribute__((packed));
   struct { lte_uint8_t pad_roi_check[E64_SIM_ROI_CHECK]; lte_uint16_t roi_check; } __attribute__((packed));
   struct { lte_uint8_t pad_roi_tag_sniper[E64_SIM_ROI_TAG_SNIPER_OFFS]; lte_uint32_t roi_tag_sniper; } __attribute__((packed));
   struct { lte_uint8_t pad_roi_tag_ssc[E64_SIM_ROI_TAG_SSC_OFFS]; lte_uint32_t roi_tag_ssc; } __attribute__((packed));
   struct { lte_uint8_t pad_roi_tag_simics[E64_SIM_ROI_TAG_SIMICS_OFFS]; lte_uint32_t roi_tag_simics; } __attribute__((packed));
   struct { lte_uint8_t pad_tst[E64_THREAD_ENTRY_TABLE_OFFS]; thread_entry64_t tst []; } __attribute__((packed));
} __attribute__((packed)); } __attribute__((packed));






static lte_uint8_t s_entry32[] = {

         0xbd, 0x01, 0x00, 0x00, 0x00,
         0xbc, 0x00, 0x00, 0x00, 0x00,

         0x4d,
         0x74, 0x26,
         0xbb, 0x00, 0x8f, 0x01, 0x80,
         0x89, 0xe1,
         0xb8, 0x78, 0x00, 0x00, 0x00,
         0xcd, 0x80,
         0x85, 0xc0,
         0x74, 0x14,
         0x81, 0xc4, 0x80, 0x0b, 0x00, 0x00,
         0xeb, 0xe3,

         0xbb, 0x00, 0x00, 0x00, 0x00,
         0xb8, 0x01, 0x00, 0x00, 0x00,
         0xcd, 0x80,

         0x0f, 0xae, 0x0c, 0x24,
         0x81, 0xc4, 0xf0, 0x0a, 0x00, 0x00,
         0xb8, 0x7b, 0x00, 0x00, 0x00,
         0xbb, 0x01, 0x00, 0x00, 0x00,
         0x89, 0xe1,
         0xba, 0x10, 0x00, 0x00, 0x00,
         0xcd, 0x80,
         0x85, 0xc0,
         0x75, 0xd3,
         0x8e, 0x64, 0x24, 0x10,
         0xb8, 0x7b, 0x00, 0x00, 0x00,
         0xbb, 0x01, 0x00, 0x00, 0x00,
         0x8d, 0x4c, 0x24, 0x14,
         0xba, 0x10, 0x00, 0x00, 0x00,
         0xcd, 0x80,
         0x85, 0xc0,
         0x75, 0xb6,
         0x8e, 0x6c, 0x24, 0x24,
         0x83, 0xc4, 0x28,
         0x9d,
         0x61,
         0xc3,

         0x5c,
         0xe9, 0xfc, 0xff, 0xff, 0xff,
};

typedef enum {
   E32_START_OFFS = 0x00,
   E32_THREAD_NUM_OFFS = 0x01,
   E32_ARCH_STATE_ADDR_OFFS = 0x06,
   E32_CREATE_THREAD_OFFS = 0x0a,
   E32_CPU_STATE_SIZE_OFFS = 0x21,
   E32_EXIT_OFFS = 0x27,
   E32_THREAD_START_OFFS = 0x33,
   E32_MODIFY_LDT_FS_OFFS = 0x4e,
   E32_MODIFY_LDT_GS_OFFS = 0x6b,
   E32_THREAD_ENTRY_TABLE_OFFS = 0x7b,
   E32_THREAD_START_ADDR_OFFS = 0x7d,

   E32_SIZE = sizeof(s_entry32),
   E32_START_SIZE = E32_EXIT_OFFS - E32_START_OFFS,
   E32_EXIT_SIZE = E32_THREAD_START_OFFS - E32_EXIT_OFFS,
   E32_THREAD_START_SIZE = E32_THREAD_ENTRY_TABLE_OFFS - E32_THREAD_START_OFFS,
   E32_THREAD_ENTRY_SIZE = E32_SIZE - E32_THREAD_ENTRY_TABLE_OFFS,
   E32_THREAD_START_ADDR_SIZE = 4
} entry32_layout_enum_t;

struct thread_entry32_t { union {
   struct { lte_uint8_t pad_ip[E32_THREAD_START_ADDR_OFFS-E32_THREAD_ENTRY_TABLE_OFFS]; lte_uint32_t ip; } __attribute__((packed));
} __attribute__((packed)); } __attribute__((packed));

struct entry32_t { union {
   struct { lte_uint8_t pad_threads_num[E32_THREAD_NUM_OFFS]; lte_uint32_t threads_num; } __attribute__((packed));
   struct { lte_uint8_t pad_arch_state_addr[E32_ARCH_STATE_ADDR_OFFS]; lte_uint32_t arch_state_addr; } __attribute__((packed));
   struct { lte_uint8_t pad_arch_state_size[E32_CPU_STATE_SIZE_OFFS]; lte_uint32_t arch_state_size; } __attribute__((packed));
   struct { lte_uint8_t pad_modify_ldt_fs[E32_MODIFY_LDT_FS_OFFS]; lte_uint16_t modify_ldt_fs; } __attribute__((packed));
   struct { lte_uint8_t pad_modify_ldt_gs[E32_MODIFY_LDT_GS_OFFS]; lte_uint16_t modify_ldt_gs; } __attribute__((packed));
   struct { lte_uint8_t pad_tst[E32_THREAD_ENTRY_TABLE_OFFS]; thread_entry32_t tst []; } __attribute__((packed));
} __attribute__((packed)); } __attribute__((packed));




static const char s_start[] = "_start";
static const char s_exit[] = "pbs.exit";
static const char s_parse_args[] = "pbs.parse_args";
static const char s_thread_start[] = "pbs.init_thread";
static const char s_tst[] = "pbs.tet.t%d";

static const char s_on_start[] = "pbs.cbk_on_start";
static const char s_on_exit[] = "pbs.cbk_on_exit";
static const char s_on_thread_start[] = "pbs.cbk_on_thread_start";
static const char s_cbk[] = "pbs.cbk";

static entry_point_t::sym entry_point32_symtab[] =
{
   {s_start, E32_START_OFFS, E32_START_SIZE, E32_GFUNC, __null},
   {s_exit, E32_EXIT_OFFS, E32_EXIT_SIZE, E32_GFUNC, __null},
   {s_thread_start, E32_THREAD_START_OFFS, E32_THREAD_START_SIZE, E32_GFUNC, __null},
};

static entry_point_t::sym entry_point64_symtab[] =
{
   {s_start, E64_START_OFFS, E64_START_SIZE, E64_GFUNC, __null},
   {s_exit, E64_EXIT_OFFS, E64_EXIT_SIZE, E64_GFUNC, __null},
   {s_parse_args, E64_PARSE_ARGS_OFFS, E64_PARSE_ARGS_SIZE, E64_GFUNC, __null},
   {s_thread_start, E64_THREAD_START_OFFS, E64_THREAD_START_SIZE, E64_GFUNC, __null},
   {s_on_start, E64_ON_PSTART_OFFS, E64_ON_PSTART_SIZE, E64_GFUNC, __null},
   {s_on_exit, E64_ON_PEXIT_OFFS, E64_ON_PEXIT_SIZE, E64_GFUNC, __null},
   {s_on_thread_start, E64_ON_TSTART_OFFS, E64_ON_TSTART_SIZE, E64_GFUNC, __null},
   {s_cbk, E64_CBK_OFFS, E64_CBK_SIZE, E64_GFUNC, __null},
};

static void clear_code(void* pcode, lte_size_t size, lte_uint8_t end = 0xcc)
{
   (((pcode != __null && size > 0)==0)?lte_assert("pcode != NULL && size > 0", 0, "lte_entry_point.cpp", 601),((void)(0)):((void)(0)));
   memset(pcode, 0, size);
   ((lte_uint8_t*)pcode)[size-1] = end;
}

entry_point_t* entry_point_t::create_entry_point(Elf_Class_t e_class, lte_uint32_t threads_num)
{
   switch(e_class)
   {
      case 1:
         return new entry_point32_t(threads_num);
      case 2:
         return new entry_point64_t(threads_num);
      default:
         ;
   }
   return __null;
}

entry_point_t* entry_point_t::create_entry_point(Elf_Class_t e_class, void* ptr, lte_size_t size)
{
   switch(e_class)
   {
      case 1:
         return new entry_point32_t(ptr, size);
      case 2:
         return new entry_point64_t(ptr, size);
      default:
         ;
   }
   return __null;
}

entry_point_t::entry_point_t()
{
   m_entry = __null;
   m_entry_buffer = __null;
   m_entry_va = 0;
   m_entry_data_va = 0;
   m_entry_size = 0;
   m_start_offs = 0;
   m_start_size = 0;
   m_threads_num = 0;
   m_thread_state_offs = 0;
   m_thread_state_size = 0;
   m_thread_state_align = 64;
   m_thread_ip_offs = 0;
   m_dmap_offs = 0;
   m_dmap_pages_num = 0;
   m_pstart_cbk_sym = 0;
   m_pexit_cbk_sym = 0;
   m_tstart_cbk_sym = 0;
}

entry_point_t::~entry_point_t()
{
   for(std::vector<sym>::iterator it = m_code_symbols.begin(); it != m_code_symbols.end(); ++it)
      if(it->name)
         free(const_cast<char*>(it->name));

   clear_initial_state();
}

void entry_point_t::clear_initial_state()
{
   for(std::vector<sym>::iterator it = m_data_symbols.begin(); it != m_data_symbols.end(); ++it)
      if(it->name)
         free(const_cast<char*>(it->name));

   m_data_symbols.clear();
   m_state.clear();
}
# 683 "lte_entry_point.cpp"
template<typename T>
void entry_point_t::add(const T& sym_data)
{



   m_state << sym_data;



}

template<typename T>
void entry_point_t::add(lte_uint32_t tid, const T& sym_data, const char* sym_name, unsigned char sym_info)
{
   add(tid, &sym_data, sizeof(sym_data), sym_name, sym_info);
}

void entry_point_t::add(lte_uint32_t tid, const void* sym_data, lte_size_t sym_data_size, const char* sym_name, unsigned char sym_info)
{
   char buffer[256];
   sprintf(buffer, "t%d.%s", tid, sym_name);

   add(sym_data, sym_data_size, buffer, sym_info);
}

void entry_point_t::add(const void* sym_data, lte_size_t sym_data_size, const char* sym_name, unsigned char sym_info)
{
   sym s;

   s.name = strdup(sym_name);
   s.offs = m_state.table_size();
   m_state.push_back(sym_data, sym_data_size);
   s.size = m_state.table_size() - s.offs;
   s.info = sym_info;
   s.rela = __null;
   m_data_symbols.push_back(s);




}

entry_point32_t::entry_point32_t(lte_uint32_t threads_num)
{
   (((threads_num>0)==0)?lte_assert("threads_num>0", 0, "lte_entry_point.cpp", 728),((void)(0)):((void)(0)));

   m_threads_num = threads_num;
   m_entry_size = sizeof(s_entry32) + sizeof(thread_entry32_t)*(threads_num-1);
   m_entry = m_entry_buffer = new lte_uint8_t[m_entry_size];
   memcpy(m_entry, s_entry32, sizeof(s_entry32));

   m_start_offs = E32_START_OFFS;
   m_start_size = E32_START_SIZE;

   ((entry32_t*)m_entry)->threads_num = threads_num;

   for(lte_uint32_t i = 0; i < sizeof(entry_point32_symtab)/sizeof(*entry_point32_symtab); ++i)
   {
      m_code_symbols.push_back(entry_point32_symtab[i]);
      m_code_symbols.back().name = strdup(m_code_symbols.back().name);
   }

   char buffer[256];
   for(lte_uint32_t i = 0; i < threads_num; ++i)
   {
      sym s;

      sprintf(buffer, s_tst, i);
      s.name = strdup(buffer);
      s.offs = (reinterpret_cast<char*>((&((entry32_t*)0)->tst[i]))-reinterpret_cast<char*>(0));
      s.size = sizeof(((entry32_t*)0)->tst[i]) - sizeof(((entry32_t*)0)->tst[i].ip);
      s.info = E32_GFUNC;
      s.rela = __null;
      m_code_symbols.push_back(s);
   }
}

entry_point32_t::entry_point32_t(void* ptr, lte_size_t size)
{
   m_entry = (lte_uint8_t*)ptr;
   m_entry_size = size;

   m_start_offs = E32_START_OFFS;
   m_start_size = E32_START_SIZE;
}

entry_point32_t::~entry_point32_t()
{
   if(m_entry_buffer)
      delete m_entry_buffer;
}

void entry_point32_t::setup(lte_uint32_t threads_num, lte_thread_state_t* states, void* dmap_pages, lte_uint32_t dmap_pages_num)
{
   entry32_t* e = (entry32_t*)m_entry;
   (((threads_num == e->threads_num)==0)?lte_assert("threads_num == e->threads_num", 0, "lte_entry_point.cpp", 779),((void)(0)):((void)(0)));

   setup_initial_state(threads_num, states, dmap_pages, dmap_pages_num);

   e->arch_state_size = m_thread_state_size;

   for(lte_uint32_t i = 0; i < threads_num; ++i)
   {
      memcpy(&e->tst[i], ((entry32_t*)s_entry32)->tst, sizeof(thread_entry32_t));
      e->tst[i].ip = states[i].eip - (m_entry_va + (reinterpret_cast<char*>((&((entry32_t*)0)->tst[i]))-reinterpret_cast<char*>(0)) + sizeof(((entry32_t*)0)->tst[i]));
   }

   relocate_code(m_entry_va);
   relocate_data(m_entry_data_va);
}

void entry_point32_t::setup_initial_state(lte_uint32_t threads_num, lte_thread_state_t* states, void* dmap_pages, lte_uint32_t dmap_pages_num)
{
   entry32_t* e = (entry32_t*)m_entry;

   if(e)
   {
    (((threads_num == e->threads_num)==0)?lte_assert("threads_num == e->threads_num", 0, "lte_entry_point.cpp", 801),((void)(0)):((void)(0)));
   }
   else
   {
    (((e)==0)?lte_assert("e", 0, "lte_entry_point.cpp", 805),((void)(0)):((void)(0)));
   }

   clear_initial_state();

   for(size_t tid = 0; tid < threads_num; ++tid)
   {
      lte_thread_state_t& state = states[tid];
      lte_size_t thread_state_offs = m_state.table_size();

      add(tid, state.xstate.fx.fcw, "fcw", (((0) << 4) + ((1) & 0xf)));
      add(tid, state.xstate.fx.fsw, "fsw", (((0) << 4) + ((1) & 0xf)));
      add(tid, state.xstate.fx.ftw, "ftw", (((0) << 4) + ((1) & 0xf)));
      add(tid, state.xstate.fx.fop, "fop", (((0) << 4) + ((1) & 0xf)));
      add(tid, state.xstate.fx.fpuip, "fpuip", (((0) << 4) + ((1) & 0xf)));
      add(tid, state.xstate.fx.fpudp, "fpudp", (((0) << 4) + ((1) & 0xf)));
      add(tid, state.xstate.fx.mxcsr, "mxcsr", (((0) << 4) + ((1) & 0xf)));
      add(tid, state.xstate.fx.mxcsr_mask, "mxcsr_mask", (((0) << 4) + ((1) & 0xf)));
      add(tid, state.xstate.fx.st, "st", (((0) << 4) + ((1) & 0xf)));
      add(tid, state.xstate.fx.xmm, "xmm", (((0) << 4) + ((1) & 0xf)));
      add(state.xstate.fx.rsvd);

      add(tid, state.xstate.xhdr, "xhdr", (((0) << 4) + ((1) & 0xf)));
      add(tid, state.xstate.ext_area2, "ext_area2", (((0) << 4) + ((1) & 0xf)));
      add(tid, state.xstate.ext_area3, "ext_area3", (((0) << 4) + ((1) & 0xf)));
      add(tid, state.xstate.ext_area4, "ext_area4", (((0) << 4) + ((1) & 0xf)));
      add(tid, state.xstate.ext_area5, "ext_area5", (((0) << 4) + ((1) & 0xf)));
      add(tid, state.xstate.ext_area6, "ext_area6", (((0) << 4) + ((1) & 0xf)));
      add(tid, state.xstate.ext_area7, "ext_area7", (((0) << 4) + ((1) & 0xf)));
      add(tid, state.xstate.ext_area8, "ext_area8", (((0) << 4) + ((1) & 0xf)));
      add(tid, state.xstate.ext_area9, "ext_area9", (((0) << 4) + ((1) & 0xf)));

      add(tid, &state.segdesc[LTE_REG_FS-LTE_REG_SR_FIRST], sizeof(state.segdesc[LTE_REG_FS-LTE_REG_SR_FIRST]), "fs.segdesc", E64_LOBJECT);
      add(tid, state.srstate.fs.sel.v, "fs.sel.v", (((0) << 4) + ((1) & 0xf)));
      add(tid, &state.segdesc[LTE_REG_GS-LTE_REG_SR_FIRST], sizeof(state.segdesc[LTE_REG_GS-LTE_REG_SR_FIRST]), "gs.segdesc", E64_LOBJECT);
      add(tid, state.srstate.gs.sel.v, "gs.sel.v", (((0) << 4) + ((1) & 0xf)));

      add(tid, state.gprstate.edi, "edi", (((0) << 4) + ((1) & 0xf)));
      add(tid, state.gprstate.esi, "esi", (((0) << 4) + ((1) & 0xf)));
      add(tid, state.gprstate.ebp, "ebp", (((0) << 4) + ((1) & 0xf)));
      add(state.gprstate.esp);
      add(tid, state.gprstate.ebx, "ebx", (((0) << 4) + ((1) & 0xf)));
      add(tid, state.gprstate.edx, "edx", (((0) << 4) + ((1) & 0xf)));
      add(tid, state.gprstate.ecx, "ecx", (((0) << 4) + ((1) & 0xf)));
      add(tid, state.gprstate.eax, "eax", (((0) << 4) + ((1) & 0xf)));
      add(tid, state.gprstate.eflags, "eflags", (((0) << 4) + ((1) & 0xf)));

      m_thread_ip_offs = m_state.table_size() - thread_state_offs;

      lte_uint32_t eip = m_entry_va + (reinterpret_cast<char*>((&((entry32_t*)0)->tst[tid]))-reinterpret_cast<char*>(0));
      add(tid, &eip, 4, "tst.eip", E32_LOBJECT);
      add(tid, state.gprstate.esp, "esp", (((0) << 4) + ((1) & 0xf)));

      m_thread_state_size = m_state.table_size() - thread_state_offs;

      lte_size_t tail_bytes_count = m_thread_state_size & (m_thread_state_align - 1);
      if(tail_bytes_count)
      {
         m_state.pad(m_thread_state_align - tail_bytes_count);
         m_thread_state_size = m_state.table_size() - thread_state_offs;
      }
   }

   if(dmap_pages && dmap_pages_num)
   {
      m_dmap_pages_num = dmap_pages_num;
      m_dmap_offs = m_state.table_size();
      add(dmap_pages, dmap_pages_num * 4, "dmap.pages", E32_LOBJECT);
   }
}

void entry_point32_t::relocate_code(lte_addr_t va)
{
   ((m_thread_state_size) ? static_cast<void> (0) : __assert_fail ("m_thread_state_size", "lte_entry_point.cpp", 878, __PRETTY_FUNCTION__));

   lte_size_t offs = va - (m_entry_va + m_start_offs);
   lte_size_t thread_ip_offs = m_thread_ip_offs;
   entry32_t* e = (entry32_t*)m_entry;

   for(lte_uint32_t tid = 0; tid < m_threads_num; ++tid, thread_ip_offs += m_thread_state_size)
   {
      m_state.dword(thread_ip_offs) += offs;
      e->tst[tid].ip -= offs;
   }
   m_entry_va = va;
}

void entry_point32_t::relocate_data(lte_addr_t va)
{
   entry32_t* e = (entry32_t*)m_entry;
   e->arch_state_addr = (lte_uint32_t)va;
   m_entry_data_va = va;
}

void entry_point32_t::relocate_dmap_data(lte_uint64_t offs)
{
}

void entry_point32_t::enable_modify_ldt(bool enable)
{
   entry32_t* e = (entry32_t*)m_entry;
   e->modify_ldt_fs = e->modify_ldt_gs = (enable ? 0x80cd : 0xc031);
}

void entry_point32_t::set_proc_start_callback(const char* name)
{
}

void entry_point32_t::set_proc_exit_callback(const char* name)
{
}

void entry_point32_t::set_thread_start_callback(const char* name)
{
}

void entry_point32_t::set_callback_stack_size(lte_uint32_t size)
{
}

void entry_point32_t::set_start_roi_mark(lte_uint32_t tag, lte_uint32_t type)
{
}

void entry_point32_t::set_magic2_tag(lte_uint32_t tag, lte_uint32_t type)
{
}

void entry_point32_t::set_roi_mark_thread(lte_uint32_t tid)
{
}


entry_point64_t::entry_point64_t(lte_uint32_t threads_num)
{
   (((threads_num>0)==0)?lte_assert("threads_num>0", 0, "lte_entry_point.cpp", 940),((void)(0)):((void)(0)));

   m_threads_num = threads_num;
   m_entry_size = sizeof(s_entry64) + sizeof(thread_entry64_t)*(threads_num-1);
   m_entry = m_entry_buffer = new lte_uint8_t[m_entry_size];
   memcpy(m_entry, s_entry64, sizeof(s_entry64));

   m_start_offs = E64_START_OFFS;
   m_start_size = E64_START_SIZE;

   ((entry64_t*)m_entry)->threads_num = threads_num;

   for(lte_uint32_t i = 0; i < sizeof(entry_point64_symtab)/sizeof(*entry_point64_symtab); ++i)
   {
      m_code_symbols.push_back(entry_point64_symtab[i]);
      m_code_symbols.back().name = strdup(m_code_symbols.back().name);
   }

   char buffer[256];
   for(lte_uint32_t i = 0; i < threads_num; ++i)
   {
      int len;
      sym s;

      len = sprintf(buffer, s_tst, i);
      s.name = strdup(buffer);
      s.offs = (reinterpret_cast<char*>((&((entry64_t*)0)->tst[i]))-reinterpret_cast<char*>(0));
      s.size = sizeof(((entry64_t*)0)->tst[i]) - sizeof(((entry64_t*)0)->tst[i].ip);
      s.info = E64_GFUNC;
      s.rela = __null;
      m_code_symbols.push_back(s);

      strcpy(buffer + len, ".rip");
      s.name = strdup(buffer);
      s.offs = (reinterpret_cast<char*>((&((entry64_t*)0)->tst[i].ip))-reinterpret_cast<char*>(0));
      s.size = sizeof(((entry64_t*)0)->tst[i].ip);
      s.info = E64_LOBJECT;
      s.rela = __null;
      m_code_symbols.push_back(s);
   }

   m_code_rela.resize(3);
   sym s;
   s.name = __null;
   s.rela = __null;
   m_pstart_cbk_sym = m_code_symbols.size();
   m_code_symbols.push_back(s);
   m_pexit_cbk_sym = m_code_symbols.size();
   m_code_symbols.push_back(s);
   m_tstart_cbk_sym = m_code_symbols.size();
   m_code_symbols.push_back(s);


   entry64_t* e = (entry64_t*)m_entry;
   e->on_pstart.opcode = 0xe9;
   e->on_pstart.offset = 0;
   e->on_pexit.opcode = 0xe9;
   e->on_pexit.offset = 0;
   e->on_tstart.opcode = 0xe9;
   e->on_tstart.offset = E64_THREAD_START_NOCBK_OFFS - (E64_ON_TSTART_CALLOP_OFFS + sizeof(e->on_tstart));

   e->thread_init_jmp1.offset = ((entry64_t*)s_entry64)->thread_init_jmp1.offset + (E64_THREAD_START_NOCBK_OFFS - E64_ON_TSTART_CALLOP_OFFS);
   e->thread_init_jmp2.offset = ((entry64_t*)s_entry64)->thread_init_jmp2.offset + (E64_THREAD_START_NOCBK_OFFS - E64_ON_TSTART_CALLOP_OFFS);
}

entry_point64_t::entry_point64_t(void* ptr, lte_size_t size)
{
   m_entry = (lte_uint8_t*)ptr;
   m_entry_size = size;

   m_start_offs = E64_START_OFFS;
   m_start_size = E64_START_SIZE;
}

entry_point64_t::~entry_point64_t()
{
   if(m_entry_buffer)
      delete m_entry_buffer;
}

void entry_point64_t::setup(lte_uint32_t threads_num, lte_thread_state_t* states, void* dmap_pages, lte_uint32_t dmap_pages_num)
{
   entry64_t* e = (entry64_t*)m_entry;
   (((threads_num == e->threads_num)==0)?lte_assert("threads_num == e->threads_num", 0, "lte_entry_point.cpp", 1023),((void)(0)):((void)(0)));

   setup_initial_state(threads_num, states, dmap_pages, dmap_pages_num);

   e->arch_state_size = m_thread_state_size;

   lte_uint64_t xstate_bv = 0;
   for(lte_uint32_t i = 0; i < threads_num; ++i)
   {
      memcpy(&e->tst[i], ((entry64_t*)s_entry64)->tst, sizeof(thread_entry64_t));
      e->tst[i].ip = states[i].rip;
      xstate_bv |= states[i].xstate.xhdr.xstate_bv;
   }
   e->xfeature_lo = (lte_uint32_t)xstate_bv;
   e->xfeature_hi = (lte_uint32_t)(xstate_bv>>32);
   e->fxrstor = (xstate_bv & ~(lte_uint64_t)(LTE_XFEATURE_MASK_X87|LTE_XFEATURE_MASK_SSE)) ? XRSTOR_OPCODE : FXRSTOR_OPCODE;

   if(get_config().no_monitor_thread())
   {
      if(m_dmap_pages_num)
      {
         clear_code(&e->monitor_thread_start, E64_MONITOR_THREAD_SIZE);
         m_start_offs = E64_PARSEARGS_CALLOP_OFFS;
         m_start_size = E64_PARSEARGS_CALLOP_SIZE + E64_REMAP_SIZE + E64_START_SIZE;
         e->dmap_pages_num = m_dmap_pages_num;
      }
      else
      {
         e->parse_argv_call_nodmap = e->parse_argv_call_dmap;
         e->parse_argv_call_nodmap.offset -= (E64_PARSEARGSNR_CALLOP_OFFS - E64_PARSEARGS_CALLOP_OFFS);
         clear_code(&e->monitor_thread_start, E64_MONITOR_THREAD_SIZE + E64_PARSEARGS_CALLOP_SIZE + E64_REMAP_SIZE - E64_PARSEARGSNR_CALLOP_SIZE);
         m_start_offs = E64_START_OFFS - E64_PARSEARGSNR_CALLOP_SIZE;
         m_start_size = E64_START_OFFS + E64_PARSEARGSNR_CALLOP_SIZE;
      }
   }
   else
   {
      if(m_dmap_pages_num)
      {
         m_start_offs = E64_MONITOR_THREAD_OFFS;
         m_start_size = E64_MONITOR_THREAD_SIZE + E64_PARSEARGS_CALLOP_SIZE + E64_REMAP_SIZE + E64_START_SIZE;
         e->dmap_pages_num = m_dmap_pages_num;
      }
      else
      {
         clear_code(&e->remap_pages_start.opcode, E64_REMAP_SIZE);
         m_start_offs = E64_MONITOR_THREAD_OFFS;
         m_start_size = E64_MONITOR_THREAD_SIZE + E64_PARSEARGS_CALLOP_SIZE + E64_REMAP_SIZE + E64_START_SIZE;
         e->remap_pages_start.opcode = 0xe9;
         e->remap_pages_start.offset = (lte_uint32_t)(E64_START_OFFS - (E64_REMAP_OFFS + 5));
      }
   }

   m_code_symbols[0].offs = m_start_offs;
   m_code_symbols[0].size = m_start_size;

   e->futex_num_waiters = e->threads_num;

   relocate_code(m_entry_va);
   relocate_data(m_entry_data_va);
}

void entry_point64_t::relocate_code(lte_addr_t va)
{
   ((m_thread_state_size) ? static_cast<void> (0) : __assert_fail ("m_thread_state_size", "lte_entry_point.cpp", 1087, __PRETTY_FUNCTION__));

   lte_size_t offs = va - m_entry_va;
   lte_size_t thread_ip_offs = m_thread_ip_offs;

   for(lte_uint32_t tid = 0; tid < m_threads_num; ++tid, thread_ip_offs += m_thread_state_size)
   {
      m_state.qword(thread_ip_offs) += offs;
   }
   m_entry_va = va;
}

void entry_point64_t::relocate_data(lte_addr_t va)
{
   entry64_t* e = (entry64_t*)m_entry;
   if(m_dmap_pages_num)
      e->dmap_pages = va + m_dmap_offs;
   e->arch_state_addr = va + m_thread_state_offs;
   e->control_mask_addr = va + (reinterpret_cast<char*>(&((entry64_data_t*)0)->control_mask)-reinterpret_cast<char*>(0));
   m_entry_data_va = va;
}

void entry_point64_t::relocate_dmap_data(lte_uint64_t offs)
{
   entry64_t* e = (entry64_t*)m_entry;
   e->dmap_file_offset = offs;
}

void entry_point64_t::setup_initial_state(lte_uint32_t threads_num, lte_thread_state_t* states, void* dmap_pages, lte_uint32_t dmap_pages_num)
{
   entry64_t* e = (entry64_t*)m_entry;

   (((threads_num == e->threads_num)==0)?lte_assert("threads_num == e->threads_num", 0, "lte_entry_point.cpp", 1119),((void)(0)):((void)(0)));

   clear_initial_state();
# 1136 "lte_entry_point.cpp"
   entry64_data_t proc_data;


   m_thread_state_offs = __lte_align_up(sizeof(proc_data) + (sizeof(states->icount)+8), m_thread_state_align);

   (((m_thread_state_offs<128)==0)?lte_assert("m_thread_state_offs<128", 0, "lte_entry_point.cpp", 1141),((void)(0)):((void)(0)));
   e->entry_point_data_offs = (lte_uint8_t)((-m_thread_state_offs)&0xff);

   proc_data.num_threads = threads_num;
   proc_data.futex1 = 0;
   proc_data.control_mask = 0;
   proc_data.futex2 = 0;
   add(proc_data);


   lte_size_t thread_data_offs = __lte_align(m_thread_state_offs - (sizeof(states->icount)+8), m_thread_state_align);
   lte_size_t thread_data_padding = m_thread_state_offs - (thread_data_offs + (sizeof(states->icount)+8));
   lte_size_t padding = m_thread_state_offs - (sizeof(proc_data) + (sizeof(states->icount)+8));

   for(size_t tid = 0; tid < threads_num; ++tid, padding = thread_data_padding, thread_data_offs = m_state.table_size())
   {
      lte_thread_state_t& state = states[tid];

      add_padding(padding);
      add(tid, state.icount, "icount", ((((0)) << 4) + (((1)) & 0xf)));
      add_padding(8);

      ((((m_state.table_size() & (m_thread_state_align - 1)) == 0)==0)?lte_assert("(m_state.table_size() & (m_thread_state_align - 1)) == 0", 0, "lte_entry_point.cpp", 1163),((void)(0)):((void)(0)));

      add(tid, state.xstate.fx.fcw, "fcw", ((((0)) << 4) + (((1)) & 0xf)));
      add(tid, state.xstate.fx.fsw, "fsw", ((((0)) << 4) + (((1)) & 0xf)));
      add(tid, state.xstate.fx.ftw, "ftw", ((((0)) << 4) + (((1)) & 0xf)));
      add(tid, state.xstate.fx.fop, "fop", ((((0)) << 4) + (((1)) & 0xf)));
      add(tid, state.xstate.fx.fpuip, "fpuip", ((((0)) << 4) + (((1)) & 0xf)));
      add(tid, state.xstate.fx.fpudp, "fpudp", ((((0)) << 4) + (((1)) & 0xf)));
      add(tid, state.xstate.fx.mxcsr, "mxcsr", ((((0)) << 4) + (((1)) & 0xf)));
      add(tid, state.xstate.fx.mxcsr_mask, "mxcsr_mask", ((((0)) << 4) + (((1)) & 0xf)));
      add(tid, state.xstate.fx.st, "st", ((((0)) << 4) + (((1)) & 0xf)));
      add(tid, state.xstate.fx.xmm, "xmm", ((((0)) << 4) + (((1)) & 0xf)));
      add(state.xstate.fx.rsvd);

      add(tid, state.xstate.xhdr, "xhdr", ((((0)) << 4) + (((1)) & 0xf)));
      add(tid, state.xstate.ext_area2, "ext_area2", ((((0)) << 4) + (((1)) & 0xf)));
      add(tid, state.xstate.ext_area3, "ext_area3", ((((0)) << 4) + (((1)) & 0xf)));
      add(tid, state.xstate.ext_area4, "ext_area4", ((((0)) << 4) + (((1)) & 0xf)));
      add(tid, state.xstate.ext_area5, "ext_area5", ((((0)) << 4) + (((1)) & 0xf)));
      add(tid, state.xstate.ext_area6, "ext_area6", ((((0)) << 4) + (((1)) & 0xf)));
      add(tid, state.xstate.ext_area7, "ext_area7", ((((0)) << 4) + (((1)) & 0xf)));
      add(tid, state.xstate.ext_area8, "ext_area8", ((((0)) << 4) + (((1)) & 0xf)));
      add(tid, state.xstate.ext_area9, "ext_area9", ((((0)) << 4) + (((1)) & 0xf)));

      add(tid, &state.segdesc[LTE_REG_FS-LTE_REG_SR_FIRST], sizeof(state.segdesc[LTE_REG_FS-LTE_REG_SR_FIRST]), "fs.segdesc", E64_LOBJECT);
      add(tid, state.srstate.fs.sel.v, "fs.sel.v", ((((0)) << 4) + (((1)) & 0xf)));
      add(tid, state.srstate.fs_base, "fs_base", ((((0)) << 4) + (((1)) & 0xf)));
      add(tid, &state.segdesc[LTE_REG_GS-LTE_REG_SR_FIRST], sizeof(state.segdesc[LTE_REG_GS-LTE_REG_SR_FIRST]), "gs.segdesc", E64_LOBJECT);
      add(tid, state.srstate.gs.sel.v, "gs.sel.v", ((((0)) << 4) + (((1)) & 0xf)));
      add(tid, state.srstate.gs_base, "gs_base", ((((0)) << 4) + (((1)) & 0xf)));

      add(tid, state.gprstate.rdi, "rdi", ((((0)) << 4) + (((1)) & 0xf)));
      add(tid, state.gprstate.rsi, "rsi", ((((0)) << 4) + (((1)) & 0xf)));
      add(tid, state.gprstate.rbp, "rbp", ((((0)) << 4) + (((1)) & 0xf)));
      add(tid, state.gprstate.r8, "r8", ((((0)) << 4) + (((1)) & 0xf)));
      add(tid, state.gprstate.r9, "r9", ((((0)) << 4) + (((1)) & 0xf)));
      add(tid, state.gprstate.r10, "r10", ((((0)) << 4) + (((1)) & 0xf)));
      add(tid, state.gprstate.r11, "r11", ((((0)) << 4) + (((1)) & 0xf)));
      add(tid, state.gprstate.r12, "r12", ((((0)) << 4) + (((1)) & 0xf)));
      add(tid, state.gprstate.r13, "r13", ((((0)) << 4) + (((1)) & 0xf)));
      add(tid, state.gprstate.r14, "r14", ((((0)) << 4) + (((1)) & 0xf)));
      add(tid, state.gprstate.r15, "r15", ((((0)) << 4) + (((1)) & 0xf)));
      add(tid, state.gprstate.rdx, "rdx", ((((0)) << 4) + (((1)) & 0xf)));
      add(tid, state.gprstate.rcx, "rcx", ((((0)) << 4) + (((1)) & 0xf)));
      add(tid, state.gprstate.rbx, "rbx", ((((0)) << 4) + (((1)) & 0xf)));
      add(tid, state.gprstate.rax, "rax", ((((0)) << 4) + (((1)) & 0xf)));
      add(tid, state.gprstate.rflags, "rflags", ((((0)) << 4) + (((1)) & 0xf)));
      m_thread_ip_offs = m_state.table_size() - thread_data_offs;

      lte_uint64_t rip = m_entry_va + (reinterpret_cast<char*>((&((entry64_t*)0)->tst[tid]))-reinterpret_cast<char*>(0));
      add(tid, &rip, 8, "tst.rip", E64_LOBJECT);
      add(tid, state.gprstate.rsp, "rsp", ((((0)) << 4) + (((1)) & 0xf)));

      m_thread_state_size = m_state.table_size() - thread_data_offs;

      lte_size_t tail_bytes_count = m_thread_state_size & (m_thread_state_align - 1);
      if(tail_bytes_count)
      {
         m_state.pad(m_thread_state_align - tail_bytes_count);
         m_thread_state_size = m_state.table_size() - thread_data_offs;
      }
   }

   if(dmap_pages && dmap_pages_num)
   {
      m_dmap_pages_num = dmap_pages_num;
      m_dmap_offs = m_state.table_size();
      add(dmap_pages, dmap_pages_num * 8, "dmap.pages", E64_LOBJECT);
   }
}

void entry_point64_t::enable_modify_ldt(bool enable)
{
   entry64_t* e = (entry64_t*)m_entry;
   e->modify_ldt_fs = e->modify_ldt_gs = (enable ? 0x050f : 0xc031);
}

void entry_point64_t::set_proc_start_callback(const char* name)
{
   entry64_t* e = (entry64_t*)m_entry;
   sym& s = m_code_symbols[m_pstart_cbk_sym];

   if(s.name)
      free(const_cast<char*>(s.name));

   if(name)
   {
      s.name = strdup(name);
      s.offs = 0;
      s.size = 0;
      s.info = ((((1)) << 4) + (((0)) & 0xf)),
      s.rela = &m_code_rela[0];
      s.rela->r_offset = (reinterpret_cast<char*>((&((entry64_t*)0)->on_pstart_cbk))-reinterpret_cast<char*>(0));
      s.rela->r_info = ((((Elf64_Xword) (0)) << 32) + (1));
      s.rela->r_addend = 0;
      e->on_pstart = ((entry64_t*)s_entry64)->on_pstart;
   }
   else
   {
      e->on_pstart.opcode = 0xe9;
      e->on_pstart.offset = 0;
      s.name = __null;
      s.rela = __null;
   }
}

void entry_point64_t::set_proc_exit_callback(const char* name)
{
   entry64_t* e = (entry64_t*)m_entry;
   sym& s = m_code_symbols[m_pexit_cbk_sym];

   if(s.name)
      free(const_cast<char*>(s.name));

   if(get_config().no_monitor_thread())
   {
      e->on_pexit.opcode = 0;
      e->on_pexit.offset = 0;
      s.name = __null;
      s.rela = __null;
   }
   else if(name)
   {
      s.name = strdup(name);
      s.offs = 0;
      s.size = 0;
      s.info = ((((1)) << 4) + (((0)) & 0xf)),
      s.rela = &m_code_rela[1];
      s.rela->r_offset = (reinterpret_cast<char*>((&((entry64_t*)0)->on_pexit_cbk))-reinterpret_cast<char*>(0));
      s.rela->r_info = ((((Elf64_Xword) (0)) << 32) + (1));
      s.rela->r_addend = 0;
      e->on_pexit = ((entry64_t*)s_entry64)->on_pexit;
   }
   else
   {
      e->on_pexit.opcode = 0xe9;
      e->on_pexit.offset = 0;
      s.name = __null;
      s.rela = __null;
   }
}

void entry_point64_t::set_thread_start_callback(const char* name)
{
   entry64_t* e = (entry64_t*)m_entry;
   sym& s = m_code_symbols[m_tstart_cbk_sym];

   if(s.name)
      free(const_cast<char*>(s.name));

   if(name)
   {
      s.name = strdup(name);
      s.offs = 0;
      s.size = 0;
      s.info = ((((1)) << 4) + (((0)) & 0xf)),
      s.rela = &m_code_rela[2];
      s.rela->r_offset = (reinterpret_cast<char*>((&((entry64_t*)0)->on_tstart_cbk))-reinterpret_cast<char*>(0));
      s.rela->r_info = ((((Elf64_Xword) (0)) << 32) + (1));
      s.rela->r_addend = 0;
      e->on_tstart = ((entry64_t*)s_entry64)->on_tstart;
      e->thread_init_jmp1.offset = ((entry64_t*)s_entry64)->thread_init_jmp1.offset;
      e->thread_init_jmp2.offset = ((entry64_t*)s_entry64)->thread_init_jmp2.offset;
   }
   else
   {
      e->on_tstart.opcode = 0xe9;
      e->on_tstart.offset = E64_THREAD_START_NOCBK_OFFS - (E64_ON_TSTART_CALLOP_OFFS + sizeof(e->on_tstart));
      e->thread_init_jmp1.offset = ((entry64_t*)s_entry64)->thread_init_jmp1.offset + (E64_THREAD_START_NOCBK_OFFS - E64_ON_TSTART_CALLOP_OFFS);
      e->thread_init_jmp2.offset = ((entry64_t*)s_entry64)->thread_init_jmp2.offset + (E64_THREAD_START_NOCBK_OFFS - E64_ON_TSTART_CALLOP_OFFS);
      s.name = __null;
      s.rela = __null;
   }
}

void entry_point64_t::set_callback_stack_size(lte_uint32_t size)
{
   entry64_t* e = (entry64_t*)m_entry;
   e->cbk_stack_size = (size > 8) ? size : 8;
}

void entry_point64_t::set_start_roi_mark(lte_uint32_t tag, lte_uint32_t type)
{
   entry64_t* e = (entry64_t*)m_entry;
   if(type == ROI_TYPE_SNIPER)
      e->roi_tag_sniper = tag;
   else if(type == ROI_TYPE_SSC)
      e->roi_tag_ssc = tag;
   else if(type == ROI_TYPE_SIMICS)
      e->roi_tag_simics = 0x4711 | (tag << 16);
}

void entry_point64_t::set_magic2_tag(lte_uint32_t tag, lte_uint32_t type)
{
   entry64_t* e = (entry64_t*)m_entry;
   e->magic1_tag1_simics = e->magic1_tag2_simics = 0x4711 | (tag << 16);
}

void entry_point64_t::set_roi_mark_thread(lte_uint32_t tid)
{
   entry64_t* e = (entry64_t*)m_entry;
   e->roi_check = (tid < m_threads_num) ? 0xdb85 : 0x02eb;
}
