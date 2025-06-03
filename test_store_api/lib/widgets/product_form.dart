import 'package:flutter/material.dart';

class ProductForm extends StatefulWidget {
  final bool isEdit;
  final String? initialTitle;
  final String? initialPrice;
  final String? initialDescription;
  final String? initialImageUrl;
  final String? initialCategory;

  const ProductForm({
    Key? key,
    required this.isEdit,
    this.initialTitle,
    this.initialPrice,
    this.initialDescription,
    this.initialImageUrl,
    this.initialCategory,
  }) : super(key: key);

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  late final TextEditingController _titleController;
  late final TextEditingController _priceController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _imageUrlController;
  String? _selectedCategory;

  final List<String> _categories = [
    'Clothing',
    'Electronics',
    'Accessories',
    'Other',
  ];

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.initialTitle ?? '');
    _priceController = TextEditingController(text: widget.initialPrice ?? '');
    _descriptionController = TextEditingController(
      text: widget.initialDescription ?? '',
    );
    _imageUrlController = TextEditingController(
      text: widget.initialImageUrl ?? '',
    );
    _selectedCategory = widget.initialCategory;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    _imageUrlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: 'Title'),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _priceController,
            decoration: const InputDecoration(labelText: 'Price'),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _descriptionController,
            decoration: const InputDecoration(labelText: 'Description'),
            maxLines: 2,
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _imageUrlController,
            decoration: const InputDecoration(labelText: 'Image URL'),
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            value: _selectedCategory,
            items:
                _categories
                    .map(
                      (cat) => DropdownMenuItem(value: cat, child: Text(cat)),
                    )
                    .toList(),
            onChanged: (val) => setState(() => _selectedCategory = val),
            decoration: const InputDecoration(labelText: 'Category'),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
            ),
            child: Text(widget.isEdit ? 'Update Product' : 'Add Product'),
          ),
        ],
      ),
    );
  }
}
