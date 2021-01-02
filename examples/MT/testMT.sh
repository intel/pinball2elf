#!/bin/bash
export ELFIE_COREBASE=0
if [ -e ../../scripts ];
then
    SCRIPTLOC=../../scripts/
    GESCRIPT=$SCRIPTLOC/pinball2elf.perf.sh
else
  which pinball2elf.perf.sh
  if [ $? -ne 0 ];
  then
    echo "**Please put PINBALL2ELFKIT/scripts in your PATH"
    exit
  fi
  GESCRIPT=`which pinball2elf.perf.sh`
fi
pinball=pinball.mt/log_0
pbname=`basename $pinball`
echo "  Running $PERFSCRIPT $pinball" 
$PERFSCRIPT $pinball mt > /dev/null 2>&1
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
  echo "   graceful exit SUCCESS"
  echo "  Performance counters reported in mt.?.perf.txt"
  more mt.?.perf.txt
else
  echo    "graceful exit FAILURE"
fi
