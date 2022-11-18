import 'package:fake_store/constance.dart';
import 'package:fake_store/models/cart_model.dart';
import 'package:fake_store/models/product_model.dart';
import 'package:fake_store/services/api_service.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  int? userId;
  CartPage({super.key, required this.userId});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late APIService _apiService;
  @override
  void initState() {
    super.initState();
    _apiService = APIService();
  }

  @override
  Widget build(BuildContext context) {
    Future<List<CartResponseModel>> cartFuture =
        _apiService.getCartUser(widget.userId);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Your cart',
          style: TextStyle(color: primaryColor),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<CartResponseModel>>(
        future: cartFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final carts = snapshot.data!;
            List<dynamic> productsInCart = [];
            for (var element in carts) {
              productsInCart.add(element.products);
            }
            productsInCart = productsInCart.reduce((value, element) {
              value.addAll(element);
              return value;
            });
            return ListView.builder(
              itemCount: productsInCart.length,
              itemBuilder: (context, index) {
                Future<ProductResponseModel> cart =
                    _apiService.getProduct(productsInCart[index]['productId']);
                return FutureBuilder(
                  future: cart,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final cartUser = snapshot.data!;
                      int quantity = productsInCart[index]['quantity'];
                      double? price = cartUser.price;
                      return Card(
                        child: ListTile(
                          leading: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              child: Image.network(
                                cartUser.image.toString(),
                                height: 90,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title: Text('${cartUser.title}'),
                          subtitle: Row(
                            children: [
                              Text('Quantity: $quantity'),
                              const SizedBox(
                                width: 8,
                              ),
                              Text('Price: ${price! * quantity}'),
                            ],
                          ),
                        ),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(
                        color: primaryColor,
                      ),
                    );
                  },
                );
              },
            );
          }
          return Center(
            child: Text(
              'Wait a moment.',
              style: TextStyle(color: Colors.grey.shade600),
            ),
          );
        },
      ),
    );
  }
}
