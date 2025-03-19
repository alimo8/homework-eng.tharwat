import 'package:flutter/material.dart';
import 'package:toku/views/family_members.dart';
import 'package:toku/views/numbers_page.dart';
import 'package:toku/views/phrases.dart';
import 'package:toku/widgets/category_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text('Toku'),
      ),
      body: Column(
        children: [
          Category(
            text: 'Numbers',
            color: Colors.orange,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return NumbersPage();
                  },
                ),
              );
            },
          ),
          Category(
            text: 'FamilyMembers',
            color: Colors.green,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return FamilyMembers();
                  },
                ),
              );
            },
          ),
          const Category(
            text: 'Colors',
            color: Colors.purple,
          ),
          Category(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Phrases();
                  },
                ),
              );
            },
            text: 'Phrases',
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
