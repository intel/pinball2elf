#!/usr/bin/bash
# Usage: pinball.entry-addr.sh pinball_basename
# Output: Application THREAD-0 entry PC
# ./pinball.entry-addr.sh ../examples/MT/pinball.mt/log_0
#0x2aaac07dbf88
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
PINBALL=$1
RIPNO=`grep -i RIP $PINBALL.global.log | awk '{print $2}'`
if [ -e  $PINBALL.0.reg ]; 
then
RIPValue=`cat $PINBALL.0.reg | grep -e "^$RIPNO" | head -1 | awk '{print $2}'`
fi
if [ -e  $PINBALL.0.reg.bz2 ]; 
then
RIPValue=`bzcat $PINBALL.0.reg.bz2 | grep -e "^$RIPNO" | head -1 | awk '{print $2}'`
fi
echo -n "0x"
endian $RIPValue
