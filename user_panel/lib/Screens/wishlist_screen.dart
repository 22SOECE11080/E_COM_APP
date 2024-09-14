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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate to the Home page when clicking on the back arrow
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
        title: const Center(
          child: Text('Wishlist'),
        ),
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
                        ? 'assets/images/SKR 1 (splash logo).jpg'
                        : 'assets/images/SKR 1 (splash logo).jpg',
                  ),
                  title: Text(index == 0 ? 'Cyclops' : 'Colban 20'),
                  subtitle: const Text('1 L, 500 ml.'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.green, // Green background
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
                          color: Colors.green, // Green background
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
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home', // Add label for accessibility
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Mail', // Add label for accessibility
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart', // Add label for accessibility
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile', // Add label for accessibility
          ),
        ],
        currentIndex: _selectedIndex, // Highlight the selected tab
        selectedItemColor:
            Colors.green, // Change the color of the selected item
        unselectedItemColor:
            Colors.grey, // Change the color of unselected items
        onTap: _onItemTapped, // Handle tap events
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
