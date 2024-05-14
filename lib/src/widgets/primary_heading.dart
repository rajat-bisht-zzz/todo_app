import 'package:flutter/material.dart';

class PrimaryHeading extends StatelessWidget {
  final String headingText;

  const PrimaryHeading({super.key, required this.headingText});

  @override
  Widget build(BuildContext context) {
    return Text(
      headingText,
      style: TextStyle(
        color: Colors.black,
        fontSize: 36,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
