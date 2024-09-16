import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/categories_page.dart';
import 'package:store_app/screens/home_page.dart';
import 'package:store_app/services/add_product.dart';
import 'package:store_app/widgets/custom_botton.dart';
import 'package:store_app/widgets/custom_text_field.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});
  static String id = 'Add product';

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  ProductModel product = ProductModel(
    id: 0, // Initialize with default values
    title: '',
    price: 0.0,
    description: '',
    image: '',
    category: '',
  );
  int _selectedIndex = 1;

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          backgroundColor: Colors.white,
          title: const Text(
            'Add Product',
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
                break;
              case 1:
                Navigator.pushReplacementNamed(context, AddProductPage.id);
                break;
              case 2:
                Navigator.pushReplacementNamed(context, CategoriesPage.id);
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 45),
          child: ListView(
            children: [
              CustomTextField(
                onchanged: (value) {
                  product.title = value;
                },
                hintText: 'Product Name',
              ),
              const SizedBox(height: 15),
              CustomTextField(
                onchanged: (value) {
                  product.description = value;
                },
                hintText: 'Description',
              ),
              const SizedBox(height: 15),
              CustomTextField(
                inputType: TextInputType.number,
                onchanged: (value) {
                  product.price = double.tryParse(value.trim()) ?? 0.0;
                },
                hintText: 'Price',
              ),
              const SizedBox(height: 15),
              CustomTextField(
                onchanged: (value) {
                  product.image = value;
                },
                hintText: 'Image URL',
              ),
              const SizedBox(height: 15),
              CustomTextField(
                onchanged: (value) {
                  product.id = int.tryParse(value.trim()) ?? 0;
                },
                hintText: 'ID',
              ),
              const SizedBox(height: 15),
              CustomTextField(
                onchanged: (value) {
                  print(value);
                  product.category = value;
                },
                hintText: 'Category',
              ),
              const SizedBox(height: 45),
              CustomButton(
                text: 'Add Product',
                onTap: () async {
                  setState(() {
                    isloading = true;
                  });
                  print("Title: ${product.title}");
                  print("Description: ${product.description}");
                  print("Price: ${product.price}");
                  print("Image URL: ${product.image}");
                  print("Category: ${product.category}");
                  print("ID: ${product.id}");

                  try {
                    await addProduct(product);
                    showSnackBar(context, 'Product Added Successfully');
                  } catch (e) {
                    print('Error: ${e.toString()}');
                    showSnackBar(context, 'Failed to Add Product');
                  } finally {
                    setState(() {
                      isloading = false;
                    });
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addProduct(ProductModel product) async {
    // Ensure the product fields are properly populated before sending
    if (product.title.isEmpty ||
        product.price == 0.0 ||
        product.description.isEmpty ||
        product.image.isEmpty ||
        product.category.isEmpty) {
      throw Exception("All fields must be filled.");
    }

    try {
      await AddProductService().addProduct(
        title: product.title,
        price: product.price.toString(),
        desc: product.description,
        image: product.image,
        category: product.category,
        id: product.id.toString(),
      );
    } catch (e) {
      print('Error: ${e.toString()}');
      throw Exception("Failed to add product.");
    }
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
