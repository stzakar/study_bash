#!/bin/bash -x
if [[ $1%3 -eq 2 || $2%3 -eq 2 ]]; then
	echo "mod 2"
else
	echo "ne mod 2"
fi

a=$((5,5%1))
echo $a

let "b = 5 + 1,2"
echo $b
