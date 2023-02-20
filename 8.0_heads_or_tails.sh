#!/bin/bash
RANDOM=$$ 

facest=2	#стороны монеты
MAXT=1000	#количество бросков
throw=0		#щетчик бросков
head=0		#орел
taill=0		#решка 

print_result()
{
	echo "___________________"
	echo "Орел выпал: $head раз"
	echo
	echo "Решка выпала: $taill раз"
}

result_count()
{
	case $1 in
		0) let "head += 1";;
		1) let "taill +=1";;
	esac
}

while [ "$throw" -lt "$MAXT"  ]
do
	let "try = RANDOM % $facest"
	result_count $try
	let "throw += 1"
done

print_result
