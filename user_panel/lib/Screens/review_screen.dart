import 'package:flutter/material.dart';
import 'package:user_panel/Screens/payment_screen.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFE7F2E4),
        appBar: AppBar(
          backgroundColor: const Color(0xFFE7F2E4),
          elevation: 0,
          title: const Text(
            'Review Your products',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF2E7D32)), // Changed color to black
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios,
                color: Color(0xFF2E7D32)), // Changed color to black
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
        ),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StepIndicator(),
                SizedBox(height: 20),
                Divider(
                    color: Color(0xFF2E7D32)), // Set divider color to #008054
                EstimatedDelivery(),
                Divider(color: Color(0xFF2E7D32)),
                SizedBox(height: 20),
                ProductDetails(), // Product details card
                SizedBox(height: 20),
                Divider(color: Color(0xFF2E7D32)),
                DeliveryAddress(),
                SizedBox(height: 20),
                Divider(color: Color(0xFF2E7D32)),
                PriceDetails(),
                SizedBox(height: 20),
                DiscountMessage(), // Separate discount message card
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const BottomBar(),
      ),
    );
  }
}

// Step indicator at the top with Review and Payment circles
class StepIndicator extends StatelessWidget {
  const StepIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StepCircle(
          isActive: true, // Active step (Review)
          label: "Review",
        ),
        SizedBox(width: 40),
        StepCircle(
          isActive: false, // Inactive step (Payment)
          label: "Payment",
        ),
      ],
    );
  }
}

// Reusable Step Circle widget
class StepCircle extends StatelessWidget {
  final bool isActive;
  final String label;

  const StepCircle({super.key, required this.isActive, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 15,
          backgroundColor: isActive
              ? const Color(0xFF2E7D32)
              : Colors.grey, // Active step is green, inactive is gray
          child: const Icon(Icons.check,
              color: Colors.white, size: 16), // Step icon
        ),
        const SizedBox(height: 8),
        Text(label,
            style: TextStyle(
                color: isActive ? const Color(0xFF2E7D32) : Colors.grey)),
      ],
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

// Product details section with card view
class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/cyclops.png',
                  width: 80,
                  height: 80,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Cyclops',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const Text('1 L, 500 ml'),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.remove_circle_outline,
                              color: Colors.red),
                        ),
                        const Text('1'),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add_circle_outline,
                              color: Color(0xFF2E7D32)),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                const Text('\$99', style: TextStyle(fontSize: 18)),
              ],
            ),
          ],
        ),
      ),
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

// Delivery address section (No card, flat layout)
class DeliveryAddress extends StatelessWidget {
  const DeliveryAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Delivery Address',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.location_on, color: Color(0xFF2E7D32)),
            const SizedBox(width: 10),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nishant Talviya - 4444444444'),
                  Text('xyz village, Talala, gir Somnath, Gujarat, 360001.'),
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Change',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// Price details section with dividers
class PriceDetails extends StatelessWidget {
  const PriceDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Price Details (1 Item)',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF2E7D32)), // Updated color to match
        ),
        Divider(color: Color(0xFF2E7D32)), // Updated color to match
        PriceRow(title: 'Total Product Price', value: '\$99'),
        PriceRow(title: 'Total Discount', value: '- \$9'),
        Divider(color: Color(0xFF2E7D32)), // Updated color to match
        PriceRow(title: 'Order Total', value: '\$90'),
      ],
    );
  }
}

// Reusable price row widget
class PriceRow extends StatelessWidget {
  final String title;
  final String value;

  const PriceRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

// Bottom navigation bar with hover effect
class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            '\$90',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                  MaterialPageRoute(builder: (context) => const PaymentPage()),
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
