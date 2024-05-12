import 'package:flutter/material.dart';

class SecondaryHeading extends StatelessWidget {
  final String headingText;
  const SecondaryHeading({super.key, required this.headingText});

  @override
  Widget build(BuildContext context) {
    return Text(
      headingText,
      style: TextStyle(
        color: Colors.grey.shade700,
        fontWeight: FontWeight.w400,
        fontSize: 18,
      ),
    );
  }
}
