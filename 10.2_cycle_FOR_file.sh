#!/bin/bash
[ "$#" -eq 0 ] && dir="$(pwd)" || dir=$1
dir=${dir%/}
for file in "$dir"/*
do
	if [ -e "$file" -a -f "$file" ]; then
	ls -lh "$file" | awk '{ print  $8 "  size: " $5 }'
	echo $(file "$file")
	whatis $(basename "$file")
	echo
	fi
done
