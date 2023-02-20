#!/bin/bash
masex()										#Обмен местами элементов массива
{
	local temp=${Cou[$1]}
	Cou[$1]=${Cou[$2]}
	Cou[$2]=$temp
}
declare -a Cou									#объявление массива! не обязательно так как явно объявляется ниже
Cou=(Нидерланды Украина Заир Турция Россия Йемен Сирия Бразилия \
Аргентина Никарагуа Япония Мексика Венесуэла Греция Англия Занаду Катар \
Катар Лихтенштейн Венгрия США Литва Латвия Украина Казахстан Азербайджан)

clear 

echo "0: ${Cou[*]}" 								#Список элементов не сортированного массива
num_of_elem=${#Cou[@]}								#Подсчет количества элементов массива
echo 
echo "Count Countries in massive is: $num_of_elem"
let "comp = $num_of_elem - 1"
#echo $comp

count=1 									#Номер прохода
while [ "$comp" -gt 0 ]
do
	index=0 								#сброс индекса перед проходом
	while [ "$index" -lt "$comp" ]
	do
		if [[ ${Cou[$index]} > ${Cou[$(expr $index + 1)]} ]] 
		then
			masex $index $(expr $index + 1)
		fi
		let "index += 1"
	done
	let "comp -= 1"								#так как самый тяжелый внизу то на каждом последующем -1 сравнение
	echo
	echo "$count: ${Cou[@]}"
	echo
	let "count += 1"
done
exit 0
