//<pbs.cbk_on_start>:
 /*  0*/ 0x49, 0xbc, 0x52, 0x04, 0x40, 0x00, 0x00, //movabs $0x400452,%r12
 /*  7*/ 0x00, 0x00, 0x00,
 /*  a*/ 0xeb, 0x16,                               //jmp 4000d2 <pbs.cbk>
//<pbs.cbk_on_exit>:
 /*  c*/ 0x49, 0xbc, 0x53, 0x04, 0x40, 0x00, 0x00, //movabs $0x400453,%r12
 /* 13*/ 0x00, 0x00, 0x00,
 /* 16*/ 0xeb, 0x0a,                               //jmp 4000d2 <pbs.cbk>
//<pbs.cbk_on_thread_start>:
 /* 18*/ 0x49, 0xbc, 0x51, 0x04, 0x40, 0x00, 0x00, //movabs $0x400451,%r12
 /* 1f*/ 0x00, 0x00, 0x00,
//<pbs.cbk>:
 /* 22*/ 0x49, 0x89, 0xe6,                         //mov %rsp,%r14
 /* 25*/ 0xbd, 0x00, 0x00, 0x40, 0x00,             //mov $0x400000,%ebp
 /* 2a*/ 0x31, 0xff,                               //xor %edi,%edi
 /* 2c*/ 0x89, 0xee,                               //mov %ebp,%esi
 /* 2e*/ 0xba, 0x07, 0x00, 0x00, 0x00,             //mov $0x7,%edx
 /* 33*/ 0x41, 0xba, 0x22, 0x01, 0x00, 0x00,       //mov $0x122,%r10d
 /* 39*/ 0xb8, 0x09, 0x00, 0x00, 0x00,             //mov $0x9,%eax
 /* 3e*/ 0x0f, 0x05,                               //syscall 
 /* 40*/ 0x48, 0x8d, 0x64, 0x05, 0x00,             //lea 0x0(%rbp,%rax,1),%rsp
 /* 45*/ 0x48, 0x89, 0xdf,                         //mov %rbx,%rdi
 /* 48*/ 0x49, 0x8d, 0x76, 0x08,                   //lea 0x8(%r14),%rsi
 /* 4c*/ 0x49, 0x8b, 0x56, 0xf8,                   //mov -0x8(%r14),%rdx
 /* 50*/ 0x41, 0xff, 0xd4,                         //callq *%r12
 /* 53*/ 0x49, 0x89, 0xc4,                         //mov %rax,%r12
 /* 56*/ 0x48, 0x89, 0xe7,                         //mov %rsp,%rdi
 /* 59*/ 0x89, 0xee,                               //mov %ebp,%esi
 /* 5b*/ 0x48, 0x29, 0xef,                         //sub %rbp,%rdi
 /* 5e*/ 0xb8, 0x0b, 0x00, 0x00, 0x00,             //mov $0xb,%eax
 /* 63*/ 0x0f, 0x05,                               //syscall 
 /* 65*/ 0x4c, 0x89, 0xf4,                         //mov %r14,%rsp
 /* 68*/ 0xc3,                                     //retq 
//<_start>:
 /* 69*/ 0xbf, 0x11, 0x0f, 0x04, 0x00,             //mov $0x40f11,%edi
 /* 6e*/ 0x48, 0x89, 0xe6,                         //mov %rsp,%rsi
 /* 71*/ 0xb8, 0x38, 0x00, 0x00, 0x00,             //mov $0x38,%eax
 /* 76*/ 0x0f, 0x05,                               //syscall 
 /* 78*/ 0x48, 0x85, 0xc0,                         //test %rax,%rax
 /* 7b*/ 0x74, 0x1d,                               //je 40014a <pbs.start_threads>
 /* 7d*/ 0x89, 0xc7,                               //mov %eax,%edi
 /* 7f*/ 0x31, 0xf6,                               //xor %esi,%esi
 /* 81*/ 0xba, 0x00, 0x00, 0x00, 0x00,             //mov $0x0,%edx
 /* 86*/ 0x4d, 0x31, 0xd2,                         //xor %r10,%r10
 /* 89*/ 0xb8, 0x3d, 0x00, 0x00, 0x00,             //mov $0x3d,%eax
 /* 8e*/ 0x0f, 0x05,                               //syscall 
 /* 90*/ 0xe8, 0x77, 0xff, 0xff, 0xff,             //callq 4000bc <pbs.cbk_on_exit>
 /* 95*/ 0xe9, 0xb8, 0x00, 0x00, 0x00,             //jmpq 400202 <pbs.exit>
