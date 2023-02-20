#!/bin/bash
echo "Enter the user name"
read username
if [[ ${username?} ]]
then
	echo "user name is exists"
else
	echo "user name is not exists!!!"
fi
