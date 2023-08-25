import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/blocs.dart';

class TodoSearch extends StatelessWidget {
  const TodoSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
      onSubmitted: (todoDesc) {
        if (todoDesc.trim().isNotEmpty) {
          context.read<TodoListBloc>().add(
                AddTodoEvent(
                  todoDesc: todoDesc,
                ),
              );
        }
      },
    );
  }
}
