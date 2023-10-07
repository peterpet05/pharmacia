import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pharmacia/cart.dart';
import 'package:pharmacia/main_screen.dart';
import 'package:pharmacia/navigation_bar/home_page.dart';
import 'package:provider/provider.dart';


class ShipmentMethod {
  final String method;
  final String duration;
  final int price;

  ShipmentMethod(this.method, this.price, this.duration);
}



class CustomAlertDialog extends StatelessWidget {
  final String imageUrl;
  final int totalPrice;
  final Cart cart; // Add a parameter to receive the Cart object

  CustomAlertDialog({required this.imageUrl, required this.totalPrice, required this.cart});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(Icons.close, size: 20, color: Colors.black.withOpacity(0.5),),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainScreen()),
                );

                int currentBalance = Provider.of<PharmaWallet>(context, listen: false).balance;
                int updatedBalance = currentBalance - totalPrice;
                context.read<PharmaWallet>().updateBalance(updatedBalance);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 0),
            child: Image.asset(imageUrl),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              cart.clearCart();

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainScreen()),
              );

              int currentBalance = Provider.of<PharmaWallet>(context, listen: false).balance;
              int updatedBalance = currentBalance - totalPrice;

              context.read<PharmaWallet>().updateBalance(updatedBalance);
            },
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF4682A9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              minimumSize: Size(175, 44),
            ),
            child: Text(
              'Continue Shopping',
              style: GoogleFonts.inter(
                textStyle: TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold),
              ),
            ),
          ),

          SizedBox(height: 10.0),
        ],
      ),
    );
  }
}


class PaymentScreen extends StatefulWidget {
  final Cart cart;

  PaymentScreen({required this.cart});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool isDeliveryTypeSelected = false;

  TextEditingController notesController = TextEditingController();

  int selectedShippingPrice = 0;

