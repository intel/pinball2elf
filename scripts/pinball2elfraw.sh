#!/bin/bash
myloc=`dirname $0`
export PINBALL2ELFLOC=`dirname $myloc`/src
export PINBALL2ELF=$PINBALL2ELFLOC"/pinball2elf"
export INST=`dirname $myloc`/instrumentation
ulimit -s unlimited
ERROR()
{
    echo "Usage: $0 pinball "
    exit 1
}

if  [ $# -lt 1 ];  then
    echo "Not enough arguments!"
    ERROR
fi
    BASE=$1
    icount_threshold=1; #include threads with at least 1 instruction executed.
    compression=0
    echo $BASE
    basedir=`dirname $BASE`
    basename=`basename $BASE`
    if test "$( find $basedir -name "$basename*reg.bz2" -print -quit)"
    then
        bunzip2  $BASE*reg.bz2
        bunzip2  $BASE*.text.bz2
        compression=1
    fi
    magicval=0x1
    magicval2=0x2
    sscmark=0x111
set -x
    time  $PINBALL2ELF --text-seg-flags WXA --data-seg-flags WXA --cbk-stack-size 102400 --modify-ldt -u unlimited -l 0x0 -i $icount_threshold --roi-start ssc:$sscmark --roi-start simics:$magicval --magic2 simics:$magicval2 -d $BASE.global.log -m $BASE.text -r $BASE.address -x $BASE.elfie  $PINBALL2ELFLOC/lib/libperfle.a   $PINBALL2ELFLOC/lib/libcle.a  
set +x
    if [ $compression -eq 1 ]; then
        bzip2  $BASE*reg
        bzip2  $BASE*.text
    fi
