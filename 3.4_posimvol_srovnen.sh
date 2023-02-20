#!/bin/bash -x
echo "enter param1"
read PARAM1
echo "enter param2"
read PARAM2

if [[ "$PARAM1" -lt "$PARAM2"  ]]
then
	echo "param 2 $PARAM2 more then param 1 $PARAM1"
else if [[ "$PARAM2" -gt "$PARAM1" ]]
then 	
	echo "param 1 $PARAM1 more then param 2 $PARAM2"
else
	echo "param 1 $PARAM1 equal param 2 $PARAM2"
fi
fi

