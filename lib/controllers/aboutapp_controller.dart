import 'package:flutter/material.dart';

class AboutAppController {
  TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;

  void dispose() {
    passwordController.dispose();
  }
}
