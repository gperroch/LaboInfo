#!/bin/bash

function dis {
	echo "[`date "+%Y/%m/%d - %H:%M:%S"`] [`oko $2`] $1"
}

function oko {
	if [ $1 -eq 1 ]
	then
		echo "\033[32mOK\033[0m"
	elif [ $1 -eq 2 ]
	then
		echo "\033[33m--\033[0m"
	else
		echo "\033[31mKO\033[0m"
	fi
}

function section {
	local COLS I
	COLS=`tput cols`
	I=0
	while [[ $I -lt $COLS ]]
	do
		printf "-"
		I=$(( $I + 1 ))
	done
}
