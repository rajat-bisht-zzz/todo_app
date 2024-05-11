import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/cubit/cubits.dart';
import 'package:todo_app/utils/debounce.dart';

import '../../models/todo_model.dart';

class TodoSearch extends StatelessWidget {
  TodoSearch({super.key});

  final debounce = Debounce(ms: 1000);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
              labelText: 'Search todos..',
              border: InputBorder.none,
              filled: true,
              prefixIcon: Icon(Icons.search)),
          onChanged: (String? newSearchTerm) {
            if (newSearchTerm != null) {
              debounce.run(() {
                context.read<TodoSearchCubit>().setSearchTerm(newSearchTerm);
              });
            }
          },
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            filterButton(context, Filter.all),
            filterButton(context, Filter.completed),
            filterButton(context, Filter.active),
          ],
        )
      ],
    );
  }
}

Widget filterButton(BuildContext context, Filter filter) {
  return TextButton(
    onPressed: () {
      context.read<TodoFilterCubit>().changeFilter(filter);
    },
    child: Text(
      filter == Filter.all
          ? 'All'
          : filter == Filter.active
              ? 'Active'
              : 'Completed',
      style: TextStyle(fontSize: 18, color: textColor(context, filter)),
    ),
  );
}

Color textColor(BuildContext context, Filter filter) {
  final currentFilter = context.watch<TodoFilterCubit>().state.filter;
  return currentFilter == filter ? Colors.blue : Colors.grey;
}
