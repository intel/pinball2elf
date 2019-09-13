#!/bin/bash
if [ -e ../../scripts ];
then
    SCRIPTLOC=../../scripts/
    RAWSCRIPT=$SCRIPTLOC/pinball2elfraw.sh
    GESCRIPT=$SCRIPTLOC/pinball2elfgracefulexit.sh
else
  which pinball2elfraw.sh
  if [ $? -ne 0 ];
  then
    echo "Please put PINBALL2ELFKIT/scripts in your PATH"
    exit
  fi
  RAWSCRIPT=`which pinball2elfraw.sh`
  GESCRIPT=`which pinball2elfgracefulexit.sh`
fi
pinball=pinball.mt/log_0
echo "Running $RAWSCRIPT $pinball" 
$RAWSCRIPT $pinball > /dev/null 2>&1
if [ ! -e $pinball.elfie  ];
then
    echo "Failed command: '$RAWSCRIPT $pinball'"
    exit
fi
echo "Running $pinball.elfie "
$pinball.elfie 
if [ $? -eq 0 ];
then
  echo "raw execution SUCCESS"
else
  echo "raw execution FAILURE"
fi
rm $pinball.elfie 
echo "Running $GESCRIPT $pinball" 
$GESCRIPT $pinball > /dev/null 2>&1
if [ ! -e $pinball.elfie  ];
then
    echo "Failed command: '$GESCRIPT $pinball'"
    exit
fi
echo "Running $pinball.elfie "
$pinball.elfie > /dev/null 2>&1
if [ $? -eq 0 ];
then
  echo "graceful exit SUCCESS"
else
  echo "graceful exit FAILURE"
fi
rm $pinball.elfie 
