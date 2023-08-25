part of 'active_todo_count_bloc.dart';

class ActiveTodoCountEvent extends Equatable {
  final int activeTodoCount;

  const ActiveTodoCountEvent({required this.activeTodoCount});
  @override
  List<Object?> get props => [activeTodoCount];
}
