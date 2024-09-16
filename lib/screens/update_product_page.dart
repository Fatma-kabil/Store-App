import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/updat_product.dart';
import 'package:store_app/widgets/custom_botton.dart';
import 'package:store_app/widgets/custom_navigation_bar.dart';
import 'package:store_app/widgets/custom_text_field.dart';

class UpdateProductPage extends StatefulWidget {
  const UpdateProductPage({super.key});
  static String id = 'update product';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, desc, image;

  int? price;
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
            'Update Product',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: const CustomBottomNavigation(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 45),
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
              CustomTextField(
                onchanged: (p0) {
                  productName = p0;
                },
                hintText: 'Product Name',
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                onchanged: (p0) {
                  desc = p0;
                },
                hintText: 'Description',
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                inputType: TextInputType.number,
                onchanged: (p0) {
                  price = int.parse(p0);
                },
                hintText: 'Price',
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                onchanged: (p0) {
                  image = p0;
                },
                hintText: 'Image',
              ),
              const SizedBox(
                height: 45,
              ),
              CustomButton(
                text: 'Update',
                onTap: () async {
                  isloading = true;
                  setState(() {});
                  try {
                    await Updateproduct(product);
                    showSnakBar(context, 'All Done');
                  } catch (e) {
                    print(e.toString());
                  }
                  isloading = false;
                  setState(() {});
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> Updateproduct(ProductModel product) async {
    await UpdateProdutService().UpdateProdut(
        id: product.id,
        title: productName == null ? product.title : productName!,
        price: price == null ? product.price.toString() : price!.toString(),
        desc: desc == null ? product.description : desc!,
        image: image == null ? product.image : image!,
        category: product.category);
  }

  void showSnakBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
