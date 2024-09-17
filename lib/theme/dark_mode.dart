import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme:  const ColorScheme.dark(
    background: Colors.black,
    primary: Color(0xFF07C63D),
    secondary: Color(0xFFE69111),
    inversePrimary: Colors.black,
  ),
  textTheme: ThemeData.light().textTheme.apply(
    bodyColor: const Color(0xFF21F05C),
    displayColor: Colors.white,
  ),
);