/*BEGIN_LEGAL 
BSD License 

Copyright (c)2019 Intel Corporation. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
END_LEGAL */
#include "lte_entry_point.h"
#include "lte_portability.h"
#include "lte_utils.h"
#include "lte_config.h"

#include <iostream>
#ifdef DEBUG_ENTRY_POINT_STATE_LAYOUT
#include <iostream>
#include <iomanip>
#define print_hex(v, w) std::hex<<std::setfill('0')<<std::setw(w)<<(v)<<std::setfill(' ')<<std::dec
#endif

const lte_uint8_t FXRSTOR_OPCODE = 0x0c;
const lte_uint8_t XRSTOR_OPCODE = 0x2c;

#define ENTRY_POINT_DECLARATION_BEGIN(name) \
   struct name { union {

#define ENTRY_POINT_DECLARATION_END() \
   } __lte_packed; } __lte_packed

#define ENTRY_POINT_ITEM_TYPE_BEGIN() \
   struct name { union {

#define ENTRY_POINT_ITEM_TYPE_END() \
   } __lte_packed; } __lte_packed

#define ENTRY_POINT_ITEM(type, offs, name) \
   struct { \
      lte_uint8_t pad_##name[offs]; \
      type name; \
   } __lte_packed

#define ENTRY_POINT_ARRAY(type, offs, name, size) \
   struct { \
      lte_uint8_t pad_##name[offs]; \
      type name size; \
   } __lte_packed



#define ROI_MARK_SNIPER   0xdb876600000000b8
#define ROI_MARK_SSC      0x90676400000000bb
#define ROI_MARK_SIMICS   0x90a20f00000000b8
#define MAKE_ROI_MARK(mark, tag) \
   (((lte_uint64_t)(mark))|(((lte_uint64_t)(tag))<<8))

struct entry64_data_t {
   //   0: threads counter
   //   4: futex 1
   //   8: control mask (from argv)
   //  16: futex 2
   lte_uint32_t num_threads;
   lte_uint32_t futex1;
   lte_uint64_t control_mask;
   lte_uint32_t futex2;
} __lte_packed;

