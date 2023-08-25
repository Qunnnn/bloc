import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/todo_model.dart';

part 'todo_filter_event.dart';
part 'todo_filter_state.dart';

class TodoFilterBloc extends Bloc<TodoFilterEvent, TodoFilterState> {
  TodoFilterBloc() : super(TodoFilterState.initial()) {
    on<ChangeFilterEvent>(_changeFilterEvent);
  }

  void _changeFilterEvent(ChangeFilterEvent event, Emitter emit) {
    emit(
      state.copyWith(filter: event.filter),
    );
  }
}
