import 'package:flutter/material.dart';
import 'package:user_panel/Screens/login_screen.dart';
import 'package:user_panel/Screens/newpassword_screen.dart';
import 'package:user_panel/Screens/register_screen.dart';
import 'package:user_panel/Screens/splash_screen.dart';
import 'package:user_panel/Screens/verification_screen.dart';

import 'Screens/homepage_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'User Panel',
      home: HomePage(),
    );
  }
}
