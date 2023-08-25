part of 'todo_list_cubit.dart';

class TodoListState extends Equatable {
  final List<Todo> todos;
  const TodoListState({required this.todos});

  factory TodoListState.initial() {
    return TodoListState(
      todos: [
        Todo(
          id: '1',
          desc: 'Clean the room',
        ),
        Todo(
          id: '2',
          desc: 'Wash the dish',
        ),
        Todo(
          id: '3',
          desc: 'Do homework',
        ),
      ],
    );
  }

  @override
  List<Object> get props => [todos];

  TodoListState copyWith({
    List<Todo>? todos,
  }) {
    return TodoListState(
      todos: todos ?? this.todos,
    );
  }
}
