import 'package:flutter/material.dart';
import 'package:user_panel/Screens/product_detail_screen.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFFE7F2E4),
        appBar: AppBar(
          backgroundColor: const Color(0xFFE7F2E4),
          elevation: 0,
          title: const Text(
            'Payment',
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
                Divider(color: Color(0xFF2E7D32)), // Changed color to grey
                SizedBox(height: 20),
                Text(
                  'Select Payment Method',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black, // Changed color to black
                  ),
                ),
                SizedBox(height: 10),
                PaymentOption(
                  isSelected: false,
                  title: 'Cash On Delivery',
                  price: '\$90',
                  icon: Icons.delivery_dining,
                ),
                SizedBox(height: 10),
                PaymentOption(
                  isSelected: true,
                  title: 'Pay Online',
                  price: '\$85',
                  discount: 'Extra Discount With the Bank Offers.',
                  icon: Icons.credit_card,
                  originalPrice:
                      '\$90', // Added original price with strike-through
                ),
                SizedBox(height: 20),
                PriceDetails(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: const BottomBar(),
      ),
    );
  }
}

class StepIndicator extends StatelessWidget {
  const StepIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const StepCircle(
          isActive: true,
          label: "Review",
        ),
        Container(
          width: 100,
          height: 1,
          color: Colors.grey, // Changed color to grey
        ),
        const StepCircle(
          isActive: false,
          label: "Payment",
        ),
      ],
    );
  }
}

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
          backgroundColor: isActive ? const Color(0xFF2E7D32) : Colors.grey,
          child: Icon(
            isActive ? Icons.check : Icons.circle,
            color: Colors.white,
            size: 16,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            color: isActive ? const Color(0xFF2E7D32) : Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class PaymentOption extends StatelessWidget {
  final bool isSelected;
  final String title;
  final String price;
  final String? discount;
  final IconData icon;
  final String?
      originalPrice; // Added for displaying original price with strike-through

  const PaymentOption({
    super.key,
    required this.isSelected,
    required this.title,
    required this.price,
    this.discount,
    required this.icon,
    this.originalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: isSelected ? Colors.black : Colors.grey, // Light grey border
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.black), // Changed color to black
                const SizedBox(width: 10),
                const VerticalDivider(
                  color: Colors.grey, // Divider between text and price
                  thickness: 1,
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black, // Changed color to black
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (originalPrice != null)
                      Text(
                        originalPrice!,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.red,
                          decoration: TextDecoration
                              .lineThrough, // Strike-through style
                        ),
                      ),
                  ],
                ),
                const Spacer(),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black, // Changed color to black
                  ),
                ),
                const Spacer(),
                Icon(
                  isSelected
                      ? Icons.radio_button_checked
                      : Icons.radio_button_off,
                  color: isSelected ? const Color(0xFF2E7D32) : Colors.grey,
                ),
              ],
            ),
            if (discount != null) ...[
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.local_offer, color: Color(0xFF2E7D32)),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        discount!,
                        style: const TextStyle(color: Color(0xFF2E7D32)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class PriceDetails extends StatelessWidget {
  const PriceDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        side: BorderSide(
            color: Colors.grey.shade400), // Changed color to light grey
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Price Details (1 Item)',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black, // Changed color to black
              ),
            ),
            Divider(color: Colors.grey), // Changed color to grey
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Product Price',
                    style:
                        TextStyle(color: Colors.grey)), // Changed color to grey
                Text('\$90',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black)), // Changed color to black
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Order Total',
                    style: TextStyle(
                        color: Colors.black)), // Changed color to black
                Text('\$85',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black)), // Updated price
              ],
            ),
          ],
        ),
      ),
    );
  }
}

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
            '\$85', // Updated price to $85
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black, // Set text color to black
            ),
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
                      builder: (context) => const ProductDetailsPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: isHovering
                    ? const Color(0xFF2E7D32) // Change color on hover
                    : const Color(0xFFE7F2E4), // Default background color
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                elevation: 8, // Elevation for a raised effect
                shadowColor: Colors.black,
                side: const BorderSide(
                    color: Color(0xFFCEC9C9)), // Set border color
              ),
              child: Text(
                'Place Order',
                style: TextStyle(
                  color: isHovering ? Colors.white : const Color(0xFF005843),
                ), // Set text color for better contrast
              ),
            ),
          ),
        ],
      ),
    );
  }
}
