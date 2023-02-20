#!/bin/bash
while getopts ":abc:de" Option
do
	case $Option in
		a | b	) echo "arg -$Option in work";;
		c	) echo "arg -$Option in work with $OPTARG";;
		d | e	) echo "arg -$Option in work";;
	esac
done
shift $(($OPTIND - 1))
