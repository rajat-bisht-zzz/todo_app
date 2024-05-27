import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/models/todo_model.dart';

import '../user_interface/todo_list/todo_list_bloc.dart';

class PrimaryCheckbox extends StatefulWidget {
  final Todo todo;

  const PrimaryCheckbox({super.key, required this.todo});

  @override
  _PrimaryCheckboxState createState() => _PrimaryCheckboxState();
}

class _PrimaryCheckboxState extends State<PrimaryCheckbox> {
  late bool isChecked;
  late Color backgroundColor;
  late Color textFontColor;

  @override
  void initState() {
    super.initState();
    isChecked = widget.todo.completed;
    backgroundColor = isChecked ? Color(0xFF49BEB6) : Colors.white;
    textFontColor = isChecked ? Colors.grey : Colors.black;
  }

  void toggleCheckbox() {
    setState(() {
      isChecked = !widget.todo.completed;
      backgroundColor = isChecked ? Color(0xFF49BEB6) : Colors.white;
      textFontColor = isChecked ? Colors.grey : Colors.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        toggleCheckbox();
        context.read<TodoListBloc>().add(ToggleTodoEvent(widget.todo.id));
      },
      child: Container(
        width: 18,
        height: 18,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black),
          color: backgroundColor,
        ),
        child: isChecked ? Icon(Icons.check, size: 12, color: Colors.black) : null,
      ),
    );
  }
}
