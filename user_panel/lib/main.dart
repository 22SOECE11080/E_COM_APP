import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:user_panel/admin_screen/login_screen.dart';
import 'package:user_panel/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, // Use FirebaseOptions here
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'User Pannel',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const LoginScreen(),
    );
  }
}
