import 'package:flutter/material.dart';
import '../widgets/product_card.dart';
import 'add_product_screen.dart';
import 'edit_product_screen.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final List<Map<String, dynamic>> products = [
    {
      'title': 'Classic Olive Chino Shorts 123',
      'price': 84,
      'image': 'https://i.imgur.com/UsFlvYs.jpeg',
    },
    {
      'title': 'Classic White Crew',
      'price': 39,
      'image': 'https://i.imgur.com/1bX5QH6.jpeg',
    },
    {
      'title': 'Classic White Tee',
      'price': 73,
      'image': 'https://i.imgur.com/1bX5QH6.jpeg',
    },
    {
      'title': 'Classic Black T-Shirt',
      'price': 35,
      'image': 'https://i.imgur.com/2nCt3Sbl.jpeg',
    },
    {
      'title': 'Sleek White & Orange Controller',
      'price': 99,
      'image': 'https://i.imgur.com/8Km9tLL.jpeg',
    },
    {
      'title': 'Sleek Wireless Headphones',
      'price': 120,
      'image': 'https://i.imgur.com/1bX5QH6.jpeg',
    },
  ];

  void _showDeleteDialog(String title) {
    showDialog(
      context: context,
      builder:
          (ctx) => AlertDialog(
            title: const Text('Delete Product'),
            content: Text('Are you sure you want to delete "$title"?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(ctx).pop(),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  // Delete logic here
                  Navigator.of(ctx).pop();
                },
                child: const Text(
                  'Delete',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E-Commerce App'),
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
          ),
          itemBuilder:
              (ctx, i) => ProductCard(
                title: products[i]['title'],
                price: products[i]['price'],
                imageUrl: products[i]['image'],
                onDelete: () => _showDeleteDialog(products[i]['title']),
                onEdit: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder:
                          (_) => EditProductScreen(
                            title: products[i]['title'],
                            price: products[i]['price'].toString(),
                            description: 'Sample description',
                            imageUrl: products[i]['image'],
                            category: null,
                          ),
                    ),
                  );
                },
              ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => const AddProductScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
