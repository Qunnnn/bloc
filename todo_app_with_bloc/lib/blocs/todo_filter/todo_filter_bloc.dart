import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'todo_filter_event.dart';
part 'todo_filter_state.dart';

class TodoFilterBloc extends Bloc<TodoFilterEvent, TodoFilterState> {
  TodoFilterBloc() : super(TodoFilterInitial()) {
    on<TodoFilterEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
