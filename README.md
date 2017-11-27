# GroupUp
CECS 550 Chat Client Project
Initial push modified version of https://github.com/sjkingo/websocket-chat/tree/master/server
TODO: Add initial angular page, README, and MySQL db

Requirements:
Python3
pip
websockets

Checking:
Python: Version should be 3.4 or newer. Needed for Asyncio.
To check, run python. It will print the version immediately. May need to run python3 instead of python
pip: run pip
websockets: In python, import websockets. If the module doesn't exist, run pip install -r requirements.txt

After everything is installed, run server.py.
When the server is running, open index.html. It will automatically connect to the server. Clicking the 'Click' button will send a message across the socket, after the first click, inputting data into the text box on the right and then clicking click will send a message. This is to be cleaned up soon, but I want to get functionality fixed first.

Commands Server Receives:
Login: Contains a Username and a Password, both strings. Server checks database to see if the combination is correct, if it is, it checks if that user is already logged in. If both are valid, sends back a success command. If it is not, it sends back a relevant error message.

Register: Contans a Username and a Password, both strings. Server checks database to see if username is present, if it is not, it adds the combination to the database and returns a success command. If it is not, it returns a relevant error message.

Message: Contains a server id and a message. Server puts message into database and sends it to the users that are logged in in that channel.

Commands Client Receives:
Success: Tells the client that it is successfully logged in. Also contains Channels, a list of the channels that it is connected to

Channel: Contains the message history for a channel.

Message: Contains a single message. The message contains a message id, channel, text, the user, and a timestamp.

Fail: Contains an error message
