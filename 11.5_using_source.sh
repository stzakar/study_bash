#!/bin/bash
. param.conf
echo $var1
echo $var2
let "sum = $var1 + $var2"
echo $sum
print_msg $@
exit 0
