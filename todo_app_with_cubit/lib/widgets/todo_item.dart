import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../cubits/todo_list/todo_list_cubit.dart';
import '../models/todo_model.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({
    super.key,
    required this.todo,
  });

  final Todo todo;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(widget.todo.id),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              context.read<TodoListCubit>().remove(widget.todo);
            },
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
          SlidableAction(
            onPressed: (context) {
              showDialog(
                  context: context,
                  builder: (context) {
                    bool error = false;
                    TextEditingController textEditingController =
                        TextEditingController(text: widget.todo.desc);
                    return StatefulBuilder(
                      builder: (context, setState) => AlertDialog(
                        title: const Text(
                          'Edit todo',
                          style: TextStyle(fontSize: 16),
                        ),
                        content: TextField(
                          controller: textEditingController,
                          autofocus: true,
                          decoration: InputDecoration(
                            errorText: error ? "Value cannot be empty !" : null,
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text(
                              'Cancel',
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(
                                () {
                                  if (textEditingController.text.isEmpty) {
                                    error = true;
                                  }
                                  if (!error) {
                                    context.read<TodoListCubit>().editTodo(
                                        widget.todo.id,
                                        textEditingController.text);
                                    Navigator.pop(context);
                                  }
                                },
                              );
                            },
                            child: const Text(
                              'Edit',
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            },
            backgroundColor: const Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.edit,
            label: 'Edit',
          ),
        ],
      ),
      child: ListTile(
        leading: Checkbox(
          value: widget.todo.completed,
          onChanged: (value) =>
              context.read<TodoListCubit>().toggleTodo(widget.todo.id),
        ),
        title: Text(
          widget.todo.desc,
          style: const TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}
