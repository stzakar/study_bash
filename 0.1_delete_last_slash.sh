#!/bin/bash
: ${1?Error! use int $0 /patch}
end_of_string=${1: -1}
echo $end_of_string
if [ $end_of_string = '/' ] 
then
	patch=${1%'/'}
fi
echo $patch
#простой вариант =)
dpatch=${1%/}
echo "$dpatch"
