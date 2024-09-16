import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:store_app/screens/add_product.dart';

import 'package:store_app/screens/category_products.dart';
import 'package:store_app/screens/home_page.dart';
import 'package:store_app/services/all_categories_service.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({super.key});
  static String id = 'Categories';

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          backgroundColor: Colors.white,
          title: const Text(
            'Categories',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: FlashyTabBar(
          backgroundColor: Colors.grey[200],
          selectedIndex: _selectedIndex,
          showElevation: true,
          onItemSelected: (index) => setState(() {
            _selectedIndex = index;
            switch (_selectedIndex) {
              case 0:
                Navigator.pushReplacementNamed(context, HomePage.id);
                // Push and remove previous page
                break;
              case 1:
                Navigator.pushReplacementNamed(context, AddProductPage.id);
                // Push and remove previous page
                break;
              case 2:
                Navigator.pushReplacementNamed(context,
                    CategoriesPage.id); // Push and remove previous page
                break;
            }
          }),
          items: [
            FlashyTabBarItem(
              icon: const Icon(Icons.home),
              title: const Text('Home'),
            ),
            FlashyTabBarItem(
              icon: const Icon(Icons.add),
              title: const Text('Add'),
            ),
            FlashyTabBarItem(
              icon: const Icon(Icons.category),
              title: const Text('Categories'),
            ),
          ],
        ),
        body: FutureBuilder<List<dynamic>>(
            future: AllCategoriesService().getAllCategories(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<dynamic> categories = snapshot.data!;
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 70, bottom: 40),
                  child: GridView.builder(
                    itemCount: categories.length,
                    clipBehavior: Clip.none,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.5,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 100),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            color: Colors.blueGrey[200],
                            borderRadius: BorderRadius.circular(20)),
                        height: 100,
                        width: 150,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, CategoryProducts.id,
                                arguments: categories[index]);
                          },
                          child: Center(
                              child: Text(
                            categories[index],
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          )),
                        ),
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
