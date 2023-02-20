#!/bin/bash
param=$*
if [[ "$*" = "" ]]
then
	echo "no parametrs"
	echo $#
else
	echo "$param"
	echo "------------------------------"
	args=$#
	echo "count of args is : $#"
	echo "count of args is : $args"
	lastarg=${!args}
	echo "last arg is : $lastarg"	
	echo "------------------------------"
	echo script name $0
if [ -n "$1" ]
then
	echo "Param 1 is : "$1" "
fi
if [ -n "$2" ] 
then
	echo "Param 2 is : "$2" "
fi
if [ -n "$3" ] 
then
	echo "Param 3 is : "$3" "
fi
if [ -n "${10}" ] 
then
	echo "Param 10 is : "${10}" "
fi
fi
