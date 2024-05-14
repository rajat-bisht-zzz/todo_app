import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    background: Colors.white,
    primary: Color(0xFF49BEB6),
    secondary: Colors.grey.shade200,
    tertiary: Colors.white,
  ),
  textTheme: TextTheme(),
  checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateColor.resolveWith(
        (states) => states.contains(MaterialState.selected) ? Color(0xFF49BEB6) : Colors.white,
      ),
      shape: CircleBorder()),
);
