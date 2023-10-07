import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Language extends StatefulWidget {
  const Language({Key? key}) : super(key: key);

  @override
  State<Language> createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  final List<Map<String, String>> languages = [
    {'code': 'en_us', 'name': 'English (US)'},
    {'code': 'en_uk', 'name': 'English (UK)'},
    {'code': 'id', 'name': 'Indonesia'},
    {'code': 'cn', 'name': 'Chinese'},
    {'code': 'jp', 'name': 'Japanese'},
    {'code': 'kr', 'name': 'Korea'},
  ];

  String selectedLanguage = 'en_us';

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
                'Language',
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
          padding: const EdgeInsets.all(20.0),
          child: ListView.builder(
            itemCount: languages.length,
            itemBuilder: (context, index) {
              final language = languages[index];
              final languageCode = language['code'] ?? '';
              final languageName = language['name'] ?? '';
              final isSelected = selectedLanguage == languageCode;

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedLanguage = languageCode;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: isSelected ? Color(0xFFD1DFE7) : Color(0xFFF6F4EB),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(1),
                        spreadRadius: 0,
                        blurRadius: 1,
                        offset: Offset(0, 1),
                      ),
                    ],
                    border: isSelected
                        ? Border.all(color: Color(0xFF4682A9), width: 1.0)
                        : null,
                  ),
                  child: ListTile(
                    leading: Image.asset(
                      'assets/${languageCode}_flag.png',
                    ),
                    title: Text(
                      languageName,
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),
                      ),
                    ),
                    trailing: isSelected ? Icon(Icons.check_circle_outline, color: Color(0xFF4682A9)) : null,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
