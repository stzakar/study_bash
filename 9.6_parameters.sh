#!/bin/bash
username=
echo ${username:-$(whoami)}
echo "============================"
a=${param1+111}
echo $a
param2=
a=${param2+111}
echo $a
param3=222
a=${param3+111}
echo $a
a=${param4:+111}
echo $a
param5=
a=${param5+111}
echo $a
param6=333
a=${param6+111}
echo $a
echo "============================"
echo $(basename "$PWD")
echo ${PWD##*/}
echo $(basename $0)
echo $0
echo ${0##*/}
echo
#расщирение файла
file=config.dmt
echo ${file##*.}
