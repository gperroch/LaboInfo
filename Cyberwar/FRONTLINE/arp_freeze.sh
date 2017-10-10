#Figer la table arp dans son état actuel (la rendre statique)
#	arp_freeze start
if [ "$1" = "start" ]
then
	echo 'start ok'
	arp -a |grep -oE '((1?[0-9][0-9]?|2[0-4][0-9]|25[0-5])\.){3}(1?[0-9][0-9]?|2[0-4][0-9]|25[0-5])'
	#Récupérer les couples ip/mac et les enregistrer en static dans la table.
	#Empêcher toute nouvelle modification de la table depuis le protocole arp.
elif [ "$1" = "stop" ]
then
	echo 'stop ok'
fi
#Rendre la table à nouveau dynamique, tout en laissant les éléments présents.
#	arp_freeze stop
