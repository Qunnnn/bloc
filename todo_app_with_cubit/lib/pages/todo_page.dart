import 'package:flutter/material.dart';
import 'package:todo_app_with_cubit/models/todo_model.dart';
import 'package:todo_app_with_cubit/widgets/show_todos.dart';
import '../widgets/widgets.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({
    super.key,
    required this.title,
  });
  final String title;

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                TodoHeader(),
                TodoSearch(),
                SizedBox(
                  height: 12,
                ),
                TodoFilterAndSearch(),
                ShowTodos(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
