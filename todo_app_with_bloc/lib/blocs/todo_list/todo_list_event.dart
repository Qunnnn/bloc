part of 'todo_list_bloc.dart';

@immutable
sealed class TodoListEvent extends Equatable {}

final class AddTodoEvent extends TodoListEvent {
  final String todoDesc;
  AddTodoEvent({required this.todoDesc});

  @override
  List<Object?> get props => [todoDesc];
}

final class EditTodoEvent extends TodoListEvent {
  final String id;
  final String todoDesc;
  EditTodoEvent({required this.id, required this.todoDesc});

  @override
  List<Object?> get props => [id, todoDesc];
}

final class ToggleTodoEvent extends TodoListEvent {
  final String id;
  ToggleTodoEvent({required this.id});

  @override
  List<Object?> get props => [id];
}

final class RemoveTodoEvent extends TodoListEvent {
  final Todo todo;
  RemoveTodoEvent({required this.todo});

  @override
  List<Object?> get props => [todo];
}

