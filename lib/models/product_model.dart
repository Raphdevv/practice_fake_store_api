class ProductResponseModel {
  int? id;
  String? title;
  double? price;
  String? category;
  String? description;
  String? image;

  ProductResponseModel({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.image,
  });
  factory ProductResponseModel.fromJson(Map<String, dynamic> data) {
    return ProductResponseModel(
      id: data['id'] ?? 0,
      title: data['title'] ?? '',
      price: double.tryParse(data['price'].toString()) ?? 0.0,
      category: data['category'] ?? '',
      description: data['description'] ?? '',
      image: data['image'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "price": price,
      "category": category,
      "description": description,
      "image": image
    };
  }
}
