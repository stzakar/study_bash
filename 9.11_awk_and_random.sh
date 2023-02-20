#!/bin/bash 
RANDOM=$$
for (( i=1; i <= 10; i++ ))
do
	rnd='{ srand(str); print int(rand()*100) }' 
	let "st = $RANDOM + $i"
	echo | awk -v str=$st "$rnd"
done
