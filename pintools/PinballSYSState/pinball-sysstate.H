/*BEGIN_LEGAL 
BSD License 

Copyright (c) 2020 Intel Corporation. All rights reserved.
 
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
#include <sys/stat.h>
#include <sys/types.h>
#include <libgen.h>
#include <fcntl.h>
#include <dirent.h>
#include "pin.H"
#include "instlib.H"

using namespace std;
namespace PINBALL_SYSSTATE{

class READ_STATE;
class FD_STATE;
class FILE_STATE;

LOCALTYPE typedef std::list<READ_STATE *> READ_STATE_LIST;
LOCALTYPE typedef std::map<INT32, FD_STATE * > FD_MAP;
LOCALTYPE typedef FD_MAP *FD_MAP_PTR;
LOCALTYPE typedef std::map<INT32, FILE_STATE * > FILE_MAP;
LOCALTYPE typedef std::list<FILE_STATE *> FILE_STATE_LIST;
LOCALTYPE typedef std::list<FD_STATE *> FD_STATE_LIST;
LOCALTYPE typedef FD_STATE_LIST *FD_STATE_LIST_PTR;
LOCALTYPE typedef std::list< pair<string, string> > STRING_PAIR_LIST;
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

/*! @ingroup PINBALL_SYSSTATE
*/

class READ_STATE
{
 private:   
    ADDRINT _syscall_pc;
    INT32 _count_req;
    INT32 _count_act;
    UINT32 _file_pos;
 public:   
    ADDRINT  _buf_addr;
    CHAR * _shadow_buf;
    vector<bool> _byte_accessed; // supposed to use 1 bit per element
    READ_STATE(ADDRINT pc, ADDRINT buf_addr, INT32 count, 
        INT32 retval, INT32 filepos)
    {
      _syscall_pc = pc;
      _buf_addr = buf_addr;
      ASSERT(count, "READ_STATE: count is zero");
      _count_req = count;
      _count_act = retval;
      _shadow_buf = new CHAR[_count_req](); // zero initialized
      _byte_accessed.resize(_count_req, false);
      _file_pos = filepos;
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
        if(!_byte_accessed[offset+index])
        {
          PIN_SafeCopy(base+index, (VOID *)(memea + index), 1);
          _byte_accessed[offset+index] = true;
        }
      } 
    }

    VOID PrintReadState(){
        cerr << "\tpc " << hex << _syscall_pc 
             << " filepos " << hex << _file_pos 
             << " buf_addr " << hex <<  _buf_addr 
             << " count actual " << dec << _count_act << endl;
    }
    VOID OutputReadState(INT32 dummy_fileFD){
      INT32 offset_ret = lseek(dummy_fileFD, _file_pos, SEEK_SET);
      ASSERTX(offset_ret != -1);
      INT32 count_written = write(dummy_fileFD, _shadow_buf, _count_act);
      ASSERTX(count_written == _count_act);
    }
};

// This is for files opened before the pinball beginning
class FD_STATE
{
 private:   
    UINT32 _current_file_pos;

 public:   
    INT32 _fd;
    READ_STATE_LIST _read_state_list;
    FD_STATE(INT32 fd): _fd(fd) 
    {
      _current_file_pos = 0;
    };

    INT32 Fd() { return _fd; }

    VOID AddReadState(ADDRINT pc, ADDRINT buf_addr, INT32 count, INT32 retval)
    {
      READ_STATE * rs = new READ_STATE(pc, buf_addr, count, retval,
         _current_file_pos);
      _read_state_list.push_back(rs);
      _current_file_pos += retval;
    }

    VOID SetFilePos(UINT32 retval)
    {
      _current_file_pos = retval;
    }

    VOID PrintReadStateList()
    {
      READ_STATE_LIST :: iterator it;
      for ( it = _read_state_list.begin();
           it != _read_state_list.end(); ++it)
      {
        (*it)->PrintReadState();
      }
      cerr << '\n' ;
    }

