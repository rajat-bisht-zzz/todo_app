import 'package:flutter/material.dart';

class PrimaryCheckbox extends StatefulWidget {
  @override
  _PrimaryCheckboxState createState() => _PrimaryCheckboxState();
}

class _PrimaryCheckboxState extends State<PrimaryCheckbox> {
  bool isChecked = false;
  Color backgroundColor = Colors.white;

  void toggleCheckbox() {
    setState(() {
      isChecked = !isChecked;
      backgroundColor = isChecked ? Color(0xFF49BEB6) : Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: toggleCheckbox,
      child: Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.black),
            color: backgroundColor,
          ),
          child: Icon(Icons.check, weight: 2, size: 12, color: Colors.black)),
    );
  }
}
