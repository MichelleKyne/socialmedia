#!/bin/bash

if [ $# -ne 0 ] ; then
        echo "Error: parameters problem"
        exit 1
fi
 
while true; do
	mkfifo serverpipe
	read input < serverpipe
	# echo $input
	clientid=$( echo $input | cut -d' ' -f1 )
	script=$( echo $input | cut -d' ' -f2 )
	if [ $(echo $input | grep -o " " | wc -l) -lt 4 ] ; then
		arguments=$( echo $input | cut -d' ' -f3- )
        else
		arguments=$( echo $input | cut -d' ' -f3,4 )
		message=$( echo $input | cut -d' ' -f5- )
	fi
	dir_name=`dirname $0` 
	case "$script" in
            create)
		$dir_name/$script.sh $arguments > $clientid.pipe 	
		rm serverpipe
		;;
	    add)
		$dir_name/$script.sh $arguments > $clientid.pipe
		rm serverpipe
		;;
	    post)
		$dir_name/$script.sh $arguments "$message" > $clientid.pipe
		rm serverpipe
		;;
	    show)
		$dir_name/$script.sh $arguments > $clientid.pipe
		rm serverpipe
		;;
	    shutdown)
		echo "Bye!" > $clientid.pipe
		rm serverpipe
		exit 0
		;;
	    *)
		echo "Error: bad request"
		rm serverpipe
		exit 2
	esac
done
