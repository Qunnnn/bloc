import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'todo_search_event.dart';
part 'todo_search_state.dart';

class TodoSearchBloc extends Bloc<TodoSearchEvent, TodoSearchState> {
  TodoSearchBloc()
      : super(
          TodoSearchState.initial(),
        ) {
    on<SetSearchTodoTerm>(
      _setSearchTodoTerm,
    );
  }

  void _setSearchTodoTerm(SetSearchTodoTerm event, Emitter emit) {
    emit(
      TodoSearchState(searchTerm: event.searchTerm),
    );
  }
}
