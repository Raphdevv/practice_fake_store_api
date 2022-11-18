import 'package:fake_store/component/product.dart';
import 'package:fake_store/component/productcategory.dart';
import 'package:fake_store/constance.dart';
import 'package:fake_store/models/category_model.dart';
import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../services/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late APIService _apiService;
  late String category;
  bool check1 = false;
  bool check2 = false;
  bool check3 = false;
  bool check4 = false;

  @override
  void initState() {
    super.initState();
    _apiService = APIService();
    category = "electronics";
  }

  @override
  Widget build(BuildContext context) {
    Future<List<CategoryResponseModel>> future =
        _apiService.getCategory(category);
    Future<List<ProductResponseModel>> productFuture =
        _apiService.getAllProduct();
    if ((check1 == false) &&
        (check2 == false) &&
        (check3 == false) &&
        (check4 == false)) {
      return AllProduct(productFuture);
    } else {
      return Category(future);
    }
  }

  Scaffold Category(Future<List<CategoryResponseModel>> future) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Home",
          style: TextStyle(color: primaryColor),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: primaryColor,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Fake Store App',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'welcome to my app.',
                  style: TextStyle(
                    color: primaryColor,
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      check1 = true;
                      check2 = false;
                      check3 = false;
                      check4 = false;
                    });
                    if (check1) {
                      setState(() {
                        category = 'electronics';
                      });
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: check1 ? primaryColor : Colors.white,
                        border: Border.all(
                          width: 2,
                          color: primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "electronics",
                        style: TextStyle(
                          color: check1 ? Colors.white : primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      check1 = false;
                      check2 = true;
                      check3 = false;
                      check4 = false;
                    });
                    if (check2) {
                      setState(() {
                        category = 'jewelery';
                      });
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: check2 ? primaryColor : Colors.white,
                        border: Border.all(
                          width: 2,
                          color: primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "jewelery",
                        style: TextStyle(
                          color: check2 ? Colors.white : primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      check1 = false;
                      check2 = false;
                      check3 = true;
                      check4 = false;
                    });
                    if (check3) {
                      setState(() {
                        category = "men's clothing";
                      });
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: check3 ? primaryColor : Colors.white,
                        border: Border.all(
                          width: 2,
                          color: primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "men's clothing",
                        style: TextStyle(
                          color: check3 ? Colors.white : primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      check1 = false;
                      check2 = false;
                      check3 = false;
                      check4 = true;
                    });
                    if (check4) {
                      setState(() {
                        category = "women's clothing";
                      });
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: check4 ? primaryColor : Colors.white,
                        border: Border.all(
                          width: 2,
                          color: primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "women's clothing",
                        style: TextStyle(
                          color: check4 ? Colors.white : primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                setState(() {
                  check1 = false;
                  check2 = false;
                  check3 = false;
                  check4 = false;
                });
              },
              child: const Text(
                "See all",
                style: TextStyle(fontSize: 14, color: primaryColor),
              ),
            ),
          ),
          Expanded(
            child: ProductCategory(future: future),
          ),
        ],
      ),
    );
  }

  Scaffold AllProduct(Future<List<ProductResponseModel>> productFuture) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Home",
          style: TextStyle(color: primaryColor),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: primaryColor,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Fake Store App',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'welcome to my app.',
                  style: TextStyle(
                    color: primaryColor,
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      check1 = true;
                      check2 = false;
                      check3 = false;
                      check4 = false;
                    });
                    if (check1) {
                      setState(() {
                        category = 'electronics';
                      });
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: check1 ? primaryColor : Colors.white,
                        border: Border.all(
                          width: 2,
                          color: primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "electronics",
                        style: TextStyle(
                          color: check1 ? Colors.white : primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      check1 = false;
                      check2 = true;
                      check3 = false;
                      check4 = false;
                    });
                    if (check2) {
                      setState(() {
                        category = 'jewelery';
                      });
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: check2 ? primaryColor : Colors.white,
                        border: Border.all(
                          width: 2,
                          color: primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "jewelery",
                        style: TextStyle(
                          color: check2 ? Colors.white : primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      check1 = false;
                      check2 = false;
                      check3 = true;
                      check4 = false;
                    });
                    if (check3) {
                      setState(() {
                        category = "men's clothing";
                      });
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: check3 ? primaryColor : Colors.white,
                        border: Border.all(
                          width: 2,
                          color: primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "men's clothing",
                        style: TextStyle(
                          color: check3 ? Colors.white : primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      check1 = false;
                      check2 = false;
                      check3 = false;
                      check4 = true;
                    });
                    if (check4) {
                      setState(() {
                        category = "women's clothing";
                      });
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: check4 ? primaryColor : Colors.white,
                        border: Border.all(
                          width: 2,
                          color: primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "women's clothing",
                        style: TextStyle(
                          color: check4 ? Colors.white : primaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Product(productFuture: productFuture),
          ),
        ],
      ),
    );
  }
}
