#!/bin/bash
echo "Please enter type of realistion script 1(S.Konstanin) or 2(from textbook)"
read real
if [[ real -eq 1 ]]
	then
	cparam=$# 
	for (( i=1; i<=$cparam; i++ )) 
		do
		echo param "$i" is : $1
		shift
	done
elif [[ real -eq 2 ]]
then
	#Из учебника
	until [ -z "$1" ]
	do
 		echo -n "$1 "
 		shift
	done
	echo
else
	echo "No correct realisation number"
fi
