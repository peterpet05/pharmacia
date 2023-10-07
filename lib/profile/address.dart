import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmacia/profile/add_new_address.dart';

class Address extends StatefulWidget {
  const Address({Key? key}) : super(key: key);

  @override
  State<Address> createState() => _AddressState();
}

class _AddressState extends State<Address> {
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
                'Address',
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
        body: SingleChildScrollView( // Wrap with SingleChildScrollView
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Image.asset(
                      'assets/Address3.png',
                    ),
                    SizedBox(height: 15,),
                    Image.asset(
                      'assets/Address2.png',
                    ),
                    SizedBox(height: 15,),
                    Image.asset(
                      'assets/Address1.png',
                    ),
                    SizedBox(height: 60,),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddNewAddress()),
                        );
                      },
                      child: Container(
                        height: 55,
                        width: 330,
                        padding: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
                        child: Row(
                          children:[
                            SizedBox(width: 62),
                            Icon(
                              Icons.add_circle_outline_outlined,
                              size: 15,
                              color: Color(0xFFF6F4EB),
                            ),
                            SizedBox(width: 10),
                            Center(
                              child: Text(
                                "Add New Address",
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
