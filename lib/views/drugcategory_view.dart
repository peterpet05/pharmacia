import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmacia/views/categorydetail_view.dart';

class DrugCategory extends StatefulWidget {
  const DrugCategory({Key? key}) : super(key: key);

  @override
  State<DrugCategory> createState() => _DrugCategoryState();
}

class _DrugCategoryState extends State<DrugCategory> {
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
                'Category',
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
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 20.0),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search, color: Color(0xFF5C5959).withOpacity(0.5)),
                  hintText: 'Find Category',
                  filled: true,
                  fillColor: Color(0xFFF6F4EB),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Color(0xFF5C5959).withOpacity(0.5)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Color(0xFF5C5959).withOpacity(0.5)),
                  ),
                ),
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 40,),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => HeadacheCategory()),
                                );
                              },
                              child: Image.asset(
                                'assets/Headache.png',
                              ),
                            ),
                            Image.asset(
                              'assets/Repiratory.png',
                            ),
                            Image.asset(
                              'assets/Fever.png',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 25,),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              'assets/Cough.png',
                            ),
                            Image.asset(
                              'assets/Neck Pain.png',
                            ),
                            Image.asset(
                              'assets/Antiseptic.png',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 25,),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              'assets/Mask.png',
                            ),
                            Image.asset(
                              'assets/Sanitizer.png',
                            ),
                            Image.asset(
                              'assets/Thermometer.png',
                            ),
                          ],
                        ),
                      )
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