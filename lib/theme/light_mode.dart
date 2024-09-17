import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme:  ColorScheme.light(
    background: Colors.grey.shade200,
    primary: Colors.orange.shade400,
    secondary: Colors.blue.shade300,
    inversePrimary: Colors.black,
  ),
  textTheme: ThemeData.light().textTheme.apply(
    bodyColor: Colors.grey[800],
    displayColor: Colors.black,
  ),
);