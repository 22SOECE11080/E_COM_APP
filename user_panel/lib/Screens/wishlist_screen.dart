import 'package:flutter/material.dart';

import 'homepage_screen.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  int _selectedIndex = 0; // To track the selected tab

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // You can handle navigation here based on the index
    switch (index) {
      case 0:
        // Navigate to Home
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
        break;
      case 1:
        // Navigate to Mail
        break;
      case 2:
        // Navigate to Cart
        break;
      case 3:
        // Navigate to Profile
        break;
    }
  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        
          backgroundColor: const Color(0xFFFFFFFF), 
        elevation: 1, // Light elevation for subtle shadow effect
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(100),
          ),
        ), // Rounded bottom border
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF2E7D32)), // Green back arrow
          onPressed: () {
            // Navigate to the Home page when clicking on the back arrow
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
        title: const Text(
          'Wishlist',
          style: TextStyle(
            color: Color(0xFF2E7D32), // Green text color
          ),
        ),
        centerTitle: true, // Center the title
      ),
      body: Container(
        color:
            const Color(0xFFE7F2E4), // Apply the E7F2E4 background color here
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Card(
                child: ListTile(
                  leading: Image.asset(
                    index == 0
                        ? 'assets/images/cyclops.png'
                        : 'assets/images/cyclops.png',
                  ),
                  title: Text(index == 0 ? 'Cyclops' : 'Colban 20'),
                  subtitle: const Text('1 L, 500 ml.'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color:  const Color(0xFF2E7D32), // Green background
                          borderRadius:
                              BorderRadius.circular(8), // Rounded edges
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.grid_view),
                          color: Colors.white, // White icon
                          onPressed: () {
                            // Handle grid view button press
                          },
                        ),
                      ),
                      const SizedBox(
                          width: 8), // Add some spacing between buttons
                      Container(
                        decoration: BoxDecoration(
                          color:  const Color(0xFF2E7D32), // Green background
                          borderRadius:
                              BorderRadius.circular(8), // Rounded edges
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.shopping_cart),
                          color: Colors.white, // White icon
                          onPressed: () {
                            // Handle shopping cart button press
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor:const Color(0xFF2E7D32), // Matches the color scheme in your image
  unselectedItemColor: Colors.grey, // Unselected items in grey
  elevation: 10, // Adds shadow effect
  type: BottomNavigationBarType.fixed, // Keeps labels visible
  items: const [
    BottomNavigationBarItem(
      icon: Icon(Icons.home), // Home icon
      label: 'Home', // Home label
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_bag), // Products icon (you can use a custom icon here)
      label: 'Products', // Products label
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart), // Cart icon
      label: 'Cart', // Cart label
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person), // Account icon
      label: 'Account', // Account label
    ),
  ],
    ),


    );
  }
}

// Sample HomeScreen class for navigation
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: const Center(
        child: Text("Welcome to the Home Page!"),
      ),
    );
  }
}
