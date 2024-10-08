import 'dart:async';
import 'package:flutter/material.dart';
import 'package:user_panel/Screens/landing_screen.dart';
// Make sure this points to the correct login screen file

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Set a timer to navigate to the login screen after 2 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LandingPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Center the image
          Expanded(
            child: Center(
              child: Image.asset(
                'assets/images/SKR.png',
                width: 400, // Adjust the width as needed
                height: 400, // Adjust the height as needed
              ),
            ),
          ),
          // Push the "Created by" text to the bottom
          const Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Created by NVR',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}