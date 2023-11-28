import 'package:flutter/material.dart';
import 'package:pharmacia/models/cart_model.dart';
import 'package:pharmacia/views/homepage_view.dart';
import 'package:pharmacia/views/login_view.dart';
import 'package:provider/provider.dart';
import 'package:pharmacia/models/login_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LoginModel().initSharedPreferences();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartNotifier()),
        ChangeNotifierProvider(create: (context) => PharmaWallet()),
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
