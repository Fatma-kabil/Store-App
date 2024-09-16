import 'package:store_app/helpers/api.dart';
import 'package:store_app/models/product_model.dart';

class AddProductService {
  Future<ProductModel> addProduct(
      {required String title,
      required String price,
      required String desc,
      required String image,
      required String category,
      required String id}) async {
    Map<String, dynamic> data =
        await Api().post(Url: 'https://fakestoreapi.com/products', body: {
      'title': title,
      'price': price,
      'description': desc,
      'image': image,
      'category': category,
      'id': id
    });
    return ProductModel.fromJson(data);
  }
}
