#!/bin/bash
File=/etc/fstab

{
read line1
read line2
read line3
} < $File

echo $line1; echo $line3
