import 'package:store_app/helpers/api.dart';
import 'package:store_app/models/product_model.dart';

class UpdateProdutService {
  Future<ProductModel> UpdateProdut(
      {required String title,
      required String price,
      required String desc,
      required String image,
      required String category,
      required int id}) async {
    print('product id =$id');
    Map<String, dynamic> data =
        await Api().put(Url: 'https://fakestoreapi.com/products/$id', body: {
      'title': title,
      'price': price,
      'description': desc,
      'image': image,
      'category': category
    });
    return ProductModel.fromJson(data);
  }
}
