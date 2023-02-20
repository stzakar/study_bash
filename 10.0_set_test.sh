#!/bin/bash
echo "args before call set command :"
echo $1
echo $2
echo $3
set $(uname -a)
echo $_
echo "args after call set command :"
echo $1
echo $2
echo $3
cards="hearts spades diamonds clubs"
set $cards
echo $1
echo $2
echo $3
echo $4

