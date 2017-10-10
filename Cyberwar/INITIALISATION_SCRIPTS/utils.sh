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

function choice {
	KEY=""
	while [[ $KEY != "y" && $KEY != "n" ]]
	do
		printf "\r\033[0K"
		printf "Do you want to $1 ? (y/n) : "
		read -n 1 KEY
	done
	printf "\n"
	if [[ $KEY = "n" ]]
	then
		SCRIPT_RES=0
		exit
	fi
}

function loader {
	local LIMIT I
	I=0
	LIMIT=$1
while [[ $I < $LIMIT ]]
do
	printf "|"
	sleep 0.6
	tput le
	printf "/"
	sleep 0.6
	tput le
	printf "-"
	sleep 0.6
	tput le
	printf "\\"
	sleep 0.6
	tput le
	I=$(( $I + 1))
done
printf " "
}

function check_procedure {
	local I ARR SIZE RET
	ARR=("${!1}")
	SIZE=${#ARR[@]}
	I=0
	RET=1
	while [ "$I" -lt "$SIZE" ]
	do
		if [ ${ARR[$I]} -eq 0 ]
		then
			RET=0
		fi
		I=$(( $I + 1 ))
	done
	echo "RET = $RET" > log
	echo "$RET"
}

## Paramètres:
#$1 Message à afficher
#$2 Variable d'état
#$3 Script à exécuter
function procede {
	local MESSAGE STATE SCRIPT
	MESSAGE=$1
	STATE=$2
	SCRIPT=$3

	tput sc
	dis "$MESSAGE" $STATE
		sh $SCRIPT #Le script set la variable d'environnement SCRIPT_RES (1=success,0=fail)
		STATE=$SCRIPT_RES
	tput rc
	tput cd
	dis "$MESSAGE" $STATE
}
