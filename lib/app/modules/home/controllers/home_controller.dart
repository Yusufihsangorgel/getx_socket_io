import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_socket_io/app/modules/home/model/message.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class HomeController extends GetxController {
  final List<Message> _messages = [];
  late IO.Socket socket;
  List<Message> get messages => _messages;
  final TextEditingController messageInputController = TextEditingController();
  addNewMessage(Message message) {
    _messages.add(message);
    update();
  }

  sendMessage(String username) {
    socket.emit('message', {
      'message': messageInputController.text.trim(),
      'sender': username,
    });
    messageInputController.clear();
    print('Message sent username : $username');
    update();
  }

  connectSocket() {
    socket.onConnect((data) => print('Connection established'));
    socket.onConnectError((data) {
      print('Connection error');
      print(data);
      Get.snackbar('Connection error', "Please first start the server on app.js");
    });
    socket.onDisconnect((data) => print('Socket.IO server disconnected'));
    socket.on('message', (data) {
      print('Message come: $data');
      addNewMessage(Message.fromJson(data));
    });
    update();
  }

  @override
  void onInit() {
    print("username: ${Get.arguments}");
    socket = IO.io(
      'http://localhost:3000',
      IO.OptionBuilder().setTransports(['websocket']).setQuery(
          {'username': Get.arguments}).build(),
    );
    connectSocket();
    super.onInit();
  }

  @override
  void onClose() {
    messageInputController.dispose();
    update();
    super.onClose();
  }
}
