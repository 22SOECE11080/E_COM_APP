import 'package:flutter/material.dart';
import 'package:user_panel/Screens/login_screen.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background image covering the entire screen
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/landing page.png'), // Add your image to assets folder
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Text and button over the image
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Welcome Text
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 80.0),
                child: Column(
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Login or Sign Up to Continue using our app.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              // Get Started Button
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                     const Color(0xFFE7F2E4), // Button color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                     side: const BorderSide(color: Color(0xFFCEC9C9)), // Set border color

                    ),
                  ),
                  child: const Text(
                    'Get Started >',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF005843) , // Text color for the button
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
