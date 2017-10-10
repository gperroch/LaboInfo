#!/bin/bash
source INITIALISATION_SCRIPTS/utils.sh

printf "securityBot"
loader 3
printf "\n"
export SCRIPT_RES=1
exit


printf "Lancement du bot de sécurité "
loader 3
SCRIPT_RES=1
printf "\nBot de sécurité actif\n"

################################################################################

#Connections protection:
#White-list d'addresse IP autorisées pour les connexions (protège des scans TCP,
#tout packet ne provenant pas de ces sites et ignoré). Un fichier (XML?)
#contient la liste des sites autorisés (ex: www.google.com), qui est traduite
#via DNS en IP et la liste des IP autorisées est maintenue à jour régulièrement.
