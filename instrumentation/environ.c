/*BEGIN_LEGAL 
BSD License 

Copyright (c) 2016-2020 Intel Corporation. All rights reserved.
 
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

#define MAXENVSIZE 99999
#define MAXENVCOUNT 4999
__lte_static int efd;
__lte_static char elfie_environ[MAXENVSIZE+1];
__lte_static char * environ_vars[MAXENVCOUNT+1];
__lte_static uint64_t envsize;
__lte_static int envvarcount=0;

//The following are declared file global to avoid local variable declarations
__lte_static int tmpi=0; 
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

#define isELFieVar(var) ((var[0]=='E')&&(var[1]=='L')&&(var[2]=='F')&&(var[3]=='I')&&(var[4]=='E')&&(var[5]=='_'))

#define isELFieVerbose(var) (isELFieVar(var) && (var[6]=='V') && (var[7]=='E') && (var[8]=='R') && (var[9]=='B') && (var[10]=='O') && (var[11]=='S')  && (var[12]=='E') && (var[13]=='='))

#define isELFieCoreBase(var) (isELFieVar(var) && (var[6]=='C') && (var[7]=='O') && (var[8]=='R') && (var[9]=='E') && (var[10]=='B') && (var[11]=='A')  && (var[12]=='S')  && (var[13]=='E')  && (var[14]=='='))

#define isELFiePCCount(var) (isELFieVar(var) && (var[6]=='P') && (var[7]=='C') && (var[8]=='C') && (var[9]=='O') && (var[10]=='U') && (var[11]=='N')  && (var[12]=='T')  && (var[13]=='='))

#define isELFieWarmup(var) (isELFieVar(var) && (var[6]=='W') && (var[7]=='A') && (var[8]=='R') && (var[9]=='M') && (var[10]=='U') && (var[11]=='P') && (var[12]=='='))

#define isELFiePerfList(var) (isELFieVar(var) && (var[6]=='P') && (var[7]=='E') && (var[8]=='R') && (var[9]=='F') && (var[10]=='L') && (var[11]=='I')  && (var[12]=='S')  && (var[13]=='T') && (var[14]=='='))
  
int handleELFieVERBOSE(char * var)
{
/* ELFIE_COREBASE=7 */
  if(isELFieVerbose(var)) 
  {
      verbose=0;
      varptr = &var[14];
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

int handleELFieCORES(char * var)
{
/* ELFIE_COREBASE=7 */
  if(isELFieCoreBase(var)) 
  {
      core_base=0;
      varptr = &var[15];
      tmpc = *varptr;
      while (tmpc)
      {
        core_base=10*core_base + tmpc - '0'; 
        varptr++;
        tmpc = *varptr;
      }
      return 1;
  }
  return 0;
}
  
int handleELFiePCCOUNT(char * var)
{
/* ELFIE_PCCOUNT=1 */
  if(isELFiePCCount(var)) 
  {
      use_pccount=0;
      varptr = &var[14];
      tmpc = *varptr;
      while (tmpc)
      {
        use_pccount=10*use_pccount + tmpc - '0'; 
        varptr++;
        tmpc = *varptr;
      }
      return 1;
  }
  return 0;
}

  
int handleELFieWARMUP(char * var)
{
/* ELFIE_WARMUP=1 */
  if(isELFieWarmup(var)) 
  {
      use_warmup=0;
      varptr = &var[13];
      tmpc = *varptr;
      while (tmpc)
      {
        use_warmup=10*use_warmup + tmpc - '0'; 
        varptr++;
        tmpc = *varptr;
      }
      return 1;
  }
  return 0;
}

int handleELFiePERFLIST(char * var)
{
/* ELFIE_PERFLIST=0,1,... */
  if(isELFiePerfList(var)) 
  {
      tptype=0;
      tpevent=0;
      tmpp=0;
      varptr = &var[15];
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
      if (isELFieVar(environ_vars[tmpi]))
      {
        lte_syscall(__NR_write, 1, (uint64_t)environ_vars[tmpi],lte_strlen(environ_vars[tmpi])-1, 0, 0, 0);
        lte_syscall(__NR_write, 1, (uint64_t)"\n", lte_strlen("\n")-1, 0, 0, 0);
        if (handleELFieVERBOSE(environ_vars[tmpi])) continue;
        if (handleELFieCORES(environ_vars[tmpi])) continue;
        if (handleELFiePCCOUNT(environ_vars[tmpi])) continue;
        if (handleELFieWARMUP(environ_vars[tmpi])) continue;
        if (handleELFiePERFLIST(environ_vars[tmpi])) continue;
      }
  }
}

void print_envvars(int elfie_only)
{
  for (tmpi=0; tmpi<envvarcount; tmpi++)
  {
      if( ! elfie_only )
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
  varptr = &elfie_environ[0];
  varindex = 0;
  for (tmpi=0; tmpi<envsize; tmpi++)
  {
   if (!isprintable(elfie_environ[tmpi])) 
   {
    environ_vars[varindex] = varptr;
    /* elfie_environ[i]='\n'; */
    varindex++;
    if(varindex > MAXENVCOUNT)
    {
      lte_syscall(__NR_write, 2, (uint64_t)"Too many environment variables ", lte_strlen("Too many environment variables ")-1, 0, 0, 0);
      lte_diprintfe(2, varindex, '\n');
      lte_syscall(__NR_write, 2, (uint64_t)"Exiting... \n", lte_strlen("Exiting... \n")-1, 0, 0, 0);
      lte_exit_group(0);
    }
    varptr=&elfie_environ[tmpi+1];
   }
  }
  /*elfie_environ[envsize+1]='\n';*/
  envvarcount=varindex;
  /* lte_write(1, elfie_environ, envsize); */
}

void read_environ()
{
   efd = lte_syscall(__NR_open, (uint64_t)"/proc/self/environ", (uint64_t)O_RDONLY|O_CLOEXEC, 0,  0, 0, 0);
  if (efd == -1 )
  {
   lte_syscall(__NR_write, 2, (uint64_t)"environ open failed", lte_strlen("environ open failed")-1, 0, 0, 0);
   return;
  }
  envsize = lte_syscall(__NR_read, (uint64_t)efd, (uint64_t)elfie_environ, (uint64_t) MAXENVSIZE,  0, 0, 0);
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
