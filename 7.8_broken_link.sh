#!/bin/bash 

BD_DIR=60
NOT_FOLDER=60
bad_dir="BAD DIR!!"

[ $# -eq 0 ] && dir="$(pwd)" || dir=$@

#end_of_string=${1: -1}
#if [ "$end_of_string" == '/' ] 
#then
#        dir=${1%'/'}
#fi
dir=${1%/}

if [[ ! -e "$dir" && ! -d "$dir" ]]; then
	 echo $bad_dir && exit $BD_DIR
fi

linkck () { 
	for link in "$1"/*; do
		[[ -h "$link" &&  ! -e "$link" ]] && echo "Link is boken $link"
		[ -d "$link" ] && linkck "$link"
		# -h проверяет символические ссылки -d каталоги
	done
}

for directory in "$dir"; do
	if [ -d "$directory" ]; then
		linkck "$directory"
	else
		echo "$directory is not a floder"
		echo "use it: $0 dir1 \[ dir2 \] \[ dir3 \]"
		exit $NOT_FOLDER
	fi
done
exit 0
