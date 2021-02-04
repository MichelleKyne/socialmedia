#!/bin/bash

#create.sh usuage = ./create.sh user

if [ $# -ne 1 ] ; then
        echo "Error: parameters problem"
	exit 1
fi

dir_name=$(dirname $0)
user="$1"

if ! [ -d "$dir_name/$user" ] ; then
	./P.sh "$user"
	mkdir "$dir_name/$user"
	./V.sh "$user"
	echo "OK: user created"
	touch $dir_name/"$user"/friends
	touch $dir_name/"$user"/wall
else
	echo "Error: user already exists"
	exit 2
fi
