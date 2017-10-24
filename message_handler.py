def send(name, com, clients):
	print("test")
	for client, _ in clients.items():
		#yield from client.send('{}:{}'.format(name, message))
		print(com["message"], name)
		yield from client.send(json.dumps({"command": "message", "user": name, "message": com["message"]}))
