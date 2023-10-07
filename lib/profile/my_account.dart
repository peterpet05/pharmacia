import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  bool isDefaultAddress = false;
  String? selectedGender;

  TextEditingController _dateController = TextEditingController();
  DateTime? _selectedDate;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _numberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _nameController.text = 'John Arthur';
    _emailController.text = 'arthurjohn@gmail.com';
    _numberController.text = '0812-3456-2635';
  }

  void _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
        _dateController.text = DateFormat('d MMMM yyyy').format(pickedDate);
      });
    }
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
                'My Account',
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
                  controller: _nameController,
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
                  'E-mail Address',
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(fontSize: 14, color: Color(0xFF555555)),
                  ),
                ),
                SizedBox(height: 5,),
                TextField(
                  controller: _emailController,
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
                  controller: _numberController,
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
                  'Gender',
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(fontSize: 14, color: Color(0xFF555555)),
                  ),
                ),
                SizedBox(height: 5,),
                Container(
                  width: 400,
                  height: 55,
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    color: Color(0xFFF6F4EB),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButtonFormField<String>(
                      value: selectedGender,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedGender = newValue;
                        });
                      },
                      isDense: true,
                      decoration: InputDecoration(
                        hintText: 'Male',
                        filled: true,
                        fillColor: Color(0xFFF6F4EB),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      items: <String>['Male', 'Female'].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                color: Color(0xFF555555),
                                fontSize: 14,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Text(
                  'Date of Birth',
                  style: GoogleFonts.inter(
                    textStyle: TextStyle(fontSize: 14, color: Color(0xFF555555)),
                  ),
                ),
                SizedBox(height: 5,),
                TextField(
                  onTap: () {
                    _selectDate(context);
                  },
                  readOnly: true,
                  controller: _dateController,
                  decoration: InputDecoration(
                    hintText: '1 January 1999',
                    hintStyle: TextStyle(
                        color: Color(0xFF555555)
                    ),
                    filled: true,
                    fillColor: Color(0xFFF6F4EB),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.calendar_today, color: Color(0xFF555555),),
                      onPressed: () {
                        _selectDate(context);
                      },
                    ),
                  ),
                  style: TextStyle(fontSize: 14),
                ),

                SizedBox(height: 45,),
                GestureDetector(
                  onTap: () {

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
                            "Update Profile",
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