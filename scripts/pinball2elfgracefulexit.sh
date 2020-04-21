#!/bin/bash
myloc=`dirname $0`
export PINBALL2ELFLOC=`dirname $myloc`/src
export PINBALL2ELF=$PINBALL2ELFLOC"/pinball2elf"
export INST=`dirname $myloc`/instrumentation
ulimit -s unlimited
ERROR()
{
    echo "Usage: $0 pinball <scalltrace> <pinball_start_global_icount>"
    exit 1
}

IS_SYS_FILE()
{
  filename=$1
  res=`echo $filename | awk '
    /\/sys/ || /\/proc/ || /\/usr/ || /\/lib/ || /\/etc/ {print 1; next}
    {print 0}
  '`
  return
}

STRACE()
{
  strace=$1
  psgi=$2
  cfile=$3
  echo "void replay_syscalls()" >> $cfile
  echo "{" >> $cfile
  echo "int myfd = 0;" >> $cfile
  echo "lte_write(1, s_replay, sizeof(s_replay)-1);" >> $cfile
#Threadid, thread count, global count, syscall number, syscall name, fd, delta-offset, offset, name, cwd
  IFS=$'\n'
  for rec in `cat $strace`
  do
    gi=`echo $rec | awk -F"," '{print $3}'`
    if [ $gi -ge $psgi ];
    then
      continue
    fi
    sysname=`echo $rec | awk -F"," '{print $5}'`
    case $sysname in
      "SYS_open")
#0,7540,7540,2,SYS_open,3,0,0,/lib64/libc.so.6,/nfs/mmdc/disks/tpi4/proj/ThreadPoints/lit2elf/SyscallTrace/test
        fd=`echo $rec | awk -F"," '{print $6}'`
        fname=`echo $rec | awk -F"," '{print $9}'`
        IS_SYS_FILE $fname 
        if [ $res -eq 1 ];
        then
          echo "  myfd = lte_syscall(__NR_open, (uint64_t)\"$fname\", O_RDONLY,S_IRWXU,0,0,0);" >> $cfile
        else
          echo "  myfd = lte_syscall(__NR_open, (uint64_t)\"$fname\", O_RDWR,S_IRWXU,0,0,0);" >> $cfile
        fi
        echo "  lte_syscall(__NR_dup2, myfd, $fd,0,0,0,0);" >> $cfile
      ;;
      "SYS_read")
#0,108480,108480,0,SYS_read,3,16,16,in.txt,
        fd=`echo $rec | awk -F"," '{print $6}'`
        count=`echo $rec | awk -F"," '{print $7}'`
        echo "  if($count < MYBUFSIZE)" >> $cfile
        echo "  {" >> $cfile
        echo "     lte_syscall(__NR_read, $fd,(uint64_t)mybuf,$count,0,0,0);" >> $cfile
        echo "  }" >> $cfile
        echo "  else" >> $cfile
        echo "  {" >> $cfile
        echo "     lte_diprintfe(1, $count, ' ');" >> $cfile
        echo "     lte_write(1, s_readerror, sizeof(s_readerror)-1);" >> $cfile
        echo "  }" >> $cfile
      ;;
      "SYS_close")
#0,6461,6461,3,SYS_close,3,0,0,/etc/ld.so.cache
        fd=`echo $rec | awk -F"," '{print $6}'`
        echo "  lte_syscall(__NR_close, $fd, 0,0,0,0,0);" >> $cfile
      ;;
      "SYS_lseek")
#0,370148,370148,8,SYS_lseek,1,0,0,,.
        fd=`echo $rec | awk -F"," '{print $6}'`
        offset=`echo $rec | awk -F"," '{print $8}'`
        # lseek(int fd, off_t offset, int whence);
        # using 'whence' == SEEK_SET        0      
        #  /* seek relative to beginning of file */
        echo "  lte_syscall(__NR_lseek, $fd, $offset,0,0,0,0);" >> $cfile
      ;;
      "SYS_chdir")
