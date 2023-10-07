import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmacia/news/article_four.dart';
import 'package:pharmacia/news/article_one.dart';
import 'package:pharmacia/news/article_three.dart';
import 'package:pharmacia/news/article_two.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  PageController pageController = PageController(viewportFraction: 0.90);
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = 200;

  List<String> imageAssets = [
    "assets/News02.png",
    "assets/News04.png",
    "assets/News03.png",
    "assets/News01.png",
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color(0xFFF6F4EB),
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 60,),
                  Padding(
                    padding: const EdgeInsets.only(left: 27.5),
                    child: Text(
                      "News",
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: TextStyle(fontSize: 21.5, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: 22),
                  Column(
                    children: [
                      Container(
                        height: 160,
                        child: PageView.builder(
                          controller: pageController,
                          itemCount: 4,
                          itemBuilder: (BuildContext context, int index) {
                            return _buildPageItem(index);
                          },
                        ),
                      ),
                      SizedBox(height: 5),
                      new DotsIndicator(
                        dotsCount: 4,
                        position: _currentPageValue,
                        decorator: DotsDecorator(
                          color: Colors.grey.withOpacity(0.35),
                          activeColor: Color(0xFF7F7F7F),
                          size: const Size.square(9.0),
                          activeSize: const Size(18.0, 9.0),
                          activeShape:
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 17.5),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF6F4EB),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 4,
                          offset: Offset(3, 0),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(32.5, 30.0, 32.5, 15.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Latest Article",
                                style: GoogleFonts.plusJakartaSans(
                                  textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                "See all >",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(fontSize: 14.25, color: Color(0xFF4682A9)),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ArticleOne()),
                              );
                            },
                            child: Image.asset(
                              'assets/News1.png',
                            ),
                          ),
                          SizedBox(height: 8,),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ArticleTwo()),
                              );
                            },
                            child: Image.asset(
                              'assets/News2.png',
                            ),
                          ),
                          SizedBox(height: 8,),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ArticleThree()),
                              );
                            },
                            child: Image.asset(
                              'assets/News3.png',
                            ),
                          ),
                          SizedBox(height: 8,),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ArticleFour()),
                              );
                            },
                            child: Image.asset(
                              'assets/News4.png',
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
