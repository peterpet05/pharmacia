import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pharmacia/controllers/cart_controller.dart';

class CartNotifier extends ChangeNotifier {
  final Cart cart = Cart();
}