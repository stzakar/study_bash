#!/bin/bash
a=2234
let "a += 1"
echo "a= $a"
b=${a/23/BB}
echo "b= $b"
