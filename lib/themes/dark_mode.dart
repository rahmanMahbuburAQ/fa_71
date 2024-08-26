import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    surface: const Color.fromARGB(255, 35, 35, 35),// Use 'surface' instead of 'background'
    primary: const Color.fromARGB(255, 122, 122, 122),
    secondary: const Color.fromARGB(255, 30, 30, 30),
    tertiary: const Color.fromARGB(255, 47, 47, 47), // Color for text/icons on primary color
    inversePrimary: Colors.grey.shade300,      // Color for text/icons on secondary color
  ),
  scaffoldBackgroundColor: const Color.fromARGB(255, 35, 35, 35),  // Set scaffold background color
);
