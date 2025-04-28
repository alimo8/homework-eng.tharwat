import 'package:flutter/material.dart';

class NoTasksYet extends StatelessWidget {
  const NoTasksYet({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check_circle_outline_sharp, size: 100, color: Colors.grey),
          SizedBox(height: 25),
          Text(
            'No tasks yet',
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),
          SizedBox(height: 15),
          Text(
            'Add a task to get started',
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
