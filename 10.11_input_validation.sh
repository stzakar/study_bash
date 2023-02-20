#!/bin/bash
SUCCESS=0
FAILURE=-1
#является ли первый символ строки буквой
firstchar () {
[ -z "$1" ] && return $FAILURE

case "$1" in
	[A-Za-z]*	) return $SUCCESS;; #Первый символ букава
	*		) return $FAILURE;;
esac
}
#состоит ли вся строка только из символов алфавита
allstringchar(){
[ $# -eq 1 ] || return $FAILURE

case $1 in
	*[!A-Za-z]*|""	) return $FAILURE;;  #если что то по мимо a-zA-Z или "" пустая строка
	*		) return $SUCCESS;;
esac
}
#состоит ли вся строка только из цифр
allstringnum() {
[ $# -eq 1 ] || return $FAILURE

case $1 in
	*[!0-9]*|""	) return $FAILURE;; #если есть что то помимо цифр
	*		) return $SUCCESS;;
esac
}

num_is_float(){
[ $# -eq 1 ] || return $FAILURE 

case "$1" in 
	*[!0-9.0-9]*|""	) return $FAILURE;;
	*		) return $SUCCESS;;
esac
}

chk_char(){
if firstchar "$@"; then
 echo "First simbol is a char"
 if allstringchar "$@"; then
	 echo "All simbols in string is a chars"
 else
	 echo "one or several simbols is not a char or string is equals ZERO"
 fi
else
	echo "First simbol is not a char"
fi
}

chk_num(){
if allstringnum "$@"; then
	echo "String contains only numbers [0-9]"
else
	echo "Strin contains NOT only numbers"
fi
}

chk_float(){
if num_is_float "$@"; then
	echo "The num is a float num"
else
	echo "The num is not a float num"
fi
}
chk_char $@
chk_num $@
chk_float $@
