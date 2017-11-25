import asyncio
import websockets
import json
import accounthandler
import messagehandler

LISTEN_ADDRESS = ('0.0.0.0',8080)
clients = {}
channels = {}

@asyncio.coroutine
def client_handler(websocket,path):
	cmd = yield from websocket.recv()
	cmd = json.loads(cmd)
	if cmd["command"] == "login":
		success = accounthandler.login(cmd)
		if not type(success) is str:
			if success[0] in clients.keys():
				success = "That account is already logged in"
	if cmd["command"] == "register":
		success = accounthandler.register(cmd)
	while type(success) is str:
		cmd = {"command": "fail", "error": success}
		yield from websocket.send(json.dumps(cmd))
		cmd = yield from websocket.recv()
		cmd = json.loads(cmd)
		if cmd["command"] == "login":
			success = accounthandler.login(cmd)
			if not type(success) is str:
				if success[0] in clients.keys():
					success = "That account is already logged in"
		if cmd["command"] == "register":
			success = accounthandler.register(cmd)
	uid = success[0]
	chan = accounthandler.getchannels(uid)
	clients[uid] = {"socket": websocket, "channels": chan}
	yield from websocket.send(json.dumps({"command":"success", "channels": chan}))
	for c in chan:
		if c[0] in channels.keys():
			channels[c[0]].append(uid)
		else:
			channels[c[0]] = [uid]
		yield from websocket.send(json.dumps(messagehandler.initchannel(c[0])))
	while True:
		cmd = yield from websocket.recv()
		if cmd == "":
			for c in clients[uid]["channels"]:
				channels[c[0]].remove(uid)
			del clients[uid]
			break
		print(cmd)
		cmd = json.loads(cmd)
		if cmd["command"] == "message":
			yield from messagehandler.send(uid,cmd,[clients[a]["socket"] for a in channels[cmd["channel"]]])

start_server = websockets.serve(client_handler, *LISTEN_ADDRESS)
asyncio.get_event_loop().run_until_complete(start_server)
asyncio.get_event_loop().run_forever()
