#!/bin/bash
PS3='Make your choce bro! =)$'
chose(){
select veg
do
	echo 
	echo "Your choce is $veg"
	echo
	break
done
}

chose tomato onion carrot radish
