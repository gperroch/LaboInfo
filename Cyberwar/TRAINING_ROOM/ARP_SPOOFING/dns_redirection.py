import sys
import socket
import binascii
import scapy.all

nmbr = 0
while True:
	request = scapy.all.sniff(1, filter="ether src 0c:4d:e9:c0:57:b0 or ether src 00:24:d4:a2:18:c8")

	if request[0][0].type == 0x800:
		if request[0][1].proto == 0x11:
			print "-----------------------------\nUDP Received:"
#			print request[0][1].proto
			request.show()
			if request[0].src == '0c:4d:e9:c0:57:b0':
				request[0].dst = '00:24:d4:a2:18:c8'
				request[0].src = '98:4b:e1:8f:c7:b7'

			if request[0].src == '00:24:d4:a2:18:c8':
				request[0].dst = '0c:4d:e9:c0:57:b0'
				request[0].src = '98:4b:e1:8f:c7:b7'

			request[0][1].chksum = None
			request[0][2].chksum = None
	
			reply1,reply2 = scapy.all.srp(request[0])
			print "\nReply:"
			reply1.show()
#			reply1[0][1].show()

			##Creation d'un nouveau packet.

			pkt = (scapy.all.Ether()/scapy.all.IP()/scapy.all.UDP()/scapy.all.DNS())

			if reply1[0][1].src == '0c:4d:e9:c0:57:b0':
				ptk.dst = '00:24:d4:a2:18:c8'
				pkt.src = '98:4b:e1:8f:c7:b7'
			if reply1[0][1].src == '00:24:d4:a2:18:c8':
				pkt.dst = '0c:4d:e9:c0:57:b0'
				pkt.src = '98:4b:e1:8f:c7:b7'
			pkt[0].type = 0x800
			pkt[1] = reply1[0][1][1]
			pkt[2] = reply1[0][1][2]

			pkt[1].chksum = None
			pkt[2].chksum = None

			scapy.all.sendp(pkt)
			print "\nSent as reply:"
			pkt.show()
