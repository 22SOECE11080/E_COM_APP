import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_panel/Screens/review_screen.dart';

class CartItem {
  final String productName;
  final double productPrice;
  final String productImage;
  int quantity;

  CartItem({
    required this.productName,
    required this.productPrice,
    required this.productImage,
    this.quantity = 1,
  });

  // Create a factory constructor to build CartItem from Firestore document
  factory CartItem.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return CartItem(
      productName: data['productName'],
      productPrice: data['productPrice'],
      productImage: data['productImage'],
      quantity: data['quantity'],
    );
  }

  // Convert CartItem to Map to update in Firestore if needed
  Map<String, dynamic> toMap() {
    return {
      'productName': productName,
      'productPrice': productPrice,
      'productImage': productImage,
      'quantity': quantity,
    };
  }
}

class CartScreen extends StatefulWidget {
  const CartScreen({super.key, required List cartItems});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartItem> cartItems = [];

  // Function to update quantity in the local list and Firestore
  void updateQuantity(int index, bool isIncrement) async {
    setState(() {
      if (isIncrement) {
        cartItems[index].quantity++;
      } else {
        if (cartItems[index].quantity > 1) {
          cartItems[index].quantity--;
        }
      }
    });

    // Update the Firestore document for the cart item
    final docId =
        cartItems[index].productName; // Assuming product name is unique
    await FirebaseFirestore.instance.collection('cart').doc(docId).update({
      'quantity': cartItems[index].quantity,
    });
  }

  // Function to calculate total price
  double getTotalPrice() {
    return cartItems.fold(
        0.0, (total, item) => total + (item.productPrice * item.quantity));
  }

  @override
  void initState() {
    super.initState();
    fetchCartItems(); // Fetch cart items when the screen is loaded
  }

  // Function to fetch cart items from Firestore
  Future<void> fetchCartItems() async {
    final querySnapshot =
        await FirebaseFirestore.instance.collection('cart').get();

    setState(() {
      cartItems =
          querySnapshot.docs.map((doc) => CartItem.fromFirestore(doc)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE7F2E4),
      body: SafeArea(
        child: Column(
          children: [
            // AppBar
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
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
                      icon: const Icon(Icons.arrow_back_ios,
                          color: Color(0xFF2E7D32)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          'My Cart',
                          style: TextStyle(
                            color: Color(0xFF2E7D32),
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
            // Cart Items List
            Expanded(
              child: cartItems.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final item = cartItems[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Image.asset(
                                    item.productImage, // Product image
                                    width: 50,
                                    height: 50,
                                  ),
                                  const SizedBox(width: 15),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.productName,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Color(0xFF2E7D32),
                                          ),
                                        ),
                                        const Text(
                                          '1 L, 500 ml.',
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        '\$${item.productPrice}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Color(0xFF2E7D32),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          IconButton(
                                            icon: const Icon(
                                                Icons.remove_circle_outline,
                                                color: Colors.red),
                                            onPressed: () {
                                              updateQuantity(index,
                                                  false); // Decrease quantity
                                            },
                                          ),
                                          Text('${item.quantity}'),
                                          IconButton(
                                            icon: const Icon(
                                                Icons.add_circle_outline,
                                                color: Color(0xFF2E7D32)),
                                            onPressed: () {
                                              updateQuantity(index,
                                                  true); // Increase quantity
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
            // Total Price and Proceed to Buy
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '\$${getTotalPrice().toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color(0xFF2E7D32),
                        ),
                      ),
                      const Text(
                        'Total Price',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE7F2E4),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: const BorderSide(
                          color: Color(0xFFCEC9C9),
                        ),
                      ),
                    ),
                    onPressed: () {
                      // Navigate to the Review Page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ReviewPage(),
                        ),
                      );
                    },
                    child: Text(
                      'Proceed to Buy (${cartItems.length} Items)',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF005843),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
