import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ArticleFour extends StatefulWidget {
  const ArticleFour({Key? key}) : super(key: key);

  @override
  State<ArticleFour> createState() => _ArticleFourState();
}

class _ArticleFourState extends State<ArticleFour> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        backgroundColor: Color(0xFFF6F4EB),
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
                'Article',
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
            padding: const EdgeInsets.all(25.5),
            child: Column(
              children: <Widget>[
                Image.asset(
                    'assets/Article4.png'
                ),
                SizedBox(height: 15,),
                Text(
                  "How to Best Track and Calculate Menstrual Cycle",
                  style: GoogleFonts.plusJakartaSans(
                    textStyle: TextStyle(fontSize: 23.5, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 7,),
                Row(
                  children: <Widget>[
                    Icon(Icons.history, color: Color(0xFF4682A9), size: 20,),
                    SizedBox(width: 5,),
                    Text(
                      "19 August 2023  |  Menstrual",
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF4682A9)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 14,),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.  Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
                  style: GoogleFonts.plusJakartaSans(
                    textStyle: TextStyle(fontSize: 14),
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 20,),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.  Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
                  style: GoogleFonts.plusJakartaSans(
                    textStyle: TextStyle(fontSize: 14),
                  ),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 45,),
                Row(
                  children: [
                    Icon(Icons.favorite_border_outlined, color: Color(0xFF4682A9)),
                    SizedBox(width: 7,),
                    Text(
                      "342",
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: TextStyle(fontSize: 14, color: Color(0xFF4682A9), fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Icon(Icons.comment_outlined, color: Color(0xFF4682A9)),
                    SizedBox(width: 7,),
                    Text(
                      "23",
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: TextStyle(fontSize: 14, color: Color(0xFF4682A9), fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Icon(Icons.share_outlined, color: Color(0xFF4682A9)),
                    SizedBox(width: 7,),
                    Text(
                      "21",
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: TextStyle(fontSize: 14, color: Color(0xFF4682A9), fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
