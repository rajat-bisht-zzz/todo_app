import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubit/todo_list/todo_list_cubit.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/widgets/primary_tile_item.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  const TodoItem({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return CustomTile(
      isChecked: false,
      todoDescription: todo.desc,
      onCheckedChanged: (bool) {},
      onDeletePressed: () {
        context.read<TodoListCubit>().removeTodo(todo);
      },
    );
  }
}
