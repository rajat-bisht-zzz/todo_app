import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/src/widgets/secondary_heading.dart';

class TodoTimeHeader extends StatelessWidget {
  const TodoTimeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEEE, d MMMM').format(now).toLowerCase();

    return SecondaryHeading(
      headingText: formattedDate,
    );
  }
}
