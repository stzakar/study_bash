#!/bin/bash
var1=abcd12V312423545abc8856
pattern1=a*c #* - любое кол во символов между a и c.
pattern2=a*6 #* - любое кол во символов между a и c.
echo "var1 = ${var1}" #пример вывода переменной 
echo "Count of simblos is a ${#var1}" #подсчет кол-ва символов
echo "pattern1 = ${pattern1}"
echo '${var1#$pattern1}= '"${var1#$pattern1}" # Наименьшая подстановка удалятся символы из pattern1 (счет с начала)
echo '${var1##$pattern1}= '"${var1##$pattern1}" #Удалятся символы из первой (abcd) последовтельности до второй последовательности (abc) включая её
echo '${var1%$pattern1}= '"${var1%$pattern2}" # Наименьшая подстановка удалятся символы из pattern2 (счет с конца) 
