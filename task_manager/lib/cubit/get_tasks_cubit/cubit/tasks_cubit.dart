import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:newapp/model/task_model.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TasksInitial());

  final TaskManager taskManager = TaskManager();

  void addTask(String title) {
    emit(TasksLoading());
    try {
      taskManager.addTask(title);
      emit(TasksISuccess());
    } catch (e) {
      emit(TasksFailure(errorMessage: e.toString()));
    }
  }

  void removeTask(TaskModel task) {
    emit(TasksLoading());
    try {
      taskManager.removeTask(task);
      emit(TasksISuccess());
    } catch (e) {
      emit(TasksFailure(errorMessage: e.toString()));
    }
  }

  void completedTask(TaskModel task) {
    emit(TasksLoading());
    try {
      taskManager.completedTask(task);
      emit(TasksISuccess());
    } catch (e) {
      emit(TasksFailure(errorMessage: e.toString()));
    }
  }

  void uncompletedTask(TaskModel task) {
    emit(TasksLoading());
    try {
      taskManager.uncompletedTask(task);
      emit(TasksISuccess());
    } catch (e) {
      emit(TasksFailure(errorMessage: e.toString()));
    }
  }
}
