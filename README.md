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
