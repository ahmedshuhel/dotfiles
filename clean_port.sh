#!/bin/bash

killport()
{
	pids=`lsof -ti:$@`

	if [ ! "$pids" ]; then
		echo "No proccesses on port $@ found to kill"
	else
		echo "Killing proccesses $pids found to kill"
		# kill -9 $pids
	fi
}

for i in 80 443 3000 3001 3002 4000 4100 5000 5010 7005 7847 8080 8443 8081 7070 9200 9201 4502 4503 9230 9235 9229 27017 35729
do
    killport $i
done


