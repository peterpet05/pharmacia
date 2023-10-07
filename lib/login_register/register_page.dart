import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmacia/login_register/login_page.dart';

class CustomAlertDialogImg extends StatelessWidget {
  final String imagesUrl;

  CustomAlertDialogImg({required this.imagesUrl});

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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
            child: Image.asset(imagesUrl),
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
              'Login Now',
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

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _showRegisterConfirmationDialogImg(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialogImg(
          imagesUrl: 'assets/RegisterComplete.png',
        );
      },
    );
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
                          decoration: InputDecoration(filled:true, fillColor: Color(0xFFF6F4EB)),
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
                          decoration: InputDecoration(filled:true, fillColor: Color(0xFFF6F4EB)),
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
                          controller: _passwordController,
                          obscureText: !_isPasswordVisible,
                          decoration: InputDecoration(

                            filled:true,
                            fillColor: Color(0xFFF6F4EB),
                            suffixIcon: IconButton(
                              icon: Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off, color: Color(0xFF5C5959).withOpacity(0.5)),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 31.5,),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            _showRegisterConfirmationDialogImg(context);
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
                                  textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFFF6F4EB)),
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
                              textStyle: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.5)),
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