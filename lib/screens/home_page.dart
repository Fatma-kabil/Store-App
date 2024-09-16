import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/add_product.dart';
import 'package:store_app/screens/categories_page.dart';
import 'package:store_app/services/get_all_product_service.dart';
import 'package:store_app/widgets/custom_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String id = 'HomePage';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                FontAwesomeIcons.cartShopping,
                size: 20,
              ),
            ),
          ],
          title: const Text(
            'New Trend',
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
                Navigator.pushReplacementNamed(
                    context, HomePage.id); // Push and remove previous page
                break;
              case 1:
                Navigator.pushReplacementNamed(context,
                    AddProductPage.id); // Push and remove previous page
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
        body: FutureBuilder<List<ProductModel>>(
            future: AllProductsService().getAllProduct(),
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
