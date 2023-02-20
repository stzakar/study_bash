#!/bin/bash
BD_ARG_COUNT=20
BD_FL_NM=21
BD_CH=22
FN=$(ls)

if [ $# -ne 2 ]; then
	echo "Input `basename $0` string (for search) filename (in search)"
	i=1
	for word in $FN; do
                echo "$i - $word"
                (( i++ ))
        done
        unset i
	exit $BD_ARG_COUNT
fi

if [ ! -e $2 ]; then
	if [ ! -f $2 ]; then
		echo "File $2 is not exists"
		i=1
		for word in $FN; do
		echo "$i - $word"
		(( i++ ))
	done
	unset i
	exit $BD_FL_NM
	fi
fi

echo "if this file is binary eter "1" if this file is text enter "2" "
read choce
if [ "$choce" -eq 1 ];then
	for word in $( strings "$2" | grep "$1"); do
		echo $word
	done
elif [ "$choce" -eq 2 ]; then
for word in $FN; do
	grep "$1" "$word"
	if [ $? -eq 0 ]; then
	echo "./$word"
	fi
done
else
	echo "Enering ERROR"
	exit $BD_CH
fi
#IFS="\r"
#echo $FN
exit 0




