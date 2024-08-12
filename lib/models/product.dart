class Product {
  final int? id;
  final String name;
  final String imageUrl;
  final double price;
  final String? description;

  Product({
     this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    this.description,
  });

  // Convert JSON to Product
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      price: json['price'],
      description: json['description'],
    );
  }

  // Convert Product to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'price': price,
      'description': description,
    };
  }
}
