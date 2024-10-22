import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_panel/Screens/cart_screen.dart';
import 'package:user_panel/Screens/review_screen.dart';

// CartItem model to hold cart details
class CartItem {
  final String productName;
  final double productPrice;
  final String productImage;
  late final int quantity;

  CartItem({
    required this.productName,
    required this.productPrice,
    required this.productImage,
    this.quantity = 1, // Default quantity is 1
  });

  // Convert CartItem to a Map to store in Firestore
  Map<String, dynamic> toMap() {
    return {
      'productName': productName,
      'productPrice': productPrice,
      'productImage': productImage,
      'quantity': quantity,
    };
  }
}

class OrderDetailScreen extends StatelessWidget {
  final String productName;
  final String productDescription;
  final double productPrice;
  final String productImage;

  const OrderDetailScreen({
    super.key,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.productImage,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFE7F2E4),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE7F2E4),
        elevation: 0,
        title: Text(
          productName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF2E7D32),
          ),
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
          // Product Image Section
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: screenHeight * 0.35,
                width: screenWidth,
                color: const Color(0xFFE7F2E4),
                child: Image.asset(
                  productImage,
                  height: 200,
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
                    Text(
                      productName,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2E7D32),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Text(
                          "\$500",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "\$$productPrice",
                          style: const TextStyle(
                            fontSize: 24,
                            color: Color(0xFF2E7D32),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          "1% off",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      productDescription,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ReviewPage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: const Color(0xFF005843),
                          backgroundColor: const Color(0xFFE7F2E4),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 60,
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(
                              color: Color(0xFFCEC9C9),
                            ),
                          ),
                        ),
                        child: const Text(
                          "Buy Now",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
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
          onPressed: () async {
            // Create CartItem object
            CartItem cartItem = CartItem(
              productName: productName,
              productPrice: productPrice,
              productImage: productImage,
            );

            // Add the CartItem to Firestore under "cart" collection
            await FirebaseFirestore.instance
                .collection('cart')
                .add(cartItem.toMap());

            // Navigate to CartScreen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CartScreen(cartItems: [],),
              ),
            );

          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFE7F2E4),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(
                color: Color(0xFFCEC9C9),
              ),
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
}
