import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmacia/main_screen.dart';
import 'package:pharmacia/login_register/register_page.dart';

class AboutApp extends StatefulWidget {
  const AboutApp({Key? key});

  @override
  _AboutAppState createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  bool _rememberMe = false;

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [Color(0xFF4682A9),
                  Color(0xFFAEF0FF)
                ]
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 50,),
              Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: [
                        SizedBox(width: 8,),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Color(0xFFF6F4EB),
                            size: 27,
                          ),
                        ),
                        SizedBox(width: 102.5,),
                        Text(
                          'About App',
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(fontSize: 19, color: Colors.white, fontWeight: FontWeight.bold, shadows: [
                              Shadow(
                                color: Color(0x66000000),
                                offset: Offset(2, 2),
                                blurRadius: 3,
                              ),
                            ],),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 35,),
                    Image.asset(
                      'assets/Pharmacia.png',
                      height: 110,
                      width: 475,
                    ),
                    SizedBox(height: 30,),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFEEECE4),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 4,
                      offset: Offset(3, 0),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "About Pharmacia",
                        style: GoogleFonts.plusJakartaSans(
                          textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text(
                        "Pharmacia is an innovative e-commerce platform specifically designed to fulfill people's need to obtain medicines easily and efficiently. With a user-friendly interface and advanced features, \n\n"
                            "Pharmacia allows users to explore various categories of medicines, ranging from over-the-counter to prescription, easily and safely. Pharmacia's strengths include a drug recommendation system based on the user's health needs and history, providing a personalized and trusted shopping experience.\n\n"
                            "In addition, the app also provides in-depth information about each drug product, including dosage, side effects, and drug interactions. With Pharmacia, your health is our priority, making it easy to get medicine without having to leave the house.",
                        style: GoogleFonts.plusJakartaSans(
                          textStyle: TextStyle(fontSize: 14, color: Color(0xFF302D2D)),
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      SizedBox(height: 25,),
                      Center(
                        child: Text(
                          "App Version",
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          "1.0.0",
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Center(
                        child: Container(
                          height: 45,
                          width: 250,
                          padding: EdgeInsets.fromLTRB(30.0, 5.5, 30.0, 0),
                          child: Column(
                            children:[
                              Center(
                                child: Text(
                                  "Developed by",
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFFF6F4EB),
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  "4th Teams",
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFFF6F4EB),
                                      fontStyle: FontStyle.italic
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xFF4682A9),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}