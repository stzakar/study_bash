#!/bin/bash
TLIM=5
echo "ENTER OR WITE 5sec"
read -t $TLIM word 
echo
if [ -z $word ]; then
	echo "Time is out"
else
	echo "string is : $word"
fi
exit 0
