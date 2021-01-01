/*BEGIN_LEGAL 
BSD License 

Copyright (c) 2016-2019 Intel Corporation. All rights reserved.
 
Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are
met:

Redistributions of source code must retain the above copyright notice,
this list of conditions and the following disclaimer.  Redistributions
in binary form must reproduce the above copyright notice, this list of
conditions and the following disclaimer in the documentation and/or
other materials provided with the distribution.  Neither the name of
the Intel Corporation nor the names of its contributors may be used to
endorse or promote products derived from this software without
specific prior written permission.
 
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE INTEL OR
ITS CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
END_LEGAL */

#define STATBUFLEN 2048
__lte_static  char statbuf[STATBUFLEN];
uint64_t mystr2dec(char *inptr)
{
 uint64_t retval=0;
 while( (*inptr != 0) &&  (*inptr != ' ' ))
 {
  retval=10*retval + (*inptr) - '0';
  inptr++;
 }
 return retval;
}

char * mystrchr(char * inptr, char c)
{
 while( (*inptr != 0) &&  (*inptr != c)) inptr++;
 return inptr;
}

__lte_static struct prctl_mm_map prctl_map;
void set_heap()
{
  int  statfd = lte_syscall(__NR_open, (uint64_t)"/proc/self/stat", (uint64_t)O_RDONLY|O_CLOEXEC, 0,  0, 0, 0);
 int read_count = lte_syscall(__NR_read, (uint64_t)statfd, (uint64_t)statbuf, (uint64_t) STATBUFLEN,  0, 0, 0);
 statbuf[read_count]=0;
 char * sptr = mystrchr(statbuf, ' ');
 // skip fields 1--25
 for (int i =0; i < 24; i++)
 {
    sptr = mystrchr(sptr+1, ' '); 
 } 
 // read fields 26, 27, 28
 uint64_t start_code = mystr2dec(sptr+1);
 sptr = mystrchr(sptr+1, ' '); 
 uint64_t end_code = mystr2dec(sptr+1);
 sptr = mystrchr(sptr+1, ' '); 
 uint64_t start_stack = mystr2dec(sptr+1);
 sptr = mystrchr(sptr+1, ' '); 
 // skip 16 fields 29--44
 for (int i =0; i < 16; i++)
 {
    sptr = mystrchr(sptr+1, ' '); 
 } 
 // read fields 45--51
 uint64_t start_data = mystr2dec(sptr+1);
 sptr = mystrchr(sptr+1, ' '); 
 uint64_t end_data = mystr2dec(sptr+1);
 sptr = mystrchr(sptr+1, ' '); 
 uint64_t start_brk = mystr2dec(sptr+1);
 sptr = mystrchr(sptr+1, ' '); 
 uint64_t arg_start = mystr2dec(sptr+1);
 sptr = mystrchr(sptr+1, ' '); 
 uint64_t arg_end = mystr2dec(sptr+1);
 sptr = mystrchr(sptr+1, ' '); 
 uint64_t env_start = mystr2dec(sptr+1);
 sptr = mystrchr(sptr+1, ' '); 
 uint64_t env_end = mystr2dec(sptr+1);
 sptr = mystrchr(sptr+1, ' '); 
  prctl_map.start_code = start_code;
  prctl_map.end_code = end_code;
  prctl_map.start_data = start_data;
  prctl_map.end_data = end_data;
  prctl_map.start_brk = start_brk;
  prctl_map.start_stack = start_stack;
  prctl_map.arg_start = arg_start;
  prctl_map.arg_end = arg_end;
  prctl_map.env_start = env_start;
  prctl_map.env_end = env_end;
  prctl_map.auxv = NULL;
  prctl_map.auxv_size = 0;
  prctl_map.exe_fd = -1;
  uint64_t retval = lte_syscall(__NR_brk, 0, 0, 0,  0, 0, 0);
  prctl_map.start_data = prctl_map.end_code;
  prctl_map.end_data = FIRST_BRK_ADDR-0x1000;
  prctl_map.start_brk = FIRST_BRK_ADDR;
  prctl_map.brk = LAST_BRK_ADDR;
  retval = lte_syscall(__NR_prctl, PR_SET_MM,
          (uint64_t)(PR_SET_MM_MAP), (uint64_t)(&prctl_map),
          (uint64_t)(sizeof(prctl_map)), (uint64_t)0, (uint64_t)0);
}
