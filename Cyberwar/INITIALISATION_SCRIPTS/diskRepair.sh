#!/bin/bash
source INITIALISATION_SCRIPTS/utils.sh

printf "diskRepair"
loader 3
printf "\n"
export SCRIPT_RES=1
exit

choice "repair disk1"
#diskutil repairVolume disk1
