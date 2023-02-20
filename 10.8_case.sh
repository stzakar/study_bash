#!/bin/bash
charl(){
echo "it is lower char"
}

charu(){
echo "it is upper char"
}

num(){
echo "it is number"
}

mark(){
echo "it is punctuation mark"
}

echo "press eny key"
echo "press \"x\" for exit"
key=""
while [ "$key" != x ]; do
	read key
	case "$key" in
		[a-z]	) charl;;
		[A-Z]	) charu;;
		[0-9]	) num;;
		*	) mark;;
	esac	
done
