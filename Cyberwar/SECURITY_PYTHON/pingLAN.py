#Utiliser object.__dict__ pour voir ses attributs
#Functions:
#sr()(layer 3 packets) ex: sr(IP(dst="www.google.com")/ICMP()/"payload")
#sr1()
#srp()(layer 2 packets)
#
#Example, DNS request: sr1(IP(dst="dns.addr.x.x")/UDP()/DNS(rd=1, qd=DNSQR(qname="www.site.org")))
#		'rd' stands for 'recursion desired'

from scapy.all import *
import re

gateway = sr1(IP(dst="www.google.com", ttl=0)/ICMP()).src
regex_ip = re.compile("([0-9]+)\.([0-9]+)\.([0-9]+)\.([0-9]+)")
ip_split = regex_ip.search(gateway)
ip_lan = ip_split.group(1)+ "." + ip_split.group(2) + "." + ip_split.group(3) + "."
print ip_lan

ip_range = 256
for unit in range(ip_range):
	addr = ip_lan + str(unit)
	print "PING OF: " + addr
	sr1(IP(dst=addr, ttl=2)/ICMP(), timeout=1)