static lte_uint8_t s_entry64[] = {
//<pbs.cbk_on_start>:
 /*  0*/ 0x49, 0xbc, 0x00, 0x00, 0x00, 0x00, 0x00,      //movabs $0x000000,%r12
 /*  7*/ 0x00, 0x00, 0x00,                              //
 /*  a*/ 0xeb, 0x16,                                    //jmp    <pbs.cbk>
//<pbs.cbk_on_exit>:
 /*  c*/ 0x49, 0xbc, 0x00, 0x00, 0x00, 0x00, 0x00,      //movabs $0x000000,%r12
 /* 13*/ 0x00, 0x00, 0x00,                              //
 /* 16*/ 0xeb, 0x0a,                                    //jmp    <pbs.cbk>
//<pbs.cbk_on_thread_start>:
 /* 18*/ 0x49, 0xbc, 0x00, 0x00, 0x00, 0x00, 0x00,      //movabs $0x0000030%r12
 /* 1f*/ 0x00, 0x00, 0x00,                              //
//<pbs.cbk>:
 /* 22*/ 0x49, 0x89, 0xe6,                              //mov    %rsp,%r14
 /* 25*/ 0xbd, 0x00, 0x00, 0x40, 0x00,                  //mov    $0x400000,%ebp
 /* 2a*/ 0x31, 0xff,                                    //xor    %edi,%edi
 /* 2c*/ 0x89, 0xee,                                    //mov    %ebp,%esi
 /* 2e*/ 0xba, 0x07, 0x00, 0x00, 0x00,                  //mov    $0x7,%edx
 /* 33*/ 0x41, 0xba, 0x22, 0x01, 0x00, 0x00,            //mov    $0x122,%r10d
 /* 39*/ 0xb8, 0x09, 0x00, 0x00, 0x00,                  //mov    $0x9,%eax
 /* 3e*/ 0x0f, 0x05,                                    //syscall
 /* 40*/ 0x48, 0x8d, 0x64, 0x05, 0x00,                  //lea    0x0(%rbp,%rax,1),%rsp
 /* 45*/ 0x48, 0x89, 0xdf,                              //mov    %rbx,%rdi
 /* 48*/ 0x49, 0x8d, 0x76, 0x08,                        //lea    0x8(%r14),%rsi
 /* 4c*/ 0x49, 0x8b, 0x56, 0xf8,                        //mov    -0x8(%r14),%rdx
 /* 50*/ 0x41, 0xff, 0xd4,                              //callq  *%r12
 /* 53*/ 0x49, 0x89, 0xc4,                              //mov    %rax,%r12
 /* 56*/ 0x48, 0x89, 0xe7,                              //mov    %rsp,%rdi
 /* 59*/ 0x89, 0xee,                                    //mov    %ebp,%esi
 /* 5b*/ 0x48, 0x29, 0xef,                              //sub    %rbp,%rdi
 /* 5e*/ 0xb8, 0x0b, 0x00, 0x00, 0x00,                  //mov    $0xb,%eax
 /* 63*/ 0x0f, 0x05,                                    //syscall
 /* 65*/ 0x4c, 0x89, 0xf4,                              //mov    %r14,%rsp
 /* 68*/ 0xc3,                                          //retq
//<_start>:
 /* 69*/ 0xbf, 0x11, 0x0f, 0x04, 0x00,                  //mov    $0x40f11,%edi
 /* 6e*/ 0x48, 0x89, 0xe6,                              //mov    %rsp,%rsi
 /* 71*/ 0xb8, 0x38, 0x00, 0x00, 0x00,                  //mov    $0x38,%eax
 /* 76*/ 0x0f, 0x05,                                    //syscall
 /* 78*/ 0x48, 0x85, 0xc0,                              //test   %rax,%rax
 /* 7b*/ 0x74, 0x1d,                                    //je     <pbs.start_threads>
 /* 7d*/ 0x89, 0xc7,                                    //mov    %eax,%edi
 /* 7f*/ 0x31, 0xf6,                                    //xor    %esi,%esi
 /* 81*/ 0xba, 0x00, 0x00, 0x00, 0x00,                  //mov    $0x0,%edx
 /* 86*/ 0x4d, 0x31, 0xd2,                              //xor    %r10,%r10
 /* 89*/ 0xb8, 0x3d, 0x00, 0x00, 0x00,                  //mov    $0x3d,%eax
 /* 8e*/ 0x0f, 0x05,                                    //syscall
 /* 90*/ 0xe8, 0x77, 0xff, 0xff, 0xff,                  //callq  <pbs.cbk_on_exit>
 /* 95*/ 0xe9, 0xb8, 0x00, 0x00, 0x00,                  //jmpq   <pbs.exit>
//<pbs.start_threads>:
 /* 9a*/ 0xe8, 0xbc, 0x00, 0x00, 0x00,                  //callq  <pbs.parse_args>
 /* 9f*/ 0x48, 0x8b, 0x7c, 0x24, 0x08,                  //mov    0x8(%rsp),%rdi
 /* a4*/ 0x31, 0xf6,                                    //xor    %esi,%esi
 /* a6*/ 0xb8, 0x02, 0x00, 0x00, 0x00,                  //mov    $0x2,%eax
 /* ab*/ 0x0f, 0x05,                                    //syscall
 /* ad*/ 0x49, 0x89, 0xc4,                              //mov    %rax,%r12
 /* b0*/ 0x48, 0xbd, 0x00, 0x00, 0x00, 0x00, 0x00,      //movabs $0x0000000000000000,%rbp
 /* b7*/ 0x00, 0x00, 0x00,                              //
 /* ba*/ 0x49, 0xbe, 0x00, 0x00, 0x00, 0x00, 0x00,      //movabs $0x0000000000000000,%r14
 /* c1*/ 0x00, 0x00, 0x00,                              //
 /* c4*/ 0xbb, 0x00, 0x00, 0x00, 0x00,                  //mov    $0x00000000,%ebx
//<pbs.remap_page>:
 /* c9*/ 0x48, 0x8b, 0x7d, 0x00,                        //mov    0x0(%rbp),%rdi
 /* cd*/ 0xbe, 0x00, 0x10, 0x00, 0x00,                  //mov    $0x1000,%esi
 /* d2*/ 0xb8, 0x0b, 0x00, 0x00, 0x00,                  //mov    $0xb,%eax
 /* d7*/ 0x0f, 0x05,                                    //syscall
 /* d9*/ 0x48, 0x8b, 0x7d, 0x00,                        //mov    0x0(%rbp),%rdi
 /* dd*/ 0xbe, 0x00, 0x10, 0x00, 0x00,                  //mov    $0x1000,%esi
 /* e2*/ 0xba, 0x07, 0x00, 0x00, 0x00,                  //mov    $0x7,%edx
 /* e7*/ 0x41, 0xba, 0x12, 0x00, 0x00, 0x00,            //mov    $0x12,%r10d
 /* ed*/ 0x4d, 0x89, 0xe0,                              //mov    %r12,%r8
 /* f0*/ 0x4d, 0x89, 0xf1,                              //mov    %r14,%r9
 /* f3*/ 0xb8, 0x09, 0x00, 0x00, 0x00,                  //mov    $0x9,%eax
 /* f8*/ 0x0f, 0x05,                                    //syscall
 /* fa*/ 0x49, 0x81, 0xc6, 0x00, 0x10, 0x00, 0x00,      //add    $0x1000,%r14
 /*101*/ 0x48, 0x83, 0xc5, 0x08,                        //add    $0x8,%rbp
 /*105*/ 0x83, 0xeb, 0x01,                              //sub    $0x1,%ebx
 /*108*/ 0x75, 0xbf,                                    //jne    <pbs.remap_page>
 /*10a*/ 0x4c, 0x89, 0xe7,                              //mov    %r12,%rdi
 /*10d*/ 0xb8, 0x03, 0x00, 0x00, 0x00,                  //mov    $0x3,%eax
 /*112*/ 0x0f, 0x05,                                    //syscall
//<pbs.start>:
 /*114*/ 0xbb, 0x01, 0x00, 0x00, 0x00,                  //mov    $0x1,%ebx
 /*119*/ 0x48, 0xbc, 0x00, 0x10, 0x60, 0x00, 0x00,      //movabs $0x601000,%rsp
 /*120*/ 0x00, 0x00, 0x00,                              //
 /*123*/ 0x4c, 0x8d, 0x7c, 0x24, 0xff,                  //lea    -0x1(%rsp),%r15
 /*128*/ 0xe8, 0xd3, 0xfe, 0xff, 0xff,                  //callq  <pbs.cbk_on_start>
//<pbs.create_thread>:
 /*12d*/ 0xff, 0xcb,                                    //dec    %ebx
 /*12f*/ 0x0f, 0x84, 0x84, 0x00, 0x00, 0x00,            //je     <pbs.init_thread>
 /*135*/ 0xbf, 0x11, 0x0f, 0x05, 0x00,                  //mov    $0x50f11,%edi
 /*13a*/ 0x48, 0x89, 0xe6,                              //mov    %rsp,%rsi
 /*13d*/ 0xb8, 0x38, 0x00, 0x00, 0x00,                  //mov    $0x38,%eax
 /*142*/ 0x0f, 0x05,                                    //syscall
 /*144*/ 0x48, 0x85, 0xc0,                              //test   %rax,%rax
 /*147*/ 0x74, 0x70,                                    //je     <pbs.init_thread>
 /*149*/ 0x48, 0x81, 0xc4, 0xc0, 0x0b, 0x00, 0x00,      //add    $0xbc0,%rsp
 /*150*/ 0xeb, 0xdb,                                    //jmp    <pbs.create_thread>
//<pbs.exit>:
 /*152*/ 0x31, 0xff,                                    //xor    %edi,%edi
 /*154*/ 0xb8, 0xe7, 0x00, 0x00, 0x00,                  //mov    $0xe7,%eax
 /*159*/ 0x0f, 0x05,                                    //syscall
//<pbs.parse_args>:
 /*15b*/ 0x4c, 0x8b, 0x74, 0x24, 0x08,                  //mov    0x8(%rsp),%r14
 /*160*/ 0x48, 0x8b, 0x7c, 0x24, 0x10,                  //mov    0x10(%rsp),%rdi
 /*165*/ 0x4d, 0x31, 0xed,                              //xor    %r13,%r13
 /*168*/ 0xeb, 0x16,                                    //jmp    <pbs.argloop.enter>
//<pbs.argloop>:
 /*16a*/ 0x49, 0xff, 0xce,                              //dec    %r14
 /*16d*/ 0x74, 0x19,                                    //je     <pbs.argloop.exit>
//<pbs.argloop.opt1>:
 /*16f*/ 0xe8, 0x29, 0x00, 0x00, 0x00,                  //callq  <pbs.argcmp.opt1>
 /*174*/ 0x75, 0x06,                                    //jne    <pbs.argloop.next>
 /*176*/ 0x49, 0x83, 0xcd, 0x01,                        //or     $0x1,%r13
 /*17a*/ 0xeb, 0xee,                                    //jmp    <pbs.argloop>
//<pbs.argloop.next>:
 /*17c*/ 0x85, 0xc0,                                    //test   %eax,%eax
 /*17e*/ 0x74, 0xea,                                    //je     <pbs.argloop>
//<pbs.argloop.enter>:
 /*180*/ 0x0f, 0xb6, 0x07,                              //movzbl (%rdi),%eax
 /*183*/ 0x48, 0xff, 0xc7,                              //inc    %rdi
 /*186*/ 0xeb, 0xf4,                                    //jmp    <pbs.argloop.next>
//<pbs.argloop.exit>:
 /*188*/ 0x48, 0xbf, 0x00, 0x00, 0x00, 0x00, 0x00,      //movabs $0x000000,%rdi
 /*18f*/ 0x00, 0x00, 0x00,                              //
 /*192*/ 0x4c, 0x87, 0x2f,                              //xchg   %r13,(%rdi)
 /*195*/ 0xc3,                                          //retq
//<pbs.str.opt1>:
 /*196*/ 0x2d, 0x66, 0x75, 0x74, 0x65, 0x78, 0x00,      // "-futex"
//<pbs.argcmp.opt1>:
 /*19d*/ 0x48, 0x8d, 0x35, 0xf2, 0xff, 0xff, 0xff,      //lea    -0xe(%rip),%rsi #<pbs.str.opt1>
//<pbs.argcmp>:
 /*1a4*/ 0x0f, 0xb6, 0x07,                              //movzbl (%rdi),%eax
 /*1a7*/ 0x0f, 0xb6, 0x16,                              //movzbl (%rsi),%edx
 /*1aa*/ 0x48, 0xff, 0xc7,                              //inc    %rdi
 /*1ad*/ 0x48, 0xff, 0xc6,                              //inc    %rsi
 /*1b0*/ 0x29, 0xc2,                                    //sub    %eax,%edx
 /*1b2*/ 0x75, 0x04,                                    //jne    <pbs.argcmp.exit>
 /*1b4*/ 0x85, 0xc0,                                    //test   %eax,%eax
 /*1b6*/ 0x75, 0xec,                                    //jne    <pbs.argcmp>
//<pbs.argcmp.exit>:
 /*1b8*/ 0xc3,                                          //retq
//<pbs.init_thread>:
 /*1b9*/ 0xe8, 0x5a, 0xfe, 0xff, 0xff,                  //callq  <pbs.cbk_on_thread_start>
 /*1be*/ 0x4d, 0x89, 0xe5,                              //mov    %r12,%r13
 /*1c1*/ 0xb8, 0x03, 0x00, 0x00, 0x00,                  //mov    $0x3,%eax
 /*1c6*/ 0xba, 0x00, 0x00, 0x00, 0x00,                  //mov    $0x0,%edx
 /*1cb*/ 0x0f, 0xae, 0x2c, 0x24,                        //xrstor (%rsp)
 /*1cf*/ 0x48, 0x81, 0xc4, 0xf0, 0x0a, 0x00, 0x00,      //add    $0xaf0,%rsp
 /*1d6*/ 0xb8, 0x9a, 0x00, 0x00, 0x00,                  //mov    $0x9a,%eax
 /*1db*/ 0xbf, 0x01, 0x00, 0x00, 0x00,                  //mov    $0x1,%edi
 /*1e0*/ 0x48, 0x89, 0xe6,                              //mov    %rsp,%rsi
 /*1e3*/ 0xba, 0x10, 0x00, 0x00, 0x00,                  //mov    $0x10,%edx
 /*1e8*/ 0x0f, 0x05,                                    //syscall
 /*1ea*/ 0x48, 0x85, 0xc0,                              //test   %rax,%rax
 /*1ed*/ 0x0f, 0x85, 0x5f, 0xff, 0xff, 0xff,            //jne    <pbs.exit>
 /*1f3*/ 0x8e, 0x64, 0x24, 0x10,                        //mov    0x10(%rsp),%fs
 /*1f7*/ 0xb8, 0x9e, 0x00, 0x00, 0x00,                  //mov    $0x9e,%eax
 /*1fc*/ 0xbf, 0x02, 0x10, 0x00, 0x00,                  //mov    $0x1002,%edi
 /*201*/ 0x48, 0x8b, 0x74, 0x24, 0x14,                  //mov    0x14(%rsp),%rsi
 /*206*/ 0x0f, 0x05,                                    //syscall
 /*208*/ 0x48, 0x85, 0xc0,                              //test   %rax,%rax
 /*20b*/ 0x0f, 0x85, 0x41, 0xff, 0xff, 0xff,            //jne    <pbs.exit>
 /*211*/ 0xb8, 0x9a, 0x00, 0x00, 0x00,                  //mov    $0x9a,%eax
 /*216*/ 0xbf, 0x01, 0x00, 0x00, 0x00,                  //mov    $0x1,%edi
 /*21b*/ 0x48, 0x8d, 0x74, 0x24, 0x1c,                  //lea    0x1c(%rsp),%rsi
 /*220*/ 0xba, 0x10, 0x00, 0x00, 0x00,                  //mov    $0x10,%edx
 /*225*/ 0x0f, 0x05,                                    //syscall
 /*227*/ 0x48, 0x85, 0xc0,                              //test   %rax,%rax
 /*22a*/ 0x0f, 0x85, 0x22, 0xff, 0xff, 0xff,            //jne    <pbs.exit>
 /*230*/ 0x8e, 0x6c, 0x24, 0x2c,                        //mov    0x2c(%rsp),%gs
 /*234*/ 0xb8, 0x9e, 0x00, 0x00, 0x00,                  //mov    $0x9e,%eax
 /*239*/ 0xbf, 0x01, 0x10, 0x00, 0x00,                  //mov    $0x1001,%edi
 /*23e*/ 0x48, 0x8b, 0x74, 0x24, 0x30,                  //mov    0x30(%rsp),%rsi
 /*243*/ 0x0f, 0x05,                                    //syscall
 /*245*/ 0x48, 0x85, 0xc0,                              //test   %rax,%rax
 /*248*/ 0x0f, 0x85, 0x04, 0xff, 0xff, 0xff,            //jne    <pbs.exit>
 /*24e*/ 0x48, 0x83, 0xc4, 0x38,                        //add    $0x38,%rsp
 /*252*/ 0x41, 0xf7, 0x47, 0x08, 0x01, 0x00, 0x00,      //testl  $0x1,0x8(%r15)
 /*259*/ 0x00,                                          //
 /*25a*/ 0x74, 0x68,                                    //je     <pbs.spinloop_barrier>
 /*25c*/ 0x85, 0xdb,                                    //test   %ebx,%ebx
 /*25e*/ 0x74, 0x42,                                    //je     <pbs.sync_master_threads>
 /*260*/ 0xf0, 0x41, 0x83, 0x2f, 0x01,                  //lock subl $0x1,(%r15)
 /*265*/ 0x75, 0x09,                                    //jne    <pbs.wait>
 /*267*/ 0x49, 0x8d, 0x7f, 0x04,                        //lea    0x4(%r15),%rdi
 /*26b*/ 0xe8, 0x14, 0x00, 0x00, 0x00,                  //callq  <pbs.sys_futex_wake>
//<pbs.wait>:
 /*270*/ 0x49, 0x8d, 0x7f, 0x10,                        //lea    0x10(%r15),%rdi
 /*274*/ 0xe8, 0x02, 0x00, 0x00, 0x00,                  //callq  <pbs.sys_futex_wait>
 /*279*/ 0xeb, 0x72,                                    //jmp    <pbs.exit_barrier>
//<pbs.sys_futex_wait>:
 /*27b*/ 0xbe, 0x80, 0x00, 0x00, 0x00,                  //mov    $0x80,%esi
 /*280*/ 0x31, 0xd2,                                    //xor    %edx,%edx
 /*282*/ 0xeb, 0x0d,                                    //jmp    <pbs.sys_futex>
//<pbs.sys_futex_wake>:
 /*284*/ 0xbe, 0x81, 0x00, 0x00, 0x00,                  //mov    $0x81,%esi
 /*289*/ 0xba, 0x7f, 0xff, 0xff, 0xff,                  //mov    $0x7fffffff,%edx
 /*28e*/ 0xf0, 0x09, 0x37,                              //lock or %esi,(%rdi)
//<pbs.sys_futex>:
 /*291*/ 0x4d, 0x31, 0xd2,                              //xor    %r10,%r10
 /*294*/ 0x4d, 0x31, 0xc0,                              //xor    %r8,%r8
 /*297*/ 0x4d, 0x31, 0xc9,                              //xor    %r9,%r9
 /*29a*/ 0xb8, 0xca, 0x00, 0x00, 0x00,                  //mov    $0xca,%eax
 /*29f*/ 0x0f, 0x05,                                    //syscall
 /*2a1*/ 0xc3,                                          //retq
//<pbs.sync_master_threads>:
 /*2a2*/ 0xf0, 0x41, 0x83, 0x2f, 0x01,                  //lock subl $0x1,(%r15)
 /*2a7*/ 0x74, 0x09,                                    //je     <pbs.wake>
 /*2a9*/ 0x49, 0x8d, 0x7f, 0x04,                        //lea    0x4(%r15),%rdi
 /*2ad*/ 0xe8, 0xc9, 0xff, 0xff, 0xff,                  //callq  <pbs.sys_futex_wait>
//<pbs.wake>:
 /*2b2*/ 0x49, 0x8d, 0x7f, 0x10,                        //lea    0x10(%r15),%rdi
 /*2b6*/ 0xb8, 0x11, 0x47, 0x01, 0x00,                  //mov    $0x14711,%eax
 /*2bb*/ 0x0f, 0xa2,                                    //cpuid
 /*2bd*/ 0xe8, 0xc2, 0xff, 0xff, 0xff,                  //callq  <pbs.sys_futex_wake>
 /*2c2*/ 0xeb, 0x29,                                    //jmp    <pbs.exit_barrier>
//<pbs.spinloop_barrier>:
 /*2c4*/ 0x31, 0xed,                                    //xor    %ebp,%ebp
 /*2c6*/ 0xf7, 0xd5,                                    //not    %ebp
 /*2c8*/ 0xf0, 0x41, 0x01, 0x2f,                        //lock add %ebp,(%r15)
 /*2cc*/ 0x85, 0xdb,                                    //test   %ebx,%ebx
 /*2ce*/ 0x74, 0x0a,                                    //je     <pbs.wait_threads>
//<pbs.barrier_loop>:
 /*2d0*/ 0x41, 0x85, 0x6f, 0x04,                        //test   %ebp,0x4(%r15)
 /*2d4*/ 0x75, 0x17,                                    //jne    <pbs.exit_barrier>
 /*2d6*/ 0xf3, 0x90,                                    //pause
 /*2d8*/ 0xeb, 0xf6,                                    //jmp    <pbs.barrier_loop>
//<pbs.wait_threads>:
 /*2da*/ 0x41, 0x85, 0x2f,                              //test   %ebp,(%r15)
 /*2dd*/ 0xf3, 0x90,                                    //pause
 /*2df*/ 0x75, 0xf9,                                    //jne    <pbs.wait_threads>
 /*2e1*/ 0xb8, 0x11, 0x47, 0x02, 0x00,                  //mov    $0x24711,%eax
 /*2e6*/ 0x0f, 0xa2,                                    //cpuid
 /*2e8*/ 0xf0, 0x41, 0x09, 0x6f, 0x04,                  //lock or %ebp,0x4(%r15)
//<pbs.exit_barrier>:
 /*2ed*/ 0x4d, 0x85, 0xed,                              //test   %r13,%r13
 /*2f0*/ 0x74, 0x3d,                                    //je     <pbs.perf.end>
 /*2f2*/ 0x41, 0x8b, 0x5d, 0x00,                        //mov    0x0(%r13),%ebx
//<pbs.perf.reset>:
 /*2f6*/ 0x89, 0xdf,                                    //mov    %ebx,%edi
 /*2f8*/ 0xbe, 0x03, 0x24, 0x00, 0x00,                  //mov    $0x2403,%esi
 /*2fd*/ 0xba, 0x01, 0x00, 0x00, 0x00,                  //mov    $0x1,%edx
 /*302*/ 0xb8, 0x10, 0x00, 0x00, 0x00,                  //mov    $0x10,%eax
 /*307*/ 0x0f, 0x05,                                    //syscall
//<pbs.perf.enable>:
 /*309*/ 0x89, 0xdf,                                    //mov    %ebx,%edi
 /*30b*/ 0xbe, 0x00, 0x24, 0x00, 0x00,                  //mov    $0x2400,%esi
 /*310*/ 0xba, 0x01, 0x00, 0x00, 0x00,                  //mov    $0x1,%edx
 /*315*/ 0xb8, 0x10, 0x00, 0x00, 0x00,                  //mov    $0x10,%eax
 /*31a*/ 0x0f, 0x05,                                    //syscall
//<pbs.perf.refresh>:
 /*31c*/ 0x89, 0xdf,                                    //mov    %ebx,%edi
 /*31e*/ 0xbe, 0x02, 0x24, 0x00, 0x00,                  //mov    $0x2402,%esi
 /*323*/ 0xba, 0x01, 0x00, 0x00, 0x00,                  //mov    $0x1,%edx
 /*328*/ 0xb8, 0x10, 0x00, 0x00, 0x00,                  //mov    $0x10,%eax
 /*32d*/ 0x0f, 0x05,                                    //syscall
//<pbs.perf.end>:
 /*32f*/ 0x5f,                                          //pop    %rdi
 /*330*/ 0x5e,                                          //pop    %rsi
 /*331*/ 0x5d,                                          //pop    %rbp
 /*332*/ 0x41, 0x58,                                    //pop    %r8
 /*334*/ 0x41, 0x59,                                    //pop    %r9
 /*336*/ 0x41, 0x5a,                                    //pop    %r10
 /*338*/ 0x41, 0x5b,                                    //pop    %r11
 /*33a*/ 0x41, 0x5c,                                    //pop    %r12
 /*33c*/ 0x41, 0x5d,                                    //pop    %r13
 /*33e*/ 0x41, 0x5e,                                    //pop    %r14
 /*340*/ 0x41, 0x5f,                                    //pop    %r15
 /*342*/ 0x85, 0xdb,                                    //test   %ebx,%ebx
 /*344*/ 0x75, 0x17,                                    //jne    <pbs.mark_end>
//<pbs.mark>:
 /*346*/ 0xb8, 0x01, 0x00, 0x00, 0x00,                  //mov    $0x1,%eax
 /*34b*/ 0x66, 0x87, 0xdb,                              //xchg   %bx,%bx
 /*34e*/ 0xbb, 0x01, 0x00, 0x00, 0x00,                  //mov    $0x1,%ebx
 /*353*/ 0x64, 0x67, 0x90,                              //fs addr32 nop
 /*356*/ 0xb8, 0x11, 0x47, 0x01, 0x00,                  //mov    $0x14711,%eax
 /*35b*/ 0x0f, 0xa2,                                    //cpuid
//<pbs.mark_end>:
 /*35d*/ 0x5a,                                          //pop    %rdx
 /*35e*/ 0x59,                                          //pop    %rcx
 /*35f*/ 0x5b,                                          //pop    %rbx
 /*360*/ 0x58,                                          //pop    %rax
 /*361*/ 0x9d,                                          //popfq
 /*362*/ 0xc3,                                          //retq
//<pbs.tst.start>:
 /*363*/ 0x5c,                                          //pop    %rsp
 /*364*/ 0xff, 0x25, 0x00, 0x00, 0x00, 0x00,            //jmpq   *0x0(%rip)
 /*36a*/ 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
};

