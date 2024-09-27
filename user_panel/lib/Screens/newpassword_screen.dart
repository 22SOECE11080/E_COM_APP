import 'package:flutter/material.dart';
import 'package:user_panel/Screens/register_screen.dart';

class NewpasswordScreen extends StatefulWidget {
  const NewpasswordScreen({super.key});

  @override
  State<NewpasswordScreen> createState() => _NewpasswordScreenState();
}

class _NewpasswordScreenState extends State<NewpasswordScreen> {
  bool _isNewPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double screenWidth = size.width;

    return Scaffold(
      body: Column(
        children: [
          // Top section with logo
          Container(
            height: size.height * 0.3, // 30% of screen height
            width: screenWidth,
            decoration: const BoxDecoration(
              color: Color(0xFFE7F2E4),
            ),
            child: Center(
              child: Image.asset(
                'assets/images/satvakrushi_logo.jpg',
                width: screenWidth,
                height: 800.0, // Adjust size for proper fit
              ),
            ),
          ),
          // Bottom section with form
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
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    // Gray line above the title
                    Center(
                      child: Container(
                        width: 50.0,
                        height: 3.0,
                        color: Colors.grey,
                        margin: const EdgeInsets.only(bottom: 20.0),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const Text(
                      'Reset Password',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    
                    // Column for New Password
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          Text(
                            'Enter New Password',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        TextField(
                          obscureText: !_isNewPasswordVisible,
                          decoration: InputDecoration(
                            hintText: 'Enter New Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isNewPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isNewPasswordVisible = !_isNewPasswordVisible;
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                      ],
                    ),
                    
                    // Column for Confirm Password
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            'Enter Conform Password',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        TextField(
                          obscureText: !_isConfirmPasswordVisible,
                          decoration: InputDecoration(
                            hintText: 'Confrom Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            filled: true,
                            fillColor: Colors.grey[200],
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isConfirmPasswordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 30.0),
                    
                   Center(
  child: ElevatedButton(
    onPressed: () {
      // Handle reset password logic here
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const RegisterScreen(),
        ),
      );
    },
    style: ElevatedButton.styleFrom(
      backgroundColor:  const Color(0xFFE7F2E4), // Button color
      padding: const EdgeInsets.symmetric(
        horizontal: 80, // Adjust width as needed
        vertical: 15,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
         side: const BorderSide(color: Color(0xFFCEC9C9)),
      ),
    ),
    child: const Text(
      'Reset Password',
      style: TextStyle(
        fontSize: 18,
        color: Color(0xFF005843),
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
    );
  }
}
