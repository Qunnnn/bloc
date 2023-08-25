import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/todo_model.dart';
import '../blocs.dart';

part 'active_todo_count_event.dart';
part 'active_todo_count_state.dart';

class ActiveTodoCountBloc
    extends Bloc<ActiveTodoCountEvent, ActiveTodoCountState> {
  late final StreamSubscription subTodoList;

  final int initialActivetTodoCount;
  final TodoListBloc todoListBloc;
  ActiveTodoCountBloc({
    required this.initialActivetTodoCount,
    required this.todoListBloc,
  }) : super(
          ActiveTodoCountState(
            activeTodoCount: initialActivetTodoCount,
          ),
        ) {
    subTodoList = todoListBloc.stream.listen((TodoListState state) {
      on<ActiveTodoCountEvent>(_activeTodoCountEvent);
    });
  }
  void _activeTodoCountEvent(
    ActiveTodoCountEvent event,
    Emitter emit,
  ) {
      final int currentActiveTodoCount = todoListBloc.state.todos
          .where((Todo todo) => !todo.completed)
          .toList()
          .length;
      emit(
        state.copyWith(
          activeTodoCount: currentActiveTodoCount,
        ),
      );
  }

    @override
  Future<void> close() {
    subTodoList.cancel();
    return super.close();
  }
}
