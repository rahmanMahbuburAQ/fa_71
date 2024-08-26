import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade300,  // Use 'surface' instead of 'background'
    primary: Colors.grey.shade500,
    secondary: Colors.grey.shade100,
    tertiary: Colors.white,        // Color for text/icons on primary color
    inversePrimary: Colors.grey.shade700,      // Color for text/icons on secondary color
  ),
  scaffoldBackgroundColor: Colors.grey.shade300,  // Set scaffold background color
);

