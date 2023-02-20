#!/bin/bash
PI=3,14159265358979
DecCon=31373
mes1="Поздравляю , "
mes2="Землянин . "
printf "$PI \n"
printf "Чиссло пи с точностью до 2ого знака после запятой = %1.2f" $PI
printf "\n"
printf "Чиссло пи с точностью до 9ого знака после запятой = %1.9f" $PI
printf "\n"
printf "Константа = \t%d\n" $DecCon
printf "%s %s \n" $mes1 $mes2
#Запись форматированной строки в переменную
Pif=$(printf "%1.10f" $PI)
echo $Pif
Msg=$(printf "%s %s \n" $mes1 $mes2)
echo $Msg; echo $Msg
exit 0
