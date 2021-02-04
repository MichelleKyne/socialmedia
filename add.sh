#!/bin/bash

#add.sh usuage = ./add.sh user friend

if [ $# -ne 2 ] ; then
        echo "Error: parameters problem"
	exit 1
fi

dir_name=$(dirname $0)
dir_user=$dir_name/"$1"
friend="$2"
dir_friend=$dir_name/"$2"

if ! [ -d "$dir_user" ] ; then
        echo "Error: user does not exist"
	exit 2
elif ! [ -d "$dir_friend" ] ; then
        echo "Error: friend does not exist"
	exit 3
elif grep -q "$friend" "$dir_user/friends" ;  then
	echo "Error: user already friends with this user"
	exit 4
else
	./P.sh "$dir_user"
	echo "$friend" >> "$dir_user/friends"
	./V.sh "$dir_user"
	echo "OK: friend added"
	exit 5
fi
