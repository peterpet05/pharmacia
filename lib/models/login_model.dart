import 'package:shared_preferences/shared_preferences.dart';

class LoginModel {
  late SharedPreferences loginData;

  Future<void> initSharedPreferences() async {
    loginData = await SharedPreferences.getInstance();
  }

  Future<bool> checkLogin() async {
    bool newuser = loginData.getBool('login') ?? true;
    return newuser;
  }

  Future<void> performLogin(String username) async {
    loginData.setBool('login', false);
    loginData.setString('username', username);
  }
}