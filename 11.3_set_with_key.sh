#!/bin/bash
var1="one two three four five six seven eight nine ten"
set -- $var1
echo $1
echo ${10}
shift; shift;
next_param="$*"
echo $next_param
set -- $var1
echo $2
set --
echo "last is :  $3"
