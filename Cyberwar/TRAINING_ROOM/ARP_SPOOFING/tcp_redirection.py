import sys
import socket
import binascii
import scapy.all

nmbr = 0
while True:
	pkt = scapy.all.sniff(1)

	if pkt[0][0].type == 0x800:
		if pkt[0][1].proto == 0x6 and (pkt[0][1].src == '192.168.0.19' or pkt[0][1].src == '192.168.0.254'):
			if pkt[0][2].flags == 0x2:
				print "-----------------------------\nTCP S Received:"
				print pkt[0][1].proto
				pkt[0].show()
				if pkt[0].src == '0c:4d:e9:c0:57:b0':
					pkt[0].dst = '00:24:d4:a2:18:c8'
					pkt[0].src = '98:4b:e1:8f:c7:b7'
					pkt[0][1].dst = '192.168.0.254'
					pkt[0][1].src = '192.168.0.19'
	
				if pkt[0].src == '00:24:d4:a2:18:c8':
					pkt[0].dst = '0c:4d:e9:c0:57:b0'
					pkt[0].src = '98:4b:e1:8f:c7:b7'
					pkt[0][1].dst = '192.168.0.19'
					pkt[0][1].src = '192.168.0.254'

				del pkt[0][1].chksum
				del pkt[0][2].chksum
	
				scapy.all.sendp(pkt[0])
				print "\nSent:"
				pkt[0].show()

#			print "\nReply:"
#			reply1.show()
#			reply1[0][1].show()
#			
#			if reply1[0][1].src == '0c:4d:e9:c0:57:b0':
#				reply1[0][1].dst = '00:24:d4:a2:18:c8'
#				reply1[0][1].src = '98:4b:e1:8f:c7:b7'
#				reply1[0][1][1].dst = '192.168.0.254'
#				reply1[0][1][1].src = '192.168.0.19'
#
#			if reply1[0][1].src == '00:24:d4:a2:18:c8':
#				reply1[0][1].dst = '0c:4d:e9:c0:57:b0'
#				reply1[0][1].src = '98:4b:e1:8f:c7:b7'
#				reply1[0][1][1].dst = '192.168.0.19'
#				reply1[0][1][1].src = '192.168.0.254'
#
#			del reply1[0][1][1].chksum
#			del reply1[0][1][2].chksum
#
#			scapy.all.sendp(reply1[0][1])
#			print "\nSent as reply:"
#			reply1[0][1].show()
