import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_with_cubit/cubits/cubits.dart';
import 'package:todo_app_with_cubit/models/todo_model.dart';

class TodoFilterAndSearch extends StatelessWidget {
  const TodoFilterAndSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 60),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search Todo',
              hintStyle: const TextStyle(fontSize: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Colors.grey,
                ),
              ),
              prefixIcon: const Icon(
                Icons.search,
              ),
            ),
            onChanged: (value) {
              context.read<TodoSearchCubit>().setSearchItem(value);
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FilterTodo(
              context: context,
              filter: Filter.all,
            ),
            FilterTodo(
              context: context,
              filter: Filter.active,
            ),
            FilterTodo(
              context: context,
              filter: Filter.completed,
            ),
          ],
        ),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  TextButton FilterTodo({
    required BuildContext context,
    required Filter filter,
  }) {
    return TextButton(
      onPressed: () {
        context.read<TodoFilterCubit>().changeFilter(filter);
      },
      child: Text(
        filter == Filter.all
            ? 'All'
            : filter == Filter.active
                ? 'Active'
                : 'Completed',
        style: TextStyle(
          fontSize: 16,
          color: filter == context.watch<TodoFilterCubit>().state.filter
              ? Colors.blue
              : Colors.grey,
        ),
      ),
    );
  }
}
