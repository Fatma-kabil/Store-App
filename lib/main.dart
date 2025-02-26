import 'package:flutter/material.dart';
import 'package:store_app/screens/add_product.dart';
import 'package:store_app/screens/categories_page.dart';
import 'package:store_app/screens/category_products.dart';
import 'package:store_app/screens/home_page.dart';
import 'package:store_app/screens/product_details.dart';
import 'package:store_app/screens/update_product_page.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomePage.id: (context) => const HomePage(),
        UpdateProductPage.id: (context) => const UpdateProductPage(),
        ProductDetails.id: (context) => const ProductDetails(),
        AddProductPage.id: (context) => const AddProductPage(),
        CategoriesPage.id: (context) => const CategoriesPage(),
        CategoryProducts.id: (context) => const CategoryProducts(),
      },
      initialRoute: HomePage.id,
    );
  }
}
