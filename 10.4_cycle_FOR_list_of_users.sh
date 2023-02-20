#!/bin/bash
pass_file=/etc/passwd
n=0
for user in $(awk 'BEGIN{FS=":"}{print $1}'< "$pass_file")
do
	let "n += 1"
	echo "uesr №$n is $user"
done
echo "count of user: $n"
