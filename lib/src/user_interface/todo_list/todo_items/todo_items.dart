import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/models/todo_model.dart';
import 'package:todo_app/src/user_interface/todo_list/todo_list_bloc.dart';
import 'package:todo_app/src/widgets/primary_checkbox.dart';

class TodoItems extends StatelessWidget {
  final Todo todo;

  const TodoItems({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 6,
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Text(
              todo.desc,
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: todo.completed ? Colors.black38 : Colors.black,
                  decoration: todo.completed ? TextDecoration.lineThrough : TextDecoration.none),
            ),
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              context.read<TodoListBloc>().add(RemoveTodoEvent(todo));
            },
          ),
          SizedBox(
            width: 20,
          ),
          PrimaryCheckbox(
            todo: todo,
          ),
        ],
      ),
    );
  }
}
