from scapy.all import *
from multiprocessing import Process
from uuid import getnode as get_mac

i = 0

##############################################################################################################
def packaging(str_):
	packet = Ether()/IP()/ICMP()/Raw()
	packet[Raw].load = str_
	return packet
##############################################################################################################
def listener():
	global i
	fil = "icmp and icmp[icmptype] == icmp-echo and ether dst " + getmac()
	print "Sniff filter : " + fil
	while True:
		#sniffed = sniff(filter="icmp and icmp[icmptype] == icmp-echo and dst net 172.16.91.253", count=1)
		sniffed = sniff(filter=fil, count=1)
		try:
			print str(i) + "Received : " + str(sniffed[0][Raw].load)
		except:
			continue
		i += 1
##############################################################################################################
def getmac():
	mac = get_mac()
	mac = hex(mac)
	mac = mac[2:14]
	j = 0
	res = ""
	while j <= 8:
		res = res + mac[j:j+2] + ":"
		j += 2
	res = res + mac[j:j+2]
	return res
##############################################################################################################
##execution bloc#############################################################################################
print getmac()
target = sys.argv[1]
_str = ""
p = Process(target=listener)
p.start()
while _str != "exit" :
	_str = str(raw_input())
	pkt = packaging(_str)
	pkt[IP].src = str(target)
	print "Sent to " + pkt[IP].src
#	print pkt[Raw].load
p.terminate()
print "EXIT"
##############################################################################################################


