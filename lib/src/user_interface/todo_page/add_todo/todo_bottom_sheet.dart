import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/user_interface/todo_list/todo_list_bloc.dart';

class TodoBottomSheet extends StatefulWidget {
  @override
  State<TodoBottomSheet> createState() => _TodoBottomSheetState();
}

class _TodoBottomSheetState extends State<TodoBottomSheet> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.8,
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Task',
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                final desc = _controller.text;
                desc.isNotEmpty ? context.read<TodoListBloc>().add(AddTodoEvent(todoDescription: desc)) : null;
                Navigator.pop(context);
              },
              child: Center(child: Text('add')),
            ),
          ],
        ),
      ),
    );
  }
}
