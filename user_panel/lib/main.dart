import 'package:flutter/material.dart';
import 'package:user_panel/Screens/homepage_screen.dart';
import 'package:user_panel/Screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commarce Application',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const LoginScreen(),
    );
  }
}
