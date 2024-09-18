import 'package:flutter/material.dart';
import 'package:user_panel/Screens/forgot_password_screeen.dart';
import 'package:user_panel/Screens/homepage_screen.dart';
import 'package:user_panel/Screens/newpassword_screen.dart';
import 'package:user_panel/Screens/verification_screen.dart';

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
      home: const HomePage(),
    );
  }
}
