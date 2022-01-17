/*BEGIN_LEGAL 
BSD License 

Copyright (c)2022 Intel Corporation. All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
END_LEGAL */

#define MAXENVSIZE 99999
#define MAXENVCOUNT 4999
__lte_static int efd;
__lte_static char roiperf_environ[MAXENVSIZE+1];
__lte_static char * environ_vars[MAXENVCOUNT+1];
__lte_static uint64_t envsize;
__lte_static unsigned int envvarcount=0;

//The following are declared file global to avoid local variable declarations
__lte_static unsigned int tmpi=0; 
__lte_static int tmpp=0; 
__lte_static   int varindex=0;
__lte_static   char * varptr=NULL;
__lte_static  char tmpc=0;
__lte_static int tptype=0; 
__lte_static int tpevent=0; 

int isprintable(char c)
{
  return ((c > 0x20) && ( c <= 0x7E));
}

#define isROIperfVar(var) ((var[0]=='R')&&(var[1]=='O')&&(var[2]=='I')&&(var[3]=='P')&&(var[4]=='E')&&(var[5]=='R')&&(var[6]=='F')&&(var[7]=='_'))

#define isROIperfVerbose(var) (isROIperfVar(var) && (var[8]=='V') && (var[9]=='E') && (var[10]=='R') && (var[11]=='B') && (var[12]=='O') && (var[13]=='S')  && (var[14]=='E') && (var[15]=='='))

#define isROIperfPerfList(var) (isROIperfVar(var) && (var[8]=='P') && (var[9]=='E') && (var[10]=='R') && (var[11]=='F') && (var[12]=='L') && (var[13]=='I')  && (var[14]=='S')  && (var[15]=='T') && (var[16]=='='))
  
int handleROIperfVERBOSE(char * var)
{
/* ROIPERF_VERBOSE=1 */
  if(isROIperfVerbose(var)) 
  {
      verbose=0;
      varptr = &var[16];
      tmpc = *varptr;
      while (tmpc)
      {
        verbose=10*verbose + tmpc - '0'; 
        varptr++;
        tmpc = *varptr;
      }
      return 1;
  }
  return 0;
}

int handleROIperfPERFLIST(char * var)
{
/* ROIPERF_PERFLIST=0,1,... */
  if(isROIperfPerfList(var)) 
  {
      tptype=0;
      tpevent=0;
      tmpp=0;
      varptr = &var[17];
      tmpc = *varptr;
      while (tmpc)
      {
        if(tmpc==':')
        {
          tmpp=1; // transition to reading event
          varptr++;
          tmpc = *varptr;
          continue;
        }
        if(tmpc==' ')
        {
          varptr++;
          tmpc = *varptr;
          continue;
        }
        if(tmpc==',')
        {
          if(tptype==0)
          {
            hw_event_enabled[tpevent]=1;
            tptype=0;
            tpevent=0;
          }
          if(tptype==1)
          {
            sw_event_enabled[tpevent]=1;
            tptype=0;
            tpevent=0;
          }
          tmpp=0;// transition to reading type
          varptr++;
          tmpc = *varptr;
          continue;
        }
        if(tmpp==0) // reading type
          tptype=10*tptype + tmpc - '0'; 
        if(tmpp==1) // reading event
          tpevent=10*tpevent + tmpc - '0'; 
        varptr++;
        tmpc = *varptr;
      }
      if(tptype==0)
      {
        hw_event_enabled[tpevent]=1;
      }
      if(tptype==1)
      {
        sw_event_enabled[tpevent]=1;
      }
      return 1;
  }
  return 0;
}

void handle_envvars()
{
  for (tmpi=0; tmpi<envvarcount; tmpi++)
  {
      if (isROIperfVar(environ_vars[tmpi]))
      {
        lte_syscall(__NR_write, 1, (uint64_t)environ_vars[tmpi],lte_strlen(environ_vars[tmpi])-1, 0, 0, 0);
        lte_syscall(__NR_write, 1, (uint64_t)"\n", lte_strlen("\n")-1, 0, 0, 0);
        if (handleROIperfVERBOSE(environ_vars[tmpi])) continue;
        if (handleROIperfPERFLIST(environ_vars[tmpi])) continue;
      }
  }
}

void print_envvars(int roiperf_only)
{
  for (tmpi=0; tmpi<envvarcount; tmpi++)
  {
      if( ! roiperf_only )
      {
        lte_diprintfe(1, tmpi, ':');
        lte_syscall(__NR_write, 1, (uint64_t)environ_vars[tmpi],lte_strlen(environ_vars[tmpi])-1, 0, 0, 0);
        lte_syscall(__NR_write, 1, (uint64_t)"\n", lte_strlen("\n")-1, 0, 0, 0);
      }
  }
}

// Replace unprintable characters with a '\n'
void clean_environ()
{
  varptr = &roiperf_environ[0];
  varindex = 0;
  for (tmpi=0; tmpi<envsize; tmpi++)
  {
   if (!isprintable(roiperf_environ[tmpi])) 
   {
    environ_vars[varindex] = varptr;
    /* roiperf_environ[i]='\n'; */
    varindex++;
    if(varindex > MAXENVCOUNT)
    {
      lte_syscall(__NR_write, 2, (uint64_t)"Too many environment variables ", lte_strlen("Too many environment variables ")-1, 0, 0, 0);
      lte_diprintfe(2, varindex, '\n');
      lte_syscall(__NR_write, 2, (uint64_t)"Exiting... \n", lte_strlen("Exiting... \n")-1, 0, 0, 0);
      lte_exit_group(0);
    }
    varptr=&roiperf_environ[tmpi+1];
   }
  }
  /*roiperf_environ[envsize+1]='\n';*/
  envvarcount=varindex;
  /* lte_write(1, roiperf_environ, envsize); */
}

void read_environ()
{
   efd = lte_syscall(__NR_open, (uint64_t)"/proc/self/environ", (uint64_t)O_RDONLY|O_CLOEXEC, 0,  0, 0, 0);
  if (efd == -1 )
  {
   lte_syscall(__NR_write, 2, (uint64_t)"environ open failed", lte_strlen("environ open failed")-1, 0, 0, 0);
   return;
  }
  envsize = lte_syscall(__NR_read, (uint64_t)efd, (uint64_t)roiperf_environ, (uint64_t) MAXENVSIZE,  0, 0, 0);
  if(envsize == MAXENVSIZE)
  {
    lte_syscall(__NR_write, 2, (uint64_t)"environ too big to read ", lte_strlen("environ too big to read ")-1, 0, 0, 0);
    lte_diprintfe(2, envsize, '\n');
    lte_syscall(__NR_write, 2, (uint64_t)"Exiting... \n", lte_strlen("Exiting... \n")-1, 0, 0, 0);
    lte_exit_group(0);
  }
  clean_environ();
  print_envvars(1);
  handle_envvars();
}
