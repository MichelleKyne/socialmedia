#!/bin/bash

user="$1"

#V.sh
if [ $# -ne 1 ]; then
	echo "Usage $0 mutex-name"
	exit 1
else	
	rm "$user-key" "$user-key-lock"
	exit 0
fi