    READ_STATE * FindReadState(ADDRINT memea, UINT32 bytes)
    {
      READ_STATE * retval = NULL;
      READ_STATE_LIST :: iterator it;
      for ( it = _read_state_list.begin();
           it != _read_state_list.end(); ++it)
      {
        if((*it)->ReadAddrInRange(memea)
              || (*it)->ReadAddrInRange(memea+bytes-1))
        {
          retval = *it; 
        }
      }
      return retval;
    }

    VOID OutputReadStateListFD(string out_dirname)
    {
      ostringstream ss;
      ss << _fd;
      string fname = out_dirname + "/FD_" + ss.str();
      //cerr << "OutputReadStateListFD() : " << fname << endl;
      INT32 dummy_fileFD;
      mode_t mode = S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH;
      dummy_fileFD = open(fname.c_str(),O_WRONLY|O_CREAT|O_TRUNC, mode);
      if (dummy_fileFD == -1)
      {
        cerr << "Could not open output  file " <<
          fname.c_str() << endl;
        ASSERTX(0);
      }
      READ_STATE_LIST :: iterator it;
      for ( it = _read_state_list.begin();
           it != _read_state_list.end(); ++it)
      {
        (*it)->OutputReadState(dummy_fileFD);
      }
    }
};


// This is for files opened during the pinball replay
class FILE_STATE : public FD_STATE
{
 public:   
    string _fname;

    FILE_STATE (string fname, INT32 fd):FD_STATE(fd){ _fname = fname; };

    VOID CreatePath(string pathstr)
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

    VOID OutputReadStateListFile(string out_dirname)
    {
#if 0
      // replace '/' in _fname by '\'
      replace(_fname.begin(), _fname.end(), '/', '\\');
      string outfname = out_dirname + "/" + _fname;
#endif
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
};

class SYSSTATE_PRODUCER
{
  public:
    SYSSTATE_PRODUCER(string statedirname, bool verbose)
    {
      _out_state_rootdirname = statedirname + ".sysstate";
      _out_state_workdirname = statedirname + ".sysstate/workdir";
      _verbose = verbose;
      first_brk_retval = 0;
      last_brk_retval = 0;
      cerr << "Producer " << statedirname << endl;
      PIN_AddSyscallEntryFunction(syscallEntryCallbackProducer, this);
      PIN_AddSyscallExitFunction(syscallExitCallbackProducer, this);
      // Register ThreadStart to be called when a thread starts.
      PIN_AddThreadStartFunction(ThreadStartProducer, this);
      PIN_AddFiniFunction(FiniProducer, this);
      INS_AddInstrumentFunction(Instruction, this);
      producer_tls_key = PIN_CreateThreadDataKey(NULL);
      PIN_RWMutexInit(&_producerMutex);
    }

  private:
     static BOOL checkFDmap(FD_MAP_PTR ptrmap, 
          ADDRINT memea_callback, UINT32 bytes,string *dis)
     {
        for (auto itr = ptrmap->begin(); 
          itr != ptrmap->end(); ++itr) 
        { 
          FD_STATE * fs = itr->second;
          READ_STATE * rs = fs->FindReadState(memea_callback, bytes);
          if (rs)
          {
#if 0
            cerr << "checkFDmap:fd: " << dec << fs->_fd;
            cerr << " mem: " << hex << memea_callback << " + " << dec << bytes << endl;
            cerr << "checkFDmap(  memea_translated: " << hex << memea_callback << " bytes: " << dec << bytes << " " << *dis << endl;
            cerr << "Found READ_STATE: offset " << dec << offset;
            cerr << "  dst " << hex << (ADDRINT)rs->_shadow_buf+offset;
            cerr << "  src " << hex << (VOID *) memea_callback;
            cerr << "  count " << dec << bytes << endl;
            cerr << "  byte 0 " << hex << *((UINT16 *)memea_callback) << endl;
            rs->PrintReadState();
            cerr << '\n' ;
#endif
            //PIN_SafeCopy(rs->_shadow_buf+offset,
            //     (VOID *) memea_callback, bytes);
            rs->SafeCopy((CHAR *)memea_callback, bytes);
            return TRUE;
          }
        }
        return FALSE;
    }

