#!/usr/bin/env bash
# Usage: pinball.entry-addr.sh pinball_basename <thread_number>
# Output: Application THREAD-0 entry PC
# ./pinball.entry-addr.sh ../examples/MT/pinball.mt/log_0
#0x2aaac07dbf88
ERROR()
{
  echo " Usage: pinball.entry-addr.sh pinball_basename <thread_number> "
  exit
}

endian()
{
  v=$1
  i=${#v}
  while [ $i -gt 0 ]
  do
    i=$[$i-2]
    echo -n ${v:$i:2}
  done
  echo
}
#set -x
if  [ $# -lt 1 ];  then
    ERROR
fi

PINBALL=$1
TNO=0
if  [ $# -eq 2 ];  then
  TNO=$2
fi

RIPNO=`grep -i RIP $PINBALL.global.log | awk '{print $2}'`
if [ -e  $PINBALL.$TNO.reg ]; 
then
RIPValue=`cat $PINBALL.$TNO.reg | grep -e "^$RIPNO" | head -1 | awk '{print $2}'`
fi
if [ -e  $PINBALL.$TNO.reg.bz2 ]; 
then
RIPValue=`bzcat $PINBALL.$TNO.reg.bz2 | grep -e "^$RIPNO" | head -1 | awk '{print $2}'`
fi

if [ -z $RIPValue ];
then
  echo "Thread $TNO not valid"
  ERROR
fi
echo -n "Thread: $TNO Entry Address: 0x"
endian $RIPValue
