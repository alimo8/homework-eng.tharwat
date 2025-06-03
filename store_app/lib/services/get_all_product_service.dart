// // import 'package:storeapp/helpers/api.dart';
// // import 'package:storeapp/models/product_model.dart';

// // class AllProductService {
// //   Future<List<ProductModel>> getAllProductService() async {
// //     List<dynamic> data =
// //         await Api().get(url: 'https://fakestoreapi.com/products');

// //     List<ProductModel> productList = [];
// //     for (int i = 0; i < data.length; i++) {
// //       productList.add(ProductModel.fromjason(data[i]));
// //     }
// //     return productList;
// //   }
// // }

// import 'package:storeapp/helpers/api.dart';
// import 'package:storeapp/models/product_model.dart';

// class AllProductService {
//   Future<List<ProductModel>> getAllProductService() async {
//     List<dynamic> data =
//         await Api().get(url: 'https://fakestoreapi.com/products', token: null);

//     List<ProductModel> productList = [];
//     for (var item in data) {
//       productList.add(ProductModel.fromjason(item));
//     }
//     return productList;
//   }
// }

import 'package:storeapp/helpers/api.dart';
import 'package:storeapp/models/product_model.dart';

class AllProductService {
  Future<List<ProductModel>> getAllProduct() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products');

    List<ProductModel> productList = [];
    for (int i = 0; i < data.length; i++) {
      productList.add(
        ProductModel.fromJson(data[i]),
      );
    }
    return productList;
  }
}
