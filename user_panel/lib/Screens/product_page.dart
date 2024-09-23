import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Handle back button press
          },
        ),
        title: const Text(
          'CATOGARY',
          style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
        ),
      ),
      body: Row(
        children: [
          // Sidebar for categories
          Container(
            width: 90,
            color: Colors.white,
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 20),
              children: [
                _buildCategoryItem(
                    'Pesticides', 'assets/images/pesticides.png'),
                _buildCategoryItem('Grains', 'assets/images/grains.png'),
                _buildCategoryItem('Herbs', 'assets/images/herbs.png'),
                _buildCategoryItem('Veggies', 'assets/images/veggies.png'),
              ],
            ),
          ),
          // Main content with products and sort button
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Sort dropdown and other header items
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Sort',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      DropdownButton<String>(
                        value: 'Sort',
                        items: [
                          'Sort',
                          'Price: Low to High',
                          'Price: High to Low'
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          // Handle sort value change
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Grid of product cards
                  Expanded(
                    child: GridView.builder(
                      itemCount: 6,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 0.7,
                      ),
                      itemBuilder: (context, index) {
                        return _buildProductCard();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // Bottom navigation bar
      bottomNavigationBar: _buildModernBottomNavigationBar(),
    );
  }

  // Category item widget for the sidebar
  Widget _buildCategoryItem(String title, String imagePath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(imagePath),
            radius: 30,
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(fontSize: 12, color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // Product card widget
  Widget _buildProductCard() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Center(
                child: Image.asset(
                  'assets/images/cyclops.png', // Example product image
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Text(
                    '15% OFF',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            "Elegant",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          const Text(
            "Flonicamid 50% WG\n500 gm, 250gm",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          const SizedBox(height: 5),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$99",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
              Text(
                "\$500",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.red,
                    decoration: TextDecoration.lineThrough),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Bottom navigation bar widget
  Widget _buildModernBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Profile',
        ),
      ],
      currentIndex:
          0, // Change the currentIndex value according to your navigation logic
      onTap: (index) {
        // Handle bottom navigation tap
      },
    );
  }
}