typedef enum {
   E64_ON_PSTART_OFFS          = 0x00,
   E64_ON_PSTART_CBKADDR_OFFS  = 0x02,
   E64_ON_PEXIT_OFFS           = 0x0c,
   E64_ON_PEXIT_CBKADDR_OFFS   = 0x0e,
   E64_ON_TSTART_OFFS          = 0x18,
   E64_ON_TSTART_CBKADDR_OFFS  = 0x1a,
   E64_CBK_OFFS                = 0x22,
   E64_CBK_STACK_SIZE_OFFS     = 0x26,
   E64_MONITOR_THREAD_OFFS     = 0x69,
   E64_ON_PEXIT_CALLOP_OFFS    = 0x90,  // callq  pbs.cbk_on_exit
   E64_ON_PEXIT_ADDR_OFFS      = 0x91,  // callq  pbs.cbk_on_exit
   E64_PARSEARGS_CALLOP_OFFS   = 0x9a,  // parse_args call in case of remap
   E64_REMAP_OFFS              = 0x9f,  // pbs.remap
   E64_DMAP_PAGES_OFFS         = 0xb2,  // remap pages addresses
   E64_DMAP_FILE_OFFSET_OFFS   = 0xbc,  // remap pages file offset
   E64_DMAP_PAGES_NUM_OFFS     = 0xc5,  // number of remap pages
   E64_PARSEARGSNR_CALLOP_OFFS = 0x10f, // parse_args call if no remap
   E64_START_OFFS              = 0x114, // _start
   E64_THREAD_NUM_OFFS         = 0x115, // number of threads
   E64_ARCH_STATE_ADDR_OFFS    = 0x11b, // architecture state address
   E64_ENTRY_POINT_DATA_OFFS   = 0x127,
   E64_ON_PSTART_CALLOP_OFFS   = 0x128, // callq  pbs.cbk_on_start
   E64_ON_PSTART_ADDR_OFFS     = 0x129, // callq  pbs.cbk_on_start
   E64_CREATE_THREAD_OFFS      = 0x12d, // pbs.create_thread
   E64_THREAD_INIT_JMP1_OFFS   = 0x12f,
   E64_THREAD_INIT_JMP2_OFFS   = 0x147,
   E64_CPU_STATE_SIZE_OFFS     = 0x14c,
   E64_EXIT_OFFS               = 0x152, // .exit
   E64_PARSE_ARGS_OFFS         = 0x15b,
   E64_CONTROL_MASK_ADDR_OFFS  = 0x18a,
   E64_THREAD_START_OFFS       = 0x1b9, // pbs.init_thread
   E64_ON_TSTART_CALLOP_OFFS   = 0x1b9, // callq  pbs.cbk_on_thread_start
   E64_ON_TSTART_ADDR_OFFS     = 0x1ba, // callq  pbs.cbk_on_thread_start
   E64_THREAD_START_NOCBK_OFFS = 0x1c1,
   E64_XFEATURES_LO_OFFS       = 0x1c2, // lo dword of xfeatures mask
   E64_XFEATURES_HI_OFFS       = 0x1c7, // hi dword of xfeatures mask
   E64_FXRSTOR_OPCODE_OFFS     = 0x1cd,
   E64_MODIFY_LDT_FS_OFFS      = 0x1e8,
   E64_MODIFY_LDT_GS_OFFS      = 0x225,
   E64_SYNC_CODE_OFFS          = 0x252,
   E64_FUTEX_NUM_WAITERS       = 0x28a,
   E64_SIM_M1_TAG1_SIMICS_OFFS = 0x2b7,
   E64_SIM_M1_TAG2_SIMICS_OFFS = 0x2e2,
   E64_SYNC_CODE_END_OFFS      = 0x2ed,
   E64_SIM_ROI_CHECK           = 0x342,
   E64_SIM_ROI_TAG_SNIPER_OFFS = 0x347,
   E64_SIM_ROI_TAG_SSC_OFFS    = 0x34f,
   E64_SIM_ROI_TAG_SIMICS_OFFS = 0x357,
   E64_THREAD_ENTRY_TABLE_OFFS = 0x363,
   E64_THREAD_START_ADDR_OFFS  = 0x36a, // thread start address#endif
   E64_SIZE                    = sizeof(s_entry64),
   E64_ON_PSTART_SIZE          = E64_ON_PEXIT_OFFS-E64_ON_PSTART_OFFS,
   E64_ON_PEXIT_SIZE           = E64_ON_TSTART_OFFS-E64_ON_PEXIT_OFFS,
   E64_ON_TSTART_SIZE          = E64_CBK_OFFS-E64_ON_TSTART_OFFS,
   E64_CBK_SIZE                = E64_MONITOR_THREAD_OFFS-E64_CBK_OFFS,
   E64_MONITOR_THREAD_SIZE     = E64_PARSEARGS_CALLOP_OFFS-E64_MONITOR_THREAD_OFFS,
   E64_PARSEARGS_CALLOP_SIZE   = 5,
   E64_PARSEARGSNR_CALLOP_SIZE = E64_PARSEARGS_CALLOP_SIZE,
   E64_REMAP_SIZE              = E64_START_OFFS-E64_REMAP_OFFS,
   E64_START_SIZE              = E64_EXIT_OFFS-E64_START_OFFS,
   E64_EXIT_SIZE               = E64_THREAD_START_OFFS-E64_EXIT_OFFS,
   E64_PARSE_ARGS_SIZE         = E64_THREAD_START_OFFS-E64_PARSE_ARGS_OFFS,
   E64_SYNC_CODE_SIZE          = (E64_SYNC_CODE_END_OFFS-E64_SYNC_CODE_OFFS),
   E64_THREAD_START_SIZE       = E64_THREAD_ENTRY_TABLE_OFFS-E64_THREAD_START_OFFS,
   E64_THREAD_ENTRY_SIZE       = E64_SIZE-E64_THREAD_ENTRY_TABLE_OFFS,
   E64_THREAD_START_ADDR_SIZE  = 8
} entry64_layout_enum_t;

