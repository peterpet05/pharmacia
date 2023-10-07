import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmacia/profile/address.dart';

class AddNewAddress extends StatefulWidget {
  const AddNewAddress({Key? key}) : super(key: key);

  @override
  State<AddNewAddress> createState() => _AddNewAddressState();
}

class _AddNewAddressState extends State<AddNewAddress> {
  bool isDefaultAddress = false;

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
                'New Address',
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
              children: [
                Text(
                  'Full Name',
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(fontSize: 14, color: Color(0xFF555555)),
                  ),
                ),
                SizedBox(height: 5,),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFF6F4EB),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 20,),
                Text(
                  'Phone Number',
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(fontSize: 14, color: Color(0xFF555555)),
                  ),
                ),
                SizedBox(height: 5,),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFF6F4EB),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Image.asset(
                      'assets/IDN.png',
                    ),
                  ),
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 20,),
                Text(
                  'Address Label',
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(fontSize: 14, color: Color(0xFF555555)),
                  ),
                ),
                SizedBox(height: 5,),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFF6F4EB),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 20,),
                Text(
                  'Full Address',
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(fontSize: 14, color: Color(0xFF555555)),
                  ),
                ),
                SizedBox(height: 5,),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFF6F4EB),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 20,),
                Text(
                  'Note (optional)',
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(fontSize: 14, color: Color(0xFF555555)),
                  ),
                ),
                SizedBox(height: 5,),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFF6F4EB),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Set as default address',
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(fontSize: 14, color: Color(0xFF555555)),
                      ),
                    ),
                    Switch(
                      value: isDefaultAddress,
                      onChanged: (value) {
                        setState(() {
                          isDefaultAddress = value;
                        });
                      },
                      activeColor: Color(0xFF4682A9),
                    ),
                  ],
                ),
                SizedBox(height: 45,),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 55,
                    width: 330,
                    padding: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
                    child: Row(
                      children:[
                        SizedBox(width: 90),
                        Center(
                          child: Text(
                            "Save Address",
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
    );
  }
}
