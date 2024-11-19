import 'package:flutter/material.dart';
import 'package:user_panel/admin_screen/dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = false; // Manage password visibility state

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height for the image size
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFE7F2E4), // Light green background color
      body: Center(
        child: Container(
          constraints: const BoxConstraints(
              maxWidth: 1000), // Limits max width for responsiveness
          padding: const EdgeInsets.all(20.0),
          child: Container(
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 4,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Left Column: Feature List
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right:
                            30.0), // Right padding for space between list and divider
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Image logo
                        Image.asset(
                          'assets/images/satvakrushi_logo.png',
                          width: screenWidth *
                              0.5, // Adjusted width to fit within the screen
                          height: screenHeight *
                              0.25, // Adjusted height to fit properly
                          fit: BoxFit
                              .contain, // Maintains the aspect ratio of the image
                        ),
                        const SizedBox(height: 20), // Spacing between items
                        _buildFeatureRow(
                            Icons.local_florist, 'Organic Groceries'),
                        const SizedBox(height: 20), // Spacing between items
                        _buildFeatureRow(
                            Icons.restaurant, 'Whole foods and vegetables'),
                        const SizedBox(height: 20),
                        _buildFeatureRow(
                            Icons.delivery_dining, 'Fast Delivery'),
                        const SizedBox(height: 20),
                        _buildFeatureRow(
                            Icons.refresh, 'Easy Refund and Return'),
                        const SizedBox(height: 20),
                        _buildFeatureRow(Icons.security, 'Secure and Safe'),
                      ],
                    ),
                  ),
                ),
                // Divider between columns
                Container(
                  height: 350, // Divider height
                  width: 1,
                  color: Colors.grey[400],
                ),
                // Right Column: Login Form
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 30.0), // Left padding to space from divider
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Logo and Header Section
                        const SizedBox(height: 20),
                        const Text(
                          'Login with SATTVA KRUSHI',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Enter your number we will send 6 digit OTP on this number',
                          style:
                              TextStyle(fontSize: 14, color: Colors.grey[600]),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 30),
                        // Phone Number Input
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Phone Number',
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            TextField(
                              decoration: InputDecoration(
                                hintText: 'Enter your phone number',
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Password',
                              style: TextStyle(
                                color: Colors.grey[700],
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            TextField(
                              obscureText: !_isPasswordVisible,
                              decoration: InputDecoration(
                                hintText: 'Enter your password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                filled: true,
                                fillColor: Colors.grey[200],
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isPasswordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isPasswordVisible = !_isPasswordVisible;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        // Login Button
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const DashboardScreen()),
                            );
                            // Add login action here
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(
                                0xFFE7F2E4), // Button color similar to the image
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              side: const BorderSide(color: Color(0xFFCEC9C9)),

                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 14.0, horizontal: 60.0),
                          ),
                          child: const Text('Login'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to build each feature row
  Widget _buildFeatureRow(IconData icon, String feature) {
    return Row(
      children: [
        Icon(icon, color: Colors.green, size: 28), // Slightly larger icons
        const SizedBox(width: 15),
        Text(
          feature,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
