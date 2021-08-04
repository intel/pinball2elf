#!/bin/bash
myloc=`dirname $0`
export PINBALL2ELFLOC=`dirname $myloc`/src
export PINBALL2ELF=$PINBALL2ELFLOC"/pinball2elf"
export INST=`dirname $myloc`/instrumentation
export TMPDIR=/tmp
export CWD=""
if [ ! -z $P2E_TEMP ];
then
   export TMPDIR=$P2E_TEMP
fi
echo "TMPDR $TMPDIR"
ulimit -s unlimited
ERROR()
{
    echo "Usage: $0 pinball <message>"
    exit 1
}

FATCHECK()
{
 pb=$1
 glog=$pb.global.log
 if [ ! -e $glog ];
 then
    echo "ERROR: *.global.log file not found for $pb" 
    exit 1
 fi
 fatrec=`grep "fat: " $glog`
 if [ -z "$fatrec" ]; 
 then
    echo "ERROR: 'fat: ' not found for $pb" 
    exit 1
 fi
 isfat=`grep "fat: " $glog | awk '{print $NF}'`
 if [ $isfat -eq 1 ];
 then
    echo "$pb WAS created with '-log:fat'" 
 else
    echo "ERROR: $pb was not created with '-log:fat'" 
    exit 1
 fi
}

SETENV()
{
  cfile=$1

  cat $INST/environ.c | awk '
  BEGIN {flag=0}
  /END_LEGAL/ {flag=1; next}
      {if(flag) print $0}
  ' >> $cfile
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
  nonFDcount=`ls $sysstate | grep -v FD_ | wc -l`
  if [ $nonFDcount -gt 1 ];
  then
    echo "     lte_write(1, "\"ELFie will open local files. Must be in \'sysstate$CWD\' to succeed.\\\n\"", sizeof("\"ELFie will open local files. Must be in \'sysstate$CWD\' to succeed.\\\n\"")-1);" >> $cfile
  fi
  if test "$( find $sysstate -name "FD_*" -print -quit)"
  then
    echo "int myfd = 0;" >> $cfile
    echo "     lte_write(1, "\"preopen_files\(\):\"", sizeof("\"preopen_files\(\):\"")-1);" >> $cfile
    echo "     lte_write(1, "\"#must be in \'sysstate$CWD\' to succeed \\\n\"", sizeof("\"#must be in \'sysstate$CWD\' to succeed \\\n\"")-1);" >> $cfile
    for p in `find $sysstate -name "FD_*"`
    do
#pinball/perlbench-r.3_58573_globalr5_warmupendPC0x0004c7c6b_warmupendPCCount138041_warmuplength800000017_endPC0x0004d1d7c_endPCCount96403_length200000010_multiplier7-000_005_0-05600.0.sysstate/FD_0
      f=`basename $p` 
      fd=`echo $f | awk -F"_" '{print $2}'`
      if [ $fd -eq 2 ];
      then
         echo "Skipping 'stderr' re-direction with $f"
      else
        echo "  myfd = lte_syscall(__NR_open, (uint64_t)\"$f\", O_RDWR,S_IRWXU,0,0,0);" >> $cfile
        echo "    if( myfd < 0 )" >> $cfile
        echo "     lte_write(1, "\"could not pre-open $f \\\n\"", sizeof("\"could not pre-open $f \\\n\"")-1);" >> $cfile
        echo "    else" >> $cfile
        echo "     lte_syscall(__NR_dup2, myfd, $fd,0,0,0,0);" >> $cfile
      fi
    done
  fi
  echo "}" >> $cfile
}


if  [ $# -lt 1 ];  then
    echo "Not enough arguments!"
    ERROR
fi
    BASE=$1
    message=""
if  [ $# -eq 2 ];  then
    message=$2
fi
    icount_threshold=1; #include threads with at least 1 instruction executed.
    compression=0
    echo $BASE
    FATCHECK $BASE
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
        for otherfile in `ls $basedir | grep -a -v "reg.bz2"| grep -a -v "\.text.bz2" | grep -a -v sysstate`
        do
          obasename=`basename $otherfile`
          srcfile=`readlink -f $basedir/$otherfile`
          cp -rs $srcfile $tmpbasedir/$obasename
        done
        compression=1
    fi

    sysstate=""
    BNAME=`basename $BASE`
    DEST=$BASE.sim.elfie
    if test "$( find $basedir -name "$basename*.sysstate" -print -quit)"
    then
      sysstate=`find $basedir -name "$basename*.sysstate"`
      DEST=$sysstate/$BNAME.sim.elfie
    fi

    magicval=0x1
    magicval2=0x2
    sscmark=0x111
    sscmark2=0x222
    mystr="\\\n  Start Simics magic instruction: 1. $magicval 2. $magicval2 SSC mark 1. $sscmark $message"
    cat $INST/sim_callbacks.c | awk -v MYSTR="$mystr" '/void elfie_on_start/       {print "__lte_static char str[] = \"",MYSTR,"\";\n"}
      {print $0}'> $TMPDIR/sim_callbacks.$$.c
    if [ ! -z $sysstate ];
    then
      if test "$( find $sysstate -name "CWD.log" -print -quit)"
      then
        CWDfile=`find $sysstate -name "CWD.log"`
        echo "CWDFILE $CWDfile"
        CWD=`cat $CWDfile`
        echo "CWD set to $CWD"
      fi
      PREOPEN $sysstate $TMPDIR/sim_callbacks.$$.c
    else
      echo "WARNING: No sysstate directory exists for $BNAME"
      echo "void preopen_files(){}" >>  $TMPDIR/sim_callbacks.$$.c
    fi
    if [ ! -z $sysstate ];
    then
      if test "$( find $sysstate -name "BRK.log" -print -quit)"
      then
        BRKfile=`find $sysstate -name "BRK.log"`
        echo "BRKFILE $BRKfile"
        SETHEAP $BRKfile $TMPDIR/sim_callbacks.$$.c
      else
        echo "void set_heap(){}" >>  $TMPDIR/sim_callbacks.$$.c
      fi
    else
        echo "void set_heap(){}" >>  $TMPDIR/sim_callbacks.$$.c
    fi
    SETENV $TMPDIR/sim_callbacks.$$.c

    gcc -g -I$PINBALL2ELFLOC/lib -c $TMPDIR/sim_callbacks.$$.c -o $TMPDIR/sim_callbacks.$$.o
    time  $PINBALL2ELF --text-seg-flags XA --data-seg-flags WXA --cbk-stack-size 102400 --modify-ldt -u unlimited --roi-start ssc:$sscmark  --roi-start simics:$magicval --magic2 simics:$magicval2 -l 0x0 -i 0 -d $tmpBASE.global.log -m $tmpBASE.text -r $tmpBASE.address -x $DEST -p elfie_on_start -t elfie_on_thread_start $TMPDIR/sim_callbacks.$$.o  $PINBALL2ELFLOC/lib/libperfle.a   $PINBALL2ELFLOC/lib/libcle.a  
    cp  $TMPDIR/sim_callbacks.$$.c sim_callbacks.c
    rm  $TMPDIR/sim_callbacks.$$.*
    if [ $compression -eq 1 ]; then
       rm -rf $tmpbasedir
    fi
