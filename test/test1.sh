#!/bin/bash
: ${username=`whoami`}
echo $username
hostname=1
username=2
mail=3
: ${hostname?} ${username?} ${mail?};
echo $?

files=$(ls "$1")
echo $files