#!/bin/bash
min=400
max=500
num=0 #инициализация воизбижания ошибок
while [ "$num" -le "$min" ]
do
	num=$RANDOM
	let "num %= $max"
done
echo
echo "Generation random number min= $min max= $max"
echo $num
echo
echo "Generate fals or true =)"
del=2          					#делитель делающий возможным получить лишь 2 значения 1 и 2
point=$RANDOM  					#оценивающийся щетчик
type=1         					#переменная определяющая значение соответствующее значению true
let "point %= $del"
if [ "$point" -eq "$type" ]; then
echo "True"
else
echo "False"
fi
echo

faces=7		#деление на 7 даёт диапазон от 0 до 6
face1=0
face2=0
zer=0
#throw first cube
while [ "$face1" -eq "$zer"  ]; do
#	face1=$RANDOM
	let "face1 = $RANDOM % $faces"
done
#throw second cube
while [ "$face2" -eq "$zer"  ]; do
	let "face2 = $RANDOM  % $faces"
done
echo "Face of the first cube is $face1"
echo "Face of the second cube is $face2"
let "sum = $face1 + $face2"
echo "Summ of the Faces cubes is : $sum"

echo "============card-deck================"

suit="Бубей
Червей
Треф
Пик"
card="2ка
3ка
4ка
5ка
6ка
7ка
8ка
9ка
10ка
Валет
Дама
Король
Туз"
Suits=($suit)
Cards=($card)
suit_amount=${#Suits[*]}
card_amount=${#Cards[*]}
echo -n ${Cards[(($RANDOM%$card_amount))]}
echo -n " "
echo ${Suits[(($RANDOM%$suit_amount))]}

