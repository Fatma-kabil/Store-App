import 'package:store_app/helpers/api.dart';

class AllCategoriesService {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> data =
        await Api().get(Url: 'https://fakestoreapi.com/products/categories');

    return data;
  }
}