//<pbs.start_threads>:
 /* 9a*/ 0xe8, 0xbc, 0x00, 0x00, 0x00,             //callq 40020b <pbs.parse_args>
 /* 9f*/ 0x48, 0x8b, 0x7c, 0x24, 0x08,             //mov 0x8(%rsp),%rdi
 /* a4*/ 0x31, 0xf6,                               //xor %esi,%esi
 /* a6*/ 0xb8, 0x02, 0x00, 0x00, 0x00,             //mov $0x2,%eax
 /* ab*/ 0x0f, 0x05,                               //syscall 
 /* ad*/ 0x49, 0x89, 0xc4,                         //mov %rax,%r12
 /* b0*/ 0x48, 0xbd, 0xff, 0xff, 0xff, 0xff, 0xff, //movabs $0xffffffffffffffff,%rbp
 /* b7*/ 0xff, 0xff, 0xff,
 /* ba*/ 0x49, 0xbe, 0xff, 0xff, 0xff, 0xff, 0xff, //movabs $0xffffffffffffffff,%r14
 /* c1*/ 0xff, 0xff, 0xff,
 /* c4*/ 0xbb, 0xff, 0xff, 0xff, 0xff,             //mov $0xffffffff,%ebx
//<pbs.remap_page>:
 /* c9*/ 0x48, 0x8b, 0x7d, 0x00,                   //mov 0x0(%rbp),%rdi
 /* cd*/ 0xbe, 0x00, 0x10, 0x00, 0x00,             //mov $0x1000,%esi
 /* d2*/ 0xb8, 0x0b, 0x00, 0x00, 0x00,             //mov $0xb,%eax
 /* d7*/ 0x0f, 0x05,                               //syscall 
 /* d9*/ 0x48, 0x8b, 0x7d, 0x00,                   //mov 0x0(%rbp),%rdi
 /* dd*/ 0xbe, 0x00, 0x10, 0x00, 0x00,             //mov $0x1000,%esi
 /* e2*/ 0xba, 0x07, 0x00, 0x00, 0x00,             //mov $0x7,%edx
 /* e7*/ 0x41, 0xba, 0x12, 0x00, 0x00, 0x00,       //mov $0x12,%r10d
 /* ed*/ 0x4d, 0x89, 0xe0,                         //mov %r12,%r8
 /* f0*/ 0x4d, 0x89, 0xf1,                         //mov %r14,%r9
 /* f3*/ 0xb8, 0x09, 0x00, 0x00, 0x00,             //mov $0x9,%eax
 /* f8*/ 0x0f, 0x05,                               //syscall 
 /* fa*/ 0x49, 0x81, 0xc6, 0x00, 0x10, 0x00, 0x00, //add $0x1000,%r14
 /*101*/ 0x48, 0x83, 0xc5, 0x08,                   //add $0x8,%rbp
 /*105*/ 0x83, 0xeb, 0x01,                         //sub $0x1,%ebx
 /*108*/ 0x75, 0xbf,                               //jne 400179 <pbs.remap_page>
 /*10a*/ 0x4c, 0x89, 0xe7,                         //mov %r12,%rdi
 /*10d*/ 0xb8, 0x03, 0x00, 0x00, 0x00,             //mov $0x3,%eax
 /*112*/ 0x0f, 0x05,                               //syscall 
