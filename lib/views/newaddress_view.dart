import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmacia/models/newaddress_model.dart';
import 'package:pharmacia/utils/database_helper.dart';

class AddressDetail extends StatefulWidget {
  final String appBarTitle;
  final Address address;

  AddressDetail(this. address, this.appBarTitle);

  @override
  State<StatefulWidget> createState() {
    return AddressDetailState(this.address, this.appBarTitle);
  }
}

class AddressDetailState extends State<AddressDetail> {
  DatabaseHelper helper = DatabaseHelper();
  String appBarTitle;
  Address address;

  TextEditingController nameController = TextEditingController();
  TextEditingController notesController = TextEditingController();
  TextEditingController labelController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phonenumController = TextEditingController();

  AddressDetailState(this.address, this.appBarTitle);

  @override
  Widget build(BuildContext context) {
    nameController.text = address.name;
    notesController.text = address.notes!;
    labelController.text = address.label;
    addressController.text = address.address;
    phonenumController.text = address.phonenum;

    return WillPopScope(
        onWillPop: () async {
          moveToLastScreen();
          return Future.value(true);
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
            leading: IconButton(icon: Icon(
              Icons.arrow_back, color: Colors.black,),
                onPressed: () {
                  moveToLastScreen();
                }
            ),
          ),
          body: Padding(
            padding: EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
            child: ListView(
              children: <Widget>[
                // Full Name Input
                Text(
                  'Full Name',
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(fontSize: 14, color: Color(0xFF555555)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 17.5),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0.2,
                          blurRadius: 1,
                          offset: Offset(0, 0.5),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: nameController,
                      style: TextStyle(fontSize: 16),
                      onChanged: (value) {
                        debugPrint('Something changed in Name Text Field');
                        updateName();
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF6F4EB),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),

                // Phone Number Input
                Text(
                  'Phone Number',
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(fontSize: 14, color: Color(0xFF555555)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 17.5),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0.2,
                          blurRadius: 1,
                          offset: Offset(0, 0.5),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: phonenumController,
                      style: TextStyle(fontSize: 16),
                      onChanged: (value) {
                        debugPrint('Something changed in Phone Number Text Field');
                        updatePhonenumber();
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF6F4EB),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),

                // Address Label Input
                Text(
                  'Address Label',
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(fontSize: 14, color: Color(0xFF555555)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 17.5),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0.2,
                          blurRadius: 1,
                          offset: Offset(0, 0.5),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: labelController,
                      style: TextStyle(fontSize: 16),
                      onChanged: (value) {
                        debugPrint('Something changed in Label Text Field');
                        updateLabel();
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF6F4EB),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),

                // Full Address Input
                Text(
                  'Full Address',
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(fontSize: 14, color: Color(0xFF555555)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 17.5),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0.2,
                          blurRadius: 1,
                          offset: Offset(0, 0.5),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: addressController,
                      style: TextStyle(fontSize: 16),
                      onChanged: (value) {
                        debugPrint('Something changed in Address Text Field');
                        updateAddress();
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF6F4EB),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),

                // Notes Input
                Text(
                  'Note (optional)',
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(fontSize: 14, color: Color(0xFF555555)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 17.5),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0.2,
                          blurRadius: 1,
                          offset: Offset(0, 0.5),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: notesController,
                      style: TextStyle(fontSize: 16),
                      onChanged: (value) {
                        debugPrint('Something changed in Notes Text Field');
                        updateNotes();
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF6F4EB),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 25.0, bottom: 17.5),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            primary: Color(0xFF4682A9),
                            minimumSize: Size(double.infinity, 50), // Adjust the height as needed
                          ),
                          onPressed: () {
                            setState(() {
                              debugPrint("Save button clicked");
                              _save();
                            });
                          },
                          child: Text(
                            "Save",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFF6F4EB),
                              ),
                            ),
                          ),
                        ),
                      ),

                      Container(width: 10.0,),

                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            primary: Color(0xFFC41010),
                            minimumSize: Size(double.infinity, 50),
                          ),
                          onPressed: () {
                            setState(() {
                              debugPrint("Delete button clicked");
                              _delete();
                            });
                          },
                          child: Text(
                            "Delete",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFF6F4EB),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  void updateName(){
    address.name = nameController.text;
  }

  void updateNotes() {
    address.notes = notesController.text;
  }

  void updateLabel() {
    address.label = labelController.text;
  }

  void updateAddress() {
    address.address = addressController.text;
  }

  void updatePhonenumber() {
    address.phonenum = phonenumController.text;
  }

  void _save() async {
    moveToLastScreen();
    int result;
    if (address.id != null) {
      result = await helper.updateAddress(address);
    } else {
      result = await helper.insertAddress(address);
    }

    if (result != 0) {  // Success
      _showAlertDialog('Status', 'Address Saved Successfully!');
    } else {  // Failure
      _showAlertDialog('Status', 'Problem Saving Address!');
    }
  }

  void _delete() async {
    moveToLastScreen();
    if (address.id == null) {
      _showAlertDialog('Status', 'No Address was deleted!');
      return;
    }

    int result = await helper.deleteAddress(address.id ?? 0);
    if (result != 0) {
      _showAlertDialog('Status', 'Address Deleted Successfully!');
    } else {
      _showAlertDialog('Status', 'Error Occured while Deleting Address!');
    }
  }

  void _showAlertDialog(String title, String message) {
    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(
        context: context,
        builder: (_) => alertDialog
    );
  }

}