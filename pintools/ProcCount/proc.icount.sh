#!/bin/bash
COMMAS=1
if [ $# -eq 2 ];
then
 COMMAS=0
fi
if [ $COMMAS -eq 1 ]; then
cat $1 | awk -F "#" '{sum+=$NF} END {printf "%'"'"'d\n", sum}'
else
cat $1 | awk -F "#" '{sum+=$NF} END {print sum}'
fi
