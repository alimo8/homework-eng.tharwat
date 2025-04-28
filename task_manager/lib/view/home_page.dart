import 'package:flutter/material.dart';
import 'package:newapp/widget/add_task_field.dart';
import 'package:newapp/widget/no_tasks_yet.dart';
import 'package:newapp/widget/task_list_view.dart';
import 'package:newapp/widget/task_manager_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('My Tasks'),
        backgroundColor: Colors.cyanAccent,
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 70, // تخصيص مساحة لزر الإضافة
            child: TaskListView(),
          ),
          Positioned(bottom: 5, left: 0, right: 0, child: AddTaskField()),
        ],
      ),
    );
  }
}
