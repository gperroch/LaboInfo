from suds.client import Client

if __name__=="__main__":
	port = raw_input("Port: ")
	address = "http://localhost:" + port + "/?wsdl"
	client = Client(address)
	while True:
		text = raw_input("Message: ")
		result = client.service.say_hello(text, 1)
		print result
