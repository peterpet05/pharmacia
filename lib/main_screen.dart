import 'package:flutter/material.dart';
import 'package:pharmacia/home_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  List pages=[
    HomePage(),
    Container(child: Center(child: Text("Order Page"))),
    Container(child: Center(child: Text("News Page"))),
    Container(child: Center(child: Text("Profile Page"))),
  ];

  void onTapNav(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Color(0xFF4682A9),
        unselectedItemColor: Color(0xFF5C5959).withOpacity(0.5),
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        onTap: onTapNav,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home,),
              label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag,),
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
    );
  }
}

