import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:user_panel/admin_screen/orderdetails_screen.dart';

class PaymentPage extends StatefulWidget {
  final double orderTotal;

  const PaymentPage({super.key, required this.orderTotal});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  Razorpay? _razorpay;
  String _selectedPaymentMethod = 'Cash On Delivery';

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    _razorpay?.clear(); // Removes all listeners
    super.dispose();
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Payment successful
    _navigateToOrderDetails();
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Payment failed
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Payment failed. Please try again.")),
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // External wallet selected
  }

  void _startRazorpayPayment() {
    var options = {
      'key': 'rzp_test_e5PpVeIjadAcC6', // Replace with your Razorpay key
      'amount': (widget.orderTotal * 100).toInt(), // Razorpay amount in paise
      'name': 'Your App Name',
      'description': 'Order Payment',
      'prefill': {
        'contact': '1234567890',
        'email': 'test@example.com',
      }
    };

    try {
      _razorpay?.open(options);
    } catch (e) {
      debugPrint('Error: $e');
    }
  }

  void _navigateToOrderDetails() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const OrderDetailsScreen()),
    );
  }

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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const StepIndicator(),
                const Divider(color: Color(0xFF2E7D32)),
                const SizedBox(height: 20),
                const Text(
                  'Select Payment Method',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                PaymentOption(
                  isSelected: _selectedPaymentMethod == 'Cash On Delivery',
                  title: 'Cash On Delivery',
                  price: '\$${widget.orderTotal.toStringAsFixed(2)}',
                  icon: Icons.delivery_dining,
                  onSelect: () {
                    setState(() {
                      _selectedPaymentMethod = 'Cash On Delivery';
                    });
                  },
                ),
                const SizedBox(height: 10),
                PaymentOption(
                  isSelected: _selectedPaymentMethod == 'Pay Online',
                  title: 'Pay Online',
                  price:
                      '\$${(widget.orderTotal - 5).toStringAsFixed(2)}', // Discount for online payment
                  discount: 'Extra Discount With Bank Offers',
                  icon: Icons.credit_card,
                  originalPrice: '\$${widget.orderTotal.toStringAsFixed(2)}',
                  onSelect: () {
                    setState(() {
                      _selectedPaymentMethod = 'Pay Online';
                    });
                  },
                ),
                const SizedBox(height: 20),
                PriceDetails(orderTotal: widget.orderTotal),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomBar(
          orderTotal: widget.orderTotal,
          selectedPaymentMethod: _selectedPaymentMethod,
          onPlaceOrder: () {
            if (_selectedPaymentMethod == 'Cash On Delivery') {
              _navigateToOrderDetails();
            } else if (_selectedPaymentMethod == 'Pay Online') {
              _startRazorpayPayment();
            }
          },
        ),
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
          color: Colors.grey,
        ),
        const StepCircle(
          isActive: true,
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
  final String? originalPrice;
  final VoidCallback onSelect;

  const PaymentOption({
    super.key,
    required this.isSelected,
    required this.title,
    required this.price,
    this.discount,
    required this.icon,
    this.originalPrice,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: isSelected ? Colors.black : Colors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, color: Colors.black),
              const SizedBox(width: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
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
        ),
      ),
    );
  }
}

class PriceDetails extends StatelessWidget {
  final double orderTotal;

  const PriceDetails({super.key, required this.orderTotal});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Price Details (1 Item)',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const Divider(color: Colors.grey),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total Product Price',
                    style: TextStyle(color: Colors.grey)),
                Text('\$${orderTotal.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Shipping Charge',
                    style: TextStyle(color: Colors.grey)),
                const Text('\$5.00',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(color: Colors.grey),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Total Amount',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
                Text('\$${(orderTotal + 5).toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  final double orderTotal;
  final String selectedPaymentMethod;
  final VoidCallback onPlaceOrder;

  const BottomBar({
    super.key,
    required this.orderTotal,
    required this.selectedPaymentMethod,
    required this.onPlaceOrder,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '\$${(orderTotal + 5).toStringAsFixed(2)}', // Total amount with shipping
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          ElevatedButton(
            onPressed: onPlaceOrder,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2E7D32),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            ),
            child: const Text(
              'Place Order',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
