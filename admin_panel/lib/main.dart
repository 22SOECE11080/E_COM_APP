import 'package:admin_panel/Screens/addproduct_screen.dart';
import 'package:admin_panel/Screens/customer_screen.dart';
import 'package:admin_panel/Screens/dashboard_screen.dart';
import 'package:admin_panel/Screens/login_screen.dart';
import 'package:admin_panel/Screens/orderdetails_screen.dart';
import 'package:admin_panel/Screens/orderlist_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommarce app Admin Pannel',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const LoginScreen(),
    );
  }
}