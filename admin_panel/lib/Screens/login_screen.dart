import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9F5EC), // Light green background color
      body: Center(
        child: Container(
          constraints: BoxConstraints(
              maxWidth: 1000), // Limits max width for responsiveness
          padding: const EdgeInsets.all(20.0),
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
                      _buildFeatureRow(
                          Icons.local_florist, 'Organic Groceries'),
                      SizedBox(height: 20), // Spacing between items
                      _buildFeatureRow(
                          Icons.restaurant, 'Whole foods and vegetables'),
                      SizedBox(height: 20),
                      _buildFeatureRow(Icons.delivery_dining, 'Fast Delivery'),
                      SizedBox(height: 20),
                      _buildFeatureRow(Icons.refresh, 'Easy Refund and Return'),
                      SizedBox(height: 20),
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
                      Image.asset('assets/images/satvakrushi_logo.jpg',
                          height: 80), // Adjusted logo size
                      SizedBox(height: 20),
                      Text(
                        'Login with SATTVA KRUSHI',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Enter your number we will send 6 digit OTP on this number',
                        style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 30),
                      // Phone Number Input
                      TextField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
                          prefixIcon: Icon(Icons.phone),
                          contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      // Password Input
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(Icons.lock),
                          suffixIcon: Icon(Icons.visibility_off),
                          contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      // Login Button
                      ElevatedButton(
                        onPressed: () {
                          // Add login action here
                        },
                        child: Text('Login'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(
                              0xFFB8DABA), // Button color similar to the image
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 14.0, horizontal: 60.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
        SizedBox(width: 15),
        Text(
          feature,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
