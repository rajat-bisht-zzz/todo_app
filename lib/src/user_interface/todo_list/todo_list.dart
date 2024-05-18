import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/user_interface/todo_list/todo_items/todo_items.dart';
import 'package:todo_app/src/user_interface/todo_list/todo_list_bloc.dart';

class TodosList extends StatelessWidget {
  const TodosList({super.key});

  @override
  Widget build(BuildContext context) {
    // final todos = context.watch<FilteredTodosCubit>().state.filteredTodos;

    return BlocBuilder<TodoListBloc, TodoListState>(builder: (context, state) {
      return ListView.builder(
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
              child: TodoItem(todo: todo));
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

// class TodoItem extends StatefulWidget {
//   final Todo todo;
//   const TodoItem({
//     Key? key,
//     required this.todo,
//   }) : super(key: key);

//   @override
//   State<TodoItem> createState() => _TodoItemState();
// }

// class _TodoItemState extends State<TodoItem> {
//   late final TextEditingController textEditingController;

//   @override
//   void initState() {
//     super.initState();
//     textEditingController = TextEditingController();
//   }

//   @override
//   void dispose() {
//     textEditingController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       onTap: () {
//         showDialog(
//             context: context,
//             builder: (context) {
//               bool _error = false;
//               textEditingController.text = widget.todo.desc;

//               return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
//                 return AlertDialog(
//                   title: Text('Edit Todo'),
//                   content: TextField(
//                     controller: textEditingController,
//                     autofocus: true,
//                     decoration: InputDecoration(errorText: _error ? "Value can't be empty" : null),
//                   ),
//                   actions: [
//                     TextButton(
//                       onPressed: () => Navigator.pop(context),
//                       child: Text('CANCEL'),
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         setState(
//                           () {
//                             _error = textEditingController.text.isEmpty ? true : false;
//                             if (!_error) {
//                               context.read<TodoListCubit>().editTodo(widget.todo.id, textEditingController.text);
//                               Navigator.pop(context);
//                             }
//                           },
//                         );
//                       },
//                       child: Text('EDIT'),
//                     ),
//                   ],
//                 );
//               });
//             });
//       },
//       leading: Checkbox(
//         value: widget.todo.completed,
//         onChanged: (bool? checked) {
//           context.read<TodoListCubit>().toggleTodo(widget.todo.id);
//         },
//       ),
//       title: Text(widget.todo.desc),
//     );
//   }
// }
