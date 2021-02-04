#!/bin/bash

# Usage = ./client.sh $clientId $req [args]

if [ $# -lt 2 ] ; then
        echo "Error: parameters problem"
        exit 1
fi

mkfifo $1.pipe
request=$( echo $@ | cut -d' ' -f1- ) 
echo $request > serverpipe
cat $1.pipe
rm $1.pipe
