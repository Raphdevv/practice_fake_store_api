class CartResponseModel {
  int? id;
  int? userId;
  String? date;
  List<dynamic>? products;

  CartResponseModel({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
  });

  factory CartResponseModel.fromJson(Map<String, dynamic> data) {
    return CartResponseModel(
      id: data['id'] ?? 0,
      userId: data['userId'] ?? 0,
      date: data['date'] ?? '',
      products: data['products'] ?? [],
    );
  }

  void addAll(CartResponseModel element) {}
}
