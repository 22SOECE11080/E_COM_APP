import 'package:flutter/material.dart';
import 'package:user_panel/admin_screen/appdrawer_screen.dart';

class OrderListScreen extends StatelessWidget {
  const OrderListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
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
      body: Center(
        // Centering the entire body
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.center, // Center align horizontally
            children: [
              const Center(
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
