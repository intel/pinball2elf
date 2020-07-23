#!/bin/bash
myloc=`dirname $0`
export PINBALL2ELFLOC=`dirname $myloc`/src
export PINBALL2ELF=$PINBALL2ELFLOC"/pinball2elf"
#export PINBALL2ELF=$PINBALL2ELFLOC"/pinball2elfd"
export INST=`dirname $myloc`/instrumentation
ERROR()
{
  echo "Usage : " $0 " pinball-basename breakpoint count"
  exit
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

if  [ $# != 3 ];  then
    ERROR
fi
ulimit -s unlimited
    BASE=$1
    bp=$2
    bpcount=$3
    compression=0
    echo $bp
    probe_addr=`echo $bp | awk '{ printf "0x%x",int(strtonum($1)/0x1000)*0x1000 }'`
    echo $probe_addr
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
#Modify the line "__lte_static uint64_t bpcount = 1;"
    cat $INST/breakpoint_callback.c | awk -v BPCOUNT=$bpcount ' 
    /__lte_static uint64_t bpcount = 1;/{
      print "__lte_static uint64_t bpcount = ",BPCOUNT,";"
      next
    }
    {print $0}' > /tmp/breakpoint_callback.$$.c
    if [ ! -z $sysstate ];
    then
      PREOPEN $sysstate /tmp/breakpoint_callback.$$.c
    else
      echo "WARNING: No sysstate directory exists for $BNAME"
      echo "void preopen_files(){}" >>  /tmp/breakpoint_callback.$$.c
    fi
    if [ ! -z $sysstate ];
    then
      if test "$( find $sysstate -name "BRK.log" -print -quit)"
      then
        BRKfile=`find $sysstate -name "BRK.log"`
        echo "BRKFILE $BRKfile"
        SETHEAP $BRKfile /tmp/breakpoint_callback.$$.c
      else
        echo "void set_heap(){}" >>  /tmp/breakpoint_callback.$$.c
      fi
    else
        echo "void set_heap(){}" >>  /tmp/breakpoint_callback.$$.c
    fi
    gcc -g -I$PINBALL2ELFLOC/lib -c /tmp/breakpoint_callback.$$.c -o /tmp/breakpoint_callback.$$.o
    magicval=0x1
    magicval2=0x2
    sscmark=0x111
    sscmark2=0x222
set -x
    time  $PINBALL2ELF --text-seg-flags WXA --data-seg-flags WXA --cbk-stack-size 1024000 --modify-ldt -u unlimited --roi-start ssc:$sscmark  --roi-start simics:$magicval --magic2 simics:$magicval2 -l 0x0 -b $bp -i 1 -d $BASE.global.log -m $BASE.text -r $BASE.address -x $DEST --probe-addr $probe_addr -p on_start -t on_thread_start /tmp/breakpoint_callback.$$.o  $PINBALL2ELFLOC/lib/libperfle.a   $PINBALL2ELFLOC/lib/libcle.a  
    cp /tmp/breakpoint_callback.$$.c breakpoint_callback.c
    rm /tmp/breakpoint_callback.$$.c /tmp/breakpoint_callback.$$.o
    if [ $compression -eq 1 ]; then
       rm -rf $tmpbasedir
    fi
