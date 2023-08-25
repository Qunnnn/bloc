part of 'todo_filter_bloc.dart';

@immutable
sealed class TodoFilterEvent extends Equatable {}

final class ChangeFilterEvent extends TodoFilterEvent {
  final Filter filter;
  ChangeFilterEvent({required this.filter});
  @override
  List<Object?> get props => [filter];
}
