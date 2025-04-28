import 'package:flutter/material.dart';
import 'package:newapp/widget/task_manager_card.dart';

class TaskListView extends StatelessWidget {
  const TaskListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return TaskManagerCard();
      },
    );
  }
}
