import 'package:flutter/material.dart';
import 'package:user_panel/Screens/login_screen.dart';
import 'package:user_panel/Screens/verification_screen.dart'; // Import GetX package

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});

  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double screenHeight = size.height;
    final double screenWidth = size.width;

    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        color: const Color(0xFFE7F2E4), // Background color for the top section
        child: Column(
          children: [
            // Top section with logo
            Container(
              height: screenHeight * 0.3, // 30% of screen height
              width: screenWidth, // Full screen width
              decoration: const BoxDecoration(
                color: Color(0xFFE7F2E4),
              ),
              child: Center(
                child: Image.asset(
                  'assets/images/satvakrushi_logo.jpg', // Add your logo asset here
                  width: screenWidth, // Adjust logo width as needed
                  height: 800.0,
                ),
              ),
            ),
            // Bottom section with form
            Container(
              height: screenHeight * 0.7, // 70% of screen height
              width: screenWidth, // Full screen width
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  const SizedBox(height: 30),

                    // Small gray line above Sign Up text
                    Center(
                      child: Container(
                        width: 50.0,
                        height: 3.0,
                        color: Colors.grey,
                        margin: const EdgeInsets.only(bottom: 20.0),
                      ),
                    ),
                    // forget title
                    const Text(
                      'Forget Password',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 80),
                    // Phone number field
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Phone Number', // Label text above the TextField
                          style: TextStyle(
                            color: Colors.grey[700], // Label color
                            fontSize: 16, // Label font size
                            fontWeight: FontWeight.bold, // Label bold
                          ),
                        ),
                        const SizedBox(height: 8.0), // Spacing
                        TextField(
                          decoration: InputDecoration(
                            hintText: 'Enter your phone number', // Placeholder
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Back to sign in field
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()),
                            );
                          },
                          child: const Text(
                            'Back to Sign In',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20, // Increase text size
                              fontWeight: FontWeight.bold, // Bold text
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        // Send OTP button
                        ElevatedButton(
                          onPressed: () {
                            // Handle forget password action (send OTP)
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const VerificationScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color(0xFFA3D3A2), // Button color
                            padding: const EdgeInsets.symmetric(
                              horizontal: 100,
                              vertical: 15,
                            ), // Button size
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(20), // Rounded corners
                            ),
                          ),
                          child: const Text(
                            'Send OTP',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
