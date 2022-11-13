import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GetBuilder<LoginController>(
            init: LoginController(),
            builder: (_) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/socket_icon.png'),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Flutter Socket.IO GetX',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextField(
                    controller: controller.usernameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Who are you?',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: controller.login,
                    child: const Text('Start Now'),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
