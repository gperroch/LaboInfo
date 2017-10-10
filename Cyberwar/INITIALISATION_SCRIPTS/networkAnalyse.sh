#!/bin/bash
#nmap, traceroute, metasploit
#https://www.sans.org/reading-room/whitepapers/tools/tools-tools-tools-406
##Script d'analyse réseau
# 1. Mapping:
#		Type de réseau (architecture)
#		Appareils du sous-réseau
#			Informations (type de connexion, type de machine, services, ports ouverts)
# 2. Trafic en temps réel
source INITIALISATION_SCRIPTS/utils.sh

printf "networkAnalyse"
loader 3
printf "\n"
export SCRIPT_RES=1
exit
#######################################################

python SECURITY_PYTHON/sniffer.py >& /dev/ttys000

nmap -sS 192.168.0.0/24 #scan TCP syn
nmap -sA 192.168.0.0/24 #scan TCP syn/ack
