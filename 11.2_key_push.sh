#!/bin/bash
#What is key push
#Author Sternin K.

alf(){
echo "key has been presin $1"
echo
}

arruppk='\[A'
while [ "$key" != "x" ]; do
echo "Push the differnt three buttons"
read -n3 -t 2 key
echo
	case "$key" in
		*\[A	) echo " arrow UP has been pushin";;
		*\[B	) echo " arrow DOWN has been pushin";;
		*\[D	) echo " arrow LEFT has been pushin";;
		*\[C	) echo " arrow RIGHT has been pushin";;
		*\[3	) echo " key DELETE has been pushin";;
		*\[2	) echo " key INSERT has been pushin";;
		*\[H	) echo " key HOME has been pushin";;
		*\[F	) echo " key END has been pushin";;
		*\[5	) echo " key PageUp has been pushin";;
		*\[6	) echo " key PageDown has been pushin";;
		[a-zA-Z]	) alf $key;;
	esac
done
