import scapy.all as s

count=0
while True :
	print("Count=%s\n", count)
	s.sniff(filter="ip", count=10).show()
	count+=1
