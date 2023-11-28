import 'package:flutter/material.dart';
import 'package:pharmacia/models/register_model.dart';
import 'package:pharmacia/views/login_view.dart';
import 'package:pharmacia/views/register_custom_alert_dialog.dart';

class RegisterController {
  final RegisterModel _registerModel = RegisterModel();
  TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;

  RegisterModel get registerModel => _registerModel;

  void setUsername(String username) {
    _registerModel.username = username;
  }

  void setEmailOrPhoneNumber(String emailOrPhoneNumber) {
    _registerModel.emailOrPhoneNumber = emailOrPhoneNumber;
  }

  void setPassword(String password) {
    _registerModel.password = password;
  }

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
  }

  void dispose() {
    passwordController.dispose();
  }

  void showRegisterConfirmationDialog(BuildContext context, {required String imagesUrl}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialogImg(
          imagesUrl: imagesUrl,
          onDialogClose: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
          onLoginPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
        );
      },
    );
  }
}
