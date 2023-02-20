#!/bin/bash
var1=abcd12345abc6789
pattern1=a*c #любые символы между "a" и "с"
pattern2=b*9
echo
echo "var1= ${var1}"
echo "pattern1= $pattern1"
echo '${var1#$pattern1} =' "${var1#$pattern1}"
echo '${var1##$pattern1} =' "${var1##$pattern1}"
echo "pattern2= $pattern2"
echo '${var1%$pattern2} =' "${var1%$pattern2}"
echo '${var1%%$pattern2} =' "${var1%%$pattern2}"
echo "=========================================="
echo ${0%sh} #удаление происходит по конкретному шаблону! с которого слово либо начинается либо им заканчивается! не выдергивается из середины как в операциях со строками
var2=abcd-12345-defg
echo "var2= $var2"
echo '#'
echo ${var2#*-*}
echo ${var2##*-*}
echo '%'
echo ${var2%*-*}
echo ${var2%%*-*}
echo "=========================================="
patch="/etc/style/date/logo.dow.moni"
echo "$patch"
echo
echo "====Delete_route_to_paatch===="
echo ${patch##/*/}
echo $(basename "$patch")
echo ${patch##*/}
echo
echo "====Delete_name_of_file===="
echo ${patch%/*.*}
echo $(dirname $patch)
echo
echo "====del 11 simbols |  next string 11 simbols del +4 simbols leaves===="
echo ${patch:11}
echo ${patch:11:4}
echo
echo "========================================="
echo
var3=a1b2c3DSVb1b2b3
echo "var3= $var3"
echo ${var3/#a1b2c3/START_MOVE_}
echo ${var3/%b1b2b3/_END_MOVE}
echo
echo "========================================"
echo
abc11=75
abc12=
abcDCac=M
echo ${!abc*}
echo ${!abc@}
