import 'package:flutter/foundation.dart';
import 'package:pharmacia/cart.dart';
import 'package:flutter/material.dart';

class CartNotifier extends ChangeNotifier {
  final Cart cart = Cart();
}