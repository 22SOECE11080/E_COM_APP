import 'package:flutter/material.dart';

// Assuming that you have a separate homepage_screen.dart file
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
        // Navigate to Products (You can create a Products screen)
        break;
      case 2:
        // Navigate to Cart
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const CartScreen()),
        );
        break;
      case 3:
        // Navigate to Profile (You can create a Profile screen)
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        flexibleSpace: Container(
        decoration: const BoxDecoration(
          color:Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          
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
        selectedItemColor: const Color(0xFF005843),
        unselectedItemColor: Colors.grey,
        elevation: 10,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50], // light green background
      body: SafeArea(
        child: Column(
          children: [
            // Top AppBar-like Container
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
                          'MY CART',
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
            // Cart Items
            Expanded(
              child: ListView(
                children: const [
                  CartItem(),
                  Divider(thickness: 1, color: Colors.green),
                  CartItem(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Image.asset(
              'assets/images/cyclops.png', // Ensure you have this image in your assets
              height: 60,
              width: 60,
            ),
            const SizedBox(width: 10),
            // Product Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cyclops',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[800],
                    ),
                  ),
                  const Text(
                    '1 L, 500 ml.',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            // Price and Actions
            Column(
              children: [
                // Product Price
                const Text(
                  '\$99',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                const SizedBox(height: 10),
                // Quantity Selector
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.remove_circle_outline, color: Colors.red),
                    ),
                    const Text('1'),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.add_circle_outline, color: Colors.green),
                    ),
                  ],
                ),
              ],
            ),
            // Delete Icon
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete_outline, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

