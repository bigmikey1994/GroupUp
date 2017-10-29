var myApp = angular.module('myApp',[]);
myApp.controller("chatCtrl", ChatCtrl);
var chat;
var socket = new WebSocket("ws://localhost:8080/")
function ChatCtrl($scope) {
  chat = this;
  chat.messages = [{user: "test", message: "did this work"},
                  {user: "test2", message: "did this work again"}];
  chat.user;
  chat.message;
  chat.pass;
  chat.error;
  chat.online = false;
  chat.login = function() {
    com = {};
    com.command = "login";
    com.user = chat.user;
    com.password = chat.pass;
    socket.send(JSON.stringify(com));
  }
  chat.register = function() {
    com = {};
    com.command = "register";
    com.user = chat.user;
    com.password = chat.pass;
    socket.send(JSON.stringify(com));
  }
  chat.sendMessage = function() {
    com = {};
    com.command = "message";
    com.message = chat.message;
    socket.send(JSON.stringify(com));
  };
  chat.addMessage = function(user, message) {
    chat.messages.push({user: user, message: message});
  }
  chat.update = function() {
    $scope.$apply();
  }
};
socket.onmessage = function (event) {
  var com = JSON.parse(event.data);
  switch(com.command) {
    case "message":
      chat.addMessage(com.user, com.message);
      break;

    case "fail":
      chat.error = com.error;
      break;

    case "success":
      chat.online = true;
      break;
  }	
  chat.update();
}
