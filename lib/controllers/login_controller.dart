import 'package:flutter/material.dart';
import 'package:pharmacia/main_screen.dart';
import 'package:pharmacia/models/login_model.dart';

class LoginController {
  final LoginModel _authModel = LoginModel();

  Future<void> checkLogin(BuildContext context) async {
    await _authModel.initSharedPreferences();

    bool newuser = await _authModel.checkLogin();

    if (!newuser) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    }
  }

  Future<void> performLogin(BuildContext context, String username) async {
    await _authModel.initSharedPreferences();
    await _authModel.performLogin(username);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => MainScreen()),
    );
  }
}