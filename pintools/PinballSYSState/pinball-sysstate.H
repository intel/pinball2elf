/*BEGIN_LEGAL 
BSD License 

Copyright (c) 2021 Intel Corporation. All rights reserved.
 
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

#ifndef PINBALL_SYSSTATE_H
#define PINBALL_SYSSTATE_H

/*
 A producer/consumer for pinball system call state 
 Motivation: During un-constrained replay of a pinball or during
   the native execution of the ELFie generated, system calls are 
    not skipped but re-exeucted using the test machine's environment.
   For file read()s this poses a challenge because we need to make
    sure the corresponding files are available on the test machine
    at the expected location.

  Producer: A replay-based tool that captures all open()'s/read()s prior to 
         pinball beginning and creates a 'sysstate' directory with
         relevant data. 
  Consumer: Use 'sysstate' directory to service a subset of system calls 
   during the un-constrained replay.

  'sysstate' can also be used by 'pinball2elf' as an ELFie execution is
   similar to un-constrained replay.

 For now, we are only focusing of file-related system call.
 Producer:
 [1] read - read from a file descriptor 
    ssize_t read(int fd, void *buf, size_t count)
    RETURN VALUE
       On success, the number of bytes read is returned (zero indicates end of
       file), and the file position is advanced by this number.  It is not  an
       error  if  this  number  is smaller than the number of bytes requested;
       this may happen for example because fewer bytes are actually  available
       right  now  (maybe  because we were close to end-of-file, or because we
       are reading from a pipe, or from a terminal),  or  because  read()  was
       interrupted  by  a  signal.  On error, -1 is returned, and errno is set
       appropriately.  In this case it is left unspecified  whether  the  file
       position (if any) changes.

    i. remember 'fd'
    i. put *buf in a dummy file corresponding to 'fd'

 Complication: pinball memory injection is lazy -- *buf is not going
   to change after the (skipped) read() system call during replay. Instead,
   parts of *buf values will be injected if/when they are actually used
   later in the pinball. 

   [ If the pinball was created using "-log:pages_early", only possibly the
    first read value from *buf will be injected early.]

   We need to maintain a shadow buffer of length 'count'. We then need to 
   monitor all memory reads in the range buf[0]--buf[count-1] and gather the 
   values read, and populate the shadow buffer with them.
   
   Output the shadow buffer to the corrsponding dummy file only at the
   end of the replay.

 [2] write - write to a file descriptor 
   ssize_t write(int fd, const void *buf, size_t count);
  write()  writes  up  to  count bytes from the buffer pointed buf to the
       file referred to by the file descriptor fd.
   i. remember 'fd'
    If 'fd' corresponds to a file opened prior to the ROI, create a dummy 
      file in sysstate/workdir.

 [3] open, creat - open and possibly create a file or device
       int open(const char *pathname, int flags);
       int open(const char *pathname, int flags, mode_t mode);
       int creat(const char *pathname, mode_t mode);

    Remember the file descriptor returned along with the PC of the
     open system call.

 Consumer:
 A. For files open()ed prior to the pinball beginning,
   do an open() of the corresponding dummy file [see below] and
   use dup2() to make sure the file descriptor matches the expected one.
   Note: this applies to both files read and written in the ROI using
    a pre-opened file descriptor

 B. Files open()ed inside the pinball region, change the pathname
     to the corresponding dummy file and use dup2() to match the expected
     file descriptor
     NOTE: this requires monitoring system calls and changing the pathname 
     argument of any  open() encountered. This can be done with Pin
       even during un-constrained replay.
*/

#include <algorithm>
#include <sstream> 
#include <fstream> 
#include <iostream> 
#include <cctype>
#include <string>
#include <list>
#include <sys/syscall.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <libgen.h>
#include <unistd.h>
#include <fcntl.h>
#include <dirent.h>
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <limits.h> // for PATH_MAX definition
#include <fcntl.h> // for  AT_FDCWD
#include "pin.H"
#include "instlib.H"
#include "pinplay.H"

using namespace std;
namespace PINBALL_SYSSTATE{
constexpr signed int MAXFD = 500;
constexpr int CWDMAX = PATH_MAX;

class READ_STATE;
class FILE_STATE;

LOCALTYPE typedef std::list<READ_STATE *> READ_STATE_LIST;
LOCALTYPE typedef std::list<ADDRINT> MMAP_ADDR_LIST;
LOCALTYPE typedef std::set<string> STRING_SET;
LOCALTYPE typedef std::set<UINT32> POS_SET;

union thread_data_t
{
 struct
 {
  ADDRINT sys_ip;
  ADDRINT sys_num;
  ADDRINT arg0;
  ADDRINT arg1;
  ADDRINT arg2;
  ADDRINT arg3;
  ADDRINT arg4;
  ADDRINT arg5;
 } _data;
  // Force each thread's data to be in its own data cache line so that
  // multiple threads do not contend for the same data cache line.
  // This avoids the false sharing problem.
 char _pad[64]; 
};

static BOOL IsAbsolutePathname(string pathname)
{
  return (pathname.c_str()[0] == '/');
}

#if 0
static BOOL IsDummyFilename(string filename)
{
  return (strstr(filename.c_str(),"FD_") != NULL);
}
#endif

static BOOL IsCWDDirname(string filename)
{
  return (strstr(filename.c_str(),"CWD") != NULL);
}

/*! @ingroup PINBALL_SYSSTATE
*/

class READ_STATE
{
 private:   
    ADDRINT _syscall_pc;
    UINT32 _count_act;
 public:   
    UINT32 _file_pos;
    UINT32 _count_req;
    string _fname;
    ADDRINT  _buf_addr;
    CHAR * _shadow_buf;
    vector<bool> _byte_accessed; // supposed to use 1 bit per element
    READ_STATE(ADDRINT pc, ADDRINT buf_addr, INT32 count, 
        INT32 retval, INT32 filepos, string fname)
    {
      _syscall_pc = pc;
      _buf_addr = buf_addr;
      ASSERT(count, "READ_STATE: count is zero");
      _count_req = count;
      _count_act = retval;
      _shadow_buf = new CHAR[_count_req];
      bzero(_shadow_buf,_count_req);
      _byte_accessed.resize(_count_req, false);
      _file_pos = filepos;
      _fname = fname;
    }
    BOOL ReadAddrInRange(ADDRINT read_addr) { 
      return (read_addr >= _buf_addr) 
        && (read_addr < (_buf_addr + _count_act)); 
    }

    VOID SafeCopy(CHAR * memea, UINT32 bytes)
    {
      ADDRINT offset = (ADDRINT) (memea - _buf_addr); 
      CHAR * base = _shadow_buf  + offset;
#if 0
      PIN_SafeCopy(base, (VOID *) memea, bytes);
#endif
      for (UINT32 index = 0; index < bytes; index++)
      { 
        if(index >= (_count_req - offset) )
        {
          ASSERT(index < (_count_req - offset), "SafeCopy() index out of bounds\n");
          cerr << "WARNING: SafeCopy() index out of bounds\n";
          break;
        }
        if(!_byte_accessed[offset+index])
        {
          PIN_SafeCopy(base+index, (VOID *)(memea + index), 1);
          _byte_accessed[offset+index] = true;
        }
      } 
    }

    VOID PrintReadState(){
        cerr << "\tpc 0x" << hex << _syscall_pc 
             << " fname " << hex << _fname 
             << " filepos 0x" << hex << _file_pos 
             << " buf_addr 0x" << hex <<  _buf_addr 
             << " shadow_buf 0x" << hex <<  (ADDRINT)_shadow_buf
             << " count actual " << dec << _count_act << endl;
    }
    UINT32 OutputReadState(INT32 dummy_fileFD){
      INT32 offset_ret = lseek(dummy_fileFD, _file_pos, SEEK_SET);
      ASSERTX(offset_ret != -1);
      UINT32 wcount=0;
      for (UINT32 index = 0; index < _count_req; index++)
      { 
        if(_byte_accessed[index])
        {
          INT32 count_written = write(dummy_fileFD, &_shadow_buf[index], 1);
          ASSERTX(count_written == 1);
          wcount++;
        }
        else
        {
          offset_ret = lseek(dummy_fileFD, 1, SEEK_CUR);
          ASSERTX(offset_ret != -1);
        }
      } 
      //cerr << "\t filepos : "<< dec << _file_pos << " wcount " << dec << wcount << endl;
      return wcount;
    }
};

class FILE_STATE 
{
 public:   
    INT32 _fd;
    string _fname;
    UINT32 _current_file_pos;

    FILE_STATE(string fname, INT32 fd)
    { 
       ASSERT(fd < MAXFD, "file descriptor too big.\n");
       _fname = fname; 
       _fd = fd; 
       _current_file_pos = 0;
    }

    INT32 Fd() { return _fd; }

    VOID SetFilePos(UINT32 retval)
    {
      _current_file_pos = retval;
    }

    static string CleanPathName(string pathstr)
    {
      char * path = (char *) pathstr.c_str();
      char * tok = strstr(path, "/./");
      string retval = pathstr;
      if (tok)
      {
        tok[0] = 0; // terminate 'path' at '.'
        tok = tok+2; // get rid of leading "/."
        retval = string(path) + string(tok);
      }
      return retval;
    }

