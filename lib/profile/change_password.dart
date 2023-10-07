import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController _password1Controller = TextEditingController();
  bool _isPassword1Visible = false;

  TextEditingController _password2Controller = TextEditingController();
  bool _isPassword2Visible = false;

  TextEditingController _password3Controller = TextEditingController();
  bool _isPassword3Visible = false;

  @override
  void dispose1() {
    _password1Controller.dispose();
    super.dispose();
  }

  @override
  void dispose2() {
    _password2Controller.dispose();
    super.dispose();
  }

  void dispose3() {
    _password3Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        backgroundColor: Color(0xFFEEECE4),
        appBar: AppBar(
          toolbarHeight: 75.0,
          backgroundColor: Color(0xFFF6F4EB),
          automaticallyImplyLeading: true,
          elevation: 4.0,
          titleSpacing: 0.0,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Password',
                style: GoogleFonts.inter(
                  textStyle: TextStyle(fontSize: 19, color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10,),
                Center(child: Image.asset('assets/NewPass.png')),
                SizedBox(height: 15,),
                Center(
                  child: Text(
                    'Set new password',
                    style: GoogleFonts.plusJakartaSans(
                      textStyle: TextStyle(fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Center(
                  child: Text(
                    'Your new password must be different\nfrom  previously used password',
                    style: GoogleFonts.plusJakartaSans(
                      textStyle: TextStyle(fontSize: 14, color: Color(0xFF929292)),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 40,),
                Text(
                  'Current Password',
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(fontSize: 14, color: Color(0xFF555555)),
                  ),
                ),
                SizedBox(height: 5,),
                TextField(
                  controller: _password1Controller,
                  obscureText: !_isPassword1Visible,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    filled:true,
                    fillColor: Color(0xFFF6F4EB),
                    suffixIcon: IconButton(
                      icon: Icon(_isPassword1Visible ? Icons.visibility : Icons.visibility_off, color: Color(0xFF5C5959).withOpacity(0.5)),
                      onPressed: () {
                        setState(() {
                          _isPassword1Visible = !_isPassword1Visible;
                        });
                      },
                    ),
                  ),
                  style: TextStyle(fontSize: 13),
                ),
                SizedBox(height: 20,),
                Text(
                  'New Password',
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(fontSize: 14, color: Color(0xFF555555)),
                  ),
                ),
                SizedBox(height: 5,),
                TextField(
                  controller: _password2Controller,
                  obscureText: !_isPassword2Visible,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    filled:true,
                    fillColor: Color(0xFFF6F4EB),
                    suffixIcon: IconButton(
                      icon: Icon(_isPassword2Visible ? Icons.visibility : Icons.visibility_off, color: Color(0xFF5C5959).withOpacity(0.5)),
                      onPressed: () {
                        setState(() {
                          _isPassword2Visible = !_isPassword2Visible;
                        });
                      },
                    ),
                  ),
                  style: TextStyle(fontSize: 13),
                ),
                SizedBox(height: 7,),
                Text(
                  'Password must contain at least 1 number and 8 characters',
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(fontSize: 10.5, color: Color(0xFF929292)),
                  ),
                ),
                SizedBox(height: 20,),
                Text(
                  'Confirm New Password',
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(fontSize: 14, color: Color(0xFF555555)),
                  ),
                ),
                SizedBox(height: 5,),
                TextField(
                  controller: _password3Controller,
                  obscureText: !_isPassword3Visible,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    filled:true,
                    fillColor: Color(0xFFF6F4EB),
                    suffixIcon: IconButton(
                      icon: Icon(_isPassword3Visible ? Icons.visibility : Icons.visibility_off, color: Color(0xFF5C5959).withOpacity(0.5)),
                      onPressed: () {
                        setState(() {
                          _isPassword3Visible = !_isPassword3Visible;
                        });
                      },
                    ),
                  ),
                  style: TextStyle(fontSize: 13),
                ),
                SizedBox(height: 40,),
                Container(
                  height: 55,
                  width: 330,
                  padding: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
                  child: Row(
                    children:[
                      SizedBox(width: 75),
                      Center(
                        child: Text(
                          "Change Password",
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFF6F4EB),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFF4682A9),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
