import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:storeapp/models/product_model.dart';
import 'package:storeapp/services/get_all_product_service.dart';
import 'package:storeapp/widgets/custom_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(FontAwesomeIcons.cartPlus),
          ),
        ],
        centerTitle: true,
        title: Text('New Trend'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 16.0, left: 16, top: 65),
        child: FutureBuilder<List<ProductModel>>(
          future: AllProductService().getAllProduct(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProductModel> products = snapshot.data!;
              return GridView.builder(
                  itemCount: products.length,
                  clipBehavior: Clip.none,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 70,
                  ),
                  itemBuilder: (context, index) {
                    return CustomCard(
                      product: products[index],
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:storeapp/models/product_model.dart';
// import 'package:storeapp/services/get_all_product_service.dart';
// import 'package:storeapp/widgets/custom_card.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//   static String id = 'HomePage';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           IconButton(
//             onPressed: () {},
//             icon: Icon(
//               FontAwesomeIcons.cartPlus,
//               color: Colors.black,
//             ),
//           )
//         ],
//         elevation: 0,
//         backgroundColor: Colors.white,
//         centerTitle: true,
//         title: Text(
//           'New Trend',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 25,
//             fontFamily: 'Pacifico',
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(left: 10, right: 10, top: 65),
//         child: FutureBuilder<List<ProductModel>>(
//           future: AllProductService().getAllProduct(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               List<ProductModel> products = snapshot.data!;
//               return GridView.builder(
//                   itemCount: products.length,
//                   clipBehavior: Clip.none,
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       childAspectRatio: 1.3,
//                       crossAxisSpacing: 10,
//                       mainAxisSpacing: 85),
//                   itemBuilder: (context, index) {
//                     return CustomCard(
//                       product: products[index],
//                     );
//                   });
//             } else {
//               return Center(child: CircularProgressIndicator());
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
