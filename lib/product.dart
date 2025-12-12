class Product{
  int id; 
  String title; 
  String description; 
  String image;
  dynamic price;
  String category;
  Product({
    required this.id, 
    required this.title, 
    required this.description, 
    required this.category, 
    required this.image, 
    required this.price
  });

  factory Product.fromJson(Map<String, dynamic> json){
    return Product(
      id: json['id'] ?? 0, 
      title: json['title']??'', 
      description: json['description']??'', 
      category: json['category']??'', 
      image: json['image']??'', 
      price: json['price']?? 0);
  }
}