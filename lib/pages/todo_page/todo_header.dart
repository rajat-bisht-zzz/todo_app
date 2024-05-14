import 'package:flutter/material.dart';
import 'package:todo_app/widgets/primary_heading.dart';
import 'package:todo_app/widgets/secondary_heading.dart';

class TodoHeader extends StatelessWidget {
  const TodoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PrimaryHeading(headingText: 'Hello, Rajat'),
        SecondaryHeading(headingText: 'here\'s what\'s due today')

        // Text(
        //   formattedDate,
        //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        // ),
        // Text(
        //   '',
        //   style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        // ),
        // Text(
        //   'here\'s what\'s due today',
        //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
        // ),
        // BlocBuilder<ActiveTodoCountCubit, ActiveTodoCountState>(
        //   builder: (context, state) {
        //     return Text(
        //       '${state.activeTodoCount} items left',
        //       style: TextStyle(fontSize: 40),
        //     );
        //   },
        // ),
        // Text(
        //   '${context.watch<ActiveTodoCountCubit>().state.activeTodoCount} items left',
        //   style: TextStyle(fontSize: 20, color: Colors.red),
        // ),
      ],
    );
  }
}
