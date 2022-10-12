#!/bin/bash
start=`nm -D /bin/ls | grep __libc_start_main`
if [ -z "$start" ]
then
  echo "Could not find '__libc_start_main' in 'nm -D /bin/ls' output"
  exit 1;
fi
stop=`nm -D /bin/ls | grep exit`
if [ -z "$stop" ]
then
  echo "Could not find 'exit' in 'nm -D /bin/ls' output"
  exit 1;
fi
echo "RTNstart:__libc_start_main:1" > probe.in
#echo "RTNstop:exit:1" >> probe.in
echo "ideltastop:10000" >> probe.in
export ROIPERF_VERBOSE=1
export ROIPERF_PERFLIST="0:0,0:1,1:0"
set -x
$PIN_ROOT/pin -t obj-intel64/ROIperf.so -probecontrol:in probe.in -probecontrol:verbose -verbose -- /bin/ls
cat perf.txt