    static VOID CreatePath(string pathstr)
    {
      char * path = (char *) pathstr.c_str();
      char * tok = strtok(path, "/");
      string subpath = "";
      //cerr << "CreatePath: " << pathstr << endl;
      while (tok != NULL)
      {
        //cerr << "tok: " << tok << endl;
        if(subpath.empty())
        {
          subpath=subpath+tok;
        }
        else 
        {
          subpath=subpath + "/" + tok;
        }
        //cerr << " subpath: " <<  subpath << endl;
        if ( mkdir(subpath.c_str(), 0755) != 0)
        {
          if (errno != EEXIST)
          {
            cerr << "Could not create output state directory " <<
              subpath.c_str() << endl;
            ASSERTX(0);
          }
        }
        tok = strtok(NULL, "/");
      }
    }

#if 0
    VOID OutputReadStateListFile(string out_dirname)
    {
      CHAR * basefname = basename((CHAR *)_fname.c_str());
      CHAR * dirfname = dirname((CHAR *)_fname.c_str());
      //cerr << "basename : " << basefname << endl;
      //cerr << "dirname : " << dirfname << endl;
      string outfname = out_dirname + "/" + dirfname + "/" + basefname;
      string outdir = out_dirname + "/" + dirfname;
      CreatePath(outdir);
      //cerr << "outfname : " << outfname << endl;
      INT32 dummy_fileFD;
      mode_t mode = S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH;
      dummy_fileFD = open(outfname.c_str(),O_WRONLY|O_CREAT|O_TRUNC, mode);
      if (dummy_fileFD == -1)
      {
        cerr << "Could not open output  file " <<
          outfname.c_str() << endl;
        cerr << " errno " << errno << endl;
        return;
        //ASSERTX(0);
      }
      READ_STATE_LIST :: iterator it;
      for ( it = _read_state_list.begin();
           it != _read_state_list.end(); ++it)
      {
        (*it)->OutputReadState(dummy_fileFD);
      }
      close(dummy_fileFD);
    }
#endif
};

class SYSSTATE_PRODUCER
{
  public:
    SYSSTATE_PRODUCER(PINPLAY_ENGINE *pinplay_engine, string statedirname, bool verbose)
    {
      _out_state_rootdirname = statedirname + ".sysstate";
      _out_state_workdirname = statedirname + ".sysstate"; // will be changed to $CWD
      _verbose = verbose;
      _first_brk_retval = 0;
      _last_brk_retval = 0;
      _cwd_buf_addr = NULL;
      bzero(_fd2fstate,MAXFD*sizeof(FILE_STATE *));
      cerr << "Producer " << statedirname << endl;
      PIN_AddSyscallEntryFunction(syscallEntryCallbackProducer, this);
      PIN_AddSyscallExitFunction(syscallExitCallbackProducer, this);
      // Register ThreadStart to be called when a thread starts.
      PIN_AddThreadStartFunction(ThreadStartProducer, this);
      PIN_AddFiniFunction(FiniProducer, this);
      INS_AddInstrumentFunction(Instruction, this);
      producer_tls_key = PIN_CreateThreadDataKey(NULL);
      _pinplay_engine = pinplay_engine;
      PIN_RWMutexInit(&_producerMutex);
    }

    ADDRINT TranslateAddress(ADDRINT origaddr)
    {
      return _pinplay_engine->ReplayerTranslateAddress(origaddr);
    }
    
    const char * WorkDirName()
    {
      return _out_state_workdirname.c_str();
    }

    VOID AddReadState(ADDRINT pc, ADDRINT buf_addr, INT32 req_count, INT32 act_count,
        INT32 filepos, string fname)
    {
      if(act_count == 0) return; // read() returning zero is not interesting.
      READ_STATE * rs = new READ_STATE(pc, buf_addr, req_count, act_count,
         filepos, fname);
      //rs->PrintReadState();
      _read_state_list.push_front(rs);
    }

    VOID AddCWDState(ADDRINT pc, ADDRINT buf_addr, INT32 buflength)
    {
      READ_STATE * rs = new READ_STATE(pc, buf_addr, buflength, buflength,
         0, "DUMMY");
      _cwd_state_list.push_front(rs);
    }

  private:
    READ_STATE * FindReadState(ADDRINT memea, UINT32 bytes)
    {
      READ_STATE * retval = NULL;
      READ_STATE_LIST :: iterator it;
      for ( it = _read_state_list.begin();
           it != _read_state_list.end(); ++it)
      {
        if((*it)->ReadAddrInRange(memea)
              && (*it)->ReadAddrInRange(memea+bytes-1))
        {
          retval = *it; 
        }
      }
      return retval;
    }


    READ_STATE * FindCWDState(ADDRINT memea, UINT32 bytes)
    {
      READ_STATE * retval = NULL;
      READ_STATE_LIST :: iterator it;
      for ( it = _cwd_state_list.begin();
           it != _cwd_state_list.end(); ++it)
      {
        if((*it)->ReadAddrInRange(memea)
              && (*it)->ReadAddrInRange(memea+bytes-1))
        {
          retval = *it; 
        }
      }
      return retval;
    }

    BOOL IsPossibleDirname(const char * pathname)
    {
      STRING_SET :: iterator fit;
      for ( fit = _fname_set.begin();
           fit != _fname_set.end(); ++fit)
      {
        const CHAR * fname = fit->c_str();
        if (strcmp(pathname, fname) == 0 ) continue; // this is the same set entry
        if (strstr(fname, pathname) == fname )
        {
          return TRUE; // pathname ('needle') exists at the beginning of 
                       // fname ('haystack')
        }
      }
      return FALSE;
    }

     static VOID checkReadList(ADDRINT memea_callback, UINT32 bytes,string *dis, VOID *v)
     {
        SYSSTATE_PRODUCER *p = (SYSSTATE_PRODUCER *) v;
        READ_STATE * rs = p->FindReadState(memea_callback, bytes);
        if (rs)
        {
#if 0
            ADDRINT offset = (ADDRINT) (memea_callback - rs->_buf_addr); 
            CHAR * base = rs->_shadow_buf  + offset;
            cerr << "checkFDlist(  memea_translated: " << hex << memea_callback << " bytes: " << dec << bytes << " " << *dis << endl;
            cerr << "Found READ_STATE: offset " << dec << offset;
            cerr << "  dst 0x" << hex << (ADDRINT)base;
            cerr << "  src " << hex << (VOID *) memea_callback;
            cerr << "  count " << dec << bytes << endl;
            cerr << "  byte 0 " << hex << *((UINT16 *)memea_callback) << endl;
            rs->PrintReadState();
            cerr << '\n' ;
#endif
            rs->SafeCopy((CHAR *)memea_callback, bytes);
            return;
        }
        rs = p->FindCWDState(memea_callback, bytes);
        if (rs)
        {
#if 0
            cerr << "Modifying CWD:READ_STATE: " << endl;
            rs->PrintReadState();
            ADDRINT offset = (ADDRINT) (memea_callback - rs->_buf_addr); 
            CHAR * base = rs->_shadow_buf  + offset;
            cerr << "checkFDlist(  memea_translated: " << hex << memea_callback << " bytes: " << dec << bytes << " " << *dis << endl;
            cerr << "Found READ_STATE: offset " << dec << offset;
            cerr << "  dst 0x" << hex << (ADDRINT)base;
            cerr << "  src " << hex << (VOID *) memea_callback;
            cerr << "  count " << dec << bytes << endl;
            cerr << "  byte 0 " << hex << *((UINT16 *)memea_callback) << endl;
            rs->PrintReadState();
            cerr << '\n' ;
#endif
            rs->SafeCopy((CHAR *)memea_callback, bytes);
            return;
        }
    }

    static VOID opMemoryFunc(
        ADDRINT memea_orig,ADDRINT memea_callback, UINT32 bytes, ADDRINT ip,
            string *dis, VOID *v)
    {
      SYSSTATE_PRODUCER *p = (SYSSTATE_PRODUCER *) v;
        PIN_RWMutexReadLock(&(p->_producerMutex));
        checkReadList(memea_callback, bytes, dis, v);
        PIN_RWMutexUnlock(&(p->_producerMutex));
    }

    static VOID printReadBuf(ADDRINT buf_addr, INT32 count)
    {
      ADDRINT addr=buf_addr; 
      while (addr < (buf_addr+count))
      {
        cerr << hex << setw(8) << (UINT32)(addr-buf_addr) << " ";
        for (UINT32 index=0; index < 16; index += 2)
        {
          cerr << hex << *((UINT16 *)(addr+index)) << " ";
        }
        cerr << endl;
        addr+=16;
      }
    }
    static VOID Instruction(INS ins, VOID *v)
    {
      string *disptr = new string(INS_Disassemble(ins));

      UINT32 memOperands = INS_MemoryOperandCount(ins);
      if (!INS_IsVgather(ins) && memOperands && 
            !xed_decoded_inst_is_prefetch(INS_XedDec(ins)))
      {
        // OPs
        for (UINT32 memOp = 0; memOp < memOperands; memOp++)
        {
            if (INS_MemoryOperandIsRead(ins, memOp))
            {
                INS_InsertCall(ins,
                    IPOINT_BEFORE,
                    (AFUNPTR)opMemoryFunc,
                    IARG_MEMORYOP_EA, memOp,
                    IARG_MEMORYOP_PTR, memOp,
                    IARG_UINT32,INS_MemoryOperandSize(ins,memOp),
                    IARG_INST_PTR ,
                    IARG_PTR, disptr,
                    IARG_PTR, v,
                    IARG_END);
            }
        }
      }
    }

    static VOID OutputBRKvalues(string out_dirname, VOID *v)
    {
      SYSSTATE_PRODUCER *p = (SYSSTATE_PRODUCER *) v;
      string fname = out_dirname + "/BRK.log";
      INT32 fid;
      mode_t mode = S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH;
      fid = open(fname.c_str(),O_WRONLY|O_CREAT|O_TRUNC, mode);
      if (fid == -1)
      {
        cerr << "Could not open output  file " <<
          fname.c_str() << endl;
        ASSERTX(0);
      }
      ostringstream ss;
      ss << "0x" << hex << p->_first_brk_retval << "\n";
      ss << "0x" << hex << p->_last_brk_retval << "\n";
      const char * outstr = ss.str().c_str();
      if (write(fid, outstr, strlen(outstr)) < 0 )
      {
        cerr << "Could not write to  file " <<
          fname.c_str() << endl;
        ASSERTX(0);
      }
    }

