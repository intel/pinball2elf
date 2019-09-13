#!/bin/bash
if [ -e ../../scripts ];
then
    SCRIPTLOC=../../scripts/
    RAWSCRIPT=$SCRIPTLOC/pinball2elfraw.sh
    BASICSCRIPT=$SCRIPTLOC/pinball2elfbasic.sh
else
  which pinball2elfraw.sh
  if [ $? -ne 0 ];
  then
    echo "Please put PINBALL2ELFKIT/scripts in your PATH"
    exit
  fi
  RAWSCRIPT=`which pinball2elfraw.sh`
  BASICSCRIPT=`which pinball2elfbasic.sh`
fi
pinball=pinball.st/log_0
echo "Running $RAWSCRIPT $pinball" 
$RAWSCRIPT $pinball > /dev/null 2>&1
if [ ! -e $pinball.elfie  ];
then
    echo "Failed command: '$RAWSCRIPT $pinball'"
    exit
fi
echo "Running $pinball.elfie "
$pinball.elfie 
rm $pinball.elfie 
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