ENTRY_POINT_DECLARATION_BEGIN(thread_entry64_t)
   ENTRY_POINT_ITEM(lte_uint64_t, E64_THREAD_START_ADDR_OFFS-E64_THREAD_ENTRY_TABLE_OFFS, ip);
ENTRY_POINT_DECLARATION_END();

typedef struct {
   lte_uint8_t opcode;
   lte_uint32_t offset;
} __lte_packed lte_callop_t;

typedef struct {
   lte_uint8_t opcode;
   lte_uint32_t offset;
} __lte_packed lte_jmpop_t;

typedef struct {
   lte_uint16_t opcode;
   lte_uint32_t offset;
} __lte_packed lte_jcop_t;

typedef struct {
   lte_uint8_t opcode;
   lte_uint8_t offset;
} __lte_packed lte_jcsop_t;

ENTRY_POINT_DECLARATION_BEGIN(entry64_t)
   ENTRY_POINT_ITEM(lte_uint64_t, E64_ON_PSTART_CBKADDR_OFFS, on_pstart_cbk);
   ENTRY_POINT_ITEM(lte_uint64_t, E64_ON_PEXIT_CBKADDR_OFFS, on_pexit_cbk);
   ENTRY_POINT_ITEM(lte_uint64_t, E64_ON_TSTART_CBKADDR_OFFS, on_tstart_cbk);
   ENTRY_POINT_ITEM(lte_uint32_t, E64_CBK_STACK_SIZE_OFFS, cbk_stack_size);
   ENTRY_POINT_ITEM(uint8_t, E64_MONITOR_THREAD_OFFS, monitor_thread_start);
   ENTRY_POINT_ITEM(lte_callop_t, E64_ON_PEXIT_CALLOP_OFFS, on_pexit);
   ENTRY_POINT_ITEM(lte_callop_t, E64_PARSEARGS_CALLOP_OFFS, parse_argv_call_dmap);
   ENTRY_POINT_ITEM(lte_jmpop_t, E64_REMAP_OFFS, remap_pages_start);
   ENTRY_POINT_ITEM(lte_uint64_t, E64_DMAP_PAGES_OFFS, dmap_pages);
   ENTRY_POINT_ITEM(lte_uint64_t, E64_DMAP_FILE_OFFSET_OFFS, dmap_file_offset);
   ENTRY_POINT_ITEM(lte_uint32_t, E64_DMAP_PAGES_NUM_OFFS, dmap_pages_num);
   ENTRY_POINT_ITEM(lte_callop_t, E64_PARSEARGSNR_CALLOP_OFFS, parse_argv_call_nodmap);
   ENTRY_POINT_ITEM(lte_uint32_t, E64_THREAD_NUM_OFFS, threads_num);
   ENTRY_POINT_ITEM(lte_uint64_t, E64_ARCH_STATE_ADDR_OFFS, arch_state_addr);
   ENTRY_POINT_ITEM(lte_uint8_t, E64_ENTRY_POINT_DATA_OFFS, entry_point_data_offs);
   ENTRY_POINT_ITEM(lte_callop_t, E64_ON_PSTART_CALLOP_OFFS, on_pstart);
   ENTRY_POINT_ITEM(lte_jcop_t, E64_THREAD_INIT_JMP1_OFFS, thread_init_jmp1);
   ENTRY_POINT_ITEM(lte_jcsop_t, E64_THREAD_INIT_JMP2_OFFS, thread_init_jmp2);
   ENTRY_POINT_ITEM(lte_uint32_t, E64_CPU_STATE_SIZE_OFFS, arch_state_size);
   ENTRY_POINT_ITEM(lte_uint64_t, E64_CONTROL_MASK_ADDR_OFFS, control_mask_addr);
   ENTRY_POINT_ITEM(lte_callop_t, E64_ON_TSTART_CALLOP_OFFS, on_tstart);
   ENTRY_POINT_ITEM(lte_uint32_t, E64_XFEATURES_LO_OFFS, xfeature_lo);
   ENTRY_POINT_ITEM(lte_uint32_t, E64_XFEATURES_HI_OFFS, xfeature_hi);
   ENTRY_POINT_ITEM(lte_uint8_t, E64_FXRSTOR_OPCODE_OFFS, fxrstor);
   ENTRY_POINT_ITEM(lte_uint16_t, E64_MODIFY_LDT_FS_OFFS, modify_ldt_fs);
   ENTRY_POINT_ITEM(lte_uint16_t, E64_MODIFY_LDT_GS_OFFS, modify_ldt_gs);
   ENTRY_POINT_ITEM(lte_uint32_t, E64_FUTEX_NUM_WAITERS, futex_num_waiters);
   ENTRY_POINT_ITEM(lte_uint32_t, E64_SIM_M1_TAG1_SIMICS_OFFS, magic1_tag1_simics);
   ENTRY_POINT_ITEM(lte_uint32_t, E64_SIM_M1_TAG2_SIMICS_OFFS, magic1_tag2_simics);
   ENTRY_POINT_ITEM(lte_uint16_t, E64_SIM_ROI_CHECK, roi_check);
   ENTRY_POINT_ITEM(lte_uint32_t, E64_SIM_ROI_TAG_SNIPER_OFFS, roi_tag_sniper);
   ENTRY_POINT_ITEM(lte_uint32_t, E64_SIM_ROI_TAG_SSC_OFFS, roi_tag_ssc);
   ENTRY_POINT_ITEM(lte_uint32_t, E64_SIM_ROI_TAG_SIMICS_OFFS, roi_tag_simics);
   ENTRY_POINT_ARRAY(thread_entry64_t, E64_THREAD_ENTRY_TABLE_OFFS, tst, []);