//<pbs.start>:
 /*114*/ 0xbb, 0x01, 0x00, 0x00, 0x00,             //mov $0x1,%ebx
 /*119*/ 0x48, 0xbc, 0x00, 0x10, 0x60, 0x00, 0x00, //movabs $0x601000,%rsp
 /*120*/ 0x00, 0x00, 0x00,
 /*123*/ 0x4c, 0x8d, 0x7c, 0x24, 0xff,             //lea -0x1(%rsp),%r15
 /*128*/ 0xe8, 0xd3, 0xfe, 0xff, 0xff,             //callq 4000b0 <pbs.cbk_on_start>
//<pbs.create_thread>:
 /*12d*/ 0xff, 0xcb,                               //dec %ebx
 /*12f*/ 0x0f, 0x84, 0x84, 0x00, 0x00, 0x00,       //je 400269 <pbs.init_thread>
 /*135*/ 0xbf, 0x11, 0x0f, 0x05, 0x00,             //mov $0x50f11,%edi
 /*13a*/ 0x48, 0x89, 0xe6,                         //mov %rsp,%rsi
 /*13d*/ 0xb8, 0x38, 0x00, 0x00, 0x00,             //mov $0x38,%eax
 /*142*/ 0x0f, 0x05,                               //syscall 
 /*144*/ 0x48, 0x85, 0xc0,                         //test %rax,%rax
 /*147*/ 0x74, 0x70,                               //je 400269 <pbs.init_thread>
 /*149*/ 0x48, 0x81, 0xc4, 0xc0, 0x0b, 0x00, 0x00, //add $0xbc0,%rsp
 /*150*/ 0xeb, 0xdb,                               //jmp 4001dd <pbs.create_thread>
//<pbs.exit>:
 /*152*/ 0x31, 0xff,                               //xor %edi,%edi
 /*154*/ 0xb8, 0x3c, 0x00, 0x00, 0x00,             //mov $0x3c,%eax
 /*159*/ 0x0f, 0x05,                               //syscall 
//<pbs.parse_args>:
 /*15b*/ 0x4c, 0x8b, 0x74, 0x24, 0x08,             //mov 0x8(%rsp),%r14
 /*160*/ 0x48, 0x8b, 0x7c, 0x24, 0x10,             //mov 0x10(%rsp),%rdi
 /*165*/ 0x4d, 0x31, 0xed,                         //xor %r13,%r13
 /*168*/ 0xeb, 0x16,                               //jmp 400230 <pbs.argloop.enter>
//<pbs.argloop>:
 /*16a*/ 0x49, 0xff, 0xce,                         //dec %r14
 /*16d*/ 0x74, 0x19,                               //je 400238 <pbs.argloop.exit>
//<pbs.argloop.opt1>:
 /*16f*/ 0xe8, 0x29, 0x00, 0x00, 0x00,             //callq 40024d <pbs.argcmp.opt1>
 /*174*/ 0x75, 0x06,                               //jne 40022c <pbs.argloop.next>
 /*176*/ 0x49, 0x83, 0xcd, 0x01,                   //or $0x1,%r13
 /*17a*/ 0xeb, 0xee,                               //jmp 40021a <pbs.argloop>
//<pbs.argloop.next>:
 /*17c*/ 0x85, 0xc0,                               //test %eax,%eax
 /*17e*/ 0x74, 0xea,                               //je 40021a <pbs.argloop>
//<pbs.argloop.enter>:
 /*180*/ 0x0f, 0xb6, 0x07,                         //movzbl (%rdi),%eax
 /*183*/ 0x48, 0xff, 0xc7,                         //inc %rdi
 /*186*/ 0xeb, 0xf4,                               //jmp 40022c <pbs.argloop.next>
