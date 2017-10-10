#!/bin/bash
source INITIALISATION_SCRIPTS/utils.sh

printf "audioBot "
loader 3
printf "\n"
export SCRIPT_RES=1
#exit
CONFIG=INITIALISATION_SCRIPTS/config.xml


FOLDER_COUNT=1
FOLDER_NUMBER="$(xmllint --xpath "count(/audio/folder[@read='1'])" $CONFIG)"

TRACK_NUMBER=0

export SCRIPT_RES=1
#FOLDER LOOP
while [[ $FOLDER_COUNT -le $FOLDER_NUMBER ]]
do
	FOLDER="$(xmllint --xpath "string(/audio/folder[@read='1'][position()='$FOLDER_COUNT']/@path)" $CONFIG)"
	#TRACK LOOP
	TRACK_COUNT=1
	TRACK_NUMBER="$(xmllint --xpath "count(/audio/folder[@path='$FOLDER']/track[@read='1'])" $CONFIG)"
	while [[ $TRACK_COUNT -le $TRACK_NUMBER ]]
	do
		TRACK="$(xmllint --xpath "string(/audio/folder[@path='$FOLDER']/track[@read='1'][position()='$TRACK_COUNT'])" $CONFIG)"
		FILE="$FOLDER/$TRACK"
		echo "FILE: $FILE"
		afplay "$FILE"
		TRACK_COUNT=$(( $TRACK_COUNT + 1 ))
	done
	FOLDER_COUNT=$(( $FOLDER_COUNT + 1 ))
done


#parsing de $CONFIG pour trouver les fichiers à lire (xmllint)
#lecture avec afplay
#terminer afplay avec killall afplay