ENTRY_POINT_DECLARATION_END();

#define E64_ITEM_SIZE(item)  sizeof(((entry64_t*)0)->item)
#define E64_ITEM_OFFS(item)  LTE_PTR2OFFS((&((entry64_t*)0)->item))
#define E64_DEFAULT_ENTRY()  ((entry64_t*)s_entry64)


static lte_uint8_t s_entry32[] = {
//_start:
  /* 0*/ 0xbd, 0x01, 0x00, 0x00, 0x00,       //mov    $0x1,%ebp
  /* 5*/ 0xbc, 0x00, 0x00, 0x00, 0x00,       //mov    $0x0,%esp
//.create_thread:
  /* a*/ 0x4d,                               //dec    %ebp
  /* b*/ 0x74, 0x26,                         //je     .thread_start
  /* d*/ 0xbb, 0x00, 0x8f, 0x01, 0x80,       //mov    $0x80018f00,%ebx
  /*12*/ 0x89, 0xe1,                         //mov    %esp,%ecx
  /*14*/ 0xb8, 0x78, 0x00, 0x00, 0x00,       //mov    $0x78,%eax
  /*19*/ 0xcd, 0x80,                         //int    $0x80
  /*1b*/ 0x85, 0xc0,                         //test   %eax,%eax
  /*1d*/ 0x74, 0x14,                         //je     .thread_start
  /*1f*/ 0x81, 0xc4, 0x80, 0x0b, 0x00, 0x00, //add    $0xb80,%esp
  /*25*/ 0xeb, 0xe3,                         //jmp    .create_thread
//.exit:
  /*27*/ 0xbb, 0x00, 0x00, 0x00, 0x00,       //mov    $0x0,%ebx
  /*2c*/ 0xb8, 0x01, 0x00, 0x00, 0x00,       //mov    $0x1,%eax
  /*31*/ 0xcd, 0x80,                         //int    $0x80
//.thread_start:
  /*33*/ 0x0f, 0xae, 0x0c, 0x24,             //fxrstor (%esp)
  /*37*/ 0x81, 0xc4, 0xf0, 0x0a, 0x00, 0x00, //add    $0xaf0,%esp
  /*3d*/ 0xb8, 0x7b, 0x00, 0x00, 0x00,       //mov    $0x7b,%eax
  /*42*/ 0xbb, 0x01, 0x00, 0x00, 0x00,       //mov    $0x1,%ebx
  /*47*/ 0x89, 0xe1,                         //mov    %esp,%ecx
  /*49*/ 0xba, 0x10, 0x00, 0x00, 0x00,       //mov    $0x10,%edx
  /*4e*/ 0xcd, 0x80,                         //int    $0x80
  /*50*/ 0x85, 0xc0,                         //test   %eax,%eax
  /*52*/ 0x75, 0xd3,                         //jne    .exit
  /*54*/ 0x8e, 0x64, 0x24, 0x10,             //mov    0x10(%esp),%fs
  /*58*/ 0xb8, 0x7b, 0x00, 0x00, 0x00,       //mov    $0x7b,%eax
  /*5d*/ 0xbb, 0x01, 0x00, 0x00, 0x00,       //mov    $0x1,%ebx
  /*62*/ 0x8d, 0x4c, 0x24, 0x14,             //lea    0x14(%esp),%ecx
  /*66*/ 0xba, 0x10, 0x00, 0x00, 0x00,       //mov    $0x10,%edx
  /*6b*/ 0xcd, 0x80,                         //int    $0x80
  /*6d*/ 0x85, 0xc0,                         //test   %eax,%eax
  /*6f*/ 0x75, 0xb6,                         //jne    .exit
  /*71*/ 0x8e, 0x6c, 0x24, 0x24,             //mov    0x24(%esp),%gs
  /*75*/ 0x83, 0xc4, 0x28,                   //add    $0x28,%esp
  /*78*/ 0x9d,                               //popf
  /*79*/ 0x61,                               //popa
  /*7a*/ 0xc3,                               //ret
//.tst.t0:
  /*7b*/ 0x5c,                               //pop    %esp
  /*7c*/ 0xe9, 0xfc, 0xff, 0xff, 0xff,       //jmp    .tst.t0+0x2
};