     static BOOL checkFDlist(FD_STATE_LIST_PTR ptrlist, 
          ADDRINT memea_callback, UINT32 bytes,string *dis)
     {
        for (auto itr = ptrlist->begin(); 
          itr != ptrlist->end(); ++itr) 
        { 
          FD_STATE * fs = (*itr);
          READ_STATE * rs = fs->FindReadState(memea_callback, bytes);
          if (rs)
          {
#if 0
            cerr << "checkFDlist:fd: " << dec << fs->_fd;
            cerr << " mem: " << hex << memea_callback << " + " << dec << bytes << endl;
            cerr << "checkFDlist(  memea_translated: " << hex << memea_callback << " bytes: " << dec << bytes << " " << *dis << endl;
            cerr << "Found READ_STATE: offset " << dec << offset;
            cerr << "  dst " << hex << (ADDRINT)rs->_shadow_buf+offset;
            cerr << "  src " << hex << (VOID *) memea_callback;
            cerr << "  count " << dec << bytes << endl;
            cerr << "  byte 0 " << hex << *((UINT16 *)memea_callback) << endl;
            rs->PrintReadState();
            cerr << '\n' ;
#endif
            rs->SafeCopy((CHAR *)memea_callback, bytes);
            return TRUE;
          }
        }
        return FALSE;
    }
    static VOID opMemoryFunc(
        ADDRINT memea_orig,ADDRINT memea_callback, UINT32 bytes, ADDRINT ip,
            string *dis, VOID *v)
    {
      SYSSTATE_PRODUCER *p = (SYSSTATE_PRODUCER *) v;
        PIN_RWMutexReadLock(&(p->_producerMutex));
        if(checkFDmap(&(p->open_fd_map), memea_callback, bytes, dis)) return;
        if(checkFDmap(&(p->pre_existing_fd_map), memea_callback, bytes, dis)) return;
        if(checkFDlist(&(p->closed_fd_list), memea_callback, bytes, dis)) return;
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
      ss << "0x" << hex << p->first_brk_retval << "\n";
      ss << "0x" << hex << p->last_brk_retval << "\n";
      const char * outstr = ss.str().c_str();
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
      if ( mkdir(p->_out_state_workdirname.c_str(), 0755) != 0)
      {
        if (errno != EEXIST)
        {
          cerr << "Could not create output state directory " <<
            p->_out_state_workdirname.c_str() << endl;
          ASSERTX(0);
        }
      }
      if(p->first_brk_retval != 0)
      {
        OutputBRKvalues(p->_out_state_workdirname, v);
      }
      for (auto itr = p->pre_existing_fd_map.begin(); 
          itr != p->pre_existing_fd_map.end(); ++itr) 
      { 
        FD_STATE * fs = itr->second;
        cerr << " ROI used pre-existing FD : " << itr->first << endl;
        fs->OutputReadStateListFD(p->_out_state_workdirname);
#if 0
        cerr <<  " FD : " << itr->first 
             << '\t' << itr->second << '\n'; 
        fs->PrintReadStateList();
#endif
      } 
      FILE_STATE_LIST :: iterator it;
      for ( it = p->opened_file_list.begin();
           it != p->opened_file_list.end(); ++it)
      {
        FILE_STATE * fs = (*it);
        cerr << " ROI opened file : " << fs->_fname << endl;
        cerr << "               FD : " << fs->_fd << endl;
        if(IsAbsolutePathname(fs->_fname))
          fs->OutputReadStateListFile(p->_out_state_rootdirname);
        else
          fs->OutputReadStateListFile(p->_out_state_workdirname);
      }
    }

    static FILE_STATE * FindOpenFile(VOID *v, string fname)
    {
      SYSSTATE_PRODUCER *p = (SYSSTATE_PRODUCER *) v;
      FILE_STATE_LIST :: iterator it;
      for ( it = p->opened_file_list.begin();
           it != p->opened_file_list.end(); ++it)
      {
        FILE_STATE * fs = (*it);
        if (fname.compare(fs->_fname) == 0) return fs;
      }
      return NULL;
    }
 