    static VOID OutputPIDvalue(string out_dirname, VOID *v)
    {
      SYSSTATE_PRODUCER *p = (SYSSTATE_PRODUCER *) v;
      string fname = out_dirname + "/PID.log";
      INT32 fid;
      mode_t mode = S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH;
      fid = open(fname.c_str(),O_WRONLY|O_CREAT|O_TRUNC, mode);
      if (fid == -1)
      {
        cerr << "Could not open output  file " <<
          fname.c_str() << endl;
        ASSERTX(0);
      }
      ostringstream ss;
      ss << "0x" << hex << p->_pid << "\n";
      const char * outstr = ss.str().c_str();
      if (write(fid, outstr, strlen(outstr)) < 0 )
      {
        cerr << "Could not write to  file " <<
          fname.c_str() << endl;
        ASSERTX(0);
      }
    }

    static VOID OutputMMAPvalues(string out_dirname, VOID *v)
    {
      SYSSTATE_PRODUCER *p = (SYSSTATE_PRODUCER *) v;
      string fname = out_dirname + "/MMAP.log";
      INT32 fid;
      mode_t mode = S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH;
      fid = open(fname.c_str(),O_WRONLY|O_CREAT|O_TRUNC, mode);
      if (fid == -1)
      {
        cerr << "Could not open output  file " <<
          fname.c_str() << endl;
        ASSERTX(0);
      }
      MMAP_ADDR_LIST :: iterator mit;
      cerr << "OutputMMAPvalues(): " << endl;
      for ( mit = p->_mmap_addr_list.begin();
             mit != p->_mmap_addr_list.end(); ++mit)
      {
        ostringstream ss;
        ss << "0x" << hex << *mit << "\n";
        const char * outstr = ss.str().c_str();
        if (write(fid, outstr, strlen(outstr)) < 0 )
        {
          cerr << "Could not write to  file " <<
            fname.c_str() << endl;
          ASSERTX(0);
        }
      }
    }

    static VOID OutputCWD(string out_dirname, VOID *v)
    {
      SYSSTATE_PRODUCER *p = (SYSSTATE_PRODUCER *) v;
      READ_STATE_LIST :: iterator cit;
      cerr << "OutputCWD(): " << endl;
      for ( cit = p->_cwd_state_list.begin();
             cit != p->_cwd_state_list.end(); ++cit)
      {
       if (strlen( (*cit)->_shadow_buf))
       {
          cerr << " found non-empty CWD shadow buff " << (*cit)->_shadow_buf << endl;
          p->_cwd_value = (*cit)->_shadow_buf;
          break;
       }
      }

      if (p->_cwd_value.empty()) return;

      cerr << "cwd_value: " << p->_cwd_value << endl;
      string fname = out_dirname + "/CWD.log";
      INT32 fid;
      mode_t mode = S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH;
      fid = open(fname.c_str(),O_WRONLY|O_CREAT|O_TRUNC, mode);
      if (fid == -1)
      {
        cerr << "Could not open output  file " <<
          fname.c_str() << endl;
        ASSERTX(0);
      }
      const char * outstr = p->_cwd_value.c_str();
      if (write(fid, outstr, strlen(outstr)) < 0 )
      {
        cerr << "Could not write to  file " <<
          fname.c_str() << endl;
        ASSERTX(0);
      }
    }

    static VOID FiniProducer( INT32 code, VOID *v)
    {
      SYSSTATE_PRODUCER *p = (SYSSTATE_PRODUCER *) v;
      if ( mkdir(p->_out_state_rootdirname.c_str(), 0755) != 0)
      {
        if (errno != EEXIST)
        {
          cerr << "Could not create output state directory " <<
            p->_out_state_rootdirname.c_str() << endl;
          ASSERTX(0);
        }
      }
      string default_workdirname;
      OutputCWD(p->_out_state_rootdirname, v);
      if(!p->_cwd_value.empty())
      {
        default_workdirname = p->_out_state_workdirname;
        string new_workdirname = p->_out_state_rootdirname + p->_cwd_value;
        //cerr << "TODO: create symlink from " << new_workdirname  << " to " << default_workdirname  << endl;
        FILE_STATE::CreatePath( new_workdirname);
#if 0
        FILE_STATE::CreatePath( p->_out_state_workdirname);
        string syscmd = "echo 'hi'; cd " + p->_out_state_rootdirname + "; pwd;  lndir ." + p->_cwd_value + " workdir";
        //system(syscmd.c_str());
        if(link(p->_out_state_workdirname.c_str(), default_workdirname.c_str())
            != 0)
        {
          cerr << "Could not create symlink from " <<
            p->_out_state_workdirname.c_str() << " to " << default_workdirname << endl;
          ASSERTX(0);
        }
#endif
      }
      if(p->_first_brk_retval != 0)
      {
        OutputBRKvalues(p->_out_state_rootdirname, v);
      }
      if(p->_pid != 0)
      {
        OutputPIDvalue(p->_out_state_rootdirname, v);
      }
      if(!p->_mmap_addr_list.empty())
      {
        OutputMMAPvalues(p->_out_state_rootdirname, v);
      }
      STRING_SET :: iterator fit;
      for ( fit = p->_fname_set.begin();
           fit != p->_fname_set.end(); ++fit)
      {
        const CHAR * fname = fit->c_str();
        const CHAR * basefname = basename(fname);
        const CHAR * dirfname = dirname(fname);
        string outdir_name;
        POS_SET dirty_pos_set;
        cerr << "Processing file " << fname << endl;
        cerr << "basename : " << basefname << endl;
        cerr << "dirname : " << dirfname << endl;
        if(IsAbsolutePathname(dirfname))
        {
          outdir_name = p->_out_state_rootdirname + dirfname;
        }
        else
        {
          if(IsCWDDirname(dirfname))
          {
            // dirfname starts with "CWD"
            string cwd_dirname = p->_cwd_value;
            outdir_name = p->_out_state_rootdirname + cwd_dirname;
          }
          else
          {
            outdir_name = p->_out_state_workdirname + dirfname;
          }
        }
        if(IsAbsolutePathname(fname))
        {
           //handling special case: e.g. "/lib" which was used with 'stat()'
           // '/lib' is  a directory but we do not know that
           // treat it as a directory if it appears as a prefix of some other
           // filename
          if(p->IsPossibleDirname(fname))
          {
            cerr << "Skipping processing " << fname  << " a possible directory " << endl;
            cerr << "========================\n";
            continue;
          }
        }
        FILE_STATE::CreatePath(outdir_name);
        string outfname = outdir_name + "/" + basefname;
        cerr << "outfname : " << outfname << endl;
        INT32 dummy_fileFD;
        mode_t mode = S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH;
        dummy_fileFD = open(outfname.c_str(),O_WRONLY|O_CREAT|O_TRUNC, mode);
        if (dummy_fileFD == -1)
        {
          cerr << "Could not open output  file " <<
            outfname.c_str() << endl;
          cerr << " errno " << errno << endl;
          return;
          //ASSERTX(0);
        }
        UINT32 write_count = 0;
        UINT32 max_count_req = 0;
        char * max_shadow_buf = NULL;
        READ_STATE_LIST :: iterator rit;
        for ( rit = p->_read_state_list.begin();
             rit != p->_read_state_list.end(); ++rit)
        {
           //if((*rit)->_fname==*(fit)) (*rit)->PrintReadState();
           if((*rit)->_fname == *fit)
           {
              UINT32 this_write_count = (*rit)->OutputReadState(dummy_fileFD);
              if(this_write_count)
              {
                dirty_pos_set.insert((*rit)->_file_pos);
              }
              else
              {
                if(!dirty_pos_set.count((*rit)->_file_pos))
                {
                  // this _file_pos has not had a 'real' write yet, add an empty one
                  UINT32 count_written = write(dummy_fileFD, (*rit)->_shadow_buf, (*rit)->_count_req);
                  //cerr << " writing an empty buffer at pos " << dec << (*rit)->_file_pos << endl;
                  ASSERTX(count_written == (*rit)->_count_req);
                }
              }
              write_count += this_write_count;
              if((*rit)->_count_req > max_count_req) 
              {
                max_count_req = (*rit)->_count_req;
                max_shadow_buf =  (*rit)->_shadow_buf;
              }
           }
        }
        if(write_count == 0)
        {
          // no dirty bytes found. Write out the largest buffer (empty)
          UINT32 count_written = write(dummy_fileFD, max_shadow_buf, max_count_req);
          ASSERTX(count_written == max_count_req);
        }
        close(dummy_fileFD);
        cerr << "========================\n";
      }
    }

    static VOID ThreadStartProducer(THREADID threadid, CONTEXT *ctxt,
        INT32 flags, VOID *v)
    {
      SYSSTATE_PRODUCER *p = (SYSSTATE_PRODUCER *) v;
      thread_data_t* tdata = new thread_data_t;
      memset(tdata, 0, sizeof(*tdata));
      if (PIN_SetThreadData(p->producer_tls_key, tdata, threadid) == FALSE)
      {
          cerr << "PIN_SetThreadData failed" << endl;
          PIN_ExitProcess(1);
      }
    }

