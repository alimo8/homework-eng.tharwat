import 'package:storeapp/helpers/api.dart';

class AllCategoriesService {
  Future<List<dynamic>> getAllProductService() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products/categories');

    return data;
  }
}