    static FILE_STATE * FindOpenFileFd(VOID *v, INT32 fd)
    {
      SYSSTATE_PRODUCER *p = (SYSSTATE_PRODUCER *) v;
      FILE_STATE_LIST :: iterator it;
      for ( it = p->opened_file_list.begin();
           it != p->opened_file_list.end(); ++it)
      {
        FILE_STATE * fs = (*it);
        if (fs->_fd == fd) return fs;
      }
      return NULL;
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
            << " pathname " << (char *)tdata->_data.arg0
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
              string fname((char *)tdata->_data.arg0);
              //cerr << " open:pathname " << fname
               //  << " fd " << fd << endl;
              auto it = p->open_fd_map.find(fd);
              ASSERTX( it == p->open_fd_map.end());
              FILE_STATE * fs =  p->FindOpenFile(v, fname);
              if (fs == NULL)
              {
                fs = new FILE_STATE(fname, fd);
                p->opened_file_list.push_back(fs);
              }
              else
              {
                fs->_fd = fd;
              }
              p->open_fd_map[fd] = fs;
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
            << " pathname " << (char *)tdata->_data.arg1
            << endl;
   }
            if ( fd != -1 )
            {
              string fname((char *)tdata->_data.arg1);
              auto it = p->open_fd_map.find(fd);
              ASSERTX( it == p->open_fd_map.end());
              FILE_STATE * fs =  p->FindOpenFile(v, fname);
              if (fs == NULL)
              {
                fs = new FILE_STATE(fname, fd);
                p->opened_file_list.push_back(fs);
              }
              else
              {
                fs->_fd = fd;
              }
              p->open_fd_map[fd] = fs;
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
            << " pathname " << (char *)tdata->_data.arg0
            << endl;
   }
            if ( retval != -1 )
            {
              string fname((char *)tdata->_data.arg0);
              FILE_STATE * fs =  p->FindOpenFile(v, fname);
              if (fs == NULL)
              {
                fs = new FILE_STATE(fname, -1);
                p->opened_file_list.push_back(fs);
              }
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
        auto it = p->open_fd_map.find(fd);
        if ( it == p->open_fd_map.end())
        {
          it = p->pre_existing_fd_map.find(fd);
          if ( it == p->pre_existing_fd_map.end())
          {
          // this is fstat() with an FD not associated with any open()
            FD_STATE * fs = new FD_STATE(fd);
            p->pre_existing_fd_map[fd] = fs;
          }
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
         auto it = p->open_fd_map.find(fd);
         if ( it != p->open_fd_map.end())
         {
            FD_STATE * fs = it->second;
            // This fd is for a file open()ed in the ROI
            //cerr << "Erasing from open_fd_map FD " << fd << endl;
            p->closed_fd_list.push_front(fs);
            p->open_fd_map.erase(it);
            //FILE_STATE * ofs = FindOpenFileFd(v, fd);
            //ofs->OutputReadStateListFile(p->_out_state_dirname);
            //cerr << "Exiting after close of " << ofs->_fname << endl;
            //PIN_ExitProcess(1);
         }
         else
         {
            it = p->pre_existing_fd_map.find(fd);
            if( it != p->pre_existing_fd_map.end())
            {
              // This fd is for a file open()ed prior to the ROI
              // and was read() from in the ROI
            }
            else
            {
              // This fd is for a file open()ed prior to the ROI
              // and was *NOT* read() from in the ROI
            }
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
          auto it = p->open_fd_map.find(fd);
          if ( it != p->open_fd_map.end())
          {
            FD_STATE * fs = it->second;
            // This fd is for a file open()ed in the ROI
            fs->SetFilePos(syscall_retval);
          }
         else
         {
            it = p->pre_existing_fd_map.find(fd);
            if( it != p->pre_existing_fd_map.end())
            {
              // This fd is for a file open()ed prior to the ROI
              // and was read() from in the ROI
              FD_STATE * fs = it->second;
              fs->SetFilePos(syscall_retval);
            }
            else
            {
              // This fd is for a file open()ed prior to the ROI
              // and was *NOT* read() from in the ROI
            }
         }
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
        PIN_RWMutexReadLock(&(p->_producerMutex));
          INT32 fd = tdata->_data.arg4;
          UINT32 length = tdata->_data.arg1;
          ADDRINT mapped_addr = syscall_retval;
         if ( (fd != -1) && ((INT32)syscall_retval != -1))
         {
   if(p->_verbose)
   {
        cerr << " Producer:SysAfter SYS_mmap? threadid " << threadid; 
        cerr << " num 0x" << hex <<  tdata->_data.sys_num
            << hex << " ip 0x" << tdata->_data.sys_ip
            << " retval 0x" << hex << syscall_retval 
            << " length " << dec <<  length
            << " fd " << dec <<  fd
            << endl;
   }
          auto it = p->open_fd_map.find(fd);
          if ( it != p->open_fd_map.end())
          {
            FD_STATE * fs = it->second;
            fs->AddReadState(tdata->_data.sys_ip, mapped_addr,
              length, length);
            //cerr << "Adding MMAP info as ReadState to  open_fd_map FD " << fd << endl;
          }
          else
          {
            it = p->pre_existing_fd_map.find(fd);
            if ( it != p->pre_existing_fd_map.end())
            {
              // this is mmap() to an FD not associated with any open()
              //cerr << "Found mmap :  pre_existing FD " << fd << endl;
              FD_STATE * fs = new FD_STATE(fd);
              fs->AddReadState(tdata->_data.sys_ip, tdata->_data.arg1,
                tdata->_data.arg2, syscall_retval);
              fs->AddReadState(tdata->_data.sys_ip, mapped_addr,
                length, length);
              //cerr << "Adding MMAP info as ReadState to  open_fd_map FD " << fd << endl;
              p->pre_existing_fd_map[fd] = fs;
            }
            else
            {
              ASSERT(0,"Only one mmap allowed for a given FD");
              //FD_STATE * fs = it->second;
            }
          }
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
        auto it = p->open_fd_map.find(fd);
        if ( it != p->open_fd_map.end())
        {
          FD_STATE * fs = it->second;
          fs->AddReadState(tdata->_data.sys_ip, tdata->_data.arg1,
            tdata->_data.arg2, syscall_retval);
          //cerr << "Adding ReadState to  open_fd_map FD " << fd << endl;
        }
        else
        {
          it = p->pre_existing_fd_map.find(fd);
          if ( it == p->pre_existing_fd_map.end())
          {
          // this is read() from an FD not associated with any open()
          // This must be the first read from pre_existing FD
            //cerr << "Found first read:  pre_existing FD " << fd << endl;
            FD_STATE * fs = new FD_STATE(fd);
            fs->AddReadState(tdata->_data.sys_ip, tdata->_data.arg1,
              tdata->_data.arg2, syscall_retval);
            p->pre_existing_fd_map[fd] = fs;
            //cerr << "Adding ReadState to  pre_existing_fd_map FD " << fd << endl;
          }
          else
          {
            FD_STATE * fs = it->second;
            fs->AddReadState(tdata->_data.sys_ip, tdata->_data.arg1,
              tdata->_data.arg2, syscall_retval);
            //cerr << "Adding ReadState to  pre_existing_fd_map FD " << fd << endl;
          }
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
            << " count 0x" << hex << tdata->_data.arg2
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
        INT32 fd = tdata->_data.arg0;
        auto it = p->open_fd_map.find(fd);
        if ( it != p->open_fd_map.end())
        {
          if(p->_verbose)
          {
            cerr << "Write to  open_fd_map FD found" << fd << endl;
          }
        }
        else
        {
          it = p->pre_existing_fd_map.find(fd);
          if ( it == p->pre_existing_fd_map.end())
          {
          // this is write() to an FD not associated with any open()
          // This must be the first write to the pre_existing FD
            FD_STATE * fs = new FD_STATE(fd);
            p->pre_existing_fd_map[fd] = fs;
            if(p->_verbose)
            {
              cerr << "First write to  pre_existing_fd_map FD found FD==" << fd << endl;
            }
          }
          else
          {
            if(p->_verbose)
            {
              cerr << "Write to  pre_existing_fd_map FD found FD==" << fd << endl;
            }
          }
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
        if(p->first_brk_retval == 0)
        {
          p->first_brk_retval = syscall_retval;
        }
        p->last_brk_retval = syscall_retval;
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
     }
     tdata->_data.sys_ip = 0;
  }
  PIN_RWMUTEX     _producerMutex;
  //for accessing TLS storage in the threads. initialized in the constructor
  TLS_KEY producer_tls_key;
  FD_MAP pre_existing_fd_map;
  FD_MAP open_fd_map;
  FILE_STATE_LIST opened_file_list;
  FD_STATE_LIST closed_fd_list;
  string _out_state_rootdirname;
  string _out_state_workdirname;
  ADDRINT first_brk_retval;
  ADDRINT last_brk_retval;
  bool _verbose;
};


class SYSSTATE_CONSUMER
{
  public:
    SYSSTATE_CONSUMER(string statedirname, bool verbose)
    {
      _in_state_rootdirname = statedirname;
      _in_state_workdirname = statedirname + "/workdir";
      _verbose = verbose;
      cerr << "Consumer " << statedirname << endl;
      PIN_AddSyscallEntryFunction(syscallEntryCallbackConsumer, this);
      PIN_AddSyscallExitFunction(syscallExitCallbackConsumer, this);
      // Register ThreadStart to be called when a thread starts.
      PIN_AddThreadStartFunction(ThreadStartConsumer, this);
      PIN_AddApplicationStartFunction(StartConsumer, this);
      consumer_tls_key = PIN_CreateThreadDataKey(NULL);
      PIN_RWMutexInit(&_consumerMutex);
    }

  private:
    static VOID StartConsumer(VOID *v)
    {
      SYSSTATE_CONSUMER *p = (SYSSTATE_CONSUMER *) v;
      DIR *indir;
      struct dirent *ent;
      indir = opendir(p->_in_state_workdirname.c_str());
      if (indir != NULL)
      {
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
            string sysfname = p->_in_state_workdirname  + "/" + origfname;
            cerr << " Pre-opened FD file " << sysfname << endl;
            currentFd = open(sysfname.c_str(), O_RDONLY|O_WRONLY);
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
          string fname((char *)tdata->_data.arg1);
          //cerr << " openat:pathname " << fname;
          if(IsAbsolutePathname(fname))
            sysfname = p->_in_state_rootdirname  + "/" + fname;
          else
            sysfname = p->_in_state_workdirname  + "/" + fname;
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
          string fname((char *)tdata->_data.arg0);
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
            << " pathname " << (char *) tdata->_data.arg0
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
            << " pathname " << (char *) tdata->_data.arg1
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
        if(tdata->_data.arg0 != 0)
          PIN_SetContextReg(ctxt, REG_GAX, tdata->_data.arg0);
   if(p->_verbose)
   {
        cerr << " Consumer:SysAfter SYS_brk threadid " << threadid; 
        cerr << " num 0x" << hex <<  tdata->_data.sys_num
            << hex << " ip 0x" << tdata->_data.sys_ip
            << " arg0 0x" << hex << tdata->_data.arg0
            << " native retval 0x" << hex << syscall_retval  
            << " forced retval 0x" << hex << tdata->_data.arg0  << endl;
   }
        PIN_RWMutexUnlock(&(p->_consumerMutex));
        break;
       }
     }
     tdata->_data.sys_ip = 0;
  }

  PIN_RWMUTEX     _consumerMutex;
  //for accessing TLS storage in the threads. initialized in the constructor
  TLS_KEY consumer_tls_key;
  string _in_state_rootdirname;
  string _in_state_workdirname;
  bool _verbose;
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
    VOID Activate(BOOL loggerActive, BOOL replayerActive)
    {
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
         return;
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
        return;
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
        }
        else {
          cerr << "Will consume sysstate from " <<  _sysstateInKnob.Value() 
            << endl;
          _consumer = new SYSSTATE_CONSUMER(_sysstateInKnob.Value(), _sysstateVerboseKnob);
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
        }
        else {
          cerr << "Will produce sysstate in " <<  _sysstateOutKnob.Value() 
             << ".sysstate" << endl;
          _producer = new SYSSTATE_PRODUCER(_sysstateOutKnob.Value(), _sysstateVerboseKnob);
        }
      }
    }
    private:
      SYSSTATE_PRODUCER *_producer;
      SYSSTATE_CONSUMER *_consumer;
};

}
#endif
