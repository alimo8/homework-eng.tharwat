import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/cubit/get_tasks_cubit/cubit/tasks_cubit.dart';
import 'package:newapp/model/task_model.dart';
import 'package:newapp/widget/task_manager_card.dart';

class TaskListView extends StatelessWidget {
  TaskListView({super.key, required this.tasks});
  final List<TaskModel> tasks;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 4,
            child: ListTile(
              leading: Checkbox(
                value: task.isCompleted,
                onChanged:
                    (_) => {
                      BlocProvider.of<TasksCubit>(context).completedTask(task),
                    },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              title: Text(task.title),
              subtitle: Text(
                'Created at : ${_formateDate(task.date)}',
                style: TextStyle(color: Colors.grey),
              ),
              trailing: IconButton(
                onPressed: () {
                  BlocProvider.of<TasksCubit>(context).removeTask(task);
                },
                icon: Icon(Icons.delete, color: Colors.red),
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              hoverColor: Colors.yellow,
            ),
          ),
        );
      },
    );
  }

  String _formateDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