#0,6293565,6293565,80,SYS_chdir,0,0,0,/media/disk2/harish/SPEC2017/Official_gccO2/spec2017.rate.ref.harness/520.omnetpp_r/ned,/media/disk2/harish/SPEC2017/Official_gccO2/spec2017.rate.ref.harness/520.omnetpp_r/ned
        path=`echo $rec | awk -F"," '{print $9}'`
        echo "  lte_syscall(__NR_chdir, (uint64_t)\"$path\", 0,0,0,0,0);" >> $cfile
      ;;
    esac
  done
  echo "}" >> $cfile
}

if  [ $# -lt 1 ];  then
    echo "Not enough arguments!"
    ERROR
fi
    BASE=$1
if  [ $# -eq 3 ];  then
    strace=$2
    psgi=$3 # pinball start global icount
fi
    icount_threshold=1; #include threads with at least 1 instruction executed.
    compression=0
    echo $BASE
    basedir=`dirname $BASE`
    basename=`basename $BASE`
    tmpBASE=$BASE
    if test "$( find $basedir -name "$basename*reg.bz2" -print -quit)"
    then
        tmpbasedir="/tmp/$$.pinball"
        tmpBASE="$tmpbasedir/$basename"
        mkdir -p $tmpbasedir
        for regfile in   $BASE*.reg.bz2
        do
          rbasename=`basename $regfile | sed '/.bz2/s///'`
          bunzip2 -c $regfile > $tmpbasedir/$rbasename
        done
        for textfile in  $BASE*.text.bz2
        do
          tbasename=`basename $textfile | sed '/.bz2/s///'`
          bunzip2 -c $textfile > $tmpbasedir/$tbasename
        done
        for otherfile in `ls $basedir | grep -v "reg.bz2"| grep -v "\.text.bz2"`
        do
          obasename=`basename $otherfile`
          srcfile=`readlink -f $basedir/$otherfile`
          cp -rs $srcfile $tmpbasedir/$obasename
        done
        compression=1
    fi
    magicval=0x1
    magicval2=0x2
    sscmark=0x111
    if [ ! -z $strace ];
    then
        cat $INST/graceful_exit_callbacks.c | awk '/void elfie_on_start/ {print "#define MYBUFSIZE 20480000\n__lte_static char mybuf[MYBUFSIZE];\n__lte_static char s_readerror[] = \" <-- actual bufsize. MYBUFSIZE too small for SYS_read \\n\";\n__lte_static int do_replay_syscalls = 1;\nvoid replay_syscalls();"}
        {print $0}'> /tmp/graceful_exit_callbacks.$$.c
    else
        cat $INST/graceful_exit_callbacks.c | awk '/void elfie_on_start/ {print "__lte_static char mybuf[1];\n__lte_static int do_replay_syscalls = 0;\nvoid replay_syscalls();\n"}
        {print $0}'> /tmp/graceful_exit_callbacks.$$.c
    fi
    if [ ! -z $strace ];
    then
        STRACE $strace $psgi /tmp/graceful_exit_callbacks.$$.c
    else
      echo "void replay_syscalls(){}" >> /tmp/graceful_exit_callbacks.$$.c
    fi
    gcc -g -I$PINBALL2ELFLOC/lib -c /tmp/graceful_exit_callbacks.$$.c -o /tmp/graceful_exit_callbacks.$$.o
    time  $PINBALL2ELF --text-seg-flags WXA --data-seg-flags WXA --cbk-stack-size 102400 --modify-ldt -u unlimited -l 0x0 -i $icount_threshold --roi-start ssc:$sscmark --roi-start simics:$magicval --magic2 simics:$magicval2 -d $tmpBASE.global.log -m $tmpBASE.text -r $tmpBASE.address -x $BASE.elfie -p elfie_on_start  -t elfie_on_thread_start   /tmp/graceful_exit_callbacks.$$.o  $PINBALL2ELFLOC/lib/libperfle.a   $PINBALL2ELFLOC/lib/libcle.a  
    cp  /tmp/graceful_exit_callbacks.$$.c graceful_exit_callbacks.c
    rm  /tmp/graceful_exit_callbacks.$$.*
#set +x
    if [ $compression -eq 1 ]; then
       rm -rf $tmpbasedir
    fi
