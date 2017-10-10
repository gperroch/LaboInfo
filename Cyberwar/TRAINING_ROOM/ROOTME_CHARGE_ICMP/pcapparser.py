from scapy.all import *
import sys

i = 0
file_to_read = sys.argv[1]
stream1 = rdpcap(file_to_read)
stream2 = rdpcap(file_to_read)
for pkt in stream1 :
	raw = pkt[Raw]
	loa = str(raw.load)
	print loa + "-------->" + str(i) + "<---------"
	i += 1

i = 0
for pkt in stream2 :
	if pkt[ICMP].type == 8 :
		raw = pkt[Raw]
		hexdump(raw.load)
		print("%d -------------------------------------------------------") % i
		i += 1
