import 'package:flutter/material.dart';

import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/categories_service.dart';

import 'package:store_app/widgets/custom_card.dart';
import 'package:store_app/widgets/custom_navigation_bar.dart';

class CategoryProducts extends StatelessWidget {
  const CategoryProducts({super.key});
  static String id = 'Category Products';

  @override
  Widget build(BuildContext context) {
    String categoryname = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          backgroundColor: Colors.white,
          title: const Text(
            'Products',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: const CustomBottomNavigation(),
        body: FutureBuilder<List<ProductModel>>(
            future: CategoriesService().getCategory(categoryName: categoryname),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<ProductModel> products = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 70, bottom: 40),
                  child: GridView.builder(
                    itemCount: products.length,
                    clipBehavior: Clip.none,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.5,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 100),
                    itemBuilder: (context, index) {
                      return CustomCard(
                        product: products[index],
                      );
                    },
                  ),
                );
              } else {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.grey,
                ));
              }
            }));
  }
}
