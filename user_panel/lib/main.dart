import 'package:flutter/material.dart';
import 'package:user_panel/Screens/cart_screen.dart';
import 'package:user_panel/Screens/homepage_screen.dart';
import 'package:user_panel/Screens/orderdetail_screen.dart';
import 'package:user_panel/Screens/product_page.dart';
import 'package:user_panel/Screens/review_screen.dart';
import 'package:user_panel/Screens/splash_screen.dart';
//import 'package:user_panel/Screens/try.dart';
import 'package:user_panel/Screens/wishlist_screen.dart';
//import 'package:user_panel/Screens/review_screen.dart';
import 'package:user_panel/Screens/profile_screeen.dart';
//import 'package:user_panel/Screens/cart_screen.dart';
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
