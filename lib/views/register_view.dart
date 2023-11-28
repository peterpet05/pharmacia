import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmacia/controllers/register_controller.dart';
import 'package:pharmacia/views/login_view.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final RegisterController _registerController = RegisterController();

  @override
  void dispose() {
    _registerController.dispose();
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
              colors: [
                Color(0xFF4682A9),
                Color(0xFFAEF0FF),
              ],
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
                    SizedBox(height: 30,),
                    Image.asset(
                      'assets/Pharmacia.png',
                      height: 110,
                      width: 475,
                    ),
                    SizedBox(height: 64,),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF6F4EB),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Create New Account",
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(fontSize: 16.5),
                        ),
                      ),
                      SizedBox(height: 7,),
                      Text(
                        "Sign Up",
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 27,),
                      Text(
                        " Username",
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.5)),
                        ),
                      ),
                      SizedBox(height: 7,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: Color(0xFF4682A9),
                            width: 2,
                          ),
                        ),
                        child: TextField(
                          onChanged: _registerController.setUsername,
                          decoration: InputDecoration(filled: true, fillColor: Color(0xFFF6F4EB)),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text(
                        "Email or Phone Number",
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.5)),
                        ),
                      ),
                      SizedBox(height: 7,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: Color(0xFF4682A9),
                            width: 2,
                          ),
                        ),
                        child: TextField(
                          onChanged: _registerController.setEmailOrPhoneNumber,
                          decoration: InputDecoration(filled: true, fillColor: Color(0xFFF6F4EB)),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text(
                        " Password",
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.5)),
                        ),
                      ),
                      SizedBox(height: 7,),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: Color(0xFF4682A9),
                            width: 2,
                          ),
                        ),
                        child: TextField(
                          controller: _registerController.passwordController,
                          obscureText: !_registerController.isPasswordVisible,
                          onChanged: _registerController.setPassword,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFF6F4EB),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _registerController.isPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Color(0xFF5C5959).withOpacity(0.5),
                              ),
                              onPressed: () {
                                _registerController.togglePasswordVisibility();
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 31.5,),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            _registerController.showRegisterConfirmationDialog(
                              context,
                              imagesUrl: 'assets/RegisterComplete.png',
                            );
                          },
                          child: Container(
                            width: 120,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(13.5),
                              color: Color(0xFF4682A9),
                            ),
                            child: Center(
                              child: Text(
                                "Sign Up",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFF6F4EB),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 7.5,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Already on Pharmacia? ",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 14,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            },
                            child: Text(
                              "Login Here",
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(fontSize: 14, color: Color(0xFF4682A9)),
                              ),
                            ),
                          ),
                        ],
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