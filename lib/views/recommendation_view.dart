import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:pharmacia/models/products_model.dart';
import 'package:pharmacia/utils/api_services.dart';

class Recommendation extends StatefulWidget {
  const Recommendation({super.key});

  @override
  State<Recommendation> createState() => _RecommendationState();
}

class _RecommendationState extends State<Recommendation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F4EB),
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
              'Recommendation',
              style: GoogleFonts.inter(
                textStyle: TextStyle(fontSize: 19, color: Colors.black, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: FutureBuilder<ProductPost>(
        future: getPosts(),
        builder: (context, AsyncSnapshot<ProductPost> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<Product> products = snapshot.data!.products;

            return ListView.builder(
              itemCount: (products.length / 2).ceil(),
              itemBuilder: (BuildContext context, int index) {
                final int firstIndex = index * 2;
                final int secondIndex = firstIndex + 1;
                final bool isOddLength = products.length.isOdd;
                final bool isLastItem = index == (products.length / 2).floor();
                final double containerWidth = MediaQuery.of(context).size.width / 2 - 17.5;

                return Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 14, right: 10, bottom: 5.0),
                  child: Row(
                    children: [
                      Container(
                        width: containerWidth,
                        decoration: BoxDecoration(
                          color: Color(0xFFF6F4EB),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Colors.black.withOpacity(0.5),
                            width: 0.5,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
                              child: Image.network(
                                products.length > firstIndex ? products[firstIndex].thumbnail : "",
                                width: double.infinity,
                                height: 125,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Divider(height: 1, color: Colors.black.withOpacity(0.5)),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(12.0, 10.0, 15.0, 0.0),
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 2.0),
                                decoration: BoxDecoration(
                                  color: Color(0xFF4682A9),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Text(
                                  products.length > firstIndex ? products[firstIndex].category : "",
                                  style: TextStyle(
                                    fontSize: 8,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(12.0, 4.0, 15.0, 0.0),
                              child: Text(
                                products.length > firstIndex ? products[firstIndex].title : "",
                                style: GoogleFonts.plusJakartaSans(
                                  textStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(12.0, 6.5, 15.0, 10.0),
                              child: Text(
                              "Rp${NumberFormat('#,###', 'idn').format(products.length > firstIndex ? products[firstIndex].price : "")}",
                                style: GoogleFonts.plusJakartaSans(
                                textStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF4682A9)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (secondIndex < products.length)
                        SizedBox(width: 10.5),
                      if (secondIndex < products.length)
                        Container(
                          width: isOddLength && isLastItem ? null : containerWidth,
                          decoration: BoxDecoration(
                            color: Color(0xFFF6F4EB),
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: Colors.black.withOpacity(0.5),
                              width: 0.5,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
                                child: Image.network(
                                  products.length > secondIndex ? products[secondIndex].thumbnail : "",
                                  width: double.infinity,
                                  height: 125,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Divider(height: 1, color: Colors.black.withOpacity(0.5)),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(12.0, 10.0, 15.0, 0.0),
                                child: Container(
                                  padding: const EdgeInsets.fromLTRB(10.0, 2.0, 10.0, 2.0),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF4682A9),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Text(
                                    products.length > secondIndex ? products[secondIndex].category : "",
                                    style: TextStyle(
                                      fontSize: 8,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(12.0, 4.0, 15.0, 0.0),
                                child: Text(
                                  products.length > secondIndex ? products[secondIndex].title : "",
                                  style: GoogleFonts.plusJakartaSans(
                                    textStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(12.0, 6.5, 15.0, 10.0),
                                child: Text(
                                  "Rp${NumberFormat('#,###', 'idn').format(products.length > secondIndex ? products[secondIndex].price : "")}",
                                  style: GoogleFonts.plusJakartaSans(
                                    textStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Color(0xFF4682A9)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