  static VOID syscallEntryCallbackProducer(THREADID threadid, CONTEXT *ctxt, 
       SYSCALL_STANDARD syscall_standard, VOID *v) 
  {
    SYSSTATE_PRODUCER *p = (SYSSTATE_PRODUCER *) v;
    ADDRINT syscall_ip = PIN_GetContextReg(ctxt, REG_INST_PTR);
    ADDRINT syscall_num = PIN_GetSyscallNumber(ctxt, syscall_standard);
    ADDRINT arg0 = PIN_GetSyscallArgument(ctxt, syscall_standard, 0);
    ADDRINT arg1 = PIN_GetSyscallArgument(ctxt, syscall_standard, 1);
    ADDRINT arg2 = PIN_GetSyscallArgument(ctxt, syscall_standard, 2);
    ADDRINT arg3 = PIN_GetSyscallArgument(ctxt, syscall_standard, 3);
    ADDRINT arg4 = PIN_GetSyscallArgument(ctxt, syscall_standard, 4);
    ADDRINT arg5 = PIN_GetSyscallArgument(ctxt, syscall_standard, 5);
    thread_data_t* tdata = static_cast<thread_data_t*>
         (PIN_GetThreadData(p->producer_tls_key, threadid));
    ASSERTX(0 == tdata->_data.sys_ip);
    tdata->_data.sys_ip = syscall_ip;
    tdata->_data.sys_num = syscall_num;
    tdata->_data.arg0 = arg0;
    tdata->_data.arg1 = arg1;
    tdata->_data.arg2 = arg2;
    tdata->_data.arg3 = arg3;
    tdata->_data.arg4 = arg4;
    tdata->_data.arg5 = arg5;

   
#if 0
   if(p->_verbose)
   {
    cerr << " Producer:SysBefore threadid " << threadid <<
          " num " << syscall_num <<
          hex << " ip " << syscall_ip
          << " arg0 " << arg0
          << " arg1 " << arg1
          << " arg2 " << arg2
          << " arg3 " << arg3
          << " arg4 " << arg4
          << " arg5 " << arg5
          << endl;
   }
#endif
    switch (tdata->_data.sys_num)
    {
      case SYS_getcwd:
      {
        PIN_RWMutexReadLock(&(p->_producerMutex));
        if(p->_verbose)
        {
              cerr << " Producer:SysBefore SYS_getcwd threadid " << threadid; 
              cerr << " num 0x" << hex <<  tdata->_data.sys_num
                  << hex << " ip 0x" << tdata->_data.sys_ip
                  << " arg 0 0x" << hex <<  tdata->_data.arg0
                  << " bufptr " << p->TranslateAddress(tdata->_data.arg0)
                  << endl;
        }
        PIN_RWMutexUnlock(&(p->_producerMutex));
        break;
      }
    }
  }

