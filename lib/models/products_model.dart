class Product {
  final String title;
  final String thumbnail;
  final String category;
  final int price;

  Product({required this.title, required this.thumbnail, required this.category, required this.price});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      title: json['title'],
      thumbnail: json['thumbnail'],
      category: json['category'],
      price: json['price'],
    );
  }
}

class ProductPost {
  final List<Product> products;

  ProductPost({required this.products});

  factory ProductPost.fromJson(Map<String, dynamic> json) {
    var list = json['products'] as List;
    List<Product> productList = list.map((product) => Product.fromJson(product)).toList();

    return ProductPost(
      products: productList,
    );
  }
}