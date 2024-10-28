import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:user_panel/Screens/cart_screen.dart';
import 'package:user_panel/Screens/payment_screen.dart';

class ReviewPage extends StatelessWidget {
  final List<CartItem> cartItems;

  const ReviewPage({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    // Calculate order total from PriceDetails
    double orderTotal = _calculateOrderTotal(cartItems);

    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFE7F2E4),
        appBar: AppBar(
          backgroundColor: const Color(0xFFE7F2E4),
          elevation: 0,
          title: const Text(
            'Review Your Products',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Color(0xFF2E7D32)),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF2E7D32)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const StepIndicator(),
                const SizedBox(height: 20),
                const Divider(color: Color(0xFF2E7D32)),
                const EstimatedDelivery(),
                const Divider(color: Color(0xFF2E7D32)),
                ProductDetails(cartItems: cartItems),
                const SizedBox(height: 20),
                const Divider(color: Color(0xFF2E7D32)),
                const DeliveryAddress(),
                const SizedBox(height: 20),
                const Divider(color: Color(0xFF2E7D32)),
                PriceDetails(cartItems: cartItems), // Render PriceDetails
                const SizedBox(height: 20),
                const DiscountMessage(),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
        bottomNavigationBar:
            BottomBar(cartItems: cartItems), // Pass cartItems to BottomBar
      ),
    );
  }

  double _calculateOrderTotal(List<CartItem> cartItems) {
    double totalProductPrice = 0;
    for (var item in cartItems) {
      totalProductPrice += item.productPrice * item.quantity;
    }
    return totalProductPrice; // Return the total price
  }
}

// Product details section with card view
class ProductDetails extends StatelessWidget {
  final List<CartItem> cartItems;

  const ProductDetails({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: cartItems.map((item) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Image.asset(
                  item.productImage,
                  width: 80,
                  height: 80,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.productName,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text('${item.quantity} x ${item.productPrice}'),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {}, // Decrement functionality
                          icon: const Icon(Icons.remove_circle_outline,
                              color: Colors.red),
                        ),
                        Text('${item.quantity}'), // Show the quantity
                        IconButton(
                          onPressed: () {}, // Increment functionality
                          icon: const Icon(Icons.add_circle_outline,
                              color: Color(0xFF2E7D32)),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                    '\$${item.productPrice * item.quantity}', // Display total price for the item
                    style: const TextStyle(fontSize: 18)),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

// Delivery estimate section
class EstimatedDelivery extends StatelessWidget {
  const EstimatedDelivery({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.local_shipping, color: Color(0xFF2E7D32)),
        const SizedBox(width: 8),
        Text(
          'Estimated Delivery on Monday, 09th Sep',
          style: TextStyle(color: Colors.grey[600]),
        ),
      ],
    );
  }
}

// Discount message section with separate card view
class DiscountMessage extends StatelessWidget {
  const DiscountMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 4,
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            'Yay! Your Total Discount is \$9',
            style: TextStyle(
                color: Color(0xFF2E7D32), fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

// Delivery address section
class DeliveryAddress extends StatelessWidget {
  const DeliveryAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser?.uid;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Delivery Address',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        FutureBuilder<DocumentSnapshot>(
          future:
              FirebaseFirestore.instance.collection('users').doc(userId).get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }

            if (snapshot.hasError) {
              return const Text('Error fetching address');
            }

            if (!snapshot.hasData || !snapshot.data!.exists) {
              return const Text('No address found');
            }

            final data = snapshot.data!.data() as Map<String, dynamic>;
            final address = data['address'] ?? 'No address available';

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.location_on, color: Color(0xFF2E7D32)),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(address),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    final newAddress =
                        await _showAddressDialog(context, address);
                    if (newAddress != null && userId != null) {
                      await FirebaseFirestore.instance
                          .collection('users')
                          .doc(userId)
                          .update({
                        'address': newAddress,
                      });
                    }
                  },
                  child: const Text(
                    'Change',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Future<String?> _showAddressDialog(
      BuildContext context, String currentAddress) async {
    TextEditingController controller =
        TextEditingController(text: currentAddress);
    return showDialog<String?>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Change Delivery Address'),
            content: TextField(
              controller: controller,
              decoration: const InputDecoration(hintText: 'Enter new address'),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(controller.text),
                child: const Text('Save'),
              ),
            ],
          );
        });
  }
}

// Price details section with dividers
class PriceDetails extends StatelessWidget {
  final List<CartItem> cartItems;

  const PriceDetails({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    double totalProductPrice = 0;

    for (var item in cartItems) {
      totalProductPrice +=
          item.productPrice * item.quantity; // Total price for each item
    }

    double orderTotal =
        totalProductPrice; // The order total is the same as the total product price

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Price Details (${cartItems.length} Items)', // Show the number of items
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Color(0xFF2E7D32)),
        ),
        const Divider(color: Color(0xFF2E7D32)),
        PriceRow(
            title: 'Total Product Price',
            price: totalProductPrice.toString()), // Total price row
        const Divider(color: Color(0xFF2E7D32)),
        PriceRow(
            title: 'Order Total',
            price: orderTotal.toString()), // Order total row
      ],
    );
  }
}

// PriceRow widget for individual price details
class PriceRow extends StatelessWidget {
  final String title;
  final String price;

  const PriceRow({super.key, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        Text('\$$price'), // Display price
      ],
    );
  }
}

// Bottom navigation bar for payment and cart actions
class BottomBar extends StatefulWidget {
  final List<CartItem> cartItems; // Accept cartItems to calculate order total

  const BottomBar({super.key, required this.cartItems});

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  bool isHovering = false;

  double _calculateOrderTotal() {
    double totalProductPrice = 0;
    for (var item in widget.cartItems) {
      totalProductPrice +=
          item.productPrice * item.quantity; // Calculate total price
    }
    return totalProductPrice; // Return total price
  }

  @override
  Widget build(BuildContext context) {
    final orderTotal = _calculateOrderTotal(); // Calculate order total

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '\$${orderTotal.toStringAsFixed(2)}', // Display calculated order total
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          MouseRegion(
            onEnter: (_) => setState(() {
              isHovering = true;
            }),
            onExit: (_) => setState(() {
              isHovering = false;
            }),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentPage(orderTotal: orderTotal),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE7F2E4),
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                elevation: 8, // Add elevation value to make it elevated
                shadowColor: Colors.black, // Optional: Set shadow color
              ),
              child: const Text(
                'Continue',
                style: TextStyle(
                    color: Color(
                        0xFF005843)), // Set text color for better contrast
              ),
            ),
          ),
        ],
      ),
    );
  }
}
