#!/usr/bin/env bash
export ELFIE_COREBASE=0
if [ -e ../../scripts ];
then
    SCRIPTLOC=../../scripts/
    BASICSCRIPT=$SCRIPTLOC/pinball2elf.basic.sh
    PERFSCRIPT=$SCRIPTLOC/pinball2elf.perf.sh
else
  which pinball2elf.basic.sh
  if [ $? -ne 0 ];
  then
    echo "  Please put PINBALL2ELFKIT/scripts in your PATH"
    exit
  fi
  BASICSCRIPT=`which pinball2elf.basic.sh`
  PERFSCRIPT=`which pinball2elf.perf.sh`
fi
pinball=pinball.SSE4.2/region
pbname=`basename $pinball`
if test "$( find . -name "$pbname.basic.elfie" -print -quit)"
then
    elfie=`find . -name "$pbname.basic.elfie"`
    echo "  Deleting old elfie: $elfie" 
    rm -f $elfie
fi

echo "  Running $BASICSCRIPT $pinball" 
$BASICSCRIPT $pinball > /dev/null 2>&1
if ! test "$( find . -name "$pbname.basic.elfie" -print -quit)"
then
    echo "**Failed command: '$BASICSCRIPT $pinball'"
    exit
fi
elfie=`find . -name "$pbname.basic.elfie"`
echo "  Running $elfie"
$elfie
echo "---------------------"
if test "$( find . -name "$pbname.perf.elfie" -print -quit)"
then
    elfie=`find . -name "$pbname.perf.elfie"`
    echo "  Deleting old elfie: $elfie" 
    rm -f $elfie
fi
echo "  Running $PERFSCRIPT $pinball SSE4.2" 
$PERFSCRIPT $pinball SSE4.2 > /dev/null 2>&1
if ! test "$( find . -name "$pbname.perf.elfie" -print -quit)"
then
    echo "**Failed command: '$PERFSCRIPT $pinball'"
    exit
fi
elfie=`find . -name "$pbname.perf.elfie"`
export ELFIE_PERFLIST="0:0,0:1,1:1"
echo "  export ELFIE_PERFLIST=$ELFIE_PERFLIST"
echo "   [ based on /usr/include/linux/perf_event.h"
echo "     Comma separeted pairs 'perftype:counter'"
echo "     perftype: 0 --> HW 1 --> SW"
echo "     HW counter: 0 --> PERF_COUNT_HW_CPU_CYCLES" 
echo "     HW counter: 1 --> PERF_COUNT_HW_CPU_INSTRUCTIONS" 
echo "     SW counter: 0 --> PERF_COUNT_SW_CPU_CLOCK" 
echo "      ... <see perf_event.h:'enum perf_hw_ids' and 'enum perf_sw_ids']"
    
echo "  Running $elfie"
$elfie
if [ $? -eq 0 ];
then
  echo "    graceful exit SUCCESS"
  echo "  Performance counters reported in SSE4.2.0.perf.txt"
  cat SSE4.2.0.perf.txt
else
  echo "    graceful exit FAILURE"
fi
