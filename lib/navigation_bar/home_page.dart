import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pharmacia/cart_notifier.dart';
import 'package:pharmacia/home/drug_category.dart';
import 'package:pharmacia/home/drug_detail.dart';
import 'package:pharmacia/home/headache_category.dart';
import 'package:provider/provider.dart';
import '../notifications.dart';
import 'package:pharmacia/cart_screen.dart';

import 'package:flutter/foundation.dart';

class PharmaWallet with ChangeNotifier {
  int _balance = 500000;

  int get balance => _balance;

  void updateBalance(int newBalance) {
    _balance = newBalance;
    notifyListeners(); // Notify listeners to update the UI
  }
}



int getPharmaWalletBalance(BuildContext context) {
  final pharmaWallet = context.watch<PharmaWallet>();
  return pharmaWallet.balance;
}


class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  PageController pageController = PageController(viewportFraction: 0.90);
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = 200;

  List<String> imageAssets = [
    "assets/Banner03.jpg",
    "assets/Banne02.png",
    "assets/Banner01.png",
    "assets/Banner04.png",
    "assets/Banner05.jpg",
  ];

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  Widget _buildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      var currScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: 200,
            margin: EdgeInsets.only(left: 9, right: 9),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(imageAssets[index % imageAssets.length]),
              ),
            ),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartNotifier>().cart;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [Color(0xFF4682A9), Color(0xFFAEF0FF)],
            ),
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 60,),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.search, color: Color(0xFF5C5959).withOpacity(0.5)),
                              hintText: 'Search on Pharmacia',
                              filled: true,
                              fillColor: Color(0xFFF6F4EB),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        SizedBox(width: 20,),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CartScreen(cart: cart)),
                            );
                          },
                          child: Icon(
                            Icons.shopping_cart,
                            color: Color(0xFFF6F4EB),
                            size: 27,
                          ),
                        ),
                        SizedBox(width: 10,),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Notifications()),
                            );
                          },
                          child: Icon(
                            Icons.notifications,
                            color: Color(0xFFF6F4EB),
                            size: 27,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      Container(
                        height: 160,
                        child: PageView.builder(
                          controller: pageController,
                          itemCount: 5,
                          itemBuilder: (BuildContext context, int index) {
                            return _buildPageItem(index);
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      new DotsIndicator(
                        dotsCount: 5,
                        position: _currentPageValue,
                        decorator: DotsDecorator(
                          activeColor: Color(0xFFF6F4EB),
                          color: Colors.white.withOpacity(0.5),
                          size: const Size.square(9.0),
                          activeSize: const Size(18.0, 9.0),
                          activeShape:
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF6F4EB),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(45.0, 65.0, 45.0, 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Search by Category",
                                style: GoogleFonts.plusJakartaSans(
                                  textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => DrugCategory()),
                                  );
                                },
                                child: Text(
                                  "See all >",
                                  style: GoogleFonts.inter(
                                    textStyle: TextStyle(fontSize: 14, color: Color(0xFFF4682A9)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => HeadacheCategory()), // Replace with your PanadolDetail class
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
                          SizedBox(height: 25,),
                          Text(
                            "Recommended for You",
                            style: GoogleFonts.plusJakartaSans(
                              textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(height: 5,),
                          Text(
                            "Based on your recent searches",
                            style: GoogleFonts.plusJakartaSans(
                              textStyle: TextStyle(fontSize: 12.1),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => PanadolDetail()),
                                  );
                                },
                                child: Image.asset(
                                  'assets/Panadol.png',
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
                                  'assets/Promag.png',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => EntrostopDetail()),
                                  );
                                },
                                child: Image.asset(
                                  'assets/Entrostop.png',
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => ParacetamolDetail()),
                                  );
                                },
                                child: Image.asset(
                                  'assets/Paracetamol.png',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 580,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    width: 345,
                    height: 65,
                    decoration: BoxDecoration(
                      color: Color(0xFFF6F4EB),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                   child: Padding(
                     padding: const EdgeInsets.only(left: 20, right: 20),
                     child: Row(
                       children: [
                         Image.asset('assets/Wallet.png'),
                         SizedBox(width: 12.5,),
                         Text(
                           "Pharma Wallet",
                           style: GoogleFonts.inter(
                             textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                           ),
                         ),
                         Expanded(
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             crossAxisAlignment: CrossAxisAlignment.end,
                             children: [
                               Text(
                           "Rp${NumberFormat('#,###', 'idn').format(
                               getPharmaWalletBalance(context))}",
                                 style: GoogleFonts.inter(
                                   textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                 ),
                               ),
                               SizedBox(height: 2,),
                               Text(
                                 "10.000 Coins",
                                 style: GoogleFonts.inter(
                                   textStyle: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
                                 ),
                               ),
                             ],
                           ),
                         ),
                       ],
                     ),
                   ),
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
