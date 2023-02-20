#!/bin/bash
for i in {1..10}
do
	echo -n  "$i "
done &
wait
for i in {11..20}
do
	echo -n  "$i "
done

echo 'echo'
