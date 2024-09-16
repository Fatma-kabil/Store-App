import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/update_product_page.dart';

import 'package:store_app/widgets/custom_botton.dart';
import 'package:store_app/widgets/custom_navigation_bar.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});
  static String id = 'product details';

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          backgroundColor: Colors.white,
          title: const Text(
            'product ',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: const CustomBottomNavigation(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 35),
          child: ListView(
            //  mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                product.image,
                height: 200,
                //     width: 20,
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                  child: Text(
                product.title,
                style:
                    const TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
              )),
              const SizedBox(
                height: 20,
              ),
              Text(
                product.description,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[800]),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Price : ' r'$ ' '${product.price.toString()}',
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'rating :  ' '${product.rating!.rate.toString()}',
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  CustomButton(
                    text: 'Update Product',
                    onTap: () {
                      Navigator.pushNamed(context, UpdateProductPage.id,
                          arguments: product);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
