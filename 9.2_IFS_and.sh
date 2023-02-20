#!/bin/bash
printarg(){
echo "$1, $2, $3"
}

set a b c #установка аргументов
IFS=""
printarg "$*"
printarg $*
printarg "$@"
printarg $@
