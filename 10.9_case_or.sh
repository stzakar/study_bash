#!/bin/bash
pers=""
ivan(){
	echo "Phone (812)777-77-01"
	echo "SPB"
}
daneil(){
	echo "Phone (812)777-77-02"
	echo "MSK"
}
konstantin(){
	echo "no information about persone"
	echo "no information about location"
}
vasiliy(){
	echo "Phone (812)777-77-03"
	echo "EKT"
}
menu(){
	echo "====List of person===="
        echo
        echo "Chose person for information"
        echo
        echo "[I]van Petrov"
        echo "[D]aneil Zamov"
        echo "[K]onstantin Smirnov"
        echo "[V]asiliy Makarov"
	echo "enter X fore exit"
	echo 
}
while [ "$pers" != X ]; do
	menu
	read pers
	case "$pers" in
		"I" | "i"	) ivan;;
		"D" | "d" 	) daneil;;
		"K" | "k" 	) konstantin;;
		"V" | "v" 	) vasiliy;;
		* ) echo "no person for this ";;
	esac	

done

