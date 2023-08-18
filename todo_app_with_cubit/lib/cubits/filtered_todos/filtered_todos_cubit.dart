import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/todo_model.dart';
import '../cubits.dart';
part 'filtered_todos_state.dart';

class FilteredTodosCubit extends Cubit<FilteredTodosState> {
  late final StreamSubscription todoFilterSub;
  late final StreamSubscription todoSearchSub;
  late final StreamSubscription todoListSub;

  final TodoListCubit todoListCubit;
  final TodoFilterCubit todoFilterCubit;
  final TodoSearchCubit todoSearchCubit;
  FilteredTodosCubit({
    required this.todoFilterCubit,
    required this.todoListCubit,
    required this.todoSearchCubit,
  }) : super(FilteredTodosState.initial()) {
    todoListSub = todoListCubit.stream.listen((TodoListState todoListState) {
      setFilteredTodos();
    });

    todoFilterSub = todoFilterCubit.stream.listen((TodoFilterState todoFilterState) {
      setFilteredTodos();
    });

    todoSearchSub = todoSearchCubit.stream.listen((TodoSearchState todoSearchState) {
      setFilteredTodos();
    });
  }

  void setFilteredTodos() {
    List<Todo> _filteredTodos;

    switch (todoFilterCubit.state.filter) {
      case Filter.active:
        _filteredTodos = todoListCubit.state.todos.where((Todo todo) => !todo.completed).toList();
        break;
      case Filter.completed:
        _filteredTodos = todoListCubit.state.todos.where((Todo todo) => todo.completed).toList();
        break;
      case Filter.all:
      default:
        _filteredTodos = todoListCubit.state.todos;
        break;
    }

    if (todoSearchCubit.state.searchTerm.isNotEmpty) {
      _filteredTodos = _filteredTodos
          .where(
            (Todo todo) => todo.desc.toLowerCase().contains(todoSearchCubit.state.searchTerm),
          )
          .toList();
    }
    emit(state.copyWith(filteredTodos: _filteredTodos));
  }
}
