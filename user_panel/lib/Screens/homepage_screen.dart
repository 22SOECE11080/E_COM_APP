import 'package:flutter/material.dart';
import 'package:user_panel/Screens/product_page.dart';
//import 'package:user_panel/screens/product_page.dart';
import 'package:user_panel/Screens/wishlist_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE7F2E4),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFE7F2E4),
        leading: IconButton(
          icon: const Icon(Icons.menu, color:  Color(0xFF2E7D32)),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color:  Color(0xFF2E7D32)),
            onPressed: () 
            {
               Navigator.push(
               context,
                MaterialPageRoute(
                builder: (context) => const WishlistScreen()),
                );
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined, color:  Color(0xFF2E7D32)),
            onPressed: () {},
          ),
        ],
        title: Row(
          children: [
            Expanded(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for products...',
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      
      drawer: _buildDrawer(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBannerSection(),
            _buildCategorySection(),
            _buildProductGrid("Trending"),
          ],
        ),
      ),
      bottomNavigationBar: _buildModernBottomNavigationBar(),
    );
  }

  // Drawer widget
  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.green,
            ),
            accountName: const Text('Signed in as'),
            accountEmail: const Text('+91 7777777777'),
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 50, color: Colors.green),
            ),
            otherAccountsPictures: [
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey[200],
                ),
                onPressed: () {
                  // Logout action
                },
                child: const Text(
                  'Logout',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Account'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.shopping_bag),
            title: const Text('Orders'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Wishlist'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.location_on),
            title: const Text('Address'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.message),
            title: const Text('Message'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text('Recommendation'),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            title: const Text('About Us'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Support'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Terms and Conditions'),
            onTap: () {},
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: DropdownButton<String>(
              isExpanded: true,
              value: 'Select Language',
              items: ['Select Language', 'English', 'Hindi', 'Spanish']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Handle language change
              },
            ),
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () {
              // Handle logout action
            },
          ),
        ],
      ),
    );
  }

  // Banner Section
  Widget _buildBannerSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFFD6E8D4),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/images/homepage.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Category Section
  Widget _buildCategorySection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Categories",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2E7D32),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProductPage()),
                  );
                },
                child: const Text(
                  "View All >",
                  style: TextStyle(
                    fontSize: 16,
                   color: Color(0xFF2E7D32),                  
                   ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildCategoryChips("Pesticides", "assets/images/pestiside.png"),
              _buildCategoryChips("Grains", "assets/images/grains.png"),
              _buildCategoryChips("Herbs", "assets/images/herbales.png"),
            ],
          ),
        ],
      ),
    );
  }

  // Category Chips
  Widget _buildCategoryChips(String label, String imagePath) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xFFD6E8D4),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(imagePath),
            radius: 20,
          ),
          const SizedBox(width: 10),
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  // Product Grid Section
  Widget _buildProductGrid(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.85,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return _buildProductCard();
            },
          ),
        ],
      ),
    );
  }

  // Product Card
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
              // Ensure the image is properly resized and fits the container
              Container(
                height: 100, // Adjust the height to be smaller
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                    image: AssetImage(
                        'assets/images/cyclops.png'), // Ensure path is correct
                    fit: BoxFit.contain, // Adjust fit for better appearance
                  ),
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.favorite_border, color: Colors.black),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            "Product Name",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const Text("₹250"),
        ],
      ),
    );
  }

  // Modern Bottom Navigation Bar
  Widget _buildModernBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: 0, // The index of the current selected tab
      onTap: (int index) {
        // Handle navigation logic
      },
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
    );
  }
}
