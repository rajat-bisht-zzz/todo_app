// import 'package:flutter/material.dart';
// import 'package:todo_app/src/widgets/primary_checkbox.dart';

// class CustomTile extends StatelessWidget {
//   final String todoDescription;
//   final bool isChecked;
//   final Function(bool?) onCheckedChanged;
//   final Function() onDeletePressed;

//   CustomTile({
//     required this.todoDescription,
//     required this.isChecked,
//     required this.onCheckedChanged,
//     required this.onDeletePressed,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       contentPadding: EdgeInsets.zero,
//       dense: false,
//       leading: CircleAvatar(
//         radius: 6,
//       ),
//       title: Text(todoDescription),
//       trailing: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           IconButton(
//             icon: Icon(Icons.delete),
//             onPressed: onDeletePressed,
//           ),
//           PrimaryCheckbox(
//               // value: isChecked,
//               // onChanged: onCheckedChanged,
//               ),
//         ],
//       ),
//     );
//   }
// }
