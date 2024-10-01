import 'package:flutter/material.dart';
import 'package:user_panel/Screens/homepage_screen.dart';
import 'package:user_panel/Screens/orderdetail_screen.dart';
import 'package:user_panel/Screens/payment_screen.dart';
import 'package:user_panel/Screens/register_screen.dart';
import 'package:user_panel/Screens/splash_screen.dart';
import 'package:user_panel/Screens/try.dart';
import 'package:user_panel/Screens/verification_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Commarce Application',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const SplashScreen(),
    );
  }
}
