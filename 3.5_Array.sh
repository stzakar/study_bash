#!/bin/bash
echo "Enter first element of array"
read array[0]
echo "Enter second element of array"
read array[1]
if [[ ${array[0]?} && ${array[1]?} ]] 
then
array[2]=`expr ${array[0]} + ${array[1]}`
echo -n "Summ ="
echo ${array[2]}
else
echo 'First or secont or both ellements of array is not exists'
fi

