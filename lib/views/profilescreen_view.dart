import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmacia/controllers/profilescreen_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileController _controller = ProfileController();

  //Shared Preferences Username
  late SharedPreferences loginData;
  late Future<String?> username;

  @override
  void initState() {
    super.initState();
    username = initial();
  }

  Future<String?> initial() async {
    loginData = await SharedPreferences.getInstance();
    return loginData.getString('username');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder<String?>(
          future: username,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final username = snapshot.data ?? "Guest";
              return Container(
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
                                  '$username',
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
                              borderRadius: BorderRadius.circular(20),
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
                                ProfileOption(_controller, 'My Account', 'Manage your account', 'assets/myacc.png', Icons.arrow_forward_ios),
                                Divider(height: 0),
                                ProfileOption(_controller, 'Change Password', 'Modify your password', 'assets/password.png', Icons.arrow_forward_ios),
                                Divider(height: 0),
                                ProfileOption(_controller, 'Language', 'English', 'assets/language.png', Icons.arrow_forward_ios),
                                Divider(height: 0),
                                ProfileOption(_controller, 'Address', 'Manage your address', 'assets/address.png', Icons.arrow_forward_ios),
                                Divider(height: 0),
                                ProfileOption(_controller, 'Help and Support', 'FAQ & Contact', 'assets/help.png', Icons.arrow_forward_ios),
                                Divider(height: 0),
                                ProfileOption(_controller, 'About App', 'About Pharmacia', 'assets/about.png', Icons.arrow_forward_ios),
                                SizedBox(height: 0),
                              ],
                            ),
                          ),
                          SizedBox(height: 24),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            child: ElevatedButton(
                              onPressed: () {
                                _controller.showProfileConfirmationDialog(context);
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
              );
            }
          },
        ),
      ),
    );
  }
}

class ProfileOption extends StatelessWidget {
  final ProfileController _controller;
  final String title;
  final String subtitle;
  final String imagePath;
  final IconData iconData;

  ProfileOption(this._controller, this.title, this.subtitle, this.imagePath, this.iconData);

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
        _controller.navigateToPage(context, title);
      },
    );
  }
}

class CustomAlertDialogLogOut extends StatelessWidget {
  final String imagesUrls;
  final ProfileController _controller = ProfileController();
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
              _controller.logOut(context);
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
