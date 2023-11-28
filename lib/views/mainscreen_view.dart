import 'package:flutter/material.dart';
import 'package:pharmacia/controllers/mainscreen_controller.dart';

class MainScreenView extends StatelessWidget {
  final MainScreenController controller;

  MainScreenView(this.controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.model.pages[controller.model.selectedIndex],
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
        child: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Color(0xFFF6F4EB),
          ),
          child: BottomNavigationBar(
            selectedItemColor: Color(0xFF4682A9),
            unselectedItemColor: Color(0xFF5C5959).withOpacity(0.5),
            showUnselectedLabels: true,
            currentIndex: controller.model.selectedIndex,
            onTap: controller.onTapNav,
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
