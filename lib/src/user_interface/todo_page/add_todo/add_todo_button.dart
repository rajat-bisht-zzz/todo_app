import 'package:flutter/material.dart';
import 'package:todo_app/src/user_interface/todo_page/add_todo/todo_bottom_sheet.dart';

class AddTodoButton extends StatelessWidget {
  const AddTodoButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        showCustomBottomSheet(context);
      },
      shape: CircleBorder(),
    );
  }
}

void showCustomBottomSheet(BuildContext context) {
  final screenHeight = MediaQuery.of(context).size.height;
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: "Dismiss",
    barrierColor: Color(0xFF49BEB6),
    transitionDuration: Duration(milliseconds: 300),
    pageBuilder: (context, animation1, animation2) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Material(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
          child: Container(
            height: screenHeight * 0.8, // 80% of screen height
            padding: EdgeInsets.all(16.0),
            child: TodoBottomSheet(),
          ),
        ),
      );
    },
    transitionBuilder: (context, animation1, animation2, child) {
      return SlideTransition(
        position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(animation1),
        child: child,
      );
    },
  );
}
