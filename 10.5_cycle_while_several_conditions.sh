#!/bin/bash
var1=noneset
previous=$var1
tlim=5
while echo "Previous value \$var1 is : $previous" 
	echo
	previous=$var1
	[ "$var1" != end ]; 
do
	echo "Enter the var value"
	read -t $tlim var1
	var1=${var1:-end}
	echo "now \$var is: $var1" 
done
exit 0
