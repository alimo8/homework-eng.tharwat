import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/cubit/get_tasks_cubit/cubit/tasks_cubit.dart';

class AddTaskField extends StatefulWidget {
  const AddTaskField({super.key});

  @override
  _AddTaskFieldState createState() => _AddTaskFieldState();
}

class _AddTaskFieldState extends State<AddTaskField> {
  // final TextEditingController _controller = TextEditingController();

  // void _saveTask() {
  //   final text = _controller.text.trim();
  //   if (text.isNotEmpty) {
  //     BlocProvider.of<TasksCubit>(context).addTask(text);
  //     _controller.clear();
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(content: Text('الرجاء كتابة مهمة قبل الإضافة')),
  //     );
  //   }
  // }

  String text = '';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0, left: 10, right: 10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              // controller: _controller,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                hintText: 'Add a new task...',
                hintStyle: TextStyle(color: Colors.grey.shade600),
                filled: true,
                fillColor: Colors.grey.shade100,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
              ),
              // onSubmitted: (_) => _saveTask(),
              onChanged: (text) {
                this.text = text;
              },
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: () {
              BlocProvider.of<TasksCubit>(context).addTask(text);
            },
            icon: const Icon(Icons.add_circle, color: Colors.blue),
            iconSize: 40,
          ),
        ],
      ),
    );
  }
}
