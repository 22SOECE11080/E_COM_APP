import 'package:flutter/material.dart';
import 'package:user_panel/admin_screen/addproduct_screen.dart';
import 'package:user_panel/admin_screen/customer_screen.dart';
import 'package:user_panel/admin_screen/dashboard_screen.dart';
import 'package:user_panel/admin_screen/orderlist_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.white),
            child: Center(
              child: Image.asset('assets/images/satvakrushi_logo.png'),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard, color: Color(0xFF2E7D32)),
            title: const Text('Dashboard'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const DashboardScreen(), // Navigate to Dashboard
                ),
              );
            },
          ),
          ExpansionTile(
            leading: const Icon(Icons.production_quantity_limits,
                color: Color(0xFF2E7D32)),
            title: const Text('Products'),
            children: [
              ListTile(
                title: const Text('Add Product'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const AddProductScreen(), // No 'const' here
                    ),
                  );
                },
              ),
            ],
          ),
          ExpansionTile(
            leading: const Icon(Icons.receipt_long, color: Color(0xFF2E7D32)),
            title: const Text('Order List'),
            children: [
              ListTile(
                title: const Text('Orders'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const OrderListScreen(), // No 'const' here
                    ),
                  );
                },
              ),
              ListTile(
                title: const Text('Order Details'),
                onTap: () {
                  // Navigate to Order Details screen
                },
              ),
            ],
          ),
          ExpansionTile(
            leading: const Icon(Icons.people, color: Color(0xFF2E7D32)),
            title: const Text('Customer'),
            children: [
              ListTile(
                title: const Text('Customer List'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const CustomerScreen(), // No 'const' here
                    ),
                  );
                },
              ),
            ],
          ),
          ExpansionTile(
            leading: const Icon(Icons.analytics, color: Color(0xFF2E7D32)),
            title: const Text('Analytics'),
            children: [
              ListTile(
                title: const Text('Reports'),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => ReportScreen(), // No 'const' here
                  //   ),
                  // );
                },
              ),
            ],
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.help, color: Color(0xFF2E7D32)),
            title: const Text('Help'),
            onTap: () {
              // Navigate to Help screen or perform another action
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Color(0xFF2E7D32)),
            title: const Text('Logout'),
            onTap: () {
              // Handle logout action
            },
          ),
        ],
      ),
    );
  }
}
