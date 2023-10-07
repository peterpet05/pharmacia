import 'package:flutter/foundation.dart';

class CartItem {
  final String productName;
  final int price;
  int quantity;
  final String images;
  int totalPrice;

  CartItem({required this.productName, required this.price, required this.quantity, required this.totalPrice, required this.images});
}

class Cart {
  final List<CartItem> items = [];

  void addToCart(String productName, int price, int quantity, int totalPrice, String image) {
    // Calculate the total price
    int totalPrice = price * quantity;

    // Check if the product is already in the cart
    for (var item in items) {
      if (item.productName == productName) {
        // Update the quantity and total price if the product is already in the cart
        item.quantity += quantity;
        item.totalPrice += totalPrice;
        return;
      }
    }

    // If the product is not in the cart, add it as a new item
    items.add(CartItem(productName: productName, price: price, quantity: quantity, totalPrice: totalPrice, images: image));
  }

  void removeFromCart(int index) {
    items.removeAt(index);
  }

  int getTotalPrice() {
    int total = 0;
    for (var item in items) {
      total += item.totalPrice;
    }
    return total;
  }

  void clearCart() {
    items.clear();
  }
}