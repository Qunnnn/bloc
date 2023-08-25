part of 'todo_search_bloc.dart';

@immutable
sealed class TodoSearchEvent extends Equatable {}

final class SetSearchTodoTerm extends TodoSearchEvent {
  final String searchTerm;
  SetSearchTodoTerm({required this.searchTerm});

  @override
  List<Object?> get props => [searchTerm];
}
