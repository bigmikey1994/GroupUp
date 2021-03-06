import asyncio
import websockets
import json
import messagehandler
import accounthandler

LISTEN_ADDRESS = ('0.0.0.0', 8080) #TODO: Move into a config file, but keep default
clients = {}

@asyncio.coroutine
def client_handler(websocket, path):
	print('New client', websocket)
	print(' ({} existing clients)'.format(len(clients)))
	info = yield from websocket.recv()
	info = json.loads(info)
	print(info)
	if info['command'] == "login":
		success = accounthandler.login(info)
	if info['command'] == "register":
		success = accounthandler.register(info)
	while not success:
		com = {}
		com['command'] = 'fail'
		if info['command'] == "login":
			com['error'] = "invalid username or password"
		if info['command'] == "register":
			com['error'] = "an account with that name already exists"
		yield from websocket.send(json.dumps(com))
		info = yield from websocket.recv()
		info = json.loads(info)
		print(info)
		if info['command'] == "login":
			success = accounthandler.login(info)
		if info['command'] == "register":
			success = accounthandler.register(info)
	com = {}	
	com['command'] = "success"
	yield from websocket.send(json.dumps(com))
	name = info['user']
	print(websocket, 'is now known as', name)
	#yield from websocket.send('Welcome to websocket-chat {}'.format(name))
	#yield from websocket.send('There are {} other users connected: {}'.format(len(clients), list(clients.values())))
	yield from websocket.send(json.dumps({"command": "init", "users": list(clients.values())}))
	clients[websocket] = name
	for client, _ in clients.items():
		#yield from client.send(name + 'has joined the chat')
		yield from client.send(json.dumps({"command": "connect", "user": name}))
	while True:
		message = yield from websocket.recv()
		if message == None:
			their_name = clients[websocket]
			del clients[websocket]
			print('Client closed connection', websocket)
			for client, _ in clients.items():
				#yield from client.send(their_name + ' has left the chat')
				yield from client.send(json.dumps({"command": "disconnect", "user": name}))
			break
		command = json.loads(message)
		if command["command"] == "message":
			yield from messagehandler.send(name, command, clients)
	
start_server = websockets.serve(client_handler, *LISTEN_ADDRESS)
asyncio.get_event_loop().run_until_complete(start_server)
asyncio.get_event_loop().run_forever()
