import sys
import socket
import binascii
import scapy.all

nmbr = 0
while True:
	pkttot = scapy.all.sniff(1, filter="src 192.168.0.19")
	pkt = pkttot[0]

	if str(pkt.src) == '0c:4d:e9:c0:57:b0':
		pkt.dst = '00:24:d4:a2:18:c8'
		if pkt.type == 0x800:
			del pkt[1].chksum
		if pkt.type != 0x806:
			scapy.all.sendp(pkt)
			print "Packet %d send from %s to %s" % (nmbr , str(pkt.src) , str(pkt.dst))
			pkttot.show()
			#pkt.show()
			nmbr += 1
			print "--------------------------------"
	
	if str(pkt.src) == '00:24:d4:a2:18:c8':
		pkt.dst = '0c:4d:e9:c0:57:b0'
		if pkt.type == 0x800:
			del pkt[1].chksum
		if pkt.type != 0x806:
			scapy.all.sendp(pkt)
			print "Packet %d send from %s to %s" % (nmbr , str(pkt.src) , str(pkt.dst))
			pkttot.show()
			#pkt.show()
			nmbr += 1
			print "--------------------------------"