  static VOID syscallExitCallbackProducer(THREADID threadid, CONTEXT *ctxt,
     SYSCALL_STANDARD syscall_standard, VOID *v) 
  {
    SYSSTATE_PRODUCER *p = (SYSSTATE_PRODUCER *) v;
    ADDRINT syscall_retval = PIN_GetSyscallReturn(ctxt, syscall_standard);
    thread_data_t* tdata = static_cast<thread_data_t*>
         (PIN_GetThreadData(p->producer_tls_key, threadid));
    switch (tdata->_data.sys_num)
    {
      case SYS_getcwd:
      {
        PIN_RWMutexReadLock(&(p->_producerMutex));
   if(p->_verbose)
   {
        cerr << " Producer:SysAfter SYS_getcwd threadid " << threadid; 
        cerr << " num 0x" << hex <<  tdata->_data.sys_num
            << hex << " ip 0x" << tdata->_data.sys_ip
            << " retval 0x" << hex << syscall_retval 
            << " arg 0 0x" << hex <<  tdata->_data.arg0
            << " bufptr " << p->TranslateAddress(tdata->_data.arg0)
            //<< " *buf " << (char *)p->TranslateAddress(tdata->_data.arg0)
            << endl;
   }
          ADDRINT trans_addr = p->TranslateAddress(tdata->_data.arg0);
          ASSERT(trans_addr, "getcwd() with NULL buffer seen\n");
          INT32 buflength =  tdata->_data.arg1;
          p->AddCWDState(tdata->_data.sys_ip, trans_addr, buflength);
          PIN_RWMutexUnlock(&(p->_producerMutex));
          break;
      }
      case SYS_open:
      {
        PIN_RWMutexReadLock(&(p->_producerMutex));
   if(p->_verbose)
   {
        cerr << " Producer:SysAfter SYS_open threadid " << threadid; 
        cerr << " num 0x" << hex <<  tdata->_data.sys_num
            << hex << " ip 0x" << tdata->_data.sys_ip
            << " retval 0x" << hex << syscall_retval 
            << " arg 0 0x" << hex <<  tdata->_data.arg0
            << " pathname " << (char *)p->TranslateAddress(tdata->_data.arg0)
            << endl;
   }
#if 0
            << " arg0 " << tdata->_data.arg0
            << " arg1 " << tdata->_data.arg1
            << " arg2 " << tdata->_data.arg2
            << " arg3 " << tdata->_data.arg3
            << " arg4 " << tdata->_data.arg4
            << " arg5 " << tdata->_data.arg5
            << endl;
#endif
            INT32 fd = syscall_retval;
            if ( fd != -1 )
            {
              //string fname((char *)tdata->_data.arg0);
              string fname((char *)p->TranslateAddress(tdata->_data.arg0));
              if(p->_verbose){
                 cerr << " open:pathname " << fname
                 << " fd " << fd << endl;
              }
              string dummy_cwd_value = "CWD/";
              if(!IsAbsolutePathname(fname))
              {
                fname = dummy_cwd_value + fname;
              }
              string cleanfname = FILE_STATE::CleanPathName(fname);

              ASSERT(fd < MAXFD, "file descriptor too big.\n");
              FILE_STATE * fs =  p->_fd2fstate[fd];
              if (fs == NULL)
              {
                fs = new FILE_STATE(cleanfname, fd);
              }
              else
              {
                // this fd is getting re-used
                fs->_fd = fd;
                fs->_fname = cleanfname; 
                fs->_current_file_pos = 0;
              }
              if(p->_verbose) cerr << " Producer:SysAfter SYS_open inserting " << cleanfname << endl; 
              p->_fname_set.insert(cleanfname);
            }
          PIN_RWMutexUnlock(&(p->_producerMutex));
          break;
      }
      case SYS_openat:
      {
        PIN_RWMutexReadLock(&(p->_producerMutex));
            INT32 fd = syscall_retval;
   if(p->_verbose)
   {
        cerr << " Producer:SysAfter SYS_openat threadid " << threadid; 
        cerr << " num 0x" << hex <<  tdata->_data.sys_num
            << hex << " ip 0x" << tdata->_data.sys_ip
            << " retval 0x" << hex << syscall_retval 
            << " arg 1 0x" << hex <<  tdata->_data.arg1
            << " pathname " << (char *)p->TranslateAddress(tdata->_data.arg1)
            << endl;
   }
            if ( fd != -1 )
            {
              ASSERT(fd < MAXFD, "file descriptor too big.\n");
              string fname((char *)p->TranslateAddress(tdata->_data.arg1));
              string dummy_cwd_value = "CWD/";
              if(!IsAbsolutePathname(fname))
              {
                INT32 dirfd = tdata->_data.arg0;
                ASSERT(dirfd == AT_FDCWD, "openat() dirfd not AT_FCWD\n");
                fname = dummy_cwd_value + fname;
              }
             
              string cleanfname = FILE_STATE::CleanPathName(fname);
              FILE_STATE * fs =  p->_fd2fstate[fd];
              if (fs == NULL)
              {
                fs = new FILE_STATE(cleanfname, fd);
                p->_fd2fstate[fd] = fs;
              }
              else
              {
                // this fd is getting re-used
                fs->_fd = fd;
                fs->_fname = cleanfname; 
                fs->_current_file_pos = 0;
              }
              if(p->_verbose) cerr << " Producer:SysAfter SYS_openat inserting " << cleanfname << endl; 
              p->_fname_set.insert(cleanfname);
            }
          PIN_RWMutexUnlock(&(p->_producerMutex));
          break;
      }
      case SYS_stat:
      {
        PIN_RWMutexReadLock(&(p->_producerMutex));
            INT32 retval = syscall_retval;
   if(p->_verbose)
   {
        cerr << " Producer:SysAfter SYS_stat threadid " << threadid; 
        cerr << " num 0x" << hex <<  tdata->_data.sys_num
            << hex << " ip 0x" << tdata->_data.sys_ip
            << " retval 0x" << hex << syscall_retval 
            << " arg 0 0x" << hex <<  tdata->_data.arg0
            << " pathname " << (char *)p->TranslateAddress(tdata->_data.arg0)
            << endl;
   }
            if ( retval != -1 )
            {
              string fname((char *)p->TranslateAddress(tdata->_data.arg0));
              string dummy_cwd_value = "CWD/";
              if(!IsAbsolutePathname(fname))
              {
                fname = dummy_cwd_value + fname;
              }
              string cleanfname = FILE_STATE::CleanPathName(fname);
              if(p->_verbose) cerr << " Producer:SysAfter SYS_stat inserting " << cleanfname << endl; 
              p->_fname_set.insert(cleanfname);
              // Not adding to _fd2fstate[] because there is no 'fd' here
            }
        PIN_RWMutexUnlock(&(p->_producerMutex));
        break;
      }
      case SYS_fstat:
      {
        PIN_RWMutexReadLock(&(p->_producerMutex));
            INT32 retval = syscall_retval;
            if ( retval == 0 )
            {
              INT32 fd = tdata->_data.arg0;
              if(p->_verbose){
                 cerr << " fstat:fd " << fd << endl;
              }
              ASSERT(fd < MAXFD, "file descriptor too big.\n");
              FILE_STATE * fs =  p->_fd2fstate[fd];
              if (fs == NULL)
              {
                ostringstream ss;
                ss << fd;
                string fname =  "CWD/FD_" + ss.str();
                fs = new FILE_STATE(fname, fd);
                fs->_fname = fname;
                p->_fd2fstate[fd] = fs;
              }
              else
              {
                // this fd exists already 
              }
            }
        PIN_RWMutexUnlock(&(p->_producerMutex));
        break;
      }
      case SYS_close:
      {
        PIN_RWMutexReadLock(&(p->_producerMutex));
        if(p->_verbose)
        {
          cerr << " Producer:SysAfter SYS_close threadid " << threadid; 
          cerr << " num 0x" << hex <<  tdata->_data.sys_num
            << hex << " ip 0x" << tdata->_data.sys_ip
            << " retval 0x" << hex << syscall_retval 
            << " arg 0 FD 0x" << hex <<  tdata->_data.arg0
            << endl;
        }
        INT32 fd = tdata->_data.arg0;
        if(p->_verbose){
          cerr << " close:fd " << fd << endl;
        }
        ASSERT(fd < MAXFD, "file descriptor too big.\n");
        FILE_STATE * fs =  p->_fd2fstate[fd];
        if(fs)
        {
          p->_fd2fstate[fd] = NULL;
        }
        else
        {
            //close() for non-existing file_state
            //do nothing
        }
        PIN_RWMutexUnlock(&(p->_producerMutex));
        break;
      }
      case SYS_lseek:
      {
        PIN_RWMutexReadLock(&(p->_producerMutex));
        INT32 fd = tdata->_data.arg0;
        if(p->_verbose)
        {
          cerr << " Producer:SysAfter SYS_lseek threadid " << threadid; 
          cerr << " num 0x" << hex <<  tdata->_data.sys_num
            << hex << " ip 0x" << tdata->_data.sys_ip
            << " retval 0x" << hex << syscall_retval 
            << " arg 0 FD 0x" << hex <<  tdata->_data.arg0
            << endl;
   }
#if 0
            << " arg0 " << tdata->_data.arg0
            << " arg1 " << tdata->_data.arg1
            << " arg2 " << tdata->_data.arg2
            << " arg3 " << tdata->_data.arg3
            << " arg4 " << tdata->_data.arg4
            << " arg5 " << tdata->_data.arg5
            << endl;
#endif
         if ( (fd != -1) && ((INT32)syscall_retval != -1))
         {
            FILE_STATE * fs =  p->_fd2fstate[fd];
            ASSERT(fs, "seek() on non-exising fd\n");
            fs->SetFilePos(syscall_retval);
         }
        PIN_RWMutexUnlock(&(p->_producerMutex));
        break;
      }
      //case SYS_mmap2:
      case SYS_mmap:
      {
#if defined(TARGET_LINUX) && defined(TARGET_IA32)
        ASSERT(0, "mmap() handling on 32-bit Linux NIY\n");
#endif
        //void *mmap(void *addr, size_t length, int prot, int flags,
        //          int fd, off_t offset);

        PIN_RWMutexReadLock(&(p->_producerMutex));
        INT32 fd = tdata->_data.arg4;
        UINT32 length = tdata->_data.arg1;
        UINT32 offset = tdata->_data.arg5;
        if ( (fd != -1) && ((INT32)syscall_retval != -1))
        {
          ADDRINT mapped_addr = p->TranslateAddress(syscall_retval);
          if(p->_verbose)
          {
            cerr << " Producer:SysAfter SYS_mmap? threadid " << threadid; 
            cerr << " num 0x" << hex <<  tdata->_data.sys_num
              << hex << " ip 0x" << tdata->_data.sys_ip
              << " retval 0x" << hex << syscall_retval 
              << " translated retval 0x" << hex << mapped_addr 
              << " length " << dec <<  length
              << " offset " << dec <<  offset
              << " fd " << dec <<  fd
              << endl;
          }
          FILE_STATE * fs =  p->_fd2fstate[fd];
          if (fs) 
          {
            p->AddReadState(tdata->_data.sys_ip, mapped_addr, length, length, offset,
                 fs->_fname);
            if(p->_verbose){
              cerr << "Adding MMAP info as ReadState to  existing FD " 
                  << fd << " " << fs->_fname << endl;
             } 
          }
          else
          {
            ostringstream ss;
            ss << fd;
            string fname =  "CWD/FD_" + ss.str();
            fs = new FILE_STATE(fname, fd);
            fs->_current_file_pos = offset;
            fs->_fname = fname;
            p->AddReadState(tdata->_data.sys_ip, mapped_addr, length, length, offset,
                 fname);
            if(p->_verbose){
                cerr << "Adding MMAP info as ReadState to  new FD " << fd << endl;
            }
            if(p->_verbose) cerr << " Producer:SysAfter SYS_mmap inserting " << fname << endl; 
            p->_fname_set.insert(fname);
            p->_fd2fstate[fd] = fs;
          }
        }
        p->_mmap_addr_list.push_back(syscall_retval);
        if(p->_verbose)
        {
          cerr << "MMAP: pushed value 0x" << hex << syscall_retval << endl;
        }
        PIN_RWMutexUnlock(&(p->_producerMutex));
        break;
      }
      case SYS_read:
      {
        PIN_RWMutexReadLock(&(p->_producerMutex));
        if(p->_verbose)
        {
          cerr << " Producer:SysAfter SYS_read threadid " << threadid; 
          cerr << " num " << tdata->_data.sys_num
            << hex << " ip 0x" << tdata->_data.sys_ip
            << " retval 0x" << hex << syscall_retval 
            << " fd 0x" << hex << tdata->_data.arg0
            << " buf 0x" << hex << tdata->_data.arg1
            << " translated buf 0x" << hex << p->TranslateAddress(tdata->_data.arg1)
            << " count 0x" << hex << tdata->_data.arg2
            << endl;
        //printReadBuf(tdata->_data.arg1, tdata->_data.arg2);
        }
#if 0
            << " arg0 " << tdata->_data.arg0
            << " arg1 " << tdata->_data.arg1
            << " arg2 " << tdata->_data.arg2
            << " arg3 " << tdata->_data.arg3
            << " arg4 " << tdata->_data.arg4
            << " arg5 " << tdata->_data.arg5
            << endl;
#endif
          INT32 fd = tdata->_data.arg0;
          ADDRINT trans_addr = p->TranslateAddress(tdata->_data.arg1);
          INT32 count_req =  tdata->_data.arg2;
          INT32 count_act =  syscall_retval;
          FILE_STATE * fs =  p->_fd2fstate[fd];
          if (fs) 
          {
            p->AddReadState(tdata->_data.sys_ip, trans_addr, count_req, count_act, 
               fs->_current_file_pos, fs->_fname);
            fs->_current_file_pos += count_act;
            if(p->_verbose){
              cerr << "Adding ReadState to  existing FD " 
                  << fd << " " << fs->_fname << endl;
             } 
          }
          else
          {
            string outdir_name = (p->_out_state_workdirname);
            ostringstream ss;
            ss << fd;
            string fname =  "CWD/FD_" + ss.str();
            fs = new FILE_STATE(fname, fd);
            p->AddReadState(tdata->_data.sys_ip, trans_addr, count_req, count_act, 
               fs->_current_file_pos, fs->_fname);
            fs->_current_file_pos += count_act;
            if(p->_verbose){
                cerr << "Adding ReadState to  new FD " 
                  << fd << " " << fs->_fname << endl;
            }
            if(p->_verbose) cerr << " Producer:SysAfter SYS_read inserting " << fname << endl; 
            p->_fname_set.insert(fname);
            p->_fd2fstate[fd] = fs;
          }
        PIN_RWMutexUnlock(&(p->_producerMutex));
        break;
      }
      case SYS_write:
      {
        PIN_RWMutexReadLock(&(p->_producerMutex));
        if(p->_verbose)
        {
        cerr << " Producer:SysAfter SYS_write threadid " << threadid; 
        cerr << " num " << tdata->_data.sys_num
            << hex << " ip 0x" << tdata->_data.sys_ip
            << " retval 0x" << hex << syscall_retval 
            << " fd 0x" << hex << tdata->_data.arg0
            << " buf 0x" << hex << tdata->_data.arg1
            << " translated buf 0x" << hex << p->TranslateAddress(tdata->_data.arg1)
            << " count 0x" << hex << tdata->_data.arg2
            << endl;
        }
          INT32 fd = tdata->_data.arg0;
          FILE_STATE * fs =  p->_fd2fstate[fd];
          if (fs) 
          {
            if(p->_verbose){
              cerr << "Write  to  existing FD " 
                  << fd << " " << fs->_fname << endl;
             } 
            p->_fname_set.insert(fs->_fname);
          }
          else
          {
            string outdir_name = (p->_out_state_workdirname);
            ostringstream ss;
            ss << fd;
            string fname =  "CWD/FD_" + ss.str();
            fs = new FILE_STATE(fname, fd);
            if(p->_verbose){
                cerr << "Write  to  new FD " 
                  << fd << " " << fs->_fname << endl;
            }
            p->_fd2fstate[fd] = fs;
            p->_fname_set.insert(fname);
          }
        PIN_RWMutexUnlock(&(p->_producerMutex));
        break;
      }
     case SYS_brk:
     {
        PIN_RWMutexReadLock(&(p->_producerMutex));
        if(tdata->_data.arg0 == 0)
        {
          cerr << " SYS_brk(0) return value " << hex << syscall_retval << endl;
        }
        else
        {
          if(syscall_retval != tdata->_data.arg0)
            cerr << " WARNING:SYS_brk return value " << hex << syscall_retval
              << " does not match arg0 " << hex << tdata->_data.arg0   << endl;
        }
        if(p->_first_brk_retval == 0)
        {
          p->_first_brk_retval = syscall_retval;
        }
        p->_last_brk_retval = syscall_retval;
   if(p->_verbose)
   {
        cerr << " Producer:SysAfter SYS_brk threadid " << threadid; 
        cerr << " num 0x" << hex <<  tdata->_data.sys_num
            << hex << " ip 0x" << tdata->_data.sys_ip
            << " arg0 0x" << hex << tdata->_data.arg0
            << " retval 0x" << hex << syscall_retval  << endl;
   }
        PIN_RWMutexUnlock(&(p->_producerMutex));
        break;
       }
      case SYS_getpid:
      {
        PIN_RWMutexReadLock(&(p->_producerMutex));
        if(tdata->_data.arg0 == 0)
        {
          cerr << " SYS_getpid(0) return value " << hex << syscall_retval << endl;
        }
        if(p->_pid == 0)
        {
          p->_pid = syscall_retval;
        }
   if(p->_verbose)
   {
        cerr << " Producer:SysAfter SYS_getpid threadid " << threadid; 
        cerr << " num 0x" << hex <<  tdata->_data.sys_num
            << hex << " ip 0x" << tdata->_data.sys_ip
            << " retval 0x" << hex << syscall_retval  << endl;
   }
        PIN_RWMutexUnlock(&(p->_producerMutex));
        break;
       }

     }
     tdata->_data.sys_ip = 0;
  }
  PIN_RWMUTEX     _producerMutex;
  PINPLAY_ENGINE     *_pinplay_engine;
  //for accessing TLS storage in the threads. initialized in the constructor
  TLS_KEY producer_tls_key;
  STRING_SET _fname_set;
  FILE_STATE * _fd2fstate[MAXFD];
  READ_STATE_LIST _read_state_list;
  READ_STATE_LIST _cwd_state_list;
  MMAP_ADDR_LIST _mmap_addr_list;
  string _out_state_rootdirname;
  string _out_state_workdirname;
  char * _cwd_buf_addr;
  string _cwd_value;
  ADDRINT _first_brk_retval;
  ADDRINT _last_brk_retval;
  ADDRINT _pid;
  bool _verbose;
};


class SYSSTATE_CONSUMER
{
  public:
    SYSSTATE_CONSUMER(PINPLAY_ENGINE *pinplay_engine, string statedirname, bool verbose)
    {
      _in_state_rootdirname = statedirname;
      _in_state_workdirname = statedirname;
      _verbose = verbose;
      _first_brk_addr = 0;
      _pid = 0;
      _first_brk_seen = false;
      bzero(_cwd_path, CWDMAX);
      cerr << "Consumer " << statedirname << endl;
      PIN_AddSyscallEntryFunction(syscallEntryCallbackConsumer, this);
      PIN_AddSyscallExitFunction(syscallExitCallbackConsumer, this);
      // Register ThreadStart to be called when a thread starts.
      PIN_AddThreadStartFunction(ThreadStartConsumer, this);
      PIN_AddApplicationStartFunction(StartConsumer, this);
      consumer_tls_key = PIN_CreateThreadDataKey(NULL);
      _pinplay_engine = pinplay_engine;
      PIN_RWMutexInit(&_consumerMutex);
    }

    ADDRINT TranslateAddress(ADDRINT origaddr)
    {
      return _pinplay_engine->ReplayerTranslateAddress(origaddr);
    }
    
    const char * WorkDirName()
    {
      return _in_state_workdirname.c_str();
    }
    
    string CWDName()
    {
      if(IsAbsolutePathname(_in_state_rootdirname))
      {
        if (_cwd_path[0] == 0)
        {
          return _in_state_workdirname;
        }
        else
        {
          string cwdstring = _in_state_rootdirname + _cwd_path;
          return cwdstring;
        }
      }
      else
      {
        char mycwd[CWDMAX];
        if (getcwd(mycwd, CWDMAX-1) == NULL)
        {
          cerr << "CWDName():ERROR with getcwd() " << endl;
          ASSERTX(0);
        }
        if (_cwd_path[0] == 0)
        {
          string cwdstring = mycwd + _in_state_workdirname;
          return cwdstring;
        }
        else
        {
          string cwdstring = mycwd + string("/") + _in_state_rootdirname + _cwd_path;
          return cwdstring;
        }
      }
    }

  private:

    static VOID ProcessBRKvalues(const char * fname, VOID *v)
    {
      ADDRINT first_brk_addr = 0;
      ADDRINT last_brk_addr = 0;
      SYSSTATE_CONSUMER *p = (SYSSTATE_CONSUMER *) v;
      fstream brkfile;
      brkfile.open(fname, fstream::in); 
      
      brkfile >> hex >> first_brk_addr;
      brkfile >> hex >> last_brk_addr;
      cerr << "BRK.log first_brk_addr 0x" << hex << first_brk_addr << endl;
      cerr << "BRK.log last_brk_addr 0x" << hex << last_brk_addr << endl;
      p->_first_brk_addr = first_brk_addr;
      p->_first_brk_seen = FALSE;
    }

    static VOID ProcessPIDvalues(const char * fname, VOID *v)
    {
      ADDRINT pid = 0;
      SYSSTATE_CONSUMER *p = (SYSSTATE_CONSUMER *) v;
      fstream pidfile;
      pidfile.open(fname, fstream::in); 
      
      pidfile >> hex >> pid;
      cerr << "PID.log pid 0x" << hex << pid << endl;
      p->_pid = pid;
    }

    static VOID ProcessMMAPvalues(const char * fname, VOID *v)
    {
      ADDRINT mmap_value = 0;
      SYSSTATE_CONSUMER *p = (SYSSTATE_CONSUMER *) v;
      fstream mmapfile;
      mmapfile.open(fname, fstream::in); 
      
      while(!mmapfile.eof())
      {
        mmapfile >> hex >> mmap_value;
        p->_mmap_addr_list.push_back(mmap_value);
        //cerr << "MMAP: read value 0x" << hex << mmap_value << endl;
      }
    }


    static VOID StartConsumer(VOID *v)
    {
      SYSSTATE_CONSUMER *p = (SYSSTATE_CONSUMER *) v;
      DIR *indir;
      struct dirent *ent;
      indir = opendir(p->_in_state_rootdirname.c_str());
      if (indir != NULL)
      {
        string brkfname = p->_in_state_rootdirname  + "/" + "BRK.log";
        INT32 brkFd = open(brkfname.c_str(), O_RDWR, S_IRWXU);
        if (brkFd != -1 ) {
          cerr << "Found " << brkfname << endl;
          close(brkFd);
          ProcessBRKvalues(brkfname.c_str(),v);
        }
        string pidfname = p->_in_state_rootdirname  + "/" + "PID.log";
        INT32 pidFd = open(pidfname.c_str(), O_RDWR, S_IRWXU);
        if (pidFd != -1 ) {
          cerr << "Found " << pidfname << endl;
          close(pidFd);
          ProcessPIDvalues(pidfname.c_str(),v);
        }

        string mmapfname = p->_in_state_rootdirname  + "/" + "MMAP.log";
        INT32 mmapFd = open(mmapfname.c_str(), O_RDWR, S_IRWXU);
        if (mmapFd != -1 ) {
          cerr << "Found " << mmapfname << endl;
          close(mmapFd);
          ProcessMMAPvalues(mmapfname.c_str(),v);
        }
        string cwdfname = p->_in_state_rootdirname  + "/" + "CWD.log";
        cerr << " Opening  " << cwdfname << endl;
        INT32 cwdFd = open(cwdfname.c_str(), O_RDWR, S_IRWXU);
        if (cwdFd != -1 ) {
          cerr << "Opened " << cwdfname << endl;
          if (read(cwdFd, p->_cwd_path, CWDMAX) == 0 )
          {
            cerr << "Could not read from file " <<
              cwdfname.c_str() << endl;
          }
          cerr << "set _cwd_path " << p->_cwd_path << endl;
          p->_in_state_workdirname  += p->_cwd_path;
          close(cwdFd);
          indir = opendir(p->_in_state_workdirname.c_str());
        }
        while((ent = readdir(indir)) != NULL)
        {
         string origfname =  ent->d_name;
         // Filter out "." and ".."
         if(origfname.find(".") != 0)
         {
          if(origfname.find("FD_") == 0)
          {
            string fdstr= origfname.substr(origfname.find('_')+1);
            INT32 origFd = atoi(fdstr.c_str());
            INT32 currentFd = -1;
            string sysfname = p->_in_state_workdirname + "/" + origfname;
            cerr << " Pre-opened FD file " << sysfname << endl;
            //currentFd = open(sysfname.c_str(), O_RDONLY|O_WRONLY);
            if(origFd == 2)
            {
              cerr << "Skipping 'stderr' re-direction with  " << sysfname << endl;
              continue;
            }
            else
            {
              currentFd = open(sysfname.c_str(), O_RDWR, S_IRWXU);
              if (currentFd == -1 ) {
                cerr << "Error: Unable to open file; " << sysfname << endl;
                continue;
              }
              cerr << "                currentFd " << currentFd << endl;
              if (currentFd != origFd) {
                INT32 retFd = dup2(currentFd, origFd);
                cerr << "                dup2():retFd " << retFd << endl;
              }
            }
          }
         }
        }
      }
    }
    
