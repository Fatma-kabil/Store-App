import 'package:flutter/material.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:store_app/screens/add_product.dart';
import 'package:store_app/screens/categories_page.dart';
import 'package:store_app/screens/home_page.dart';

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation({super.key});

  @override
  _CustomBottomNavigationState createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FlashyTabBar(
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
            Navigator.pushReplacementNamed(
                context, AddProductPage.id); // Push and remove previous page
            break;
          case 2:
            Navigator.pushReplacementNamed(
                context, CategoriesPage.id); // Push and remove previous page
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
    );
  }
}
