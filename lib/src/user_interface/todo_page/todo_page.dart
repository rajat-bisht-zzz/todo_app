import 'package:flutter/material.dart';
import 'package:todo_app/src/user_interface/todo_list/todo_list.dart';
import 'package:todo_app/src/user_interface/todo_page/add_todo/add_todo.dart';
import 'package:todo_app/src/user_interface/todo_page/add_todo/add_todo_button.dart';
import 'package:todo_app/src/user_interface/todo_page/todo_header/todo_header.dart';
import 'package:todo_app/src/user_interface/todo_page/todo_time_header/todo_time_header.dart';

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
                      AddTodo(),
                      SizedBox(height: 20),
                      TodosList(),
                      SizedBox(height: 60),
                      AddTodoButton()
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
