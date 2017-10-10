#!/bin/bash
source INITIALISATION_SCRIPTS/utils.sh

printf "interfacesOnOff"
loader 3
printf "\n"
SCRIPT_RES=1
exit


choice "$1 all network interfaces"

ifconfig -a | grep -E "mtu|status: " |
while read -r line
do
	NAME="$(echo $line | grep "mtu" | cut -d ":" -f 1)"
	if [[ $NAME != "" ]]
	then
		echo "INTERFACE: $NAME"
		sudo ifconfig $NAME $1
		ifconfig $NAME | grep "status"
	fi
done
