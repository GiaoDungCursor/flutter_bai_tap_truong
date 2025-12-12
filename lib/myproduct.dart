class Product {
  int id;
  String title;
  String description;
  String image;
  double price;
  String category;
  double rate;
  int count;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.price,
    required this.category,
    required this.rate,
    required this.count,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    final rating = json['rating'] as Map<String, dynamic>?;
    return Product(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      price: (json['price'] is num) ? (json['price'] as num).toDouble() : 0.0,
      category: json['category'] ?? '',
      rate: (rating != null && rating['rate'] is num) ? (rating['rate'] as num).toDouble() : 0.0,
      count: (rating != null && rating['count'] is int) ? rating['count'] as int : ((rating != null && rating['count'] is num) ? (rating['count'] as num).toInt() : 0),
    );
  }
}
