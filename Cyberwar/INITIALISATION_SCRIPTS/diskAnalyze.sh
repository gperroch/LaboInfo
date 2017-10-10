#!/bin/bash
source INITIALISATION_SCRIPTS/utils.sh

printf "diskAnalyze"
loader 3
printf "\n"
export SCRIPT_RES=1
exit


choice "verify the volume disk1's integrity"
diskutil verifyVolume disk1 > log &
