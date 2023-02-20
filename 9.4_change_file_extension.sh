#!/bin/bash
OP=mv
SUF=txt
if [ -n "$1" ]
then
	if [ -e "$1" -a -d "$1" ]
	then
		dir="$1"
	else
		echo "diroctory is not found"
	fi
else
	dir="$PWD"
fi
#далее удаляем лишний слэш если он есть
end_of_string=${1: -1}
#if [ $end_of_string = '/' ] 
#then
#        dir=${1%'/'}
#fi
dir=${1%/}

for file in "$dir"/*
do
	if [ $(expr "${file}" : '.*\(txt*$\)') ]
	then
		echo "${file}"
		filename=${file%%.*txt}
		$OP "$file" "$filename.$SUF"
	fi
done