//<pbs.argloop.exit>:
 /*188*/ 0x48, 0xbf, 0x00, 0x10, 0x60, 0x00, 0x00, //movabs $0x601000,%rdi
 /*18f*/ 0x00, 0x00, 0x00,
 /*192*/ 0x4c, 0x87, 0x2f,                         //xchg %r13,(%rdi)
 /*195*/ 0xc3,                                     //retq 
//<pbs.str.opt1>:
 /*196*/ 0x2d, 0x66, 0x75, 0x74, 0x65,             //sub $0x65747566,%eax
 /*19b*/ 0x78, 0x00,                               //js 40024d <pbs.argcmp.opt1>
//<pbs.argcmp.opt1>:
 /*19d*/ 0x48, 0x8d, 0x35, 0xf2, 0xff, 0xff, 0xff, //lea -0xe(%rip),%rsi # 400246 <pbs.str.opt1>
//<pbs.argcmp>:
 /*1a4*/ 0x0f, 0xb6, 0x07,                         //movzbl (%rdi),%eax
 /*1a7*/ 0x0f, 0xb6, 0x16,                         //movzbl (%rsi),%edx
 /*1aa*/ 0x48, 0xff, 0xc7,                         //inc %rdi
 /*1ad*/ 0x48, 0xff, 0xc6,                         //inc %rsi
 /*1b0*/ 0x29, 0xc2,                               //sub %eax,%edx
 /*1b2*/ 0x75, 0x04,                               //jne 400268 <pbs.argcmp.exit>
 /*1b4*/ 0x85, 0xc0,                               //test %eax,%eax
 /*1b6*/ 0x75, 0xec,                               //jne 400254 <pbs.argcmp>
//<pbs.argcmp.exit>:
 /*1b8*/ 0xc3,                                     //retq 
