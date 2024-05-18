import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/models/todo_model.dart';
import 'package:todo_app/src/user_interface/todo_list/todo_list_bloc.dart';

class RemoveTodoButton extends StatelessWidget {
  final Todo todo;
  const RemoveTodoButton({
    Key? key,
    required this.todo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.delete),
      onPressed: () {
        context.read<TodoListBloc>().add(RemoveTodoEvent(todo));
      },
    );
  }
}
