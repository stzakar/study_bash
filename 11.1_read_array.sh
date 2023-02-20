#!/bin/bash
declare -a colors
printf "%s\n" "Please enter min 3 your favorite colors"
read -a colors
echo 
count_colors=${#colors[@]}
echo -e  "Count of colors : $count_colors \n"
index=0
while [ "$index" -lt "$count_colors" ]; do
	echo ${colors[$index]}
	(( index += 1  ))
done
#более элегантный способ вывода все элементов массива в строчку ${collors[*]} даст тот же результат
echo 
echo  ${colors[@]}
unset colors[1] #удалится 2й элемент массива
echo ${colors[*]}
unset $colors #опустошить весь массив
exit 0
