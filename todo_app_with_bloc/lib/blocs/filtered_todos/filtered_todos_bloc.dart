import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'filtered_todos_event.dart';
part 'filtered_todos_state.dart';

class FilteredTodosBloc extends Bloc<FilteredTodosEvent, FilteredTodosState> {
  FilteredTodosBloc() : super(FilteredTodosInitial()) {
    on<FilteredTodosEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
