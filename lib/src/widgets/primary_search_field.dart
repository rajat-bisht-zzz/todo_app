import 'package:flutter/material.dart';

class PrimaryTextField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String)? onSubmitted;
  final String labelText;

  const PrimaryTextField({
    super.key,
    required this.controller,
    this.onSubmitted,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(hintText: labelText,
      ),
      onSubmitted: onSubmitted,
    );
  }
}
