import 'package:flutter/material.dart';

import 'package:pharmacia/views/homepage_view.dart';
import 'package:pharmacia/views/newspage_view.dart';
import 'package:pharmacia/views/orderpage_view.dart';
import 'package:pharmacia/views/profilescreen_view.dart';

class MainScreenModel {
  int selectedIndex = 0;
  List<Widget> pages = [
    HomePage(),
    OrderPage(),
    NewsPage(),
    ProfileScreen(),
  ];
}
