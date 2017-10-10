#!/bin/bash
source INITIALISATION_SCRIPTS/utils.sh
SCRIPT_RES=0

tput cm 0 0
tput cd

SCRIPTS_PATH="INITIALISATION_SCRIPTS"
STEP=(2 2 2 2 2 2 2 2)
STEP1=(2 2 2 2)

#Factoriser cette partie
dis "Cyber-war preparation launched" 2
##############################################################################################################
procede "System isolation" ${STEP[0]} "$SCRIPTS_PATH/interfacesOnOff.sh"
STEP[0]=$SCRIPT_RES
##############################################################################################################
##############################################################################################################
##############################################################################################################
dis "System's integrity check START" ${STEP[1]}
##############################################################################################################
##############################################################################################################
##############################################################################################################
###Etape intégrité des données
procede "--- Disk analyse" ${STEP1[0]} "$SCRIPTS_PATH/diskAnalyze.sh"
STEP1[0]=$SCRIPT_RES
##############################################################################################################
procede "--- Disk repair" ${STEP1[1]} "$SCRIPTS_PATH/diskRepair.sh"
STEP1[1]=$SCRIPT_RES
##############################################################################################################
###Etape Backup
procede "--- Backup procedure" ${STEP1[2]} "$SCRIPTS_PATH/backupSaving.sh"
STEP1[2]=$SCRIPT_RES
##############################################################################################################
###Etape Sécurité
## A passer avant la procédure de backup, voire même avant l'analyse des disques
procede "--- Security check" ${STEP1[3]} "$SCRIPTS_PATH/securityCheck.sh"
STEP1[3]=$SCRIPT_RES
##############################################################################################################
STEP1="$(check_procedure SSTEP1[@])"
dis "System's integrity check END" ${STEP[1]}

procede "Démarrage procédures de surveillance" ${STEP[2]} "$SCRIPTS_PATH/securityBot.sh"
STEP[2]=$SCRIPT_RES

procede "Démarrage diagnostique réseau" ${STEP[3]} "$SCRIPTS_PATH/networkAnalyse.sh"
STEP[3]=$SCRIPT_RES

dis "Mise à disposition des interfaces réseau" ${STEP[4]}

procede "Lecture automatique des podcasts et musiques" ${STEP[5]} "$SCRIPTS_PATH/audioBot.sh" # > /dev/null &
STEP[5]=$SCRIPT_RES

dis "Ouverture des sites web cruciaux" ${STEP[6]}

dis "QUESTIONNAIRE DE MAINTIENT OPERATIONNEL" 2

procede "Rapport des évènements passés" ${STEP[7]} "$SCRIPTS_PATH/dailyReport.sh"
STEP[7]=$SCRIPT_RES

#Défragmenter le disque dur
#Créer un disque système de secours et le conserver en lieu sûr (clé bootable ou dd externe)
#Mettre à jour les logiciels et le système d'exploitation en prêtant une attention particulière aux correctifs de sécurité
