#!/bin/bash
hello="A B   C     D          E 1"
echo $hello
echo "$hello"
echo ${hello}
echo "${hello}"
#неинициализированная переменная
var=$var
echo $var
var=3
let "var += 5"
echo \"a=\" "$var"

for a in 7 12 33 55 4 2
do
	echo -n "$a "
done
