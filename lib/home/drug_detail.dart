import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pharmacia/cart_notifier.dart';
import 'package:pharmacia/cart_screen.dart';
import 'package:pharmacia/notifications.dart';
import 'package:provider/provider.dart';

class PanadolDetail extends StatefulWidget {

  const PanadolDetail({Key? key}) : super(key: key);

  @override
  _PanadolDetailState createState() => _PanadolDetailState();
}
class _PanadolDetailState extends State<PanadolDetail> {

  int _quantity = 0;
  int get quantity=>_quantity;


  void setQuantity(bool isIncrement) {
    setState(() {
      if (isIncrement) {
        _quantity = checkQuantity(_quantity + 1);
      } else {
        _quantity = checkQuantity(_quantity - 1);
      }
    });
  }

  int checkQuantity(int quantity) {
    if(quantity < 0) {
      return 0;
    }
    else if(quantity > 30){
      return 30;
    }
    else {
      return quantity;
    }
  }


  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartNotifier>().cart;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [Color(0xFF4682A9), Color(0xFFAEF0FF)],
            ),
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 60,),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 10,),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Color(0xFFF6F4EB),
                            size: 27,
                          ),
                        ),
                        SizedBox(width: 250,),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CartScreen(cart: cart)),
                            );
                          },
                          child: Icon(
                            Icons.shopping_cart,
                            color: Color(0xFFF6F4EB),
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
                            Icons.notifications,
                            color: Color(0xFFF6F4EB),
                            size: 27,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 70),
                  Center(
                    child: Image.asset(
                      'assets/PanadolDetail.png',
                    ),
                  ),
                  SizedBox(height: 70),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF6F4EB),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(40.0, 30.0, 40.0, 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Flexible(
                                child: Text(
                                  "Panadol Extra Tablet (10 Tab/Strip)",
                                  style: GoogleFonts.plusJakartaSans(
                                    textStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Image.asset(
                                'assets/Wishlist.png',
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: <Widget>[
                              Text(
                                "Rp. 15.000",
                                style: GoogleFonts.plusJakartaSans(
                                  textStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF4682A9)),
                                ),
                              ),
                              SizedBox(width: 15,),
                              Image.asset(
                                'assets/InStock.png',
                              ),
                            ],
                          ),
                          SizedBox(height: 16,),
                          Divider(
                            color: Color(0xFF8E8C8C),
                            thickness: 1.0,
                          ),
                          SizedBox(height: 11,),
                          Text(
                            "Product Details",
                            style: GoogleFonts.plusJakartaSans(
                              textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.black,
                                decorationThickness: 1.5, //
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Category",
                            style: GoogleFonts.plusJakartaSans(
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Pain killer, Medicines & Treatments, Fever, Pain Relief, Headache",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Description",
                            style: GoogleFonts.plusJakartaSans(
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Panadol Extra is a medication containing Paracetamol and Caffeine. This medication can be used to alleviate headaches and toothaches. Paracetamol, as an analgesic, works by increasing the pain threshold, and Caffeine works by inhibiting the action of adenosine receptors, thereby reducing pain sensation.",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Dosage",
                            style: GoogleFonts.plusJakartaSans(
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "The recommended paracetamol dosing for adults and children 12 years and over is 500 to 1000mg every four to six hours as necessary, with a maximum of 4000mg in any 24 hour period.",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Strorage",
                            style: GoogleFonts.plusJakartaSans(
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Keep Panadol in a cool, dry place away from direct sunlight and out of reach of children.",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 85,
        padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
        decoration: BoxDecoration(
          color: Color(0xFFF6F4EB),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color(0xFF4682A9),
                  width: 1.0,
                ),
                color: Color(0xFFF6F4EB),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setQuantity(false);
                    },
                    child: Icon(Icons.remove, color: Color(0xFF4682A9)),
                  ),
                  SizedBox(width: 7),
                  Text(
                    quantity.toString(),
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(width: 7),
                  GestureDetector(
                    onTap: () {
                      setQuantity(true);
                    },
                    child: Icon(Icons.add, color: Color(0xFF4682A9)),
                  ),
                ],
              ),
            ),
            GestureDetector(
              child: Container(
                height: 50,
                width: 230,
                padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                child: Row(
                  children:[
                    SizedBox(width: 53),
                    Center(
                      child: Text(
                        "Add to cart",
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF6F4EB),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF4682A9),
                ),
              ),
              onTap: () {
                if (quantity > 0) {
                  int totalPrice = 15000 * quantity; // Calculate the total price here
                  cart.addToCart("Panadol Extra", 15000, quantity, totalPrice, "PanadolDetail.png");
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${quantity.toString()} ${quantity == 1 ? 'item' : 'items'} added to cart'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Quantity must be greater than 1'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PromagDetail extends StatefulWidget {
  const PromagDetail({Key? key}) : super(key: key);

  @override
  _PromagDetailState createState() => _PromagDetailState();
}
class _PromagDetailState extends State<PromagDetail> {

  int _quantity = 0;
  int get quantity=>_quantity;


  void setQuantity(bool isIncrement) {
    setState(() {
      if (isIncrement) {
        _quantity = checkQuantity(_quantity + 1);
      } else {
        _quantity = checkQuantity(_quantity - 1);
      }
    });
  }

  int checkQuantity(int quantity) {
    if(quantity < 0) {
      return 0;
    }
    else if(quantity > 30){
      return 30;
    }
    else {
      return quantity;
    }
  }


  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartNotifier>().cart;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [Color(0xFF4682A9), Color(0xFFAEF0FF)],
            ),
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 60,),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 10,),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Color(0xFFF6F4EB),
                            size: 27,
                          ),
                        ),
                        SizedBox(width: 250,),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CartScreen(cart: cart)),
                            );
                          },
                          child: Icon(
                            Icons.shopping_cart,
                            color: Color(0xFFF6F4EB),
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
                            Icons.notifications,
                            color: Color(0xFFF6F4EB),
                            size: 27,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 70),
                  Center(
                    child: Image.asset(
                      'assets/PromagDetail.png',
                    ),
                  ),
                  SizedBox(height: 70),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF6F4EB),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(40.0, 30.0, 40.0, 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Flexible(
                                child: Text(
                                  "Promag Tablet (10 Tab/Strip)",
                                  style: GoogleFonts.plusJakartaSans(
                                    textStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Image.asset(
                                'assets/Wishlist.png',
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: <Widget>[
                              Text(
                                "Rp. 10.000",
                                style: GoogleFonts.plusJakartaSans(
                                  textStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF4682A9)),
                                ),
                              ),
                              SizedBox(width: 15,),
                              Image.asset(
                                'assets/InStock.png',
                              ),
                            ],
                          ),
                          SizedBox(height: 16,),
                          Divider(
                            color: Color(0xFF8E8C8C),
                            thickness: 1.0,
                          ),
                          SizedBox(height: 11,),
                          Text(
                            "Product Details",
                            style: GoogleFonts.plusJakartaSans(
                              textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.black,
                                decorationThickness: 1.5, //
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Category",
                            style: GoogleFonts.plusJakartaSans(
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Pain killer, Medicines & Treatments, Fever, Pain Relief, Headache",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Description",
                            style: GoogleFonts.plusJakartaSans(
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Promag is a medication containing Paracetamol and Caffeine. This medication can be used to alleviate headaches and toothaches. Paracetamol, as an analgesic, works by increasing the pain threshold, and Caffeine works by inhibiting the action of adenosine receptors, thereby reducing pain sensation.",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Dosage",
                            style: GoogleFonts.plusJakartaSans(
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "The recommended Promag dosing for adults and children 12 years and over is 500 to 1000mg every four to six hours as necessary, with a maximum of 4000mg in any 24 hour period.",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Strorage",
                            style: GoogleFonts.plusJakartaSans(
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Keep Promag in a cool, dry place away from direct sunlight and out of reach of children.",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 85,
        padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
        decoration: BoxDecoration(
          color: Color(0xFFF6F4EB),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color(0xFF4682A9),
                  width: 1.0,
                ),
                color: Color(0xFFF6F4EB),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setQuantity(false);
                    },
                    child: Icon(Icons.remove, color: Color(0xFF4682A9)),
                  ),
                  SizedBox(width: 7),
                  Text(
                    quantity.toString(),
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(width: 7),
                  GestureDetector(
                    onTap: () {
                      setQuantity(true);
                    },
                    child: Icon(Icons.add, color: Color(0xFF4682A9)),
                  ),
                ],
              ),
            ),
            GestureDetector(
              child: Container(
                height: 50,
                width: 230,
                padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                child: Row(
                  children:[
                    SizedBox(width: 53),
                    Center(
                      child: Text(
                        "Add to cart",
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF6F4EB),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF4682A9),
                ),
              ),
              onTap: () {
                if (quantity > 0) {
                  int totalPrice = 10000 * quantity; // Calculate the total price here
                  cart.addToCart("Promag Tablet", 10000, quantity, totalPrice, "PromagDetail.png");
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${quantity.toString()} ${quantity == 1 ? 'item' : 'items'} added to cart'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Quantity must be greater than 1'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class EntrostopDetail extends StatefulWidget {
  const EntrostopDetail({Key? key}) : super(key: key);

  @override
  _EntrostopDetailState createState() => _EntrostopDetailState();
}
class _EntrostopDetailState extends State<EntrostopDetail> {

  int _quantity = 0;
  int get quantity=>_quantity;


  void setQuantity(bool isIncrement) {
    setState(() {
      if (isIncrement) {
        _quantity = checkQuantity(_quantity + 1);
      } else {
        _quantity = checkQuantity(_quantity - 1);
      }
    });
  }

  int checkQuantity(int quantity) {
    if(quantity < 0) {
      return 0;
    }
    else if(quantity > 30){
      return 30;
    }
    else {
      return quantity;
    }
  }


  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartNotifier>().cart;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [Color(0xFF4682A9), Color(0xFFAEF0FF)],
            ),
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 60,),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 10,),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Color(0xFFF6F4EB),
                            size: 27,
                          ),
                        ),
                        SizedBox(width: 250,),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CartScreen(cart: cart)),
                            );
                          },
                          child: Icon(
                            Icons.shopping_cart,
                            color: Color(0xFFF6F4EB),
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
                            Icons.notifications,
                            color: Color(0xFFF6F4EB),
                            size: 27,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 70),
                  Center(
                    child: Image.asset(
                      'assets/EntrostopDetail.png',
                    ),
                  ),
                  SizedBox(height: 70),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF6F4EB),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(40.0, 30.0, 40.0, 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Flexible(
                                child: Text(
                                  "Entrostop Tablet  (10 Tab/Strip)",
                                  style: GoogleFonts.plusJakartaSans(
                                    textStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Image.asset(
                                'assets/Wishlist.png',
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: <Widget>[
                              Text(
                                "Rp. 10.000",
                                style: GoogleFonts.plusJakartaSans(
                                  textStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF4682A9)),
                                ),
                              ),
                              SizedBox(width: 15,),
                              Image.asset(
                                'assets/InStock.png',
                              ),
                            ],
                          ),
                          SizedBox(height: 16,),
                          Divider(
                            color: Color(0xFF8E8C8C),
                            thickness: 1.0,
                          ),
                          SizedBox(height: 11,),
                          Text(
                            "Product Details",
                            style: GoogleFonts.plusJakartaSans(
                              textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.black,
                                decorationThickness: 1.5, //
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Category",
                            style: GoogleFonts.plusJakartaSans(
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Pain killer, Medicines & Treatments, Fever, Pain Relief, Headache",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Description",
                            style: GoogleFonts.plusJakartaSans(
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Entrostop Tablet is a medication containing Paracetamol and Caffeine. This medication can be used to alleviate headaches and toothaches. Paracetamol, as an analgesic, works by increasing the pain threshold, and Caffeine works by inhibiting the action of adenosine receptors, thereby reducing pain sensation.",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Dosage",
                            style: GoogleFonts.plusJakartaSans(
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "The recommended Entrostop dosing for adults and children 12 years and over is 500 to 1000mg every four to six hours as necessary, with a maximum of 4000mg in any 24 hour period.",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Strorage",
                            style: GoogleFonts.plusJakartaSans(
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Keep Entrostop in a cool, dry place away from direct sunlight and out of reach of children.",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 85,
        padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
        decoration: BoxDecoration(
          color: Color(0xFFF6F4EB),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color(0xFF4682A9),
                  width: 1.0,
                ),
                color: Color(0xFFF6F4EB),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setQuantity(false);
                    },
                    child: Icon(Icons.remove, color: Color(0xFF4682A9)),
                  ),
                  SizedBox(width: 7),
                  Text(
                    quantity.toString(),
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(width: 7),
                  GestureDetector(
                    onTap: () {
                      setQuantity(true);
                    },
                    child: Icon(Icons.add, color: Color(0xFF4682A9)),
                  ),
                ],
              ),
            ),
            GestureDetector(
              child: Container(
                height: 50,
                width: 230,
                padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                child: Row(
                  children:[
                    SizedBox(width: 53),
                    Center(
                      child: Text(
                        "Add to cart",
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF6F4EB),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF4682A9),
                ),
              ),
              onTap: () {
                if (quantity > 0) {
                  int totalPrice = 10000 * quantity; // Calculate the total price here
                  cart.addToCart("Entrostop Tablet", 10000, quantity, totalPrice, "EntrostopDetail.png");
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${quantity.toString()} ${quantity == 1 ? 'item' : 'items'} added to cart'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Quantity must be greater than 1'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ParacetamolDetail extends StatefulWidget {
  const ParacetamolDetail({Key? key}) : super(key: key);

  @override
  _ParacetamolDetailState createState() => _ParacetamolDetailState();
}
class _ParacetamolDetailState extends State<ParacetamolDetail> {

  int _quantity = 0;
  int get quantity=>_quantity;


  void setQuantity(bool isIncrement) {
    setState(() {
      if (isIncrement) {
        _quantity = checkQuantity(_quantity + 1);
      } else {
        _quantity = checkQuantity(_quantity - 1);
      }
    });
  }

  int checkQuantity(int quantity) {
    if(quantity < 0) {
      return 0;
    }
    else if(quantity > 30){
      return 30;
    }
    else {
      return quantity;
    }
  }


  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartNotifier>().cart;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [Color(0xFF4682A9), Color(0xFFAEF0FF)],
            ),
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 60,),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Row(
                      children: <Widget>[
                        SizedBox(width: 10,),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Color(0xFFF6F4EB),
                            size: 27,
                          ),
                        ),
                        SizedBox(width: 250,),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CartScreen(cart: cart)),
                            );
                          },
                          child: Icon(
                            Icons.shopping_cart,
                            color: Color(0xFFF6F4EB),
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
                            Icons.notifications,
                            color: Color(0xFFF6F4EB),
                            size: 27,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 70),
                  Center(
                    child: Image.asset(
                      'assets/ParacetamolDetail.png',
                    ),
                  ),
                  SizedBox(height: 70),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFF6F4EB),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(40.0, 30.0, 40.0, 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Flexible(
                                child: Text(
                                  "Panadol Paracetamol (10 Tab/Strip)",
                                  style: GoogleFonts.plusJakartaSans(
                                    textStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Image.asset(
                                'assets/Wishlist.png',
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: <Widget>[
                              Text(
                                "Rp. 15.000",
                                style: GoogleFonts.plusJakartaSans(
                                  textStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF4682A9)),
                                ),
                              ),
                              SizedBox(width: 15,),
                              Image.asset(
                                'assets/InStock.png',
                              ),
                            ],
                          ),
                          SizedBox(height: 16,),
                          Divider(
                            color: Color(0xFF8E8C8C),
                            thickness: 1.0,
                          ),
                          SizedBox(height: 11,),
                          Text(
                            "Product Details",
                            style: GoogleFonts.plusJakartaSans(
                              textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                decorationColor: Colors.black,
                                decorationThickness: 1.5, //
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Category",
                            style: GoogleFonts.plusJakartaSans(
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Pain killer, Medicines & Treatments, Fever, Pain Relief, Headache",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Description",
                            style: GoogleFonts.plusJakartaSans(
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Panadol Paracetamol is a medication containing Paracetamol and Caffeine. This medication can be used to alleviate headaches and toothaches. Paracetamol, as an analgesic, works by increasing the pain threshold, and Caffeine works by inhibiting the action of adenosine receptors, thereby reducing pain sensation.",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Dosage",
                            style: GoogleFonts.plusJakartaSans(
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "The recommended Panadol Paracetamol dosing for adults and children 12 years and over is 500 to 1000mg every four to six hours as necessary, with a maximum of 4000mg in any 24 hour period.",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Strorage",
                            style: GoogleFonts.plusJakartaSans(
                              textStyle: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500
                              ),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Keep Panadol Paracetamol in a cool, dry place away from direct sunlight and out of reach of children.",
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(height: 8),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 85,
        padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
        decoration: BoxDecoration(
          color: Color(0xFFF6F4EB),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Color(0xFF4682A9),
                  width: 1.0,
                ),
                color: Color(0xFFF6F4EB),
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setQuantity(false);
                    },
                    child: Icon(Icons.remove, color: Color(0xFF4682A9)),
                  ),
                  SizedBox(width: 7),
                  Text(
                    quantity.toString(),
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(width: 7),
                  GestureDetector(
                    onTap: () {
                      setQuantity(true);
                    },
                    child: Icon(Icons.add, color: Color(0xFF4682A9)),
                  ),
                ],
              ),
            ),
            GestureDetector(
              child: Container(
                height: 50,
                width: 230,
                padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                child: Row(
                  children:[
                    SizedBox(width: 53),
                    Center(
                      child: Text(
                        "Add to cart",
                        style: GoogleFonts.inter(
                          textStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF6F4EB),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF4682A9),
                ),
              ),
              onTap: () {
                if (quantity > 0) {
                  int totalPrice = 10000 * quantity; // Calculate the total price here
                  cart.addToCart("Panadol Paracetamol", 15000, quantity, totalPrice, "ParacetamolDetail.png");
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${quantity.toString()} ${quantity == 1 ? 'item' : 'items'} added to cart'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Quantity must be greater than 1'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}