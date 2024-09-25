import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:user_panel/Screens/homepage_screen.dart';
import 'package:user_panel/Screens/login_screen.dart';
=======
import 'package:user_panel/Screens/landing_screen.dart';
>>>>>>> 6c8656a6f9212019029ac2c26797a5eb53c95bd1
import 'package:user_panel/Screens/splash_screen.dart';

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
<<<<<<< HEAD
      home:  SplashScreen(),
=======
      home: SplashScreen(),
>>>>>>> 6c8656a6f9212019029ac2c26797a5eb53c95bd1
    );
  }
}
