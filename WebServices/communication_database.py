#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import mysql.connector 
import sys

if __name__=="__main__":
	conn = mysql.connector.connect(host="localhost",user="root", database="db_test")
	cursor = conn.cursor()
	query = "start"
	while query != "quit":
		query = input("Query: ")
		if query != "quit":
			cursor.execute(query)
			rows = cursor.fetchall()
			for row in rows:
				for elem in row:
					if elem:
						sys.stdout.write(elem)
					sys.stdout.write(" ")
				sys.stdout.write("\n")
	conn.close()
