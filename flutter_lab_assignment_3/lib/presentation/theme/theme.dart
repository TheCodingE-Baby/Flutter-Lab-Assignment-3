import 'package:flutter/material.dart';
import 'package:flutter_lab_assignment_3/main.dart';

MaterialApp materialApp() {
  return MaterialApp(
    title: 'Album App',
    theme: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.blue[800],
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      fontFamily: 'Arial',
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        bodyMedium: TextStyle(
          fontSize: 16.0,
          color: Colors.white,
        ),
      ),
    ),
    home: const MyHomePage(title: 'Album App'),
  );
}