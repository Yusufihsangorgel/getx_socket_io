import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_socket_io/app/routes/app_pages.dart';

class LoginController extends GetxController {
  String _errorMessage = '';
  final TextEditingController usernameController = TextEditingController();
  String get errorMessage => _errorMessage;

  setErrorMessage(String message) {
    _errorMessage = message;
    update();
  }

  login() {
    print(usernameController.text);
    if (usernameController.text.trim().isNotEmpty) {
      Get.toNamed(Routes.HOME, arguments: usernameController.text.trim());
    } else {
      Get.snackbar('Error', 'Please enter a username');
    }
  }

  @override
  void onClose() {
    usernameController.dispose();
    super.onClose();
  }
}
