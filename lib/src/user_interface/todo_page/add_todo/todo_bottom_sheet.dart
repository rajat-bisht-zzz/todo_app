import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/user_interface/todo_list/todo_list_bloc.dart';

class BottomSheetContent extends StatefulWidget {
  @override
  State<BottomSheetContent> createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
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
            child: Text('add'),
          ),
        ],
      ),
    );
  }
}