typedef enum {
   E32_START_OFFS              = 0x00,  // _start
   E32_THREAD_NUM_OFFS         = 0x01,  // number of threads
   E32_ARCH_STATE_ADDR_OFFS    = 0x06,  // architecture state address
   E32_CREATE_THREAD_OFFS      = 0x0a,  // .create_thread
   E32_CPU_STATE_SIZE_OFFS     = 0x21,
   E32_EXIT_OFFS               = 0x27,  // .exit
   E32_THREAD_START_OFFS       = 0x33,  // .thread_start
   E32_MODIFY_LDT_FS_OFFS      = 0x4e,
   E32_MODIFY_LDT_GS_OFFS      = 0x6b,
   E32_THREAD_ENTRY_TABLE_OFFS = 0x7b,
   E32_THREAD_START_ADDR_OFFS  = 0x7d,  // thread start address

   E32_SIZE                    = sizeof(s_entry32),
   E32_START_SIZE              = E32_EXIT_OFFS - E32_START_OFFS,
   E32_EXIT_SIZE               = E32_THREAD_START_OFFS - E32_EXIT_OFFS,
   E32_THREAD_START_SIZE       = E32_THREAD_ENTRY_TABLE_OFFS - E32_THREAD_START_OFFS,
   E32_THREAD_ENTRY_SIZE       = E32_SIZE - E32_THREAD_ENTRY_TABLE_OFFS,
   E32_THREAD_START_ADDR_SIZE  = 4
} entry32_layout_enum_t;

ENTRY_POINT_DECLARATION_BEGIN(thread_entry32_t)
   ENTRY_POINT_ITEM(lte_uint32_t, E32_THREAD_START_ADDR_OFFS-E32_THREAD_ENTRY_TABLE_OFFS, ip);
ENTRY_POINT_DECLARATION_END();

ENTRY_POINT_DECLARATION_BEGIN(entry32_t)
   ENTRY_POINT_ITEM(lte_uint32_t, E32_THREAD_NUM_OFFS, threads_num);
   ENTRY_POINT_ITEM(lte_uint32_t, E32_ARCH_STATE_ADDR_OFFS, arch_state_addr);
   ENTRY_POINT_ITEM(lte_uint32_t, E32_CPU_STATE_SIZE_OFFS, arch_state_size);
   ENTRY_POINT_ITEM(lte_uint16_t, E32_MODIFY_LDT_FS_OFFS, modify_ldt_fs);
   ENTRY_POINT_ITEM(lte_uint16_t, E32_MODIFY_LDT_GS_OFFS, modify_ldt_gs);
   ENTRY_POINT_ARRAY(thread_entry32_t, E32_THREAD_ENTRY_TABLE_OFFS, tst, []);
ENTRY_POINT_DECLARATION_END();

#define E32_ITEM_SIZE(item)  sizeof(((entry32_t*)0)->item)
#define E32_ITEM_OFFS(item)  LTE_PTR2OFFS((&((entry32_t*)0)->item))

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
   {s_start, E32_START_OFFS, E32_START_SIZE, E32_GFUNC, NULL},
   {s_exit, E32_EXIT_OFFS, E32_EXIT_SIZE, E32_GFUNC, NULL},
   {s_thread_start, E32_THREAD_START_OFFS, E32_THREAD_START_SIZE, E32_GFUNC, NULL},
};

static entry_point_t::sym entry_point64_symtab[] =
{
   {s_start, E64_START_OFFS, E64_START_SIZE, E64_GFUNC, NULL}, // Must be first!!!
   {s_exit, E64_EXIT_OFFS, E64_EXIT_SIZE, E64_GFUNC, NULL},
   {s_parse_args, E64_PARSE_ARGS_OFFS, E64_PARSE_ARGS_SIZE, E64_GFUNC, NULL},
   {s_thread_start, E64_THREAD_START_OFFS, E64_THREAD_START_SIZE, E64_GFUNC, NULL},
   {s_on_start, E64_ON_PSTART_OFFS, E64_ON_PSTART_SIZE, E64_GFUNC, NULL},
   {s_on_exit, E64_ON_PEXIT_OFFS, E64_ON_PEXIT_SIZE, E64_GFUNC, NULL},
   {s_on_thread_start, E64_ON_TSTART_OFFS, E64_ON_TSTART_SIZE, E64_GFUNC, NULL},
   {s_cbk, E64_CBK_OFFS, E64_CBK_SIZE, E64_GFUNC, NULL},
};

static void clear_code(void* pcode, lte_size_t size, lte_uint8_t end = 0xcc)
{
   LTE_ASSERT(pcode != NULL && size > 0);
   memset(pcode, 0, size);
   ((lte_uint8_t*)pcode)[size-1] = end;
}

entry_point_t* entry_point_t::create_entry_point(Elf_Class_t e_class, lte_uint32_t threads_num)
{
   switch(e_class)
   {
      case ELFCLASS32:
         return new entry_point32_t(threads_num);
      case ELFCLASS64:
         return new entry_point64_t(threads_num);
      default:
         ;//LTE_ASSERT((e_class!=ELFCLASS32)&&(e_class!=ELFCLASS64));
   }
   return NULL;
}

entry_point_t* entry_point_t::create_entry_point(Elf_Class_t e_class, void* ptr, lte_size_t size)
{
   switch(e_class)
   {
      case ELFCLASS32:
         return new entry_point32_t(ptr, size);
      case ELFCLASS64:
         return new entry_point64_t(ptr, size);
      default:
         ;//LTE_ASSERT((e_class!=ELFCLASS32)&&(e_class!=ELFCLASS64));
   }
   return NULL;
}

entry_point_t::entry_point_t()
{
   m_entry = NULL;
   m_entry_buffer = NULL;
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
         free(LTE_CCAST(char*, it->name));

   clear_initial_state();
}

void entry_point_t::clear_initial_state()
{
   for(std::vector<sym>::iterator it = m_data_symbols.begin(); it != m_data_symbols.end(); ++it)
      if(it->name)
         free(LTE_CCAST(char*, it->name));

   m_data_symbols.clear();
   m_state.clear();
}

