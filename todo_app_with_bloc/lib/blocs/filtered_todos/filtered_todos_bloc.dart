import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/todo_model.dart';
import '../blocs.dart';

part 'filtered_todos_event.dart';
part 'filtered_todos_state.dart';

class FilteredTodosBloc extends Bloc<FilteredTodosEvent, FilteredTodosState> {
  late final StreamSubscription todoFilterSub;
  late final StreamSubscription todoSearchSub;
  late final StreamSubscription todoListSub;

  final List<Todo> initialTodos;
  final TodoListBloc todoListBloc;
  final TodoFilterBloc todoFilterBloc;
  final TodoSearchBloc todoSearchBloc;

  FilteredTodosBloc({
    required this.initialTodos,
    required this.todoFilterBloc,
    required this.todoListBloc,
    required this.todoSearchBloc,
  }) : super(FilteredTodosState(filteredTodos: initialTodos)) {
    todoListSub = todoListBloc.stream.listen((TodoListState todoListState) {
      _setFilteredTodos();
    });

    todoFilterSub =
        todoFilterBloc.stream.listen((TodoFilterState todoFilterState) {
      _setFilteredTodos();
    });

    todoSearchSub =
        todoSearchBloc.stream.listen((TodoSearchState todoSearchState) {
      _setFilteredTodos();
    });

    on<CalculatedFilteredTodosEvent>(
      (event, emit) => emit(
        state.copyWith(
          filteredTodos: event.filteredTodos,
        ),
      ),
    );
  }

  void _setFilteredTodos() {
    List<Todo> filteredTodos;

    switch (todoFilterBloc.state.filter) {
      case Filter.active:
        filteredTodos = todoListBloc.state.todos
            .where((Todo todo) => !todo.completed)
            .toList();
        break;
      case Filter.completed:
        filteredTodos = todoListBloc.state.todos
            .where((Todo todo) => todo.completed)
            .toList();
        break;
      case Filter.all:
      default:
        filteredTodos = todoListBloc.state.todos;
        break;
    }

    if (todoSearchBloc.state.searchTerm.isNotEmpty) {
      filteredTodos = filteredTodos
          .where(
            (Todo todo) => todo.desc
                .toLowerCase()
                .contains(todoSearchBloc.state.searchTerm),
          )
          .toList();
    }
    add(
      CalculatedFilteredTodosEvent(filteredTodos: filteredTodos),
    );
  }

  @override
  Future<void> close() {
    todoFilterSub.cancel();
    todoListSub.cancel();
    todoSearchSub.cancel();
    return super.close();
  }
}
