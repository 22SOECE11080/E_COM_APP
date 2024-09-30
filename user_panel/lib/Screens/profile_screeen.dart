import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50], // light green background
      body: SafeArea(
        child: Column(
          children: [
            // Top AppBar-like Container
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
              child: Container(
                height: 60.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.green),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          'Profile',
                          style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    // Profile image
                    const Center(
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage(
                          'assets/images/logo.png', // Replace with your logo image
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          // Name field
                          buildTextField(
                            labelText: 'Name',
                            hintText: 'Nishant',
                            icon: Icons.person,
                          ),
                          const SizedBox(height: 20),
                          // Email field
                          buildTextField(
                            labelText: 'Your Email',
                            hintText: 'nishanttaliya@gmail.com',
                            icon: Icons.email,
                          ),
                          const SizedBox(height: 20),
                          // Phone Number field
                          buildTextField(
                            labelText: 'Phone Number',
                            hintText: '9999999999',
                            icon: Icons.phone,
                          ),
                          const SizedBox(height: 20),
                          // Password field
                          buildPasswordField(),
                          const SizedBox(height: 30),
                          // Save Changes button
                          ElevatedButton(
                            onPressed: () {
                              // Handle save action
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side: const BorderSide(color: Color(0xFFCEC9C9)), // Set border color
                              ),
                            ),
                            child: const Text(
                              'Save Changes',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF005843),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color(0xFF005843)),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, color: Color(0xFF005843)),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Color(0xFF005843)),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Color(0xFF005843)),
            label: 'Profile',
          ),
        ],
        currentIndex: 3, // Set the current index to the Profile tab
        onTap: (index) {
          // Handle navigation based on the selected index
          switch (index) {
            case 0:
              // Navigate to Home
              // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
              break;
            case 1:
              // Navigate to Cart
              // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const CartScreen()));
              break;
            case 2:
              // Navigate to Search
              // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SearchScreen()));
              break;
            case 3:
              // Stay on Profile
              break;
          }
        },
      ),
    );
  }

  // Helper function to build text fields
  Widget buildTextField({
    required String labelText,
    required String hintText,
    required IconData icon,
  }) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: Icon(icon, color: const Color(0xFF005843)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }

  // Helper function to build the password field
  Widget buildPasswordField() {
    return TextField(
      obscureText: !_isPasswordVisible,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
        prefixIcon: const Icon(Icons.lock, color: Color(0xFF005843)),
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: const Color(0xFF005843),
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
