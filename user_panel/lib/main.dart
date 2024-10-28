import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:user_panel/Screens/homepage_screen.dart';
<<<<<<< HEAD
import 'package:user_panel/Screens/profile_screeen.dart';
import 'package:user_panel/Screens/splash_screen.dart';
=======
import 'package:user_panel/Screens/login_screen.dart';
>>>>>>> 138b25a642042e1e270459d61d4a54a9e3aeaeea
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
