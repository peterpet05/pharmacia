import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmacia/controllers/helpsupport_controller.dart';

class HelpSupport extends StatefulWidget {
  const HelpSupport({Key? key}) : super(key: key);

  @override
  State<HelpSupport> createState() => _HelpSupportViewState();
}

class _HelpSupportViewState extends State<HelpSupport> {
  final HelpSupportController controller = HelpSupportController();

  final List<Map<String, dynamic>> faqItems = [
    {
      'question': "I haven't received any more orders than expected to arrive. What should I do?",
      'icon': Icons.chevron_right,
    },
    {
      'question': "How long is the estimated refund of the Pharma Wallet balance?",
      'icon': Icons.chevron_right,
    },
    {
      'question': "My balance was deducted, but my transaction failed. What should I do?",
      'icon': Icons.chevron_right,
    },
    {
      'question': "How do I change my phone number?",
      'icon': Icons.chevron_right,
    },
    {
      'question': "How do I cancel my order?",
      'icon': Icons.chevron_right,
    },
    {
      'question': "The status of my order has arrived, but I have not received the goods. What should I do?",
      'icon': Icons.chevron_right,
    },
  ];

  @override
  void dispose() {
    controller.dispose();
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
                'Help & Support',
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Color(0xFFD1DFE7),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "How can we help you?",
                        style: GoogleFonts.plusJakartaSans(
                          textStyle: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Container(
                        height: 50,
                        child: TextField(
                          controller: controller.searchController,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.search, color: Color(0xFF5C5959).withOpacity(0.5)),
                            hintText: 'Type your Question',
                            filled: true,
                            fillColor: Color(0xFFF6F4EB),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Color(0xFF5C5959).withOpacity(0.5)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(color: Color(0xFF5C5959).withOpacity(0.5)),
                            ),
                          ),
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      SizedBox(height: 5,),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Frequently Asked Questions (FAQ)",
                    style: GoogleFonts.plusJakartaSans(
                      textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: faqItems.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 0.0),
                      child: ListTile(
                        title: Text(
                          faqItems[index]['question'],
                          style: GoogleFonts.plusJakartaSans(
                            textStyle: TextStyle(fontSize: 13),
                          ),
                        ),
                        trailing: Icon(
                          faqItems[index]['icon'],
                          color: Color(0xFF4682A9),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFF6F4EB),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 2,
                      offset: Offset(3, 1),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Contact Us",
                        style: GoogleFonts.plusJakartaSans(
                          textStyle: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        "We are ready 24 hours, 7 days to assist you.",
                        style: GoogleFonts.plusJakartaSans(
                          textStyle: TextStyle(fontSize: 14, color: Color(0xFF3C3C3C), fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset('assets/Live Chat.png'),
                          Image.asset('assets/Email.png'),
                          Image.asset('assets/Call.png')
                        ],
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
