#!/bin/bash

#post.sh usuage = ./post.sh receiver sender message

if [ $# -ne 3 ] ; then
        echo "Error: parameters problem"
	exit 1
fi

dir_name=$(dirname $0)
receiver="$1"
dir_receiver="$dir_name/$receiver"
sender="$2"
dir_sender="$dir_name/$sender"
message="$3"

if ! [ -d "$dir_receiver" ] ; then
        echo "Error: Receiver does not exist"
	exit 2
fi

if ! [ -d "$dir_sender" ] ; then
        echo "Error: Sender does not exist"
	exit 3
fi

if ! grep -q "$sender" "$dir_receiver/friends" ;  then
        echo "Error: Sender is not a friend of receiver"
	exit 4
else
        ./P.sh "$receiver"
	echo "$sender: $message" >> "$dir_receiver/wall"
	./V.sh "$receiver"
        echo "OK: Message posted to wall"
	exit 5
fi

