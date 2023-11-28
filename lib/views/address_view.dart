import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmacia/models/newaddress_model.dart';
import 'package:pharmacia/utils/database_helper.dart';
import 'package:pharmacia/views/newaddress_view.dart';
import 'package:sqflite/sqflite.dart';

class AddressList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddressListState();
  }
}

class AddressListState extends State<AddressList> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Address>? addressList;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (addressList == null) {
      addressList = <Address>[];
      updateListView();
    }
    return Scaffold(
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

      body: getAddressListView(),

      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 9.0, left: 32.0) ,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 60.0,
            width: 350,
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: FloatingActionButton.extended(
              onPressed: () {
                navigateToDetail(Address('', '', '', '', ''), 'Add Address');
              },
              label: Row(
                children: [
                  Icon(
                    Icons.add_circle_outline_outlined,
                    size: 20,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Add New Address",
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFFF6F4EB),
                      ),
                    ),
                  ),
                ],
              ),
              backgroundColor: Color(0xFF4682A9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          ),
        ),
      ),

    );
  }

  ListView getAddressListView() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
          child: Card(
            color: Color(0xFFF6F4EB),
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(this.addressList![position].label, style: GoogleFonts.plusJakartaSans(
                          textStyle: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                        ),),
                        Icon(Icons.more_vert, color: Colors.black.withOpacity(0.5)),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 3.0),
                      child: Divider(color: Colors.black.withOpacity(0.3)),
                    ),
                    SizedBox(height: 5,),
                    Text(this.addressList![position].name + " (" + this.addressList![position].phonenum + ")", style: GoogleFonts.plusJakartaSans(
                      textStyle: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
                    ),),
                    SizedBox(height: 7,),
                    Text(this.addressList![position].address, style: GoogleFonts.dmSans(
                      textStyle: TextStyle(fontSize: 14, color: Color(0xFF666666), fontWeight: FontWeight.w400),
                    ),),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            debugPrint("ListTile Tapped");
                            navigateToDetail(this.addressList![position], 'Edit Address');
                          },
                          child: Row(
                            children: [
                              Icon(Icons.edit_note, color: Colors.black.withOpacity(0.5)),
                              SizedBox(width: 5),
                              Text(
                                'Edit',
                                style: GoogleFonts.dmSans(
                                  textStyle: TextStyle(fontSize: 13, color: Color(0xFF666666), fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 25,),
                        GestureDetector(
                          onTap: () {
                            _delete(context, addressList![position]);
                          },
                          child: Row(
                            children: [
                              Icon(Icons.delete_outline, color: Colors.black.withOpacity(0.35)),
                              SizedBox(width: 5),
                              Text(
                                'Delete',
                                style: GoogleFonts.dmSans(
                                  textStyle: TextStyle(fontSize: 13, color: Color(0xFF666666), fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
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
      },
    );
  }

  void _delete(BuildContext context, Address address) async {
    int result = await databaseHelper.deleteAddress(address.id ?? 0);
    if (result != 0) {
      updateListView();
    }
  }

  void navigateToDetail(Address address, String title) async {
    bool result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return AddressDetail(address, title);
    }));
    if (result == true) {
      updateListView();
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Address>> addressListFuture = databaseHelper.getAddressList();
      addressListFuture.then((addressList) {
        setState(() {
          this.addressList = addressList;
          this.count = addressList.length;
        });
      });
    });
  }
}