#!/bin/bash
which pinball2elfbasic.sh
if [ $? -ne 0 ];
then
  echo "Please put PINBALL2ELFKIT/scripts in your PATH"
  exit
fi
pinball=pinball.mt/log_0
set -x
pinball2elfraw.sh $pinball > /dev/null 2>&1
set +x
$pinball.elfie 
if [ $? -eq 0 ];
then
  echo "raw execution SUCCESS"
else
  echo "raw execution FAILURE"
fi
rm $pinball.elfie 
set -x
pinball2elfgracefulexit.sh $pinball > /dev/null 2>&1
set +x
$pinball.elfie > /dev/null 2>&1
if [ $? -eq 0 ];
then
  echo "graceful exit SUCCESS"
else
  echo "graceful exit FAILURE"
fi
rm $pinball.elfie 
