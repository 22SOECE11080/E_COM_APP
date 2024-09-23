import 'package:flutter/material.dart';
import 'package:user_panel/Screens/newpassword_screen.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  // A list of controllers for each digit of the verification code
  final List<TextEditingController> _controllers =
      List.generate(4, (index) => TextEditingController());

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
            Container(
              height: screenHeight * 0.3, // Height of the top section
              width: screenWidth,
              decoration: const BoxDecoration(
                color: Color(0xFFE7F2E4),
              ),
              child: Image.asset(
                'assets/images/satvakrushi_logo.jpg', // Add your logo asset here
                width: screenWidth * 0.6, // Adjust logo width as needed
                height: 100.0,
              ),
            ),
            // Bottom section for verification code
            Expanded(
              child: Container(
                width: screenWidth,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // gray line above the title
                      Center(
                        child: Container(
                          width: 50.0,
                          height: 3.0,
                          color: Colors.grey,
                          margin: const EdgeInsets.only(bottom: 20.0),
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      const Text(
                        'Verification',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      const Text(
                        'Enter Verification Code',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(4, (index) {
                          return SizedBox(
                            width: 50.0,
                            child: TextField(
                              controller: _controllers[index],
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                counterText: "", // Hide the character counter
                              ),
                              maxLength: 1, // Allow only one character
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 20.0),
                      const Text(
                        "If you didn’t receive a code,",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Logic to resend the verification code
                        },
                        child: const Text(
                          "Resend",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Color(0xFF00796B), // Green color for Resend
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40.0),
                      ElevatedButton(
                        onPressed: () {
                          // Logic to verify the entered code
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const NewpasswordScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                                const Color(0xFFA3D3A2), // Button color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 100.0, vertical: 15.0),
                          child: Text(
                            'Verify Now',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black, // Button text color
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
