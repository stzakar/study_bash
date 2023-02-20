#!/bin/bash -x
BD_TYPE=60
PS4='>'
echo
echo "Enter the number type of execution  (default type is 1)"
read typeof
typeof=${typeof:-1}
if [ "$typeof" -eq 1 ]; then
	LIM=19
	a=0
	echo "======================="
	while [ "$a" -le "$LIM" ]; do
		(( a += 1 ))
		if [ "$a" -eq 3 ] || [ "$a" -eq 13 ]
		then
			continue
		fi
		echo "$a"
	done

elif [ "$typeof" -eq 2 ]; then
	LIM=19
	a=0
	echo "======================="
	while [ "$a" -le "$LIM" ]; do
		(( a += 1 ))
		if [ "$a" -gt 2 ]; then
			break
		fi
		echo "$a"
	done
else
	echo "Wrong type! Exist 1 or 2 type"
	exit $BD_TYPE
fi

