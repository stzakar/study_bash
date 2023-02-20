#!/bin/bash
#Наибольший общий делитель
args=2
ER_BAD_ARG_COUNT=60
ER_BAD_ARG=61

if [ $# -ne "$args" ]
then
	echo "Bad syntax! Use: $0 number1 number2"
	exit $ER_BAD_ARG_COUNT
fi

#let "n1=$1%1"
#let "n2=$2%1"
$(( n1=$1%1  ))
$(( n2=$2%1  ))

echo $n1
echo $n2
#if [[ "$n1" -ne 0 || "$n2" -ne 0  ]]
if [[ $n1 -ne 0 || $n2  -ne 0  ]]
then
	echo "One or two of the entered numbers is not an integer"
	exit $ER_BAD_ARG
fi

gcd() 
{
	dividend=$1
	divisor=$2
	remainder=1

	until [ "$remainder" -eq 0 ]
	do
		let "remainder=$dividend % $divisor"
		dividend=$divisor
		divisor=$remainder
	done
}

gcd $1 $2

echo "НОД чисел $1 $2 равен : $dividend"
