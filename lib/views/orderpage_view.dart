import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pharmacia/models/cart_model.dart';
import 'package:pharmacia/views/cart_view.dart';
import 'package:pharmacia/views/notifications_view.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  int selectedIndex = 0;

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
            padding: const EdgeInsets.only(top: 9, bottom: 9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFF6F4EB),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: _buildContent(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    final cartItems = context.watch<CartNotifier>().cart.items;
    switch (selectedIndex) {
      case 0:
        return Image.asset('assets/NoOrder.png');
      case 1:
        if (cartItems.isEmpty) {
          return Image.asset('assets/NoReceive.png');
        }
        else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var cartItem in context
                  .watch<CartNotifier>()
                  .cart
                  .items)
                Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(25, 15, 20, 15),
                      decoration: BoxDecoration(
                        color: Color(0xFFF6F4EB),
                        borderRadius: BorderRadius.circular(15.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                DateFormat('dd MMMM yyyy').format(
                                    DateTime.now()),
                                style: GoogleFonts.plusJakartaSans(
                                  textStyle: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(width: 170),
                              Icon(
                                Icons.more_vert,
                                size: 28,
                                color: Colors.black.withOpacity(0.5),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/${cartItem.images}',
                                width: 105,
                                height: 70,
                              ),
                              SizedBox(width: 30),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${cartItem.productName}',
                                    style: TextStyle(fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'Quantity: ${cartItem.quantity}',
                                    style: TextStyle(fontSize: 13,
                                        color: Colors.black.withOpacity(0.5)),
                                  ),
                                  SizedBox(height: 13),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      SizedBox(width: 100,),
                                      Text(
                                        "Rp${NumberFormat('#,###', 'idn')
                                            .format(cartItem.totalPrice)}",
                                        style: GoogleFonts.plusJakartaSans(
                                          textStyle: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xFF4682A9),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20),

                          Row(
                            children: [
                              Icon(
                                Icons.delivery_dining,
                                size: 20,
                                color: Color(0xFF4682A9),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Package is being delivered to the destination address",
                                style: TextStyle(fontSize: 12, color: Color(
                                    0xFF4682A9)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                ),
            ],
          );
        }
      case 2:
        return Image.asset('assets/Completed.png');
      default:
        return Container();
    }
  }
}
