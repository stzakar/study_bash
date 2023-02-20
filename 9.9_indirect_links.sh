#!/bin/bash -x
a=3
b=a
echo $b
eval b=\$$b
echo $b
echo
echo "========="
echo
var=88
t=var
eval echo \$$t
t=var
nv=323
var=$nv
echo ${!t}
