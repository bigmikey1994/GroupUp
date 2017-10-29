import json
def send(user, com, clients):
	for client, _ in clients.items():
		yield from client.send(json.dumps({"command": "message", "user": user, "message": com["message"]}))
