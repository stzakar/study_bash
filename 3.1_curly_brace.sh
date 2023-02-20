#!/bin/bash

#-- 1
echo {file1,file2}\ :{\ A," B",' C'}
echo {a,b,c}{1,2,3}

Array[1]=slot_1
echo ${Array[1]}

#--- 2

v="mmdms"
echo "new v" |  read v 
echo "variable is -  $v" 



