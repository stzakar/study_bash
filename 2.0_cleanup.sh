#!/bin/bash
#cleanup

LOG_DIR=/var/log
ROOT_UID=0
LINES=50
ER_XCD=66 #Невозможность семны каталога
ER_NOTROOT=67

if [ "$UID" -ne "$ROOT_UID" ]
then
	echo "Need be root of system ;)"
	exit $ER_NOTROOT
	echo $?
fi

# Проверка кол-ва аргументов перед скриптом 
# | -eq - = | -ne - != | -gt - > | -ge - >= | -lt - < | -le - <= | для [] скобок
# для > < = == >= <= нужна такая форма записи (( "$a" > "$b" ))

if [ $# -gt 1 ]
then
	echo "no more 1 arg" 
	exit 0
fi

# Далее проверка надичия аргумента в командной строке

if [ -n "$1"  ]
then
	lines=$1
else
	lines=$LINES
fi
echo "$lines will be save"

# Проверка открытия каталога

cd $LOG_DIR 2> /dev/null

if [ "$PWD" != "$LOG_DIR" ]  # или if [ `pwd` != "$LOG_DIR" ] !! Не работает в случаи пробелов в названии каталога
then
	echo "cant open log dir $LOG_DIR"
	exit $ER_XCD
fi

tail -$lines messages > mesg.tmp 
STATUS=$?
if [ "$STATUS" -eq 0 ]
then
mv mesg.tmp messages
echo "the log file is clean"
exit 0
else
	echo "$STATUS"
fi

