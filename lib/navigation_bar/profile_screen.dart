import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmacia/login_register/login_page.dart';
import 'package:pharmacia/profile/about_app.dart';
import 'package:pharmacia/profile/address.dart';
import 'package:pharmacia/profile/change_password.dart';
import 'package:pharmacia/profile/help_support.dart';
import 'package:pharmacia/profile/language.dart';
import 'package:pharmacia/profile/my_account.dart';

class CustomAlertDialogLogOut extends StatelessWidget {
  final String imagesUrls;

  CustomAlertDialogLogOut({required this.imagesUrls});

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(Icons.close, size: 20, color: Colors.black.withOpacity(0.5),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
            child: Image.asset(imagesUrls),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF4682A9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              minimumSize: Size(175, 44),
            ),
            child: Text(
              'Log Out',
              style: GoogleFonts.inter(
                textStyle: TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          SizedBox(height: 10.0),
        ],
      ),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  void _showProfileConfirmationDialogImg(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialogLogOut(
          imagesUrls: 'assets/LogoutConfirm.png',
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFFEEECE4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60,),
              Padding(
                padding: const EdgeInsets.only(left: 27.5),
                child: Text(
                  "Profile",
                  style: GoogleFonts.plusJakartaSans(
                    textStyle: TextStyle(fontSize: 21.5, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 37.5,),
            Center(
              child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 22),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight, colors: [Color(0xFF4682A9), Color(0xFF4682A9)]),
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFF4682A9),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('assets/Person.png'),
                      ),
                      SizedBox(width: 17),
                      Text(
                        'John Arthur',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Container(

                  margin: EdgeInsets.symmetric(horizontal: 22),
                  decoration: BoxDecoration(
                    color: Color(0xFFF6F4EB),
                    borderRadius: BorderRadius.circular((20)
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(1, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      ProfileOption('My Account', 'Manage your account', 'assets/myacc.png', Icons.arrow_forward_ios),
                      Divider(height: 0),
                      ProfileOption('Change Password', 'Modify your password', 'assets/password.png', Icons.arrow_forward_ios),
                      Divider(height: 0),
                      ProfileOption('Language', 'English', 'assets/language.png', Icons.arrow_forward_ios),
                      Divider(height: 0),
                      ProfileOption('Address', 'Manage your address', 'assets/address.png', Icons.arrow_forward_ios),
                      Divider(height: 0),
                      ProfileOption('Help and Support', 'FAQ & Contact', 'assets/help.png', Icons.arrow_forward_ios),
                      Divider(height: 0),
                      ProfileOption('About App', 'About Pharmacia', 'assets/about.png', Icons.arrow_forward_ios),
                      SizedBox(height: 0),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      _showProfileConfirmationDialogImg(context);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFFC41010),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Log out',
                            style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.logout,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
              ),
            ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileOption extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  final IconData iconData;

  ProfileOption(this.title, this.subtitle, this.imagePath, this.iconData);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(imagePath),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Icon(iconData, size: 14),
          ),
        ],
      ),
      subtitle: Text(
        subtitle,
        style: GoogleFonts.plusJakartaSans(fontSize: 11, fontWeight: FontWeight.w400, color: Colors.black.withOpacity(0.45)),
      ),
      onTap: () {
        if (title == 'Help and Support') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HelpSupport()),
          );
        }
        else if (title == 'Address') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Address()),
          );
        }
        else if (title == 'Change Password') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChangePassword()),
          );
        }
        else if (title == 'My Account') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyAccount()),
          );
        }
        else if (title == 'About App') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AboutApp()),
          );
        }
        else if (title == 'Language') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Language()),
          );
        }
      },
    );
  }
}