//<pbs.init_thread>:
 /*1b9*/ 0xe8, 0x5a, 0xfe, 0xff, 0xff,             //callq 4000c8 <pbs.cbk_on_thread_start>
 /*1be*/ 0x4d, 0x89, 0xe5,                         //mov %r12,%r13
 /*1c1*/ 0xb8, 0x03, 0x00, 0x00, 0x00,             //mov $0x3,%eax
 /*1c6*/ 0xba, 0x00, 0x00, 0x00, 0x00,             //mov $0x0,%edx
 /*1cb*/ 0x0f, 0xae, 0x2c, 0x24,                   //xrstor (%rsp)
 /*1cf*/ 0x48, 0x81, 0xc4, 0xf0, 0x0a, 0x00, 0x00, //add $0xaf0,%rsp
 /*1d6*/ 0xb8, 0x9a, 0x00, 0x00, 0x00,             //mov $0x9a,%eax
 /*1db*/ 0xbf, 0x01, 0x00, 0x00, 0x00,             //mov $0x1,%edi
 /*1e0*/ 0x48, 0x89, 0xe6,                         //mov %rsp,%rsi
 /*1e3*/ 0xba, 0x10, 0x00, 0x00, 0x00,             //mov $0x10,%edx
 /*1e8*/ 0x0f, 0x05,                               //syscall 
 /*1ea*/ 0x48, 0x85, 0xc0,                         //test %rax,%rax
 /*1ed*/ 0x0f, 0x85, 0x5f, 0xff, 0xff, 0xff,       //jne 400202 <pbs.exit>
 /*1f3*/ 0x8e, 0x64, 0x24, 0x10,                   //mov 0x10(%rsp),%fs
 /*1f7*/ 0xb8, 0x9e, 0x00, 0x00, 0x00,             //mov $0x9e,%eax
 /*1fc*/ 0xbf, 0x02, 0x10, 0x00, 0x00,             //mov $0x1002,%edi
 /*201*/ 0x48, 0x8b, 0x74, 0x24, 0x14,             //mov 0x14(%rsp),%rsi
 /*206*/ 0x0f, 0x05,                               //syscall 
 /*208*/ 0x48, 0x85, 0xc0,                         //test %rax,%rax
 /*20b*/ 0x0f, 0x85, 0x41, 0xff, 0xff, 0xff,       //jne 400202 <pbs.exit>
 /*211*/ 0xb8, 0x9a, 0x00, 0x00, 0x00,             //mov $0x9a,%eax
 /*216*/ 0xbf, 0x01, 0x00, 0x00, 0x00,             //mov $0x1,%edi
 /*21b*/ 0x48, 0x8d, 0x74, 0x24, 0x1c,             //lea 0x1c(%rsp),%rsi
 /*220*/ 0xba, 0x10, 0x00, 0x00, 0x00,             //mov $0x10,%edx
 /*225*/ 0x0f, 0x05,                               //syscall 
 /*227*/ 0x48, 0x85, 0xc0,                         //test %rax,%rax
 /*22a*/ 0x0f, 0x85, 0x22, 0xff, 0xff, 0xff,       //jne 400202 <pbs.exit>
 /*230*/ 0x8e, 0x6c, 0x24, 0x2c,                   //mov 0x2c(%rsp),%gs
 /*234*/ 0xb8, 0x9e, 0x00, 0x00, 0x00,             //mov $0x9e,%eax
 /*239*/ 0xbf, 0x01, 0x10, 0x00, 0x00,             //mov $0x1001,%edi
 /*23e*/ 0x48, 0x8b, 0x74, 0x24, 0x30,             //mov 0x30(%rsp),%rsi
 /*243*/ 0x0f, 0x05,                               //syscall 
 /*245*/ 0x48, 0x85, 0xc0,                         //test %rax,%rax
 /*248*/ 0x0f, 0x85, 0x04, 0xff, 0xff, 0xff,       //jne 400202 <pbs.exit>
 /*24e*/ 0x48, 0x83, 0xc4, 0x38,                   //add $0x38,%rsp
 /*252*/ 0x41, 0xf7, 0x47, 0x08, 0x01, 0x00, 0x00, //testl $0x1,0x8(%r15)
 /*259*/ 0x00,
 /*25a*/ 0x74, 0x68,                               //je 400374 <pbs.spinloop_barrier>
 /*25c*/ 0x85, 0xdb,                               //test %ebx,%ebx
 /*25e*/ 0x74, 0x42,                               //je 400352 <pbs.sync_master_threads>
 /*260*/ 0xf0, 0x41, 0x83, 0x2f, 0x01,             //lock subl $0x1,(%r15)
 /*265*/ 0x75, 0x09,                               //jne 400320 <pbs.wait>
 /*267*/ 0x49, 0x8d, 0x7f, 0x04,                   //lea 0x4(%r15),%rdi
 /*26b*/ 0xe8, 0x14, 0x00, 0x00, 0x00,             //callq 400334 <pbs.sys_futex_wake>
//<pbs.wait>:
 /*270*/ 0x49, 0x8d, 0x7f, 0x10,                   //lea 0x10(%r15),%rdi
 /*274*/ 0xe8, 0x02, 0x00, 0x00, 0x00,             //callq 40032b <pbs.sys_futex_wait>
 /*279*/ 0xeb, 0x72,                               //jmp 40039d <pbs.exit_barrier>
//<pbs.sys_futex_wait>:
 /*27b*/ 0xbe, 0x80, 0x00, 0x00, 0x00,             //mov $0x80,%esi
 /*280*/ 0x31, 0xd2,                               //xor %edx,%edx
 /*282*/ 0xeb, 0x0d,                               //jmp 400341 <pbs.sys_futex>
//<pbs.sys_futex_wake>:
 /*284*/ 0xbe, 0x81, 0x00, 0x00, 0x00,             //mov $0x81,%esi
 /*289*/ 0xba, 0xff, 0xff, 0xff, 0xff,             //mov $0xffffffff,%edx
 /*28e*/ 0xf0, 0x09, 0x37,                         //lock or %esi,(%rdi)
//<pbs.sys_futex>:
 /*291*/ 0x4d, 0x31, 0xd2,                         //xor %r10,%r10
 /*294*/ 0x4d, 0x31, 0xc0,                         //xor %r8,%r8
 /*297*/ 0x4d, 0x31, 0xc9,                         //xor %r9,%r9
 /*29a*/ 0xb8, 0xca, 0x00, 0x00, 0x00,             //mov $0xca,%eax
 /*29f*/ 0x0f, 0x05,                               //syscall 
 /*2a1*/ 0xc3,                                     //retq 
//<pbs.sync_master_threads>:
 /*2a2*/ 0xf0, 0x41, 0x83, 0x2f, 0x01,             //lock subl $0x1,(%r15)
 /*2a7*/ 0x74, 0x09,                               //je 400362 <pbs.wake>
 /*2a9*/ 0x49, 0x8d, 0x7f, 0x04,                   //lea 0x4(%r15),%rdi
 /*2ad*/ 0xe8, 0xc9, 0xff, 0xff, 0xff,             //callq 40032b <pbs.sys_futex_wait>
//<pbs.wake>:
 /*2b2*/ 0x49, 0x8d, 0x7f, 0x10,                   //lea 0x10(%r15),%rdi
 /*2b6*/ 0xb8, 0x11, 0x47, 0x02, 0x00,             //mov $0x24711,%eax
 /*2bb*/ 0x0f, 0xa2,                               //cpuid 
 /*2bd*/ 0xe8, 0xc2, 0xff, 0xff, 0xff,             //callq 400334 <pbs.sys_futex_wake>
 /*2c2*/ 0xeb, 0x29,                               //jmp 40039d <pbs.exit_barrier>
//<pbs.spinloop_barrier>:
 /*2c4*/ 0x31, 0xed,                               //xor %ebp,%ebp
 /*2c6*/ 0xf7, 0xd5,                               //not %ebp
 /*2c8*/ 0xf0, 0x41, 0x01, 0x2f,                   //lock add %ebp,(%r15)
 /*2cc*/ 0x85, 0xdb,                               //test %ebx,%ebx
 /*2ce*/ 0x74, 0x0a,                               //je 40038a <pbs.wait_threads>
//<pbs.barrier_loop>:
 /*2d0*/ 0x41, 0x85, 0x6f, 0x04,                   //test %ebp,0x4(%r15)
 /*2d4*/ 0x75, 0x17,                               //jne 40039d <pbs.exit_barrier>
 /*2d6*/ 0xf3, 0x90,                               //pause 
 /*2d8*/ 0xeb, 0xf6,                               //jmp 400380 <pbs.barrier_loop>
//<pbs.wait_threads>:
 /*2da*/ 0x41, 0x85, 0x2f,                         //test %ebp,(%r15)
 /*2dd*/ 0xf3, 0x90,                               //pause 
 /*2df*/ 0x75, 0xf9,                               //jne 40038a <pbs.wait_threads>
 /*2e1*/ 0xb8, 0x11, 0x47, 0x02, 0x00,             //mov $0x24711,%eax
 /*2e6*/ 0x0f, 0xa2,                               //cpuid 
 /*2e8*/ 0xf0, 0x41, 0x09, 0x6f, 0x04,             //lock or %ebp,0x4(%r15)
//<pbs.exit_barrier>:
 /*2ed*/ 0x4d, 0x85, 0xed,                         //test %r13,%r13
 /*2f0*/ 0x74, 0x3d,                               //je 4003df <pbs.perf.end>
 /*2f2*/ 0x41, 0x8b, 0x5d, 0x00,                   //mov 0x0(%r13),%ebx
