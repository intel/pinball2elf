#!/bin/bash
if [ -e ../../scripts ];
then
    SCRIPTLOC=../../scripts/
    BASICSCRIPT=$SCRIPTLOC/pinball2elf.basic.sh
else
  which pinball2elf.basic.sh
  if [ $? -ne 0 ];
  then
    echo "Please put PINBALL2ELFKIT/scripts in your PATH"
    exit
  fi
  BASICSCRIPT=`which pinball2elf.basic.sh`
fi
pinball=pinball.st/log_0
echo "Running $BASICSCRIPT $pinball" 
$BASICSCRIPT $pinball > /dev/null 2>&1
if [ ! -e $pinball.elfie  ];
then
    echo "Failed command: '$BASICSCRIPT $pinball'"
    exit
fi
echo "Running $pinball.elfie "
$pinball.elfie 
rm $pinball.elfie 
