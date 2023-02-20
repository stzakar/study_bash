#!/bin/bash
File=/etc/passwd

IFS=':'
{
read line1
read line2
read line3
read line4
}<$File

echo $line1
echo $line2
echo $line3
echo $line4
