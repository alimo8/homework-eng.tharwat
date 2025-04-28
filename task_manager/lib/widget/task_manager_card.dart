import 'package:flutter/material.dart';

class TaskManagerCard extends StatelessWidget {
  const TaskManagerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 4,
        child: ListTile(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.check_box_outline_blank_outlined),
          ),
          title: const Text('data'),
          subtitle: Text(
            'Created at : ${DateTime.now().toString().split(' ')[0]}',
            style: TextStyle(color: Colors.grey),
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: Icon(Icons.delete, color: Colors.red),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          hoverColor: Colors.yellow,
        ),
      ),
    );
  }
}