    static VOID ThreadStartConsumer(THREADID threadid, CONTEXT *ctxt,
        INT32 flags, VOID *v)
    {
      SYSSTATE_CONSUMER *p = (SYSSTATE_CONSUMER *) v;
      thread_data_t* tdata = new thread_data_t;
      memset(tdata, 0, sizeof(*tdata));
      if (PIN_SetThreadData(p->consumer_tls_key, tdata, threadid) == FALSE)
      {
          cerr << "PIN_SetThreadData failed" << endl;
          PIN_ExitProcess(1);
      }
    }

  static VOID syscallEntryCallbackConsumer(THREADID threadid, CONTEXT *ctxt, 
       SYSCALL_STANDARD syscall_standard, VOID *v) 
  {
    SYSSTATE_CONSUMER *p = (SYSSTATE_CONSUMER *) v;
    ADDRINT syscall_ip = PIN_GetContextReg(ctxt, REG_INST_PTR);
    ADDRINT syscall_num = PIN_GetSyscallNumber(ctxt, syscall_standard);
    ADDRINT arg0 = PIN_GetSyscallArgument(ctxt, syscall_standard, 0);
    ADDRINT arg1 = PIN_GetSyscallArgument(ctxt, syscall_standard, 1);
    ADDRINT arg2 = PIN_GetSyscallArgument(ctxt, syscall_standard, 2);
    ADDRINT arg3 = PIN_GetSyscallArgument(ctxt, syscall_standard, 3);
    ADDRINT arg4 = PIN_GetSyscallArgument(ctxt, syscall_standard, 4);
    ADDRINT arg5 = PIN_GetSyscallArgument(ctxt, syscall_standard, 5);
    thread_data_t* tdata = static_cast<thread_data_t*>
         (PIN_GetThreadData(p->consumer_tls_key, threadid));
    ASSERTX(0 == tdata->_data.sys_ip);
    tdata->_data.sys_ip = syscall_ip;
    tdata->_data.sys_num = syscall_num;
    tdata->_data.arg0 = arg0;
    tdata->_data.arg1 = arg1;
    tdata->_data.arg2 = arg2;
    tdata->_data.arg3 = arg3;
    tdata->_data.arg4 = arg4;
    tdata->_data.arg5 = arg5;

#if 0
    cerr << " Consumer:SysBefore threadid " << threadid <<
          " num " << dec << syscall_num <<
          hex << " ip " << syscall_ip
          << " arg0 " << arg0
          << " arg1 " << arg1
          << " arg2 " << arg2
          << " arg3 " << arg3
          << " arg4 " << arg4
          << " arg5 " << arg5
          << endl;
#endif
    switch (syscall_num)
    {
      case SYS_getcwd:
      {
        PIN_RWMutexReadLock(&(p->_consumerMutex));
   if(p->_verbose)
   {
        cerr << " Consumer:SysBefore SYS_getcwd threadid " << threadid; 
        cerr << " num 0x" << hex <<  tdata->_data.sys_num
            << hex << " ip 0x" << tdata->_data.sys_ip
            << " arg 0 0x" << hex <<  tdata->_data.arg0
            << " bufptr " << p->TranslateAddress(tdata->_data.arg0)
            << endl;
   }
          PIN_RWMutexUnlock(&(p->_consumerMutex));
          break;
      }
      case SYS_open:
      {
        PIN_RWMutexReadLock(&(p->_consumerMutex));
          string sysfname; 
          string fname((char *)tdata->_data.arg0);
          cerr << " open:pathname " << fname;
          if(IsAbsolutePathname(fname))
            sysfname = p->_in_state_rootdirname  + "/" + fname;
          else
            sysfname = p->_in_state_workdirname  + "/" + fname;
          if (access(sysfname.c_str(), F_OK) !=-1 )
          {
            cerr << " will use " << sysfname << endl;
            PIN_SetSyscallArgument(ctxt, syscall_standard, 0, 
                  (ADDRINT)strdup(sysfname.c_str()));
          }
        PIN_RWMutexUnlock(&(p->_consumerMutex));
        break;
      }
      case SYS_openat:
      {
        PIN_RWMutexReadLock(&(p->_consumerMutex));
          string sysfname; 
          string fname((char *)p->TranslateAddress(tdata->_data.arg1));
          if(!IsAbsolutePathname(fname))
          {
            INT32 dirfd = tdata->_data.arg0;
            ASSERT(dirfd == AT_FDCWD, "openat() dirfd not AT_FCWD\n");
            string cwd_value = p->CWDName();
            const char * fnameval = fname.c_str();
            if(fnameval[0] == '.')
            {
             fnameval = fnameval+1;
            }
            sysfname = cwd_value + fnameval;
          }
          if (access(sysfname.c_str(), F_OK) !=-1 )
          {
            //cerr << " will use " << sysfname << endl;
            PIN_SetSyscallArgument(ctxt, syscall_standard, 1, 
                  (ADDRINT)strdup(sysfname.c_str()));
          }
        PIN_RWMutexUnlock(&(p->_consumerMutex));
        break;
      }
      case SYS_stat:
      {
        PIN_RWMutexReadLock(&(p->_consumerMutex));
          string sysfname;
          string fname((char *)p->TranslateAddress(tdata->_data.arg0));
          if(IsAbsolutePathname(fname))
            sysfname = p->_in_state_rootdirname  + "/" + fname;
          else
            sysfname = p->_in_state_workdirname  + "/" + fname;
          if (access(sysfname.c_str(), F_OK) !=-1 )
          {
            PIN_SetSyscallArgument(ctxt, syscall_standard, 0, 
                  (ADDRINT)strdup(sysfname.c_str()));
          }
        PIN_RWMutexUnlock(&(p->_consumerMutex));
        break;
      }

      case SYS_read:
      {
        PIN_RWMutexReadLock(&(p->_consumerMutex));
   if(p->_verbose)
   {
        cerr << " Consumer:SysBefore SYS_read threadid " << threadid; 
        cerr << " num " << tdata->_data.sys_num
            << hex << " ip 0x" << tdata->_data.sys_ip
            << " fd 0x" << hex << tdata->_data.arg0
            << " buf 0x" << hex << tdata->_data.arg1
            << " translated buf 0x" << hex << p->TranslateAddress(tdata->_data.arg1)
            << " count 0x" << hex << tdata->_data.arg2
            << endl;
   }
       //printReadBuf(tdata->_data.arg1, tdata->_data.arg2);
        PIN_RWMutexUnlock(&(p->_consumerMutex));
        break;
       }
    }
  }

