#!/bin/bash

IP=$(ifconfig $1 | grep broadcast | grep -o "[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+" | sed -n "1p")
MASK=24
TARGET="$IP/$MASK"
MODE=3
#1: unique
#2: régulier
#3: random
TIMING=10
BUTTON=1
MULTIPROCESS=1
LAST=0
RANGE=$(echo $IP |cut -d "." -f 1-3)

echo "TARGET=$TARGET"
while [ $BUTTON -eq 1 ] && [ $MULTIPROCESS != 1 ]
do
#	nmap -Pn -sS -oA logScanRunner $TARGET
	echo "SCAN"
	BUTTON=0
	echo "MODE:$MODE"
	if [ $MODE -gt 1 ]
	then
		echo "START AN OTHER LOOP"
		if [ $MODE = 3 ]
		then
			TIMING=$(cat /dev/urandom | tr -dc '0-9' | fold -w 256 | head -n 1 | sed -e 's/^0*//' | head --bytes 2)
		fi
		echo "TIMING:$TIMING"
		sleep $TIMING
		BUTTON=1
	fi
done

while [ $LAST -lt 256 ] && [ $MULTIPROCESS -eq 1 ]
do
	nmap -Pn -sS -oG logScanRunner$LAST  $RANGE.$LAST &
	echo "Multiprocess $RANGE.$LAST"
	LAST=$(( $LAST + 1))
done
