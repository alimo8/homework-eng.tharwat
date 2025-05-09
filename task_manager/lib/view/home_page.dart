// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:newapp/cubit/get_tasks_cubit/cubit/tasks_cubit.dart';
// import 'package:newapp/widget/add_task_field.dart';
// import 'package:newapp/widget/no_tasks_yet.dart';
// import 'package:newapp/widget/task_list_view.dart';
// import 'package:newapp/widget/task_manager_card.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<TasksCubit, TasksState>(
//       builder: (context, state) {
//         return Scaffold(
//           backgroundColor: Colors.white,
//           appBar: AppBar(
//             title: Text('My Tasks'),
//             backgroundColor: Colors.cyanAccent,
//           ),
//           body: Stack(
//             children: [
//               // BlocBuilder<GetTaskCubit, GetTaskState>(
//               //   builder: (context, index) {
//               //     if (State is GetTaskInitial) {
//               //       return NoTasksYet();
//               //     } else {
//               //       return Positioned(
//               //         top: 0,
//               //         left: 0,
//               //         right: 0,
//               //         bottom: 70, // تخصيص مساحة لزر الإضافة
//               //         child: TaskListView(),
//               //       );
//               //     }
//               //   },
//               // ),
//               // NoTasksYet(),
//               // TaskListView(),
//               BlocBuilder<TasksCubit, TasksState>(
//                 builder: (context, state) {
//                   // var tasks =

//                   return Expanded(
//                     child:
//                         BlocProvider.of<TasksCubit>(
//                               context,
//                             ).taskManager.task.isEmpty
//                             ? NoTasksYet()
//                             : TaskListView(),
//                   );
//                 },
//               ),
//               Positioned(bottom: 5, left: 0, right: 0, child: AddTaskField()),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newapp/cubit/get_tasks_cubit/cubit/tasks_cubit.dart';
import 'package:newapp/widget/add_task_field.dart';
import 'package:newapp/widget/no_tasks_yet.dart';
import 'package:newapp/widget/task_list_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksCubit, TasksState>(
      builder: (context, state) {
        final tasks = BlocProvider.of<TasksCubit>(context).taskManager.task;

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('My Tasks'),
            backgroundColor: Colors.cyanAccent,
          ),
          body: Column(
            children: [
              Expanded(
                child:
                    tasks.isEmpty
                        ? const NoTasksYet()
                        // راجع جزء الليست تاني
                        : TaskListView(tasks: []),
              ),
              // هذا الجزء يمثل حقل الإضافة بأسفل الصفحة
              SizedBox(
                height: 70, // نفس المساحة التي كانت مخصصة مسبقًا
                child: AddTaskField(),
              ),
            ],
          ),
        );
      },
    );
  }
}
