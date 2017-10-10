#!/bin/bash
#Shut down all the network interfaces. Use it in case of danger, not just for fun.
echo "\033[5;31mISOLATION STARTED\033[0m"

ifconfig -a | grep -E "mtu|status: " |
while read -r line
do
	NAME="$(echo $line | grep "mtu" | cut -d ":" -f 1)"
	if [ $NAME != "" ]
	then
		echo "\033[31m______ALERT______ $NAME DOWN"
		sudo ifconfig $NAME down
	fi
done
echo "\033[33m ALL INTERFACES ARE DOWN. UP THEM MANUALLY.\033[0m"
