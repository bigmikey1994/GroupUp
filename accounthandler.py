import pymysql

db = pymysql.connect(host='localhost',
		     user='root',
		     password='dungeon123',
		     db='Group_Up',
                     autocommit = True)

def login(com):
	cursor = db.cursor()
	cursor.execute("CALL login(%s,%s)", (com['user'], com['password']))
	success = cursor.fetchone()
	if success:
		return success[0]
	return success

def register(com):
	cursor = db.cursor()
	success = cursor.execute("CALL register(%s, %s)", (com['user'], com['password']))
	return (success == 1)