  void _showOrderConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomAlertDialog(
          imageUrl: 'assets/PaySuccess.png',
          totalPrice: calculateTotalPrice(),
          cart: widget.cart, // Pass the cart object here
        );
      },
    );
  }


  int calculateTotalPrice() {
    int productTotal = 0;
    for (int i = 0; i < widget.cart.items.length; i++) {
      productTotal += widget.cart.items[i].totalPrice;
    }
    return productTotal + selectedShippingPrice;
  }

  List<ShipmentMethod> shipmentMethods = [
    ShipmentMethod("Instant Shipping", 35000, "2-4 hours"),
    ShipmentMethod("Same Day Shipping", 24000, "6-8 hours"),
    ShipmentMethod("Next Day Shipping", 22000, "1-2 days"),
    ShipmentMethod("Standard Shipping", 9000, "4-5 days"),
    ShipmentMethod("Express Shipping", 21000, "2-3 days"),
  ];
  String selectedShipmentMethod = "Choose Delivery Type                          ";


  void _showShipmentMethodPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(13.0, 13.0, 13.0, 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(Icons.close, color: Colors.black.withOpacity(0.5),),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      'Select Delivery Type',
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: TextStyle(
                            fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                      )
                  ),
                  ],
                ),
              ),
              Container(
                height: 360,
                child: ListView.builder(
                  itemCount: shipmentMethods.length,
                  itemBuilder: (context, index) {
                    final shipmentMethod = shipmentMethods[index]; // Access the ShipmentMethod
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                      child: ListTile(
                        title: Text(
                          shipmentMethod.method + " (Rp${NumberFormat('#,###', 'idn').format(
                            shipmentMethod.price)})",
                          style: GoogleFonts.plusJakartaSans(
                            textStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        subtitle: Text(
                          shipmentMethod.duration, // Use shipmentMethod
                        ),
                        trailing: selectedShipmentMethod == shipmentMethod.method + " (Rp${NumberFormat('#,###', 'idn').format(
                            shipmentMethod.price)})"
                            ? Icon(Icons.check, color: Color(0xFF4682A9))
                            : null,
                          onTap: () {
                            setState(() {
                              selectedShipmentMethod = shipmentMethod.method + " (Rp${NumberFormat('#,###', 'idn').format(
                                  shipmentMethod.price)})";
                              selectedShippingPrice = shipmentMethod.price;
                              isDeliveryTypeSelected = true; // Update the flag when a delivery type is selected
                            });
                            Navigator.pop(context);
                          },
                      ),
                    );
                  },
                )
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    int totalPrice = calculateTotalPrice();

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
              'Payment',
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
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
                            SizedBox(width: 67),
                            Text(
                              "Change Address",
                              style: TextStyle(
                                  fontSize: 11.5,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF4682A9)
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 1,),
                        Padding(
                          padding: const EdgeInsets.only(left: 34),
                          child: Text(
                            'John Arthur (084837819108)',
                            style: TextStyle(
                              fontSize: 11.5,
                            ),
                          ),
                        ),
                        SizedBox(height: 1,),
                        Padding(
                          padding: const EdgeInsets.only(left: 34),
                          child: Text(
                            '2601 Orval Plain, Lake Nakiaview, Wisconsin, 191113',
                            style: TextStyle(
                              fontSize: 11.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Divider(thickness: 2,),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
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
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: widget.cart.items.length,
                          itemBuilder: (context, index) {
                            final cartItem = widget.cart.items[index];
                            final isLastItem = index == widget.cart.items.length - 1; // Check if it's the last item
                            return Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: isLastItem
                                          ? BorderSide.none // No border for the last item
                                          : BorderSide(
                                        color: Colors.grey.withOpacity(0.4),
                                        width: 1.0,
                                      ),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 7.5),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Image.asset(
                                            'assets/${cartItem.images}',
                                            width: 105,
                                            height: 70,
                                          ),
                                        ),
                                        SizedBox(width: 15),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 12.5),
                                              Text(
                                                cartItem.productName,
                                                style: GoogleFonts.plusJakartaSans(
                                                  textStyle: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 6.5,),
                                              Text(
                                                "Quantity: ${cartItem.quantity.toString()}",
                                                style: GoogleFonts.plusJakartaSans(
                                                  textStyle: TextStyle(
                                                    fontSize: 11.5,
                                                    color: Colors.black.withOpacity(0.5),
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 10,),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    "Rp${NumberFormat('#,###', 'idn').format(
                                                        cartItem.totalPrice)}",
                                                    style: GoogleFonts.plusJakartaSans(
                                                      textStyle: TextStyle(
                                                        fontSize: 13,
                                                        color: Color(0xFF4682A9),
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 10,),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 3.0, 15.0, 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xFFF6F4EB),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 1,
                            offset: Offset(1, 1),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: TextButton(
                          onPressed: () {
                            _showShipmentMethodPicker(context);
                          },
                          child: Row(
                            children: [
                              SizedBox(width: 10,),
                              Icon(Icons.local_shipping_outlined, color: Color(0xFF4682A9)),
                              SizedBox(width: 15,),
                              Text(
                                selectedShipmentMethod,
                                style: GoogleFonts.plusJakartaSans(
                                  textStyle: TextStyle(fontSize: 13,
                                      color: Color(0xFF4682A9),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(width: 70,),
                              Expanded(child: Icon(Icons.chevron_right, size: 22, color: Colors.black.withOpacity(0.5),)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 25.0, 15.0, 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xFFF6F4EB),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 1,
                            offset: Offset(1, 1),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.asset('assets/Wallet.png'),
                                    SizedBox(width: 12.5,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Pharma Wallet",
                                          style: GoogleFonts.inter(
                                            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        SizedBox(height: 2,),
                                        Text(
                                          "Rp${NumberFormat('#,###', 'idn').format(getPharmaWalletBalance(context))}",
                                          style: GoogleFonts.inter(
                                            textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black.withOpacity(0.5)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(), // Add Spacer to push the switch to the right
                                    Switch(
                                      value: true, // You can set the initial value of the switch here
                                      onChanged: (bool newValue) {
                                        // Handle switch state changes here
                                        if (newValue) {
                                          // Subtract the total amount from the balance when the switch is turned on
                                          int currentBalance = Provider.of<PharmaWallet>(context, listen: false).balance;
                                          int updatedBalance = currentBalance - calculateTotalPrice();
                                          // Update the balance
                                          context.read<PharmaWallet>().updateBalance(updatedBalance);
                                        } else {
                                          // Handle switch off if needed
                                        }
                                      },
                                      activeColor: Color(0xFF4682A9),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5,),
                                Divider(thickness: 2,),
                                SizedBox(height: 5,),
                                Row(
                                  children: [
                                    Image.asset('assets/Coins.png'),
                                    SizedBox(width: 12.5,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Pharma Coins",
                                          style: GoogleFonts.inter(
                                            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        SizedBox(height: 2,),
                                        Text(
                                          "Can't be used on this transation",
                                          style: GoogleFonts.inter(
                                            textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black.withOpacity(0.5)),
                                          ),
                                        ),

                                      ],
                                    ),
                                    Spacer(),
                                    Switch(
                                      value: false,
                                      onChanged: (bool newValue) {

                                      },
                                      activeColor: Color(0xFF4682A9),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                          ),
                        ],
                      ),
                    ),
                  )
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
                  onPressed: isDeliveryTypeSelected && getPharmaWalletBalance(context) >= totalPrice
                      ? () {
                    _showOrderConfirmationDialog(context);
                  }
                      : null,
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF4682A9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    minimumSize: Size(150, 48),
                  ),
                  child: Text(
                    'Place Order',
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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