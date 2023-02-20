#!/bin/bash
echo "Enter coordiante the X point"
read x
echo "Enter coordinate the Y point"
read y
echo "--------"
echo
if (( x > 0 )) 
then
	if (( y > 0 ))
	then
	echo "Point in I"
	else
	echo "Point in IV" 
	fi
elif (( y < 0 ))
then
	echo "Point in III"
else
	echo "Point in II"
fi