//<pbs.perf.reset>:
 /*2f6*/ 0x89, 0xdf,                               //mov %ebx,%edi
 /*2f8*/ 0xbe, 0x03, 0x24, 0x00, 0x00,             //mov $0x2403,%esi
 /*2fd*/ 0xba, 0x01, 0x00, 0x00, 0x00,             //mov $0x1,%edx
 /*302*/ 0xb8, 0x10, 0x00, 0x00, 0x00,             //mov $0x10,%eax
 /*307*/ 0x0f, 0x05,                               //syscall 
//<pbs.perf.enable>:
 /*309*/ 0x89, 0xdf,                               //mov %ebx,%edi
 /*30b*/ 0xbe, 0x00, 0x24, 0x00, 0x00,             //mov $0x2400,%esi
 /*310*/ 0xba, 0x01, 0x00, 0x00, 0x00,             //mov $0x1,%edx
 /*315*/ 0xb8, 0x10, 0x00, 0x00, 0x00,             //mov $0x10,%eax
 /*31a*/ 0x0f, 0x05,                               //syscall 
//<pbs.perf.refresh>:
 /*31c*/ 0x89, 0xdf,                               //mov %ebx,%edi
 /*31e*/ 0xbe, 0x02, 0x24, 0x00, 0x00,             //mov $0x2402,%esi
 /*323*/ 0xba, 0x01, 0x00, 0x00, 0x00,             //mov $0x1,%edx
 /*328*/ 0xb8, 0x10, 0x00, 0x00, 0x00,             //mov $0x10,%eax
 /*32d*/ 0x0f, 0x05,                               //syscall 
//<pbs.perf.end>:
 /*32f*/ 0x5f,                                     //pop %rdi
 /*330*/ 0x5e,                                     //pop %rsi
 /*331*/ 0x5d,                                     //pop %rbp
 /*332*/ 0x41, 0x58,                               //pop %r8
 /*334*/ 0x41, 0x59,                               //pop %r9
 /*336*/ 0x41, 0x5a,                               //pop %r10
 /*338*/ 0x41, 0x5b,                               //pop %r11
 /*33a*/ 0x41, 0x5c,                               //pop %r12
 /*33c*/ 0x41, 0x5d,                               //pop %r13
 /*33e*/ 0x41, 0x5e,                               //pop %r14
 /*340*/ 0x41, 0x5f,                               //pop %r15
 /*342*/ 0x85, 0xdb,                               //test %ebx,%ebx
 /*344*/ 0x75, 0x17,                               //jne 40040d <pbs.mark_end>
//<pbs.mark>:
 /*346*/ 0xb8, 0x01, 0x00, 0x00, 0x00,             //mov $0x1,%eax
 /*34b*/ 0x66, 0x87, 0xdb,                         //xchg %bx,%bx
 /*34e*/ 0xbb, 0x01, 0x00, 0x00, 0x00,             //mov $0x1,%ebx
 /*353*/ 0x64, 0x67, 0x90,                         //fs addr32 nop
 /*356*/ 0xb8, 0x11, 0x47, 0x01, 0x00,             //mov $0x14711,%eax
 /*35b*/ 0x0f, 0xa2,                               //cpuid 
//<pbs.mark_end>:
 /*35d*/ 0x5a,                                     //pop %rdx
 /*35e*/ 0x59,                                     //pop %rcx
 /*35f*/ 0x5b,                                     //pop %rbx
 /*360*/ 0x58,                                     //pop %rax
 /*361*/ 0x9d,                                     //popfq 
 /*362*/ 0xc3,                                     //retq 
//<pbs.tst.start>:
 /*363*/ 0x5c,                                     //pop %rsp
 /*364*/ 0xff, 0x25, 0x00, 0x00, 0x00, 0x00,       //jmpq *0x0(%rip) # 40041a <pbs.tst.start+0x7>
 /*36a*/ 0x22, 0x04, 0x40,                         //and (%rax,%rax,2),%al
 /*36d*/ 0x00, 0x00,                               //add %al,(%rax)
 /*36f*/ 0x00, 0x00,                               //add %al,(%rax)