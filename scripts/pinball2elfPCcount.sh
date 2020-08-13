#!/bin/bash
myloc=`dirname $0`
export PINBALL2ELFLOC=`dirname $myloc`/src
export PINBALL2ELF=$PINBALL2ELFLOC"/pinball2elf"
export INST=`dirname $myloc`/instrumentation
ulimit -s unlimited
ERROR()
{
    echo "Usage: $0 pinball ROI.control.in"
    exit 1
}

SETHEAP()
{
  brkfile=$1
  cfile=$2

  first_brk_addr=`cat $brkfile | head -1`
  last_brk_addr=`cat $brkfile | tail -1`
  
  echo "#include <sys/prctl.h>" >> $cfile
  echo "__lte_static  uint64_t FIRST_BRK_ADDR=$first_brk_addr;" >> $cfile
  echo "__lte_static  uint64_t LAST_BRK_ADDR=$last_brk_addr;" >> $cfile
  cat $INST/set_heap.c | awk '
  BEGIN {flag=0}
  /END_LEGAL/ {flag=1; next}
      {if(flag) print $0}
  ' >> $cfile
}

getIINFO()
{
 insinfo=$1
 roiinfo=$2

 nowarmup=`grep -c icount $roiinfo`

#stop:address:0x000426e9f:count627315:global
  sPC=`grep stop $roiinfo | awk -F ":" '{print $3}' | sed '/0x[0]*/s//0x/'`
  SCNT=`grep stop $roiinfo | awk -F ":" '{print $4}' | sed '/count/s///'`

  srec=`grep $sPC $insinfo | head -1`
#ADDR: 0x426ae0 INFO: 6,5,0,0 INS:  movzx ebx, word ptr [rbp+r13*2]
  sinfo=`echo $srec | awk '{print $4}'`
  #echo "Skipping sim"
  IINFO=" -I $sPC:on_simPC:$sinfo "

 if [ $nowarmup -eq 0 ];
 then
#start:address:0x00041b164:count2724648:global
#stop:address:0x000426e9f:count627315:global
  wPC=`grep start $roiinfo | awk -F ":" '{print $3}' | sed '/0x[0]*/s//0x/'`
  WCNT=`grep start $roiinfo | awk -F ":" '{print $4}' | sed '/count/s///'`
  wrec=`grep $wPC $insinfo | head -1`
#ADDR: 0x426ae0 INFO: 6,5,0,0 INS:  movzx ebx, word ptr [rbp+r13*2]
  winfo=`echo $wrec | awk '{print $4}'`
  echo "Skipping warmup"
  #if [ "$sPC" != "$wPC" ];
  #then
  #  IINFO+=" -I $wPC:on_warmupPC:$winfo "
  #else
  #  echo "sPC==wPC Skipping warmup"
  #fi
 fi

}

PREOPEN()
{
  sysstate=$1
  cfile=$2
  echo "void preopen_files()" >> $cfile
  echo "{" >> $cfile
  rootcount=`ls $sysstate | wc -l`
  if [ $rootcount -gt 1 ];
  then
    echo "     lte_write(1, "\"WARNING: ELFie will open files with absolute pathname. Consider using 'chroot'.\\\n\"", sizeof("\"WARNING: ELFie will open files with absolute pathname. Consider using 'chroot'.\\\n\"")-1);" >> $cfile
  fi
  nonFDcount=`ls $sysstate/workdir | grep -v FD_ | wc -l`
  if [ $nonFDcount -gt 1 ];
  then
    echo "     lte_write(1, "\"ELFie will open local files. Must be in 'sysstate/workdir' to succeed.\\\n\"", sizeof("\"ELFie will open local files. Must be in 'sysstate/workdir' to succeed.\\\n\"")-1);" >> $cfile
  fi
  if test "$( find $sysstate -name "FD_*" -print -quit)"
  then
    echo "int myfd = 0;" >> $cfile
    echo "     lte_write(1, "\"preopen_files\(\):\"", sizeof("\"preopen_files\(\):\"")-1);" >> $cfile
    echo "     lte_write(1, "\"#must be in 'sysstate/workdir' to succeed \\\n\"", sizeof("\"#must be in 'sysstate/workdir' to succeed \\\n\"")-1);" >> $cfile
    for p in `find $sysstate -name "FD_*"`
    do
#pinball/perlbench-r.3_58573_globalr5_warmupendPC0x0004c7c6b_warmupendPCCount138041_warmuplength800000017_endPC0x0004d1d7c_endPCCount96403_length200000010_multiplier7-000_005_0-05600.0.sysstate/workdir/FD_0
      f=`basename $p` 
      fd=`echo $f | awk -F"_" '{print $2}'`
      echo "  myfd = lte_syscall(__NR_open, (uint64_t)\"$f\", O_RDWR,S_IRWXU,0,0,0);" >> $cfile
      echo "    if( myfd < 0 )" >> $cfile
      echo "     lte_write(1, "\"could not pre-open $f \\\n\"", sizeof("\"could not pre-open $f \\\n\"")-1);" >> $cfile
      echo "    else" >> $cfile
      echo "     lte_syscall(__NR_dup2, myfd, $fd,0,0,0,0);" >> $cfile
    done
  fi
  echo "}" >> $cfile
}


if  [ $# -lt 2 ];  then
    echo "Not enough arguments!"
    ERROR
fi
    BASE=$1
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

    sysstate=""
    BNAME=`basename $BASE`
    DEST=$BASE.elfie
    if test "$( find $basedir -name "$basename*.sysstate" -print -quit)"
    then
      sysstate=`find $basedir -name "$basename*.sysstate"`
      DEST=$sysstate/workdir/$BNAME.elfie
    fi

    if ! test "$( find $basedir -name "$basename*.ins.info.txt" -print -quit)"
    then
       echo "$basename.ins.info.txt not found"
       exit 1
    fi
    

    if [ ! -e $2 ];
    then
       echo "$2 does not exist"
       exit 1
    fi
    
   
    insinfo=`find $basedir -name "$basename*.ins.info.txt"`

    IINFO=""
    SCNT=0
    WCNT=0
    getIINFO $insinfo $2
    echo "IINFO $IINFO"
    magicval=0x1
    magicval2=0x2
    sscmark=0x111
    cat $INST//PCcount_callback.c | awk -v wcnt=$WCNT -v scnt=$SCNT '
     /__lte_static uint64_t wcount/ { print "__lte_static uint64_t wcount ="wcnt";"; next} 
     /__lte_static uint64_t simcount/ { print "__lte_static uint64_t simcount ="scnt";"; next} 
     #/__lte_static uint64_t wcount/ { next} 
     #/__lte_static uint64_t simcount/ { next} 
              {print $0}
      '> /tmp/PCcount_callback.$$.c
    if [ ! -z $sysstate ];
    then
      PREOPEN $sysstate /tmp/PCcount_callback.$$.c
    else
      echo "WARNING: No sysstate directory exists for $BNAME"
      echo "void preopen_files(){}" >>  /tmp/PCcount_callback.$$.c
    fi
    if [ ! -z $sysstate ];
    then
      if test "$( find $sysstate -name "BRK.log" -print -quit)"
      then
        BRKfile=`find $sysstate -name "BRK.log"`
        echo "BRKFILE $BRKfile"
        SETHEAP $BRKfile /tmp/PCcount_callback.$$.c
      else
        echo "void set_heap(){}" >>  /tmp/PCcount_callback.$$.c
      fi
    else
        echo "void set_heap(){}" >>  /tmp/PCcount_callback.$$.c
    fi
    cp  /tmp/PCcount_callback.$$.c PCcount_callback.c
    gcc -g -I$PINBALL2ELFLOC/lib -c /tmp/PCcount_callback.$$.c -o /tmp/PCcount_callback.$$.o
set -x
    time  $PINBALL2ELF -V --text-seg-flags WXA --data-seg-flags WXA --cbk-stack-size 102400 --modify-ldt -u unlimited -l 0x0 $IINFO -i $icount_threshold --roi-start ssc:$sscmark --roi-start simics:$magicval --magic2 simics:$magicval2 -d $tmpBASE.global.log -m $tmpBASE.text -r $tmpBASE.address -x $DEST -p on_start  -t on_thread_start   /tmp/PCcount_callback.$$.o  $PINBALL2ELFLOC/lib/libperfle.a   $PINBALL2ELFLOC/lib/libcle.a  
set +x
    cp  /tmp/PCcount_callback.$$.c PCcount_callback.c
    rm  /tmp/PCcount_callback.$$.*
    if [ $compression -eq 1 ]; then
       rm -rf $tmpbasedir
    fi
