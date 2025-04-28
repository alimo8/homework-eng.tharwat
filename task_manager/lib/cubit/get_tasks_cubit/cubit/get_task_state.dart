part of 'get_task_cubit.dart';

@immutable
sealed class GetTaskState {}

final class GetTaskInitial extends GetTaskState {}

final class GetTaskLoaded extends GetTaskState {}

final class GetTaskFailuer extends GetTaskState {}
