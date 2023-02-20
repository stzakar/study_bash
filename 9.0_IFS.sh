#!/bin/bash

print_string()
{
for arg 
do echo "[$arg]"
done	
}


IFS="+"
var="A b  C d E   +)"
print_string $var
echo
IFS=":-:" 
var="A B- C D-"
print_string $var
echo 
IFS=">"
var="f	fD> D t m x" 
print_string $var
echo
