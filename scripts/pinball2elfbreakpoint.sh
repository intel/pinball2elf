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

if  [ $# != 3 ];  then
    ERROR
fi
ulimit -s unlimited
    BASE=$1
    bp=$2
    bpcount=$3
set -x
    echo $BASE
    basedir=`dirname $BASE`
    basename=`basename $BASE`
    compression=0
    if test "$( find $basedir -name "$basename*reg.bz2" -print -quit)"
    then
        bunzip2  $BASE*reg.bz2
        bunzip2  $BASE*.text.bz2
        compression=1
    fi
#Modify the line "__lte_static uint64_t bpcount = 1;"
    cat $INST/breakpoint_callback.c | awk -v BPCOUNT=$bpcount ' 
    /__lte_static uint64_t bpcount = 1;/{
      print "__lte_static uint64_t bpcount = ",BPCOUNT,";"
      next
    }
    {print $0}' > /tmp/breakpoint_callback.$$.c
    gcc -g -I$PINBALL2ELFLOC/lib -c /tmp/breakpoint_callback.$$.c -o /tmp/breakpoint_callback.$$.o
    magicval=0x1
    magicval2=0x2
    sscmark=0x111
    sscmark2=0x222
set -x
    time  $PINBALL2ELF --text-seg-flags WXA --data-seg-flags WXA --cbk-stack-size 1024000 --modify-ldt -u unlimited --roi-start ssc:$sscmark  --roi-start simics:$magicval --magic2 simics:$magicval2 -l 0x0 -b $bp -i 1 -d $BASE.global.log -m $BASE.text -r $BASE.address -x $BASE.elfie.breakpoint -p on_start -t on_thread_start /tmp/breakpoint_callback.$$.o  $PINBALL2ELFLOC/lib/libperfle.a   $PINBALL2ELFLOC/lib/libcle.a  
    cp /tmp/breakpoint_callback.$$.c breakpoint_callback.c
    rm /tmp/breakpoint_callback.$$.c /tmp/breakpoint_callback.$$.o
    if [ $compression -eq 1 ]; then
        bzip2  $BASE*reg
        bzip2  $BASE*.text
    fi
