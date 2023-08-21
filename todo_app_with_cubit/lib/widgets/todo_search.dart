import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_with_cubit/cubits/cubits.dart';

class TodoSearch extends StatelessWidget {
  const TodoSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration:const InputDecoration(
        border:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
      ),
      onSubmitted: (todoDesc) {
        if (todoDesc.trim().isNotEmpty) {
          context.read<TodoListCubit>().addTodo(todoDesc);
        }
      },
    );
  }
}
