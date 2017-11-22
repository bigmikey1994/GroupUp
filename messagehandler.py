import json
import pymysql

db = pymysql.connect(host='localhost',
		     user='root',
		     password='password',
		     db='Group_Up',
                     autocommit = True)

def send(user, com, clients):
	cursor = db.cursor()
	cursor.execute("CALL addmessage(%s,%s,%s)", (user,com["channel"],com["message"])
	tmp = cursor.fetchone()
	message = {"id": tmp[0], "channel": tmp[1], "user": tmp[3], "timestamp": tmp[4]}
	for client in clients:
		yield from client.send(json.dumps({"command": "message", "message": message}))
