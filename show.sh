#!/bin/bash

#show.sh usuage = ./show.sh user

if [ $# -ne 1 ] ; then
        echo "Error: parameters problem"
	exit 1
fi

dir_name=$(dirname $0)
user="$1"

if ! [ -d "$dir_name/$user" ] ; then
        echo "Error: user does not exist"
        exit 2
else 
	echo "wallStart"
	cat "$dir_name/$user/wall"
	echo "wallEnd"
fi