#define SYM(tid, state, sym, sym_info) \
   tid, state.sym, #sym, sym_info

#define SYM64(tid, state, sym) \
   SYM(tid, state, sym, ELF64_ST_INFO(STB_LOCAL, STT_OBJECT))

#define SYM32(tid, state, sym) \
   SYM(tid, state, sym, ELF32_ST_INFO(STB_LOCAL, STT_OBJECT))

template<typename T>
void entry_point_t::add(const T& sym_data)
{
   #ifdef DEBUG_ARCH_STATE_SECTION
   lte_size_t offs = m_state.table_size();
   #endif
   m_state << sym_data;
   #ifdef DEBUG_ENTRY_POINT_STATE_LAYOUT
   std::cout << print_hex(offs, 8) << ":(padding) " << (m_state.table_size() - offs) << '\n';
   #endif
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
   s.rela = NULL;
   m_data_symbols.push_back(s);

   #ifdef DEBUG_ENTRY_POINT_STATE_LAYOUT
   std::cout << print_hex(m_data_symbols.back().offs, 8) << ':'<< m_data_symbols.back().name << ' ' << m_data_symbols.back().size << '\n';
   #endif
}

entry_point32_t::entry_point32_t(lte_uint32_t threads_num)
{
   LTE_ASSERT(threads_num>0);

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
      s.offs = E32_ITEM_OFFS(tst[i]);
      s.size = E32_ITEM_SIZE(tst[i]) - E32_ITEM_SIZE(tst[i].ip);
      s.info = E32_GFUNC;
      s.rela = NULL;
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
   LTE_ASSERT(threads_num == e->threads_num);

   setup_initial_state(threads_num, states, dmap_pages, dmap_pages_num);

   e->arch_state_size = m_thread_state_size;

   for(lte_uint32_t i = 0; i < threads_num; ++i)
   {
      memcpy(&e->tst[i], ((entry32_t*)s_entry32)->tst, sizeof(thread_entry32_t));
      e->tst[i].ip = states[i].eip - (m_entry_va + E32_ITEM_OFFS(tst[i]) + E32_ITEM_SIZE(tst[i]));
   }

   relocate_code(m_entry_va);
   relocate_data(m_entry_data_va);
}

