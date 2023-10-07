import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmacia/cart_notifier.dart';
import 'package:pharmacia/cart_screen.dart';
import 'package:pharmacia/notifications.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int selectedIndex = 0;
  final Map<int, String> images = {
    0: 'assets/NoOrder.png',
    1: 'assets/ToDeliver.png',
    2: 'assets/Completed.png',
  };

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartNotifier>().cart;
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        return true;
      },
      child: Scaffold(
        backgroundColor: Color(0xFFF6F4EB),
        appBar: AppBar(
          toolbarHeight: 125.0,
          backgroundColor: Color(0xFFF6F4EB),
          automaticallyImplyLeading: false,
          elevation: 4.0,
          titleSpacing: 0.0,
          title: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 10.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.search, color: Color(0xFF5C5959).withOpacity(0.5)),
                          hintText: 'Search on Pharmacia',
                          filled: true,
                          fillColor: Color(0xFFF6F4EB),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Color(0xFF5C5959).withOpacity(0.5)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Color(0xFF5C5959).withOpacity(0.5)),
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
                        Icons.shopping_cart_outlined,
                        color: Colors.black,
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
                        Icons.notifications_outlined,
                        color: Colors.black,
                        size: 27,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 12,),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = 0;
                        });
                      },
                      child: Text(
                        "To Pay",
                        style: TextStyle(
                          fontSize: 15.5,
                          fontWeight: FontWeight.bold,
                          color: selectedIndex == 0 ? Color(0xFF4682A9) : Colors.black,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {

                        setState(() {
                          selectedIndex = 1;
                        });
                      },
                      child: Text(
                        "To Receive",
                        style: TextStyle(
                          fontSize: 15.5,
                          fontWeight: FontWeight.bold,
                          color: selectedIndex == 1 ? Color(0xFF4682A9) : Colors.black,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = 2;
                        });
                      },
                      child: Text(
                        "Completed",
                        style: TextStyle(
                          fontSize: 15.5,
                          fontWeight: FontWeight.bold,
                          color: selectedIndex == 2 ? Color(0xFF4682A9) : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5,),
            ],
          ),
          centerTitle: true,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 22.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  images[selectedIndex] ?? 'assets/NoOrder.png',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