  static VOID syscallExitCallbackConsumer(THREADID threadid, CONTEXT *ctxt,
     SYSCALL_STANDARD syscall_standard, VOID *v) 
  {
    SYSSTATE_CONSUMER *p = (SYSSTATE_CONSUMER *) v;
    ADDRINT syscall_retval = PIN_GetSyscallReturn(ctxt, syscall_standard);
    thread_data_t* tdata = static_cast<thread_data_t*>
         (PIN_GetThreadData(p->consumer_tls_key, threadid));
    switch (tdata->_data.sys_num)
    {
      case SYS_getcwd:
      {
        PIN_RWMutexReadLock(&(p->_consumerMutex));
   if(p->_verbose)
   {
        cerr << " Consumer:SysAfter SYS_getcwd threadid " << threadid; 
        cerr << " num 0x" << hex <<  tdata->_data.sys_num
            << hex << " ip 0x" << tdata->_data.sys_ip
            << " retval 0x" << hex << syscall_retval 
            << " arg 0 0x" << hex <<  tdata->_data.arg0
            << " translated bufptr " << p->TranslateAddress(tdata->_data.arg0)
            << " *buf " << (char *)p->TranslateAddress(tdata->_data.arg0)
            << endl;
   }
            INT32 actsize = syscall_retval;
            char * bufptr = (char *)p->TranslateAddress(tdata->_data.arg0);
            ASSERT(actsize <= CWDMAX, "getcwd() return value too large \n");
            string workdir = p->CWDName();
            ASSERT(strlen(workdir.c_str()) <= CWDMAX, "simulated workdir too large \n");
            strcpy(bufptr, workdir.c_str());
           if(p->_verbose)
           {
            cerr << " Modified *buf " << bufptr << endl;
           }
          PIN_RWMutexUnlock(&(p->_consumerMutex));
          break;
      }
      case SYS_open:
      {
        PIN_RWMutexReadLock(&(p->_consumerMutex));
   if(p->_verbose)
   {
        cerr << " Consumer:SysAfter SYS_open threadid " << threadid; 
        cerr << " num 0x" << hex <<  tdata->_data.sys_num
            << hex << " ip 0x" << tdata->_data.sys_ip
            << " retval 0x" << hex << syscall_retval 
            << " arg 0 0x" << hex <<  tdata->_data.arg0
            << " pathname " << (char *) p->TranslateAddress(tdata->_data.arg0)
            << endl;
   }
#if 0
            << " arg0 " << tdata->_data.arg0
            << " arg1 " << tdata->_data.arg1
            << " arg2 " << tdata->_data.arg2
            << " arg3 " << tdata->_data.arg3
            << " arg4 " << tdata->_data.arg4
            << " arg5 " << tdata->_data.arg5
            << endl;
#endif
          PIN_RWMutexUnlock(&(p->_consumerMutex));
          break;
      }
      case SYS_openat:
      {
        PIN_RWMutexReadLock(&(p->_consumerMutex));
   if(p->_verbose)
   {
        cerr << " Consumer:SysAfter SYS_openat threadid " << threadid; 
        cerr << " num 0x" << hex <<  tdata->_data.sys_num
            << hex << " ip 0x" << tdata->_data.sys_ip
            << " retval 0x" << hex << syscall_retval 
            << " arg 1 0x" << hex <<  tdata->_data.arg1
            << " pathname " << (char *) p->TranslateAddress(tdata->_data.arg1)
            << endl;
   }
#if 0
            << " arg0 " << tdata->_data.arg0
            << " arg1 " << tdata->_data.arg1
            << " arg2 " << tdata->_data.arg2
            << " arg3 " << tdata->_data.arg3
            << " arg4 " << tdata->_data.arg4
            << " arg5 " << tdata->_data.arg5
            << endl;
#endif
          PIN_RWMutexUnlock(&(p->_consumerMutex));
          break;
      }
      case SYS_close:
      {
        PIN_RWMutexReadLock(&(p->_consumerMutex));
   if(p->_verbose)
   {
        INT32 fd = tdata->_data.arg0;
        cerr << " Consumer:SysAfter SYS_close threadid " << threadid; 
        cerr << " num 0x" << hex <<  tdata->_data.sys_num
            << hex << " ip 0x" << tdata->_data.sys_ip
            << " retval 0x" << hex << syscall_retval 
            << " arg 0 FD 0x" << hex <<  fd
            << endl;
   }
#if 0
            << " arg0 " << tdata->_data.arg0
            << " arg1 " << tdata->_data.arg1
            << " arg2 " << tdata->_data.arg2
            << " arg3 " << tdata->_data.arg3
            << " arg4 " << tdata->_data.arg4
            << " arg5 " << tdata->_data.arg5
            << endl;
#endif
        PIN_RWMutexUnlock(&(p->_consumerMutex));
        break;
      }
      case SYS_read:
      {
        PIN_RWMutexReadLock(&(p->_consumerMutex));
   if(p->_verbose)
   {
        cerr << " Consumer:SysAfter SYS_read threadid " << threadid; 
        cerr << " num " << tdata->_data.sys_num
            << hex << " ip 0x" << tdata->_data.sys_ip
            << " retval 0x" << hex << syscall_retval 
            << " fd 0x" << hex << tdata->_data.arg0
            << " buf 0x" << hex << tdata->_data.arg1
            << " translated buf 0x" << hex << p->TranslateAddress(tdata->_data.arg1)
            << " count 0x" << hex << tdata->_data.arg2
            << endl;
       //printReadBuf(tdata->_data.arg1, tdata->_data.arg2);
   }
        PIN_RWMutexUnlock(&(p->_consumerMutex));
        break;
       }
     case SYS_brk:
     {
        PIN_RWMutexReadLock(&(p->_consumerMutex));
        if(p->_verbose)
        {
            cerr << " Consumer:SysAfter SYS_brk threadid " << threadid; 
            cerr << " num 0x" << hex <<  tdata->_data.sys_num
            << hex << " ip 0x" << tdata->_data.sys_ip
            << " arg0 0x" << hex << tdata->_data.arg0
            << " native retval 0x" << hex << syscall_retval  << endl;
        }
        if(!p->_first_brk_seen && (p->_first_brk_addr != 0))
        {
          PIN_SetContextReg(ctxt, REG_GAX, p->_first_brk_addr);
          p->_first_brk_seen = TRUE;
          if(p->_verbose)
          {
            cerr << "First SYS_brk: forced retval 0x" << hex << p->_first_brk_addr << endl;
          }
       }
       else if(tdata->_data.arg0 != 0)
       {
          PIN_SetContextReg(ctxt, REG_GAX, tdata->_data.arg0);
          if(p->_verbose)
          {
            cerr << "SYS_brk: forced retval 0x" << hex << tdata->_data.arg0 << endl;
          }
       }
        PIN_RWMutexUnlock(&(p->_consumerMutex));
        break;
     }
     case SYS_getpid:
     {
        PIN_RWMutexReadLock(&(p->_consumerMutex));
        if(p->_verbose)
        {
            cerr << " Consumer:SysAfter SYS_getpid threadid " << threadid; 
            cerr << " num 0x" << hex <<  tdata->_data.sys_num
            << hex << " ip 0x" << tdata->_data.sys_ip
            << " native retval 0x" << hex << syscall_retval  << endl;
        }
        if(p->_pid != 0)
        {
          PIN_SetContextReg(ctxt, REG_GAX, p->_pid);
          if(p->_verbose)
          {
            cerr << "SYS_getpid: forced retval 0x" << hex << p->_pid << endl;
          }
        }
        PIN_RWMutexUnlock(&(p->_consumerMutex));
        break;
     }

     case SYS_mmap:
     {
        PIN_RWMutexReadLock(&(p->_consumerMutex));
        if(p->_verbose)
        {
            cerr << " Consumer:SysAfter SYS_mmap threadid " << threadid; 
            cerr << " num 0x" << hex <<  tdata->_data.sys_num
            << hex << " ip 0x" << tdata->_data.sys_ip
            << " native retval 0x" << hex << syscall_retval  << endl;
        }
        if(!p->_mmap_addr_list.empty())
        {
          ADDRINT new_retval =  p->_mmap_addr_list.front();
          p->_mmap_addr_list.pop_front();
          PIN_SetContextReg(ctxt, REG_GAX, new_retval);
          if(p->_verbose)
          {
            cerr << "SYS_mmap: forced retval 0x" << hex << new_retval << endl;
          }
       }
        PIN_RWMutexUnlock(&(p->_consumerMutex));
        break;
       }

     }
     tdata->_data.sys_ip = 0;
  }

  PIN_RWMUTEX     _consumerMutex;
  //for accessing TLS storage in the threads. initialized in the constructor
  PINPLAY_ENGINE     *_pinplay_engine;
  TLS_KEY consumer_tls_key;
  string _in_state_rootdirname;
  string _in_state_workdirname;
  char _cwd_path[CWDMAX];
  bool _verbose;
  ADDRINT _first_brk_addr;
  ADDRINT _pid;
  bool _first_brk_seen;
  MMAP_ADDR_LIST _mmap_addr_list;
};

class SYSSTATE
{
  private:   
  KNOB<string> _sysstateOutKnob;
  KNOB<string> _sysstateInKnob;
  KNOB<BOOL> _sysstateVerboseKnob;
  public:
    // Constructor
    SYSSTATE()
    :_sysstateOutKnob( KNOB_MODE_WRITEONCE,
      "pintool",
      "sysstate:out",
      "",
      "Directory to output pinball syscall state"
      ),
    _sysstateInKnob( KNOB_MODE_WRITEONCE,
      "pintool",
      "sysstate:in",
      "",
      "Directory with pinball input syscall state"
      ),
    _sysstateVerboseKnob( KNOB_MODE_WRITEONCE,
      "pintool",
      "sysstate:verbose",
      "0",
      "Print verbose information about syscalls"
      )
      { }
    INT32 Activate(PINPLAY_ENGINE *pinplay_engine)
    {
       BOOL loggerActive = pinplay_engine->IsLoggerActive();
       BOOL replayerActive = pinplay_engine->IsReplayerActive();
      _producer = NULL;
      // Do nothing if replayer is not active 
      if(!replayerActive)
      { 
        if(!_sysstateInKnob.Value().empty())
          cerr << "Replayer inactive: ignoring '-sysstate:in " 
                <<  _sysstateInKnob.Value() 
                << "'" << endl;
        if(!_sysstateOutKnob.Value().empty())
          cerr << "Replayer inactive: ignoring '-sysstate:out " <<  _sysstateOutKnob.Value() 
            << "'" << endl;
         return 1;
      }

      // Skip the relogging case for now
      if(loggerActive)
      { 
        if(!_sysstateInKnob.Value().empty())
          cerr << "Logger active: ignoring '-sysstate:in " <<  _sysstateInKnob.Value() 
          << "'" << endl;
        if(!_sysstateOutKnob.Value().empty())
          cerr << "Logger active: ignoring '-sysstate:out " 
           <<  _sysstateOutKnob.Value() << "'" << endl;
        return 1;
      }

      KNOB_BASE * knobinjection = KNOB_BASE::FindKnob("replay:injection");
      ASSERTX(knobinjection);
      // We have a pure replay  here
      if(!_sysstateInKnob.Value().empty())
      {
        if (knobinjection->ValueString(0).compare("1") == 0)
        {
          // Consumer can only be activated with "-replay:injection 0"
          cerr << "'-replay:injection' is " << knobinjection->ValueString(0)  
             << endl;
          cerr << "-sysstate:in " <<  _sysstateInKnob.Value() <<
            " ignored." << endl;
          return 0;
        }
        else {
          if(access(_sysstateInKnob.Value().c_str(), F_OK) == -1)
          {
            cerr << "Missing sysstate directory" <<  _sysstateInKnob.Value() << endl;
            return 0;
          }
          cerr << "Will consume sysstate from " <<  _sysstateInKnob.Value() 
            << endl;
          _consumer = new SYSSTATE_CONSUMER(pinplay_engine, _sysstateInKnob.Value(), _sysstateVerboseKnob);
          return 1;
        }
      }
      if(!_sysstateOutKnob.Value().empty())
      {
        if (knobinjection->ValueString(0).compare("0") == 0)
        {
          // Producer can only be activated with "-replay:injection 1"
         cerr << "'-replay:injection' is " << knobinjection->ValueString(0)  
            << endl;
         cerr << "-sysstate:out " <<  _sysstateOutKnob.Value() <<
            " ignored." << endl;
         return 0;
        }
        else {
          cerr << "Will produce sysstate in " <<  _sysstateOutKnob.Value() 
             << ".sysstate" << endl;
          _producer = new SYSSTATE_PRODUCER(pinplay_engine, _sysstateOutKnob.Value(), _sysstateVerboseKnob);
         return 1;
        }
      }
    
      // no SYSSTATE use happening
      return 1;
    }
    private:
      SYSSTATE_PRODUCER *_producer;
      SYSSTATE_CONSUMER *_consumer;
};

}
#endif
