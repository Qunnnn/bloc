import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/todo_model.dart';
import '../todo_list/todo_list_cubit.dart';
part 'active_todo_count_state.dart';

class ActiveTodoCountCubit extends Cubit<ActiveTodoCountState> {
  final TodoListCubit todoListCubit;
  late final StreamSubscription todoListSub;
  final int initialActivetTodoCount;
  ActiveTodoCountCubit({
    required this.todoListCubit,
    required this.initialActivetTodoCount,
  }) : super(ActiveTodoCountState(
          activeTodoCount: initialActivetTodoCount,
        )) {
    todoListSub = todoListCubit.stream.listen((TodoListState todoListState) {
      final int currentActiveTodoCount = todoListState.todos
          .where((Todo todo) => !todo.completed)
          .toList()
          .length;
      emit(
        state.copyWith(
          activeTodoCount: currentActiveTodoCount,
        ),
      );
    });
  }

  @override
  Future<void> close() {
    todoListSub.cancel();
    return super.close();
  }
}
