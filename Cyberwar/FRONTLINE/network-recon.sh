#!/bin/bash
source utils.sh
#-sn #no scan
#nmap -sL #scan list
#nmap -PA #TCP ACK ping
#nmap -PS #TCP SYN ping
#nmap -PU #UDP ping
#nmap -Pn #no ping
#nmap --disable-arp-ping
#nmap -PY #SCTP INIT ping
#nmap -PE -PP -PM #Ping types
#nmap -PO #IP protocoles ping
#nmap -PR #ARP ping
#nmap --traceroute
#nmap -n #No DNS resolution
#nmap -R #DNS resolution for all targets
#nmap --system-dns
#nmap --dns-servers

#-iL <inputfilename>
#-iR <host number> #Choose random targets
#--exclude <host1>[,<host2>[,...]]
#--exclude-file <exclude_file>

#Verbosity levels :	-4 No output
#			-3 like -4 but displays fatal errors
#			-2 like -3 but displays warnings and recoverable errors
#			-1 traditionnal runtime info but doesn't display sent and received packets
#			0 default
#			1 like 0 and displays detailed information about timing, flags, protocol details, etc.
#			2 like 1 and displays very detailed information about sent and received packets and other interesting information.
#			3 like 2 and but also displays the raw hexadecimal dump of sent and received packets.
#			4+ like 3

dis "RECUPERATION DE L'IP WIFI" 2
IP="`ifconfig en1 | grep broadcast | grep -o \"[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\" | sed -n \"1p\"`"
dis "RECUPERATION DE L'IP BROADCAST WIFI" 2
BROADCAST="`ifconfig en1 | grep broadcast | grep -o \"[0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\" | sed -n \"2p\"`"
dis "RECUPERATION DES IPs DANS LA TABLE ARP" 2
ARP_TABLE_IPS="`arp -la | cut -d \" \" -f 1 | grep -v Neighbor | grep -v $IP`"
TARGETS=0

dis "Enter the target(s)..." 2
#read TARGETS
TARGETS="$BROADCAST/24"
dis "Your IP : $IP" 2
dis "Recon on : $TARGETS" 2
#nmap -sL -R -v $TARGETS
#nmap -PR -v $TARGETS
#nmap -PS -PM -R -v $TARGETS

section
dis "WIFI SCAN" 2
section
/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -s
section
#################################################################################################################################################################################
dis "-PE : ICMP ping with echo request" 2
dis "Press any key to begin" 2
read -s -n 1 key
section
sudo nmap -sn -R -PE $TARGETS
section
#################################################################################################################################################################################
dis "-PP : ICMP ping with timestamp request" 2
dis "Press any key to begin" 2
read -s -n 1 key
section
sudo nmap -sn -R -PP $TARGETS
section
#################################################################################################################################################################################
dis "-PM : ICMP ping with mask address request" 2
dis "Press any key to begin" 2
read -s -n 1 key
section
sudo nmap -sn -R -PM $TARGETS
section
#################################################################################################################################################################################
dis "TCP SYN ping (blocked by stateless firewalls, droping all incoming connection by default)" 2
dis "Press any key to begin" 2
read -s -n 1 key
section
nmap -sn -R -PS $TARGETS
section
#################################################################################################################################################################################
dis "TCP ACK ping (blocked by statefull firewall, droping unexpected packest)" 2
dis "Press any key to begin" 2
read -s -n 1 key
section
nmap -sn -R -PA $TARGETS
section
#################################################################################################################################################################################
dis "UDP ping" 2
dis "Press any key to begin" 2
read -s -n 1 key
section
nmap -sn -R -PA $TARGETS
section




#################################################################################################################################################################################
#dis "" 2
#dis "Press any key to begin" 2
#read -s -n 1 key
#section
#nmap -P? -sn --data-length 17 --dns-servers ?? $TARGETS
#section






























