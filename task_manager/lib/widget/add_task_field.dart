// import 'package:flutter/material.dart';

// class AddTask extends StatelessWidget {
//   const AddTask({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 85,
//       decoration: BoxDecoration(
//         color: Colors.grey.shade100,
//         borderRadius: BorderRadius.circular(16),
//       ),

//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 14.0),
//         child: Row(
//           children: [
//             Expanded(
//               child: TextField(
//                 decoration: InputDecoration(
//                   contentPadding: const EdgeInsets.symmetric(
//                     horizontal: 16,
//                     vertical: 14,
//                   ),
//                   hintText: 'Add a new task...',
//                   hintStyle: TextStyle(color: Colors.grey.shade600),
//                   filled: true,
//                   fillColor: Colors.grey.shade100,
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(16),
//                     borderSide: BorderSide(color: Colors.grey.shade400),
//                   ),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(16),
//                     borderSide: BorderSide(color: Colors.grey.shade400),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(width: 10),
//             IconButton(
//               onPressed: () {
//                 // Add task logic here
//               },
//               icon: Icon(Icons.add_circle),
//               color: Colors.grey,
//               iconSize: 40,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class AddTaskField extends StatefulWidget {
  @override
  _AddTaskFieldState createState() => _AddTaskFieldState();
}

class _AddTaskFieldState extends State<AddTaskField> {
  final TextEditingController _controller = TextEditingController();

  void _saveTask() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      print('تم إضافة مهمة جديدة: $text');
      _controller.clear();
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('الرجاء كتابة مهمة قبل الإضافة')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextField(
              controller: _controller,
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
              onSubmitted: (_) => _saveTask(),
            ),
          ),
        ),
        // const SizedBox(width: 8),
        IconButton(
          onPressed: _saveTask,
          icon: Icon(Icons.add_circle, color: Colors.blue),
          iconSize: 40,
        ),
      ],
    );
  }
}
