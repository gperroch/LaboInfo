#!/bin/bash

INTERFACES=("eth0" "wlan0")
SIZE=${#INTERFACES[@]}
COUNT=0

while [[ $COUNT < $SIZE ]]
do
	sudo ifconfig ${INTERFACES[$COUNT]} down
	COUNT=$(( $COUNT + 1 ))
done
