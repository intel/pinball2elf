#!/bin/bash
if [ -e ../../scripts ];
then
    SCRIPTLOC=../../scripts/
    GESCRIPT=$SCRIPTLOC/pinball2elf.perf.sh
else
  which pinball2elf.perf.sh
  if [ $? -ne 0 ];
  then
    echo "Please put PINBALL2ELFKIT/scripts in your PATH"
    exit
  fi
  GESCRIPT=`which pinball2elf.perf.sh`
fi
pinball=pinball.mt/log_0
echo "Running $GESCRIPT $pinball" 
$GESCRIPT $pinball mt > /dev/null 2>&1
if [ ! -e $pinball.perf.elfie  ];
then
    echo "Failed command: '$GESCRIPT $pinball mt'"
    exit
fi
echo "Running $pinball.perf.elfie "
$pinball.perf.elfie > /dev/null 2>&1
if [ $? -eq 0 ];
then
  echo "graceful exit SUCCESS"
else
  echo "graceful exit FAILURE"
fi
rm $pinball.perf.elfie 
