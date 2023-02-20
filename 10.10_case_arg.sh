#!/bin/bash
case "$@" in
	"") echo "start without args";;
	* ) echo "start $@"
	echo $#	
	for i in $@; do
	echo $i	
	shift
	done ;;
esac
