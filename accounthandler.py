import pymysql

db = pymysql.connect(host='localhost',
		     user='root',
		     password='password',
		     db='Group_Up',
                     autocommit = True)

def login(com):
	cursor = db.cursor()
	cursor.execute("CALL login(%s,%s)", (com['user'], com['password']))
	success = cursor.fetchone()
	if success:
		return success[0]
	return 'Invalid username or password'

def register(com):
	cursor = db.cursor()
	success = cursor.execute("CALL register(%s, %s)", (com['user'], com['password']))
	success = cursor.fetchone()
	if success:
		return success[0]
	return 'An account with that name already exists'

def getchannels(uid):
	cursor = db.cursor()
	cursor.execute("CALL getchannels(%s)", (uid))
	return cursor.fetchall()
