import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Reactive variable to hold the count value
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> onTapLogin() async {
    String usernameExpected = 'admin@gmail.com';
    String passwordExpected = 'admin123';
    String username = emailController.text.trim();
    String password = passwordController.text.trim();
    if (username.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Username and password cannot be empty',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red.shade100);
      return;
    }

    if (username == usernameExpected && password == passwordExpected) {
      Get.offAllNamed('/home');
    } else {
      Get.snackbar('Error', 'Invalid username or password',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red.shade100);
    }
  }

  void increment() => count.value++;
}
