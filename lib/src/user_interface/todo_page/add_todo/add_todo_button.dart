import 'package:flutter/material.dart';
import 'package:todo_app/src/user_interface/todo_page/add_todo/todo_bottom_sheet.dart';

class AddTodoButton extends StatelessWidget {
  const AddTodoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return TodoBottomSheet();
            });
      },
      shape: CircleBorder(),
    );
  }
}
