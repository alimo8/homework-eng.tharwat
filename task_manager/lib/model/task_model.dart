import 'package:equatable/equatable.dart';

class TaskModel extends Equatable {
  final String title;
  final DateTime date;
  bool isCompleted;

  TaskModel({
    required this.title,
    required this.date,
    this.isCompleted = false,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [title, date];
}

class TaskManager {
  final List<TaskModel> _task = [];
  List<TaskModel> get task => _task;

  void addTask(String title) {
    _task.add(TaskModel(title: title, date: DateTime.now()));
  }

  void removeTask(TaskModel task) {
    _task.remove(task);
  }

  void completedTask(TaskModel task) {
    task.isCompleted = true;
  }

  void uncompletedTask(TaskModel task) {
    task.isCompleted = false;
  }
}
