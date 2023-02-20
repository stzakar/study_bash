#!/bin/bash
echo; echo
echo "\v\v\v\v"
echo "============"
echo "Вертикальная табуляция"
echo -e "\v\v\v\v"
echo "============"
echo "Кавычки"
echo -e "\042"
echo "============"
echo; echo "Новая строка и звонок"
wait
echo $'\n'
echo $'\a'
echo "============"
quote=$'\042'
echo "$quote Эта часть текста в ковычках,$quote а эта - НЕТ!"
echo "============"
triple_under_line=$'\137\137\137'
echo "$triple_under_lineПОДЧЁРКНУТО$triple_under_line"
ABC=$'\101\102\103\010'
echo $ABC
echo; echo
echo "============"
echo "============"

