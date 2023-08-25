part of 'filtered_todos_bloc.dart';

@immutable
sealed class FilteredTodosEvent extends Equatable {}

final class CalculatedFilteredTodosEvent extends FilteredTodosEvent {
  final List<Todo> filteredTodos;
  CalculatedFilteredTodosEvent({required this.filteredTodos});
  
  @override
  List<Object?> get props => [filteredTodos];
}
