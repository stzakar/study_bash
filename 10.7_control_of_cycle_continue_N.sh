#!/bin/bash
for i in I II III IV V; do
	echo -n $i
	for a in 1 2 3 4 5 6 7 8 9 10; do
		if [ "$a" -eq 7  ]; then
			continue 2
		fi
		echo -n $a
	done
done
echo
