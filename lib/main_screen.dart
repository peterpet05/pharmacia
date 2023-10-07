import 'package:flutter/material.dart';
import 'package:pharmacia/navigation_bar/home_page.dart';
import 'package:pharmacia/navigation_bar/news_page.dart';
import 'package:pharmacia/navigation_bar/order_page.dart';
import 'package:pharmacia/navigation_bar/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  List pages = [
    HomePage(),
    OrderPage(),
    NewsPage(),
    ProfileScreen(),
  ];

  void onTapNav(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: new Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Color(0xFFF6F4EB),
          ),
          child: new BottomNavigationBar(
            selectedItemColor: Color(0xFF4682A9),
            unselectedItemColor: Color(0xFF5C5959).withOpacity(0.5),
            showUnselectedLabels: true,
            currentIndex: _selectedIndex,
            onTap: onTapNav,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag),
                label: "Order",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.newspaper),
                label: "News",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}