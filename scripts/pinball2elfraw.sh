#!/bin/bash
myloc=`dirname $0`
export PINBALL2ELFLOC=`dirname $myloc`/src
export PINBALL2ELF=$PINBALL2ELFLOC"/pinball2elf"
export INST=`dirname $myloc`/instrumentation
ulimit -s unlimited

export TMPDIR=/tmp
if [ ! -z $P2E_TEMP ];
then
   export TMPDIR=$P2E_TEMP
fi
echo "TMPDR $TMPDIR"

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
    magicval=0x1
    magicval2=0x2
    sscmark=0x111
    time  $PINBALL2ELF --text-seg-flags WXA --data-seg-flags WXA --cbk-stack-size 102400 --modify-ldt -u unlimited -l 0x0 -i $icount_threshold --roi-start ssc:$sscmark --roi-start simics:$magicval --magic2 simics:$magicval2 -d $tmpBASE.global.log -m $tmpBASE.text -r $tmpBASE.address -x $BASE.elfie  $PINBALL2ELFLOC/lib/libperfle.a   $PINBALL2ELFLOC/lib/libcle.a  
    if [ $compression -eq 1 ]; then
       rm -rf $tmpbasedir
    fi
