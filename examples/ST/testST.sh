#!/bin/bash
which pinball2elfraw.sh
if [ $? -ne 0 ];
then
  echo "Please put PINBALL2ELFKIT/scripts in your PATH"
  exit
fi
pinball=pinball.st/log_0
set -x
pinball2elfraw.sh $pinball > /dev/null 2>&1
set +x
$pinball.elfie 
rm $pinball.elfie 
set -x
pinball2elfbasic.sh $pinball > /dev/null 2>&1
set +x
$pinball.elfie 
rm $pinball.elfie 