void entry_point32_t::setup_initial_state(lte_uint32_t threads_num, lte_thread_state_t* states, void* dmap_pages, lte_uint32_t dmap_pages_num)
{
   entry32_t* e = (entry32_t*)m_entry;

   if(e)
   {
    LTE_ASSERT(threads_num == e->threads_num);
   }
   else
   {
    LTE_ASSERT(e);
   }

   clear_initial_state();

   for(size_t tid = 0; tid < threads_num; ++tid)
   {
      lte_thread_state_t& state = states[tid];
      lte_size_t thread_state_offs = m_state.table_size();

      add(SYM32(tid, state.xstate.fx, fcw));
      add(SYM32(tid, state.xstate.fx, fsw));
      add(SYM32(tid, state.xstate.fx, ftw));
      add(SYM32(tid, state.xstate.fx, fop));
      add(SYM32(tid, state.xstate.fx, fpuip));
      add(SYM32(tid, state.xstate.fx, fpudp));
      add(SYM32(tid, state.xstate.fx, mxcsr));
      add(SYM32(tid, state.xstate.fx, mxcsr_mask));
      add(SYM32(tid, state.xstate.fx, st));
      add(SYM32(tid, state.xstate.fx, xmm));
      add(state.xstate.fx.rsvd);

      add(SYM32(tid, state.xstate, xhdr));
      add(SYM32(tid, state.xstate, ext_area2));
      add(SYM32(tid, state.xstate, ext_area3));
      add(SYM32(tid, state.xstate, ext_area4));
      add(SYM32(tid, state.xstate, ext_area5));
      add(SYM32(tid, state.xstate, ext_area6));
      add(SYM32(tid, state.xstate, ext_area7));
      add(SYM32(tid, state.xstate, ext_area8));
      add(SYM32(tid, state.xstate, ext_area9));

      add(tid, &state.segdesc[LTE_REG_FS-LTE_REG_SR_FIRST], sizeof(state.segdesc[LTE_REG_FS-LTE_REG_SR_FIRST]), "fs.segdesc", E64_LOBJECT);
      add(SYM32(tid, state.srstate, fs.sel.v));
      add(tid, &state.segdesc[LTE_REG_GS-LTE_REG_SR_FIRST], sizeof(state.segdesc[LTE_REG_GS-LTE_REG_SR_FIRST]), "gs.segdesc", E64_LOBJECT);
      add(SYM32(tid, state.srstate, gs.sel.v));

      add(SYM32(tid, state.gprstate, edi));
      add(SYM32(tid, state.gprstate, esi));
      add(SYM32(tid, state.gprstate, ebp));
      add(state.gprstate.esp);
      add(SYM32(tid, state.gprstate, ebx));
      add(SYM32(tid, state.gprstate, edx));
      add(SYM32(tid, state.gprstate, ecx));
      add(SYM32(tid, state.gprstate, eax));
      add(SYM32(tid, state.gprstate, eflags));

      m_thread_ip_offs = m_state.table_size() - thread_state_offs;

      lte_uint32_t eip = m_entry_va + E32_ITEM_OFFS(tst[tid]);
      add(tid, &eip, 4, "tst.eip", E32_LOBJECT);
      add(SYM32(tid, state.gprstate, esp)); // must be last

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
   assert(m_thread_state_size);

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
   LTE_ASSERT(threads_num>0);

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
      //int len;
      sym s;

      //len = 
      sprintf(buffer, s_tst, i);
      s.name = strdup(buffer);
      s.offs = E64_ITEM_OFFS(tst[i]);
      s.size = E64_ITEM_SIZE(tst[i]) - E64_ITEM_SIZE(tst[i].ip);
      s.info = E64_GFUNC;
      s.rela = NULL;
      m_code_symbols.push_back(s);

      // Why is an LOBJECT being added to m_code_symbols?
      // This causes a local object appear in the middle of global objects
      // in the resulting symbol table causing the loader to complain
      //strcpy(buffer + len, ".rip");
      //s.name = strdup(buffer);
      //s.offs = E64_ITEM_OFFS(tst[i].ip);
      //s.size = E64_ITEM_SIZE(tst[i].ip);
      //s.info = E64_LOBJECT;
      //s.rela = NULL;
      //m_code_symbols.push_back(s);
   }

   m_code_rela.resize(3);
   sym s;
   s.name = NULL;
   s.rela = NULL;
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

   e->thread_init_jmp1.offset = E64_DEFAULT_ENTRY()->thread_init_jmp1.offset + (E64_THREAD_START_NOCBK_OFFS - E64_ON_TSTART_CALLOP_OFFS);
   e->thread_init_jmp2.offset = E64_DEFAULT_ENTRY()->thread_init_jmp2.offset + (E64_THREAD_START_NOCBK_OFFS - E64_ON_TSTART_CALLOP_OFFS);
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
   LTE_ASSERT(threads_num == e->threads_num);

   setup_initial_state(threads_num, states, dmap_pages, dmap_pages_num);

   e->arch_state_size = m_thread_state_size;

   lte_uint64_t xstate_bv = 0;
   for(lte_uint32_t i = 0; i < threads_num; ++i)
   {
      memcpy(&e->tst[i], E64_DEFAULT_ENTRY()->tst, sizeof(thread_entry64_t));
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
   // change _start symbol offset
   m_code_symbols[0].offs = m_start_offs;
   m_code_symbols[0].size = m_start_size;

   e->futex_num_waiters = e->threads_num;

   relocate_code(m_entry_va);
   relocate_data(m_entry_data_va);
}

void entry_point64_t::relocate_code(lte_addr_t va)
{
   assert(m_thread_state_size);

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
   e->control_mask_addr = va + LTE_FIELDOFFS(entry64_data_t, control_mask);
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

   LTE_ASSERT(threads_num == e->threads_num);

   clear_initial_state();


   ///////////////////////////////////////////////////////////////////////////
   //   0: threads counter
   //   4: futex 1
   //   8: control mask (from argv)
   //  16: futex 2
   // ...: padding
   // -16: thread icount
   //  -8: stack place holder (aligned to 8 byte boundary)
   //   0: cpu_state (aligned to 64 byte boundary)
   ///////////////////////////////////////////////////////////////////////////
   #define E64_STACK_PLACEHOLDER 8
   #define E64_THREAD_DATA_SIZE  (sizeof(states->icount)+E64_STACK_PLACEHOLDER)
   entry64_data_t proc_data;

   // offset of thread's state
   m_thread_state_offs = __lte_align_up(sizeof(proc_data) + E64_THREAD_DATA_SIZE, m_thread_state_align);

   LTE_ASSERT(m_thread_state_offs<128);
   e->entry_point_data_offs = (lte_uint8_t)((-m_thread_state_offs)&0xff);

   proc_data.num_threads = threads_num;
   proc_data.futex1 = 0;
   proc_data.control_mask = 0;
   proc_data.futex2 = 0;
   add(proc_data);

   // offset of thread's data: [icount, stack placeholder, state]
   lte_size_t thread_data_offs = __lte_align(m_thread_state_offs - E64_THREAD_DATA_SIZE, m_thread_state_align);
   lte_size_t thread_data_padding = m_thread_state_offs - (thread_data_offs + E64_THREAD_DATA_SIZE);
   lte_size_t padding = m_thread_state_offs - (sizeof(proc_data) + E64_THREAD_DATA_SIZE);

   for(size_t tid = 0; tid < threads_num; ++tid, padding = thread_data_padding, thread_data_offs = m_state.table_size())
   {
      lte_thread_state_t& state = states[tid];

      add_padding(padding); // padding
      add(SYM64(tid, state, icount));
      add_padding(E64_STACK_PLACEHOLDER);

      LTE_ASSERT((m_state.table_size() & (m_thread_state_align - 1)) == 0);

      add(SYM64(tid, state.xstate.fx, fcw));
      add(SYM64(tid, state.xstate.fx, fsw));
      add(SYM64(tid, state.xstate.fx, ftw));
      add(SYM64(tid, state.xstate.fx, fop));
      add(SYM64(tid, state.xstate.fx, fpuip));
      add(SYM64(tid, state.xstate.fx, fpudp));
      add(SYM64(tid, state.xstate.fx, mxcsr));
      add(SYM64(tid, state.xstate.fx, mxcsr_mask));
      add(SYM64(tid, state.xstate.fx, st));
      add(SYM64(tid, state.xstate.fx, xmm));
      add(state.xstate.fx.rsvd);

      add(SYM64(tid, state.xstate, xhdr));
      add(SYM64(tid, state.xstate, ext_area2));
      add(SYM64(tid, state.xstate, ext_area3));
      add(SYM64(tid, state.xstate, ext_area4));
      add(SYM64(tid, state.xstate, ext_area5));
      add(SYM64(tid, state.xstate, ext_area6));
      add(SYM64(tid, state.xstate, ext_area7));
      add(SYM64(tid, state.xstate, ext_area8));
      add(SYM64(tid, state.xstate, ext_area9));

      add(tid, &state.segdesc[LTE_REG_FS-LTE_REG_SR_FIRST], sizeof(state.segdesc[LTE_REG_FS-LTE_REG_SR_FIRST]), "fs.segdesc", E64_LOBJECT);
      add(SYM64(tid, state.srstate, fs.sel.v));
      add(SYM64(tid, state.srstate, fs_base));
      add(tid, &state.segdesc[LTE_REG_GS-LTE_REG_SR_FIRST], sizeof(state.segdesc[LTE_REG_GS-LTE_REG_SR_FIRST]), "gs.segdesc", E64_LOBJECT);
      add(SYM64(tid, state.srstate, gs.sel.v));
      add(SYM64(tid, state.srstate, gs_base));

      add(SYM64(tid, state.gprstate, rdi));
      add(SYM64(tid, state.gprstate, rsi));
      add(SYM64(tid, state.gprstate, rbp));
      add(SYM64(tid, state.gprstate, r8));
      add(SYM64(tid, state.gprstate, r9));
      add(SYM64(tid, state.gprstate, r10));
      add(SYM64(tid, state.gprstate, r11));
      add(SYM64(tid, state.gprstate, r12));
      add(SYM64(tid, state.gprstate, r13));
      add(SYM64(tid, state.gprstate, r14));
      add(SYM64(tid, state.gprstate, r15));
      add(SYM64(tid, state.gprstate, rdx));
      add(SYM64(tid, state.gprstate, rcx));
      add(SYM64(tid, state.gprstate, rbx));
      add(SYM64(tid, state.gprstate, rax));
      add(SYM64(tid, state.gprstate, rflags));
      m_thread_ip_offs = m_state.table_size() - thread_data_offs;

      lte_uint64_t rip = m_entry_va + E64_ITEM_OFFS(tst[tid]);
      add(tid, &rip, 8, "tst.rip", E64_LOBJECT);
      add(SYM64(tid, state.gprstate, rsp)); // must be last

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
      free(LTE_CCAST(char*, s.name));

   if(name)
   {
      s.name = strdup(name);
      s.offs = 0;
      s.size = 0;
      s.info = ELF64_ST_INFO(STB_GLOBAL, STT_NOTYPE),
      s.rela = &m_code_rela[0];
      s.rela->r_offset = E64_ITEM_OFFS(on_pstart_cbk);
      s.rela->r_info = ELF64_R_INFO(0,R_X86_64_64);
      s.rela->r_addend = 0;
      e->on_pstart = E64_DEFAULT_ENTRY()->on_pstart;
   }
   else
   {
      e->on_pstart.opcode = 0xe9;
      e->on_pstart.offset = 0;
      s.name = NULL;
      s.rela = NULL;
   }
}

void entry_point64_t::set_proc_exit_callback(const char* name)
{
   entry64_t* e = (entry64_t*)m_entry;
   sym& s = m_code_symbols[m_pexit_cbk_sym];

   if(s.name)
      free(LTE_CCAST(char*, s.name));

   if(get_config().no_monitor_thread())
   {
      e->on_pexit.opcode = 0;
      e->on_pexit.offset = 0;
      s.name = NULL;
      s.rela = NULL;
   }
   else if(name)
   {
      s.name = strdup(name);
      s.offs = 0;
      s.size = 0;
      s.info = ELF64_ST_INFO(STB_GLOBAL, STT_NOTYPE),
      s.rela = &m_code_rela[1];
      s.rela->r_offset = E64_ITEM_OFFS(on_pexit_cbk);
      s.rela->r_info = ELF64_R_INFO(0,R_X86_64_64);
      s.rela->r_addend = 0;
      e->on_pexit = E64_DEFAULT_ENTRY()->on_pexit;
   }
   else
   {
      e->on_pexit.opcode = 0xe9;
      e->on_pexit.offset = 0;
      s.name = NULL;
      s.rela = NULL;
   }
}

void entry_point64_t::set_thread_start_callback(const char* name)
{
   entry64_t* e = (entry64_t*)m_entry;
   sym& s = m_code_symbols[m_tstart_cbk_sym];

   if(s.name)
      free(LTE_CCAST(char*, s.name));

   if(name)
   {
      s.name = strdup(name);
      s.offs = 0;
      s.size = 0;
      s.info = ELF64_ST_INFO(STB_GLOBAL, STT_NOTYPE),
      s.rela = &m_code_rela[2];
      s.rela->r_offset = E64_ITEM_OFFS(on_tstart_cbk);
      s.rela->r_info = ELF64_R_INFO(0,R_X86_64_64);
      s.rela->r_addend = 0;
      e->on_tstart = E64_DEFAULT_ENTRY()->on_tstart;
      e->thread_init_jmp1.offset = E64_DEFAULT_ENTRY()->thread_init_jmp1.offset;
      e->thread_init_jmp2.offset = E64_DEFAULT_ENTRY()->thread_init_jmp2.offset;
   }
   else
   {
      e->on_tstart.opcode = 0xe9;
      e->on_tstart.offset = E64_THREAD_START_NOCBK_OFFS - (E64_ON_TSTART_CALLOP_OFFS + sizeof(e->on_tstart));
      e->thread_init_jmp1.offset = E64_DEFAULT_ENTRY()->thread_init_jmp1.offset + (E64_THREAD_START_NOCBK_OFFS - E64_ON_TSTART_CALLOP_OFFS);
      e->thread_init_jmp2.offset = E64_DEFAULT_ENTRY()->thread_init_jmp2.offset + (E64_THREAD_START_NOCBK_OFFS - E64_ON_TSTART_CALLOP_OFFS);
      s.name = NULL;
      s.rela = NULL;
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
