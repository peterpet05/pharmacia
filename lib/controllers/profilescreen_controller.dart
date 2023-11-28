import 'package:flutter/material.dart';
import 'package:pharmacia/views/aboutapp_view.dart';
import 'package:pharmacia/views/address_view.dart';
import 'package:pharmacia/views/changepassword_view.dart';
import 'package:pharmacia/views/helpsupport_view.dart';
import 'package:pharmacia/views/language_view.dart';
import 'package:pharmacia/views/login_view.dart';
import 'package:pharmacia/views/myaccount_view.dart';
import 'package:pharmacia/views/profilescreen_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController {
  void showProfileConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialogLogOut(
          imagesUrls: 'assets/LogoutConfirm.png',
        );
      },
    );
  }

  void navigateToPage(BuildContext context, String title) {
    if (title == 'Help and Support') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HelpSupport()),
      );
    } else if (title == 'Address') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AddressList()),
      );
    } else if (title == 'Change Password') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ChangePassword()),
      );
    } else if (title == 'My Account') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyAccount()),
      );
    } else if (title == 'About App') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AboutApp()),
      );
    } else if (title == 'Language') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Language()),
      );
    }
  }

  void logOut(BuildContext context) async {
    SharedPreferences loginData = await SharedPreferences.getInstance();
    await loginData.setBool('login', true);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }
}