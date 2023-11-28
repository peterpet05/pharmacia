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
    int totalPrice = price * quantity;

    for (var item in items) {
      if (item.productName == productName) {
        item.quantity += quantity;
        item.totalPrice += totalPrice;
        return;
      }
    }


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