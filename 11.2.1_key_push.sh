#!/bin/bash
arrup='\[A'
GOOD=0
NGOOD=65
read -n3 -p "Push the key : " key
echo
#echo -n "$key" | grep "$arrup"
#if [ "$?" -eq $GOOD ]; then
if [ "$arrup" = $key ]; then
	echo "Pushin button up"
	exit $GOOD
fi
