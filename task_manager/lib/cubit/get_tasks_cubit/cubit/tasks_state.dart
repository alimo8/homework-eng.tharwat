part of 'tasks_cubit.dart';

sealed class TasksState extends Equatable {
  const TasksState();

  @override
  List<Object> get props => [];
}

final class TasksInitial extends TasksState {}

final class TasksLoading extends TasksState {}

final class TasksFailure extends TasksState {
  final String errorMessage;

  const TasksFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}

final class TasksISuccess extends TasksState {}
