import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_with_cubit/cubits/cubits.dart';
import 'package:todo_app_with_cubit/widgets/todo_item.dart';

class ShowTodos extends StatelessWidget {
  const ShowTodos({super.key});

  @override
  Widget build(BuildContext context) {
    final todos = context.watch<FilteredTodosCubit>().state.filteredTodos;
    return ListView.separated(
      shrinkWrap: true,
      itemCount: todos.length,
      separatorBuilder: (context, index) => Divider(
        height: 4,
        color: Colors.grey[400],
      ),
      itemBuilder: (context, index) {
        final todo = todos[index];
        return TodoItem(todo: todo);
      },
    );
  }
}


