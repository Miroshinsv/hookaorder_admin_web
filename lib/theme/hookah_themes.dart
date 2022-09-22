import 'package:flutter/material.dart';

ThemeData lightTheme(){
  return ThemeData(
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      filled: true,
      hintStyle: const TextStyle(
        color: Colors.grey,
      ),
      fillColor: Colors.white70,
    ),
  );
}