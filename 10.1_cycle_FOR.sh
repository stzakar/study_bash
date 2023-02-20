#!/bin/bash
for coord in "x -1" "x 3" "y 5" "y -7" 
do
set -- $coord
echo "axis:  $1 coordinate: $2"
done
