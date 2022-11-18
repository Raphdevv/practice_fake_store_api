import 'package:flutter/material.dart';

import '../constance.dart';
import '../models/category_model.dart';

class ProductCategory extends StatelessWidget {
  final Future<List<CategoryResponseModel>> future;
  const ProductCategory({super.key, required this.future});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CategoryResponseModel>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final electronic = snapshot.data!;
          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 350,
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8),
              itemCount: electronic.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const Scaffold())));
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20)),
                            child: Image.network(
                              electronic[index].image.toString(),
                              height: 175,
                              width: double.infinity,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            electronic[index].title.toString(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Text("\$${electronic[index].price}"),
                        )
                      ],
                    ),
                  ),
                );
              });
        }
        return const Center(
          child: CircularProgressIndicator(
            color: primaryColor,
          ),
        );
      },
    );
  }
}
