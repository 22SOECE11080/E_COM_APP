import 'package:flutter/material.dart';
import 'package:user_panel/Screens/cart_screen.dart';
import 'package:user_panel/Screens/review_screen.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen size
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFE7F2E4),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE7F2E4),
        elevation: 0,
        title: const Text(
          'Cyclops',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF2E7D32)), // Changed color to green
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF2E7D32)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
      ),
      
      body: Column(
        children: [
          // Product Image Section with Image and Page Indicator
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: screenHeight * 0.35,
                width: screenWidth,
                color: const Color(0xFFE7F2E4),
                child: Image.asset(
                  'assets/images/cyclops.png', // Product image
                  height: 200,
                ),
              ),
              Positioned(
                bottom: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Dot indicators for more images (simulated with just one active dot here)
                    Container(
                      height: 8,
                      width: 8,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Details and Price Section
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Name
                    const Text(
                      "Cyclops",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2E7D32),
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Price Section
                    const Row(
                      children: [
                        Text(
                          "\$500",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          "\$99",
                          style: TextStyle(
                            fontSize: 24,
                            color: Color(0xFF2E7D32),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          "1% off",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // Description
                    const Text(
                      "Used for better growth and to kill worms.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Discount info
                    const Text(
                      "\$14 off | Discount for Rajkot",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF2E7D32),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Buy Now Button
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigate to the ReviewPage
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ReviewPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: const Color(0xFF005843),
                          backgroundColor: const Color(0xFFE7F2E4),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 60, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(color: Color(0xFFCEC9C9)), // Set border color

                          ),
                        ),
                        child: const Text(
                          "Buy Now",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Related Products Section
                    const Text(
                      "Related Products",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 150,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          relatedProductCard("Elegant", "\$99", "15% off"),
                          relatedProductCard("Elegant", "\$99", "15% off"),
                          relatedProductCard("Elegant", "\$99", "15% off"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            // Navigate to CartScreen
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartScreen()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFE7F2E4),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal:05),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(color: Color(0xFFCEC9C9)), // Set border color

            ),
          ),
          child: const Text(
            "Add to Cart",
            style: TextStyle(fontSize: 18, color: Color(0xFF005843)),
          ),
        ),
      ),
    );
  }

  // Related product card widget
  Widget relatedProductCard(String title, String price, String discount) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/cyclops.png', // Image for related product
            height: 80,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            price,
            style: const TextStyle(fontSize: 14, color: Color(0xFF2E7D32)),
          ),
          Text(
            discount,
            style: const TextStyle(fontSize: 12, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
