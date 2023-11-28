import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmacia/views/drugdetail_view.dart';

class HeadacheCategory extends StatefulWidget {
  const HeadacheCategory({Key? key}) : super(key: key);

  @override
  State<HeadacheCategory> createState() => _HeadacheCategoryState();
}

class _HeadacheCategoryState extends State<HeadacheCategory> {
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
                'Headache',
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
          padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0),
          child: ListView(
            children: <Widget>[
              SizedBox(height: 20,),
              TextField(
                decoration: InputDecoration(
                  suffixIcon: Icon(Icons.search, color: Color(0xFF5C5959).withOpacity(0.5)),
                  hintText: 'Find in ‘Headache’ Category',
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
              SizedBox(height: 25,),
              SingleChildScrollView(
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
                                MaterialPageRoute(builder: (context) => PanadolDetail()),
                              );
                            },
                            child: Image.asset(
                              'assets/PanadolHeadache.png',
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => PromagDetail()),
                              );
                            },
                            child: Image.asset(
                              'assets/PromagHeadache.png',
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ParacetamolDetail()),
                              );
                            },
                            child: Image.asset(
                              'assets/ParacetamolHeadache.png',
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => EntrostopDetail()),
                              );
                            },
                            child: Image.asset(
                              'assets/EntrostopHeadache.png',
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            'assets/ParamexHeadache.png',
                          ),
                          Image.asset(
                            'assets/ColdHeadache.png',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            'assets/VitaciminHeadache.png',
                          ),
                          Image.asset(
                            'assets/ProrisHeadache.png',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}