#!/bin/bash
PS3='Выбери свой овощ: '
echo
select veg in "бобы" "лук" "морковь" "toamto"
do
	echo
	echo "Вы предпочтил $veg"
	echo
	break
done
