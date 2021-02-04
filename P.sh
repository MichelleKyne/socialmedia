#!/bin/bash

#P.sh

user="$1"

if [ $# -ne 1 ]; then
	echo "Usage $0 mutex-name"
	exit 1
else
	touch "$user-key"
	while ! ln "$user-key" "$user-key-lock" 2>/dev/null; do
		sleep 1
	done
	exit 0
fi
