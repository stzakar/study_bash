#!/bin/bash
BD_ARG=20
NOT_FOUND_FILE=21
NOT_GZ=22
if [ $# -eq 0 ]
then
	# if [ -z "$1" ]; then - тоже самое
	echo "Недостаточно аргументов" >&2
	#вывод на stderr
	echo "формат запуска: $0 file_name"
	exit $BD_ARG
fi
filename=$1
if [ ! -f $filename ]
#если он не является обычным файлом
then
	echo "file: $filename is not fiand" >&2
	exit $NOT_FOUND_FILE
fi	
if [ ${filename##*.} != "gz" ]
#!ПОДСТАНОВКА по маске ##*. см глава 2?!
then
	echo "File $1 is no archive gz-file"
	exit $NOT_GZ
fi
