import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/blocs.dart';

class TodoHeader extends StatelessWidget {
  const TodoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'TODO',
            style: TextStyle(color: Colors.black, fontSize: 40),
          ),
          Builder(
            builder: (context) => Text(
              '${context.watch<ActiveTodoCountBloc>().state.activeTodoCount} left',
              style: const TextStyle(color: Colors.red, fontSize: 20),
            ),
          )
        ],
      );
  }
}
