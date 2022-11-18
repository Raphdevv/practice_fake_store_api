import 'dart:convert';

import 'package:fake_store/models/cart_model.dart';
import 'package:fake_store/models/product_model.dart';
import 'package:fake_store/models/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/category_model.dart';

class APIService {
  Future<List<ProductResponseModel>> getAllProduct() async {
    Uri url = Uri.http('fakestoreapi.com', '/products', {'q': 'http'});
    List<ProductResponseModel> product = [];

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        product = jsonData
            .map<ProductResponseModel>((e) => ProductResponseModel.fromJson(e))
            .toList();
        if (kDebugMode) {
          print('Successful!');
        }
      } else {
        if (kDebugMode) {
          print("Failed to load.");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('That\'s error $e');
      }
    }

    return product;
  }

  Future<ProductResponseModel> getProduct(int productId) async {
    Uri url =
        Uri.http('fakestoreapi.com', '/products/$productId', {'q': 'http'});
    var data;

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        data = ProductResponseModel.fromJson(jsonData);
        if (kDebugMode) {
          print('Successful!');
        }
      } else {
        if (kDebugMode) {
          print("Failed to load.");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('That\'s error $e');
      }
    }
    return data;
  }

  Future<List<CategoryResponseModel>> getCategory(String category) async {
    Uri url = Uri.http(
        'fakestoreapi.com', '/products/category/$category', {'q': 'http'});
    List<CategoryResponseModel> categorys = [];
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        categorys = jsonData
            .map<CategoryResponseModel>(
                (e) => CategoryResponseModel.fromJson(e))
            .toList();
        if (kDebugMode) {
          print('Successful!');
        }
      } else {
        if (kDebugMode) {
          print("Failed to load.");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('That\'s error $e');
      }
    }
    return categorys;
  }

  Future<UserResponseModel> getUser() async {
    Uri url = Uri.http('fakestoreapi.com', '/users/1', {'q': 'http'});
    var data;
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        data = UserResponseModel.fromJson(jsonData);
        if (kDebugMode) {
          print('Successful!');
        }
      } else {
        if (kDebugMode) {
          print("Failed to load.");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('That\'s error $e');
      }
    }
    return data;
  }

  Future<List<CartResponseModel>> getCartUser(int? userid) async {
    Uri url =
        Uri.http('fakestoreapi.com', '/carts/user/$userid', {'q': 'http'});
    List<CartResponseModel> cartusers = [];
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        cartusers = jsonData
            .map<CartResponseModel>((e) => CartResponseModel.fromJson(e))
            .toList();
        if (kDebugMode) {
          print('Successful!');
        }
      } else {
        if (kDebugMode) {
          print("Failed to load.");
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('That\'s error $e');
      }
    }
    return cartusers;
  }
}
