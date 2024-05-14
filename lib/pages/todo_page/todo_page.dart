import 'package:flutter/material.dart';
import 'package:todo_app/pages/todo_page/create_todo.dart';
import 'package:todo_app/pages/todo_page/show_todos.dart';
import 'package:todo_app/pages/todo_page/todo_header.dart';
import 'package:todo_app/pages/todo_page/todo_time_header.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Row(
                  children: [
                    TodoTimeHeader(),
                  ],
                ),
                SizedBox(height: 56),
                Center(
                  child: Column(
                    children: [
                      TodoHeader(),
                      SizedBox(height: 20),
                      CreateTodo(),
                      SizedBox(height: 20),
                      TodosList(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
