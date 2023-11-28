import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAlertDialogImg extends StatelessWidget {
  final String imagesUrl;
  final VoidCallback? onDialogClose;
  final VoidCallback? onLoginPressed;

  CustomAlertDialogImg({
    required this.imagesUrl,
    this.onDialogClose,
    this.onLoginPressed,
  });

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
              icon: Icon(Icons.close, size: 20, color: Colors.black.withOpacity(0.5)),
              onPressed: onDialogClose ?? () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
            child: Image.asset(imagesUrl),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: onLoginPressed ?? () {},
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
