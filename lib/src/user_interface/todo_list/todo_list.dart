import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/user_interface/todo_list/todo_items/todo_items.dart';
import 'package:todo_app/src/user_interface/todo_list/todo_list_bloc.dart';

class TodosList extends StatelessWidget {
  const TodosList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoListBloc, TodoListState>(builder: (context, state) {
      return state.todos.length == 0
          ? Center(
              child: Text("No Tasks Due Today!"),
            )
          : ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: state.todos.length,
              itemBuilder: (BuildContext context, int index) {
                final todo = state.todos[index];
                return Dismissible(
                    onDismissed: (_) {
                      context.read<TodoListBloc>().add(RemoveTodoEvent(todo));
                    },
                    confirmDismiss: (_) {
                      return showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Are you sure?'),
                              content: Text('Do you really want to delete?'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context, false),
                                  child: Text('No'),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(context, true),
                                  child: Text('Yes'),
                                ),
                              ],
                            );
                          });
                    },
                    background: showBackground(0),
                    secondaryBackground: showBackground(1),
                    key: ValueKey(todo.id),
                    child: TodoItems(todo: todo));
              },
            );
    });
  }

  Widget showBackground(int direction) {
    return Container(
      margin: EdgeInsets.all(4),
      padding: EdgeInsets.symmetric(horizontal: 10),
      color: Colors.red,
      alignment: direction == 0 ? Alignment.centerLeft : Alignment.centerRight,
      child: Icon(
        Icons.delete,
        size: 30,
        color: Colors.white,
      ),
    );
  }
}
