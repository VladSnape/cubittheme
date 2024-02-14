import 'package:flutter/material.dart';

class AppTheme {
  ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
  );
  ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.cyan,
    brightness: Brightness.light,
  );
}

class ColorManager {
  static const Color greenAccent = Colors.greenAccent;
  static const Color red = Colors.redAccent;
  static const Color green = Color.fromARGB(255, 82, 255, 154);
}

TextStyle getTextStyle(
  Color? color,
  double? size,
) {
  return TextStyle(
    color: color,
    fontSize: size,
  );
}
