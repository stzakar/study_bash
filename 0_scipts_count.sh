#!/bin/bash

scrp=($(ls | grep .sh))
num=${#scrp[@]}
#memo=${scrp[@]}
echo $memo
#let "num -=1"
for (( i=0; i<$num; i++  )); do
echo ${scrp[$i]}
done
echo "$num"
