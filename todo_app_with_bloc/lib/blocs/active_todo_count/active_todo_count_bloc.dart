import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'active_todo_count_event.dart';
part 'active_todo_count_state.dart';

class ActiveTodoCountBloc extends Bloc<ActiveTodoCountEvent, ActiveTodoCountState> {
  ActiveTodoCountBloc() : super(ActiveTodoCountInitial()) {
    on<ActiveTodoCountEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
