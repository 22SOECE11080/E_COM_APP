import 'package:flutter/material.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE7F2E4), // Light green background
      appBar: AppBar(
        backgroundColor: const Color(0xFFE7F2E4), // Light green AppBar
        elevation: 0,
        title: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search Orders',
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                ),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.black),
            onPressed: () {
              // Handle profile action
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Image.asset('assets/images/satvakrushi_logo.jpg'),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard, color: Color(0xFF2E7D32)),
              title: const Text('Dashboard'),
              onTap: () {},
            ),
            const ExpansionTile(
              leading:
                  Icon(Icons.production_quantity_limits, color:Color(0xFF2E7D32)),
              title: Text('Products'),
              children: [
                ListTile(title: Text('Product List')),
              ],
            ),
            const ExpansionTile(
              leading: Icon(Icons.receipt_long, color:Color(0xFF2E7D32)),
              title: Text('Order List'),
              children: [
                ListTile(title: Text('Orders')),
              ],
            ),
            const ExpansionTile(
              leading: Icon(Icons.shopping_cart, color:Color(0xFF2E7D32)),
              title: Text('Current Orders'),
              children: [
                ListTile(title: Text('Current Orders')),
              ],
            ),
            const ExpansionTile(
              leading: Icon(Icons.people, color:Color(0xFF2E7D32)),
              title: Text('Customer'),
              children: [
                ListTile(title: Text('Customer List')),
              ],
            ),
            const ExpansionTile(
              leading: Icon(Icons.analytics, color: Color(0xFF2E7D32)),
              title: Text('Analytics'),
              children: [
                ListTile(title: Text('Reports')),
              ],
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.help, color:Color(0xFF2E7D32)),
              title: const Text('Help'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Color(0xFF2E7D32)),
              title: const Text('Logout'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Order Details',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Home > Order Details',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20),
              DataTable(
                columnSpacing: 15,
                dataRowColor: WidgetStateProperty.resolveWith<Color?>(
                  (Set<WidgetState> states) {
                    return Colors.white; // Set body rows to white
                  },
                ),
                headingRowColor: WidgetStateColor.resolveWith(
                    (states) => Colors.green.shade100),
                border: TableBorder.all(color: Colors.grey),
                columns: const <DataColumn>[
                  DataColumn(label: Center(child: Text('Product'))),
                  DataColumn(label: Center(child: Text('Product Image'))),
                  DataColumn(label: Center(child: Text('Order ID'))),
                  DataColumn(label: Center(child: Text('Date'))),
                  DataColumn(label: Center(child: Text('Customer Name'))),
                  DataColumn(label: Center(child: Text('Status'))),
                  DataColumn(label: Center(child: Text('Amount'))),
                ],
                rows: <DataRow>[
                  DataRow(cells: <DataCell>[
                    const DataCell(Center(child: Text('Elegant'))),
                    DataCell(Center(
                        child: Image.asset('assets/images/cyclops.png',
                            width: 40))),
                    const DataCell(Center(child: Text('#25426'))),
                    const DataCell(Center(child: Text('Nov 8th, 2023'))),
                    const DataCell(Center(child: Text('Nishant'))),
                    const DataCell(
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.check_circle, color: Color(0xFF2E7D32)),
                            SizedBox(width: 5),
                            Text('Pending'),
                          ],
                        ),
                      ),
                    ),
                    const DataCell(Center(child: Text('₹200.00'))),
                  ]),
                  DataRow(cells: <DataCell>[
                    const DataCell(Center(child: Text('Supreme'))),
                    DataCell(Center(
                        child: Image.asset('assets/images/cyclops.png',
                            width: 40))),
                    const DataCell(Center(child: Text('#25427'))),
                    const DataCell(Center(child: Text('Nov 9th, 2023'))),
                    const DataCell(Center(child: Text('Rohit'))),
                    const DataCell(
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.check_circle, color: Colors.orange),
                            SizedBox(width: 5),
                            Text('Canceled'),
                          ],
                        ),
                      ),
                    ),
                    const DataCell(Center(child: Text('₹350.00'))),
                  ]),
                  DataRow(cells: <DataCell>[
                    const DataCell(Center(child: Text('Classic'))),
                    DataCell(Center(
                        child: Image.asset('assets/images/cyclops.png',
                            width: 40))),
                    const DataCell(Center(child: Text('#25428'))),
                    const DataCell(Center(child: Text('Nov 10th, 2023'))),
                    const DataCell(Center(child: Text('Aditi'))),
                    const DataCell(
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.check_circle, color: Color(0xFF2E7D32)),
                            SizedBox(width: 5),
                            Text('pending'),
                          ],
                        ),
                      ),
                    ),
                    const DataCell(Center(child: Text('₹250.00'))),
                  ]),
                  DataRow(cells: <DataCell>[
                    const DataCell(Center(child: Text('Modern'))),
                    DataCell(Center(
                        child: Image.asset('assets/images/cyclops.png',
                            width: 40))),
                    const DataCell(Center(child: Text('#25429'))),
                    const DataCell(Center(child: Text('Nov 11th, 2023'))),
                    const DataCell(Center(child: Text('Karan'))),
                    const DataCell(
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.check_circle, color: Colors.orange),
                            SizedBox(width: 5),
                            Text('Cancelled'),
                          ],
                        ),
                      ),
                    ),
                    const DataCell(Center(child: Text('₹0.00'))),
                  ]),
                  DataRow(cells: <DataCell>[
                    const DataCell(Center(child: Text('Vogue'))),
                    DataCell(Center(
                        child: Image.asset('assets/images/cyclops.png',
                            width: 40))),
                    const DataCell(Center(child: Text('#25430'))),
                    const DataCell(Center(child: Text('Nov 12th, 2023'))),
                    const DataCell(Center(child: Text('Megha'))),
                    const DataCell(
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.check_circle, color: Colors.orange),
                            SizedBox(width: 5),
                            Text('Canceled'),
                          ],
                        ),
                      ),
                    ),
                    const DataCell(Center(child: Text('₹180.00'))),
                  ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
