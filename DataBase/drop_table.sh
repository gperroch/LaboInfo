#!/bin/bash

DIRECTORY="DROP_TABLE"

if [ $# -eq 1 ];
then
	NBR=`cat $DIRECTORY/files_list.txt |wc -l`
	COUNT=1
	while [ "$COUNT" -le "$NBR" ];
	do
		FILE=`sed -n "${COUNT}p" $DIRECTORY/files_list.txt`
		echo "mysql ${1} < $DIRECTORY/$FILE"
		mysql ${1} < $DIRECTORY/$FILE
		COUNT=$(( $COUNT + 1 ))
	done;
fi;
