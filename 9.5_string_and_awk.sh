#!/bin/bash
string=23skidoo1
echo ${string:2:4}
echo | awk ' { print substr("'"${string}"'",3,4) } '
