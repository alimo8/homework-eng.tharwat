import 'package:flutter/material.dart';
import '../widgets/product_form.dart';

class EditProductScreen extends StatelessWidget {
  final String title;
  final String price;
  final String description;
  final String imageUrl;
  final String? category;

  const EditProductScreen({
    Key? key,
    required this.title,
    required this.price,
    required this.description,
    required this.imageUrl,
    this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ProductForm(
          isEdit: true,
          initialTitle: title,
          initialPrice: price,
          initialDescription: description,
          initialImageUrl: imageUrl,
          initialCategory: category,
        ),
      ),
    );
  }
}
