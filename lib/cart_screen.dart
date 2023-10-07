import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pharmacia/cart.dart';
import 'package:pharmacia/cart_notifier.dart';
import 'package:pharmacia/payment_screen.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  final Cart cart;

  CartScreen({required this.cart});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<bool> itemChecked = [];
  bool isNotesDialogOpen = false;
  TextEditingController notesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    itemChecked = List.generate(widget.cart.items.length, (index) => true);
  }

  int calculateTotalPrice() {
    int total = 0;
    for (int i = 0; i < widget.cart.items.length; i++) {
      if (itemChecked[i]) {
        total += widget.cart.items[i].totalPrice;
      }
    }
    return total;
  }

  void incrementQuantity(int index) {
    setState(() {
      if (widget.cart.items[index].quantity < 30) {
        widget.cart.items[index].quantity++;
        // Recalculate the total price
        widget.cart.items[index].totalPrice =
            widget.cart.items[index].price * widget.cart.items[index].quantity;
      }
    });
  }

  void decrementQuantity(int index) {
    setState(() {
      if (widget.cart.items[index].quantity > 1) {
        widget.cart.items[index].quantity--;
        // Recalculate the total price
        widget.cart.items[index].totalPrice =
            widget.cart.items[index].price * widget.cart.items[index].quantity;
      }
    });
  }

  void openNotesDialog() {
    setState(() {
      isNotesDialogOpen = true;
    });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Theme(
          data: ThemeData(
            // Customize the dialog background color
            dialogBackgroundColor: Color(0xFFF6F4EB), // Set background color
            // Customize the title text style
            textTheme: TextTheme(
              headline6: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            // Set button color
          ),
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0), // Set border radius
            ),
            title: Text("Add Notes"),
            content: TextField(
              controller: notesController,
              decoration: InputDecoration(
                hintText: "Enter your notes here",
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  "Cancel",
                  style: TextStyle(
                    color: Color(0xFF4682A9), // Set button text color
                  ),
                ),
                onPressed: () {
                  setState(() {
                    isNotesDialogOpen = false;
                  });
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text(
                  "Save",
                  style: TextStyle(
                    color: Color(0xFF4682A9), // Set button text color
                  ),
                ),
                onPressed: () {
                  // Handle saving the notes here, you can use notesController.text to access the entered notes.
                  setState(() {
                    isNotesDialogOpen = false;
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartNotifier>().cart;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75.0,
        backgroundColor: Color(0xFFF6F4EB),
        automaticallyImplyLeading: true,
        elevation: 4.0,
        titleSpacing: 0.0,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Shopping Cart',
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                    fontSize: 19, color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      backgroundColor: Color(0xFFF6F4EB),
      body: widget.cart.items.isEmpty
          ? Container(
        color:  Color(0xFFF6F4EB),
        child: Center(
          child: Image.asset('assets/EmptyCart.png'),
        ),
      )
          : Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
        child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 0.0),
                    child: Row(
                      children: [
                        Icon(Icons.location_pin, color: Color(0xFF4682A9),),
                        SizedBox(width: 10,),
                        Text(
                          'Delivering to',
                          style: TextStyle(
                            fontSize: 13.5,
                          ),
                        ),
                        Text(
                          " Arthur's House",
                          style: TextStyle(
                            fontSize: 13.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_down_outlined, color: Colors.black.withOpacity(0.35),),
                      ],
                    ),
                  ),
                  Container(
                    color: Color(0xFFF6F4EB),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: widget.cart.items.length,
                        itemBuilder: (context, index) {
                          final cartItem = widget.cart.items[index];
                          return Container(
                            padding: EdgeInsets.only(top: 9.0),
                            margin: EdgeInsets.symmetric(vertical: 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xFFF6F4EB),
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
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.grey.withOpacity(0.4),
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 7.5),
                                    child: Row(
                                      children: [
                                        Checkbox(
                                          value: itemChecked[index],
                                          onChanged: (value) {
                                            setState(() {
                                              itemChecked[index] = value!;
                                            });
                                          },
                                          activeColor: Color(0xFF4682A9),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Image.asset(
                                            'assets/${cartItem.images}', width: 105,
                                            height: 70,),
                                        ),
                                        SizedBox(width: 15),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            children: [
                                              Text(cartItem.productName,
                                                  style: GoogleFonts.plusJakartaSans(
                                                    textStyle: TextStyle(fontSize: 14,
                                                        color: Colors.black,
                                                        fontWeight: FontWeight.bold),
                                                  )),
                                              SizedBox(height: 6.5,),
                                              Text("Rp${NumberFormat('#,###', 'idn').format(
                                                  cartItem.totalPrice)}",
                                                  style: GoogleFonts.plusJakartaSans(
                                                    textStyle: TextStyle(fontSize: 13,
                                                        color: Color(0xFF4682A9),
                                                        fontWeight: FontWeight.bold),
                                                  )),
                                              SizedBox(height: 10,),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    SizedBox(width: 4,),
                                    TextButton(
                                      onPressed: () {
                                        openNotesDialog();
                                      },
                                      child: Text(
                                        'Add Notes',
                                        style: GoogleFonts.plusJakartaSans(
                                          textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF4682A9)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 106.1,),
                                    IconButton(
                                      icon: Icon(Icons.delete_outline_rounded,
                                        color: Colors.red.withOpacity(0.8),),
                                      onPressed: () {
                                        widget.cart.removeFromCart(index);
                                        setState(() {});
                                      },
                                    ),
                                    SizedBox(width: 10,),
                                    IconButton(
                                      icon: Icon(Icons.remove_circle_outline_outlined,
                                        color: widget.cart.items[index].quantity > 1 ? Color(0xFF4682A9) : Colors.black.withOpacity(0.5),
                                      ),
                                      onPressed: () {
                                        decrementQuantity(index);
                                      },
                                    ),
                                    Text(
                                      "${cartItem.quantity.toString()}",
                                      style: GoogleFonts.plusJakartaSans(
                                        textStyle: TextStyle(fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black
                                        ),
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.add_circle_outline_outlined,
                                        color: cartItem.quantity < 30 ? Color(0xFF4682A9) : Colors.black.withOpacity(0.5),
                                      ),
                                      onPressed: () {
                                        incrementQuantity(index);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
        ),
      ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF6F4EB),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 2,
                      offset: Offset(3, 1),
                    ),
                  ],
                ),
                padding: EdgeInsets.fromLTRB(20.0, 22.5, 20.0, 22.5),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total Price',
                            style: GoogleFonts.plusJakartaSans(
                              textStyle: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(height: 8,),
                          Text(
                            'Rp${NumberFormat('#,###', 'idn').format(calculateTotalPrice())}',
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => PaymentScreen(cart: cart)),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF4682A9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        minimumSize: Size(150, 48),
                      ),
                      child: Text(
                        'Checkout',
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
    );
  }
}
