import 'package:flutter/material.dart';
import 'package:user_panel/Screens/homepage_screen.dart';
<<<<<<< HEAD
import 'package:user_panel/Screens/login_screen.dart';
import 'package:user_panel/Screens/newpassword_screen.dart';
import 'package:user_panel/Screens/verification_screen.dart';
=======
>>>>>>> c3ec42c6aae1a35df26b6a0c5db7cbb12807133a

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
