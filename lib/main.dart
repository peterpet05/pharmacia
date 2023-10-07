import 'package:flutter/material.dart';
import 'package:pharmacia/cart.dart';
import 'package:pharmacia/login_register/login_page.dart';
import 'package:pharmacia/cart_notifier.dart';
import 'package:pharmacia/navigation_bar/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartNotifier()), // Replace with your Cart class
        ChangeNotifierProvider(create: (context) => PharmaWallet()), // Replace with your PharmaWallet class
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title:  'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
