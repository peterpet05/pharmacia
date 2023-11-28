import 'package:flutter/material.dart';
import 'package:pharmacia/controllers/login_controller.dart';
import 'package:pharmacia/views/register_view.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController _loginController = LoginController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
    _loginController.checkLogin(context);
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
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
              colors: [Color(0xFF4682A9), Color(0xFFAEF0FF)],
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
                        "Welcome Back!",
                        style: TextStyle(fontSize: 16.5),
                      ),
                      SizedBox(height: 7,),
                      Text(
                        "Login",
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 30,),
                      Text(
                        " Username",
                        style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.5)),
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
                          controller: usernameController,
                          decoration: InputDecoration(filled:true, fillColor: Color(0xFFF6F4EB)),
                        ),
                      ),
                      SizedBox(height: 25,),
                      Text(
                        " Password",
                        style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.5)),
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
                          controller: passwordController,
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
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Switch(
                                  value: _rememberMe,
                                  onChanged: (value) {
                                    setState(() {
                                      _rememberMe = value;
                                    });
                                  },
                                  activeColor: Color(0xFF4682A9),
                                ),
                                Text(
                                  "Remember me",
                                  style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.5)),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "Forgot Password?",
                            style: TextStyle(fontSize: 14, color: Color(0xFF4682A9)),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            String username = usernameController.text;
                            String password = passwordController.text;
                            if(username.isNotEmpty && password.isNotEmpty) {
                              _loginController.performLogin(context, username);
                            }
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
                                "Login",
                                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFFF6F4EB)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Not on Pharmacia yet? ",
                            style: TextStyle(fontSize: 14, color: Colors.black.withOpacity(0.5)),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => RegisterPage(),
                                ),
                              );
                            },
                            child: Text(
                              "Register Here",
                              style: TextStyle(fontSize: 14, color: Color(0xFF4682A9)),
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