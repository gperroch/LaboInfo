import sys
import socket
import binascii
import scapy.all

nmbr = 0
while True:
	request = scapy.all.sniff(1, filter="icmp and (host 192.168.0.19 or host 192.168.0.254)")

	if request[0][0].type == 0x800:
		if request[0][1].proto == 0x1:
			print "-----------------------------\nReceived:"
			print request[0][1].proto
			request[0].show()
			if request[0].src == '0c:4d:e9:c0:57:b0':
				request[0].dst = '00:24:d4:a2:18:c8'
				request[0].src = '98:4b:e1:8f:c7:b7'

			if request[0].src == '00:24:d4:a2:18:c8':
				request[0].dst = '0c:4d:e9:c0:57:b0'
				request[0].src = '98:4b:e1:8f:c7:b7'

			request[0][1].chksum = None
			request[0][2].chksum = None
	
			print "\nSent:"
#			request[0].show()

			reply1,reply2 = scapy.all.srp(request[0])
			print "\nReply:"
#			reply1.show()
#			reply1[0][1].show()

			if reply1[0][1].src == '0c:4d:e9:c0:57:b0':
				reply1[0][1].dst = '00:24:d4:a2:18:c8'
				reply1[0][1].src = '98:4b:e1:8f:c7:b7'

			if reply1[0][1].src == '00:24:d4:a2:18:c8':
				reply1[0][1].dst = '0c:4d:e9:c0:57:b0'
				reply1[0][1].src = '98:4b:e1:8f:c7:b7'

			reply1[0][1][1].chksum = None
			reply1[0][1][2].chksum = None

			scapy.all.sendp(reply1[0][1])
			print "\nSent as reply:"
#			reply1[0][1].show()
