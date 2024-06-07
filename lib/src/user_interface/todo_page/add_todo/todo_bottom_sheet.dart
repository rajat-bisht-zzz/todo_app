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
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(36.0),
                    child: TextField(
                      style: TextStyle(fontSize: 40.0),
                      cursorHeight: 50,
                      cursorRadius: Radius.circular(10),
                      cursorColor: Colors.amberAccent,
                      controller: _controller,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 10.0),
                        border: InputBorder.none,
                        hintText: 'Task',
                        hintStyle: TextStyle(fontSize: 40.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: SizedBox(
              width: 80,
              child: ElevatedButton(
                onPressed: () {
                  final desc = _controller.text;
                  if (desc.isNotEmpty) {
                    context.read<TodoListBloc>().add(AddTodoEvent(todoDescription: desc));
                  }
                  Navigator.pop(context);
                },
                child: Center(child: Text('add')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
