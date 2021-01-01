#!/bin/bash
myloc=`dirname $0`
export PINBALL2ELFLOC=`dirname $myloc`/src
export PINBALL2ELF=$PINBALL2ELFLOC"/pinball2elf"
#export PINBALL2ELF=$PINBALL2ELFLOC"/pinball2elfd"
export INST=`dirname $myloc`/instrumentation

export TMPDIR=/tmp
if [ ! -z $P2E_TEMP ];
then
   export TMPDIR=$P2E_TEMP
fi
echo "TMPDR $TMPDIR"

ERROR()
{
  echo "Usage : " $0 " pinball filename-prefix <scalltrace> <pinball_start_global_icount>"
  exit
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

if  [ $# -lt 2 ];  then
    ERROR
fi
ulimit -s unlimited
    BASE=$1
    pinball=$1
    prefix=$2
if  [ $# -eq 4 ];  then
    strace=$3
    psgi=$4 # pinball start global icount
fi
    compression=0
    basedir=`dirname pinball`
    echo $BASE
    basedir=`dirname $BASE`
    basename=`basename $BASE`
# We are not counting threads with 0 icount
    nthreads=`grep inscount $pinball"."*result | awk '{print $NF}' | grep -v -e "^0" | wc -l`
    echo "nthreads $nthreads with non-zero icounts"
# ELFie tids numbering is  reverse of  pinplay tid numbering
# pinplay_tid 0 --> ELFie tid (N-1) 
# Also, we are filtering out threads with 0 icount
    icount_arr=()
    wicount_arr=()
    nextetid=`echo "$nthreads-1" | bc`
    for resultfile in `ls $pinball"."*result`
    do
      rbasename=`basename $resultfile`
      tid=`echo $rbasename | awk -F "." '{print $(NF-1)}'`
      ticount=`grep inscount $resultfile | awk '{print $NF}'`
      if [ $ticount -gt 0 ];
      then
         etid=$nextetid
         nextetid=`echo "$nextetid-1" | bc`
         icount_arr[$etid]=$ticount
         wicount_arr[$etid]=0
         if [ -e $pinball.event_icount.$tid.txt ];
         then
           flag=`grep -c "tid:" $pinball.event_icount.$tid.txt`
           if [ $flag -eq 1 ];
           then
#Sim-Start tid: 0 icount 0
            twicount=`grep "tid:" $pinball.event_icount.$tid.txt | awk '{print $NF}'`
            wicount_arr[$etid]=$twicount
           fi
         fi
      fi
    done
    let i=0
    icountlist="icount_arr[]={"
    wicountlist="wicount_arr[]={"
    while [ $i -lt $nthreads ];
    do
      if [ $i -gt 0 ];
      then
        icountlist=$icountlist", "
        wicountlist=$wicountlist", "
      fi
      icountlist=$icountlist${icount_arr[$i]}
      wicountlist=$wicountlist${wicount_arr[$i]}
      let i=i+1
    done
      icountlist=$icountlist"};"
      wicountlist=$wicountlist"};"
      echo "icountlist $icountlist (reverse pinplay-tid order)"
      echo "wicountlist $wicountlist (reverse pinplay-tid order)"
    basedir=`dirname $BASE`
    basename=`basename $BASE`
    tmpBASE=$BASE
    if test "$( find $basedir -name "$basename*reg.bz2" -print -quit)"
    then
        tmpbasedir="$TMPDIR/$$.pinball"
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
    if [ ! -z $strace ];
    then
      do_replay=1
    else
      do_replay=0
    fi
    cat $INST/readperf_sampling_callbacks.c | awk -v NTHREADS=$nthreads -v ICOUNTLIST="$icountlist" -v WICOUNTLIST="$wicountlist" -v PREFIX=$prefix -v REPLAY_STRACE=$do_replay '
     /FILEDECL/ {
       if(REPLAY_STRACE) 
        { print "#define MYBUFSIZE 20480000\n__lte_static char mybuf[MYBUFSIZE];\n__lte_static char s_readerror[] = \" <-- actual bufsize. MYBUFSIZE too small for SYS_read \\n\";\n__lte_static int do_replay_syscalls = 1;\nvoid replay_syscalls();"}
       else 
        {print "__lte_static char mybuf[10240];\n__lte_static int do_replay_syscalls = 0;\nvoid replay_syscalls();\n"}
       for(i=0; i<NTHREADS; i++)
       {
         printf "__lte_static char s_fname%d[] = \"%s.%d.perf.txt\";\n",i,PREFIX,NTHREADS-i-1
       }
       printf "\n"
       printf "__lte_static char* my_output_file[] = {"
       for(i=0; i<NTHREADS; i++)
       {
         printf "s_fname%d",i
         if(i<NTHREADS) printf ", "
       }
       printf "};\n"
       printf "\n"
       printf "#define FILECOUNT %d\n", NTHREADS+1
       printf "__lte_static int out_fd[FILECOUNT];\n"
       printf "__lte_static uint64_t %s\n", ICOUNTLIST
       printf "__lte_static uint64_t %s\n", WICOUNTLIST
   
       printf "\n"
       next} 
     {print $0}'  > $TMPDIR/readperf_sampling_callbacks.$$.c
    if [ ! -z $strace ];
    then
        STRACE $strace $psgi $TMPDIR/readperf_sampling_callbacks.$$.c
    else
      echo "void replay_syscalls(){}" >> $TMPDIR/readperf_sampling_callbacks.$$.c
    fi
    gcc -g -I$PINBALL2ELFLOC/lib -c $TMPDIR/readperf_sampling_callbacks.$$.c -o $TMPDIR/readperf_sampling_callbacks.$$.o
    magicval=0x1
    magicval2=0x2
    sscmark=0x111
    sscmark2=0x222

    time  $PINBALL2ELF --text-seg-flags WXA --data-seg-flags WXA --cbk-stack-size 102400 --modify-ldt -u unlimited --roi-start ssc:$sscmark  --roi-start simics:$magicval --magic2 simics:$magicval2 -l 0x0 -i 0 -d $tmpBASE.global.log -m $tmpBASE.text -r $tmpBASE.address -x $BASE.readperf.elfie -p elfie_on_start -e elfie_on_exit -t elfie_on_thread_start $TMPDIR/readperf_sampling_callbacks.$$.o  $PINBALL2ELFLOC/lib/libperfle.a   $PINBALL2ELFLOC/lib/libcle.a  
    cp  $TMPDIR/readperf_sampling_callbacks.$$.c readperf_sampling_callbacks.c
    rm $TMPDIR/readperf_sampling_callbacks.$$.c $TMPDIR/readperf_sampling_callbacks.$$.o
    if [ $compression -eq 1 ]; then
       rm -rf $tmpbasedir
    fi
