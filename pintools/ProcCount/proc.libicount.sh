#!/bin/bash
# first two lines are 
#1#   MAIN#1302620#python bert_torchscript_mode_inference_bf16.py
#2#   Procedure#  Image#  Address#  Calls#  Instructions

#cat $1 | awk -F "#" '{if (NR > 2 ){sum[$2]+=$NF}} END {for(key in sum){print key, sum[key]}}'
COMMAS=1
if [ $# -eq 2 ];
then
 COMMAS=0
fi
if [ $COMMAS -eq 1 ]; then
cat $1 | awk -F "#" '{if (NR > 2 ){sum[$2]+=$NF}} END {for(key in sum){printf "%s %'"'"'d\n", key, sum[key]}}'
else
cat $1 | awk -F "#" '{if (NR > 2 ){sum[$2]+=$NF}} END {for(key in sum){printf "%s %d\n", key, sum[key]}}'
fi
