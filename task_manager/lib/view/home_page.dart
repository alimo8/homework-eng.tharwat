import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/cubit/get_tasks_cubit/cubit/get_task_cubit.dart';
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
          BlocBuilder<GetTaskCubit, GetTaskState>(
            builder: (context, index) {
              if (State is GetTaskInitial) {
                return NoTasksYet();
              } else {
                return Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 70, // تخصيص مساحة لزر الإضافة
                  child: TaskListView(),
                );
              }
            },
          ),

          // NoTasksYet(),
          Positioned(bottom: 5, left: 0, right: 0, child: AddTaskField()),
        ],
      ),
    );
  }
}
