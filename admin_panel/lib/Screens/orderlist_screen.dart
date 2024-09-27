import 'package:flutter/material.dart';

class OrderListScreen extends StatelessWidget {
  const OrderListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9F5EC), // Light green background
      appBar: AppBar(
        backgroundColor: const Color(0xFFE9F5EC), // Light green AppBar
        elevation: 0,
        title: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              width: 300,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Hinted search text',
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
              decoration: const BoxDecoration(color: Colors.white),
              child: Center(
                child: Image.asset('assets/images/satvakrushi_logo.jpg'),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard, color: Colors.green),
              title: const Text('Dashboard'),
              onTap: () {},
            ),
            const ExpansionTile(
              leading:
                  Icon(Icons.production_quantity_limits, color: Colors.green),
              title: Text('Products'),
              children: [
                ListTile(title: Text('Product List')),
              ],
            ),
            const ExpansionTile(
              leading: Icon(Icons.receipt_long, color: Colors.green),
              title: Text('Order List'),
              children: [
                ListTile(title: Text('Orders')),
              ],
            ),
            const ExpansionTile(
              leading: Icon(Icons.people, color: Colors.green),
              title: Text('Customer'),
              children: [
                ListTile(title: Text('Customer List')),
              ],
            ),
            const ExpansionTile(
              leading: Icon(Icons.analytics, color: Colors.green),
              title: Text('Analytics'),
              children: [
                ListTile(title: Text('Reports')),
              ],
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.help, color: Colors.green),
              title: const Text('Help'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.green),
              title: const Text('Logout'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: Center(
        // Centering the entire body
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.center, // Center align horizontally
            children: [
              Center(
                child: Text(
                  'Orders List',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Home > Order List',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: _buildOrderTable(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrderTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 15,
        dataRowColor: WidgetStateProperty.resolveWith<Color?>((
          Set<WidgetState> states,
        ) {
          return Colors.white; // Set body rows to white
        }),
        headingRowColor: WidgetStateColor.resolveWith(
          (states) => Colors.green.shade100,
        ),
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
          _buildDataRow('Elegant', 'assets/images/cyclops.png', '#25426',
              'Nov 8th, 2023', 'Nishant', 'Delivered', Colors.blue, '₹200.00'),
          _buildDataRow('Elegant', 'assets/images/cyclops.png', '#25425',
              'Nov 7th, 2023', 'Nishant', 'Canceled', Colors.orange, '₹200.00'),
          _buildDataRow('Elegant', 'assets/images/cyclops.png', '#25424',
              'Nov 6th, 2023', 'Nishant', 'Delivered', Colors.blue, '₹200.00'),
          _buildDataRow(
              'Elegant',
              'assets/images/cyclops.png',
              '#25423',
              'Nov 5th, 2023',
              'Nishant',
              'Processing',
              Colors.green,
              '₹200.00'),
          _buildDataRow('Elegant', 'assets/images/cyclops.png', '#25422',
              'Nov 4th, 2023', 'Nishant', 'Delivered', Colors.blue, '₹200.00'),
        ],
      ),
    );
  }

  DataRow _buildDataRow(
      String product,
      String imagePath,
      String orderId,
      String date,
      String customerName,
      String status,
      Color statusColor,
      String amount) {
    return DataRow(cells: <DataCell>[
      DataCell(Center(child: Text(product))),
      DataCell(Center(child: Image.asset(imagePath, width: 40))),
      DataCell(Center(child: Text(orderId))),
      DataCell(Center(child: Text(date))),
      DataCell(Center(child: Text(customerName))),
      DataCell(Center(child: _buildStatus(status, statusColor))),
      DataCell(Center(child: Text(amount))),
    ]);
  }

  Widget _buildStatus(String status, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 5,
          backgroundColor: color,
        ),
        const SizedBox(width: 5),
        Text(status),
      ],
    );
  }
}
