import 'package:flutter/material.dart';

class CustomerScreen extends StatelessWidget {
  const CustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9F5EC),
      // AppBar section with search bar
      appBar: AppBar(
        backgroundColor: const Color(0xFFE9F5EC), // Light green shade
        elevation: 0,
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search for customers...',
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
              child: Image.asset('assets/images/satvakrushi_logo.jpg'),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Screen title (centered)
            const Center(
              child: Text(
                'Customer List',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  _buildTableSection('', _buildCustomerDataTable()),
                ],
              ),
            ),
          ],
        ),
      ),
      // Floating action button for "Add new customer"
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add new customer action
        },
        label: const Text('Add Customer'),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }

  // Widget to build each table section
  Widget _buildTableSection(String title, Widget table) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        table,
      ],
    );
  }

  // Customer Data Table
  Widget _buildCustomerDataTable() {
    return Center(
      child: DataTable(
        columnSpacing: 20.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        columns: const <DataColumn>[
          DataColumn(label: Text('Customer Name')),
          DataColumn(label: Text('Contact')),
          DataColumn(label: Text('Email')),
          DataColumn(label: Text('Address')),
          DataColumn(label: Text('Actions')),
        ],
        rows: <DataRow>[
          DataRow(cells: <DataCell>[
            const DataCell(Text('John Doe')),
            const DataCell(Text('+91-9876543210')),
            const DataCell(Text('john.doe@example.com')),
            const DataCell(Text('New Delhi, India')),
            DataCell(_buildActionButtons()),
          ]),
          DataRow(cells: <DataCell>[
            const DataCell(Text('Jane Smith')),
            const DataCell(Text('+91-9876543211')),
            const DataCell(Text('jane.smith@example.com')),
            const DataCell(Text('Mumbai, India')),
            DataCell(_buildActionButtons()),
          ]),
          DataRow(cells: <DataCell>[
            const DataCell(Text('Alice Johnson')),
            const DataCell(Text('+91-9876543212')),
            const DataCell(Text('alice.johnson@example.com')),
            const DataCell(Text('Bangalore, India')),
            DataCell(_buildActionButtons()),
          ]),
          DataRow(cells: <DataCell>[
            const DataCell(Text('Bob Brown')),
            const DataCell(Text('+91-9876543213')),
            const DataCell(Text('bob.brown@example.com')),
            const DataCell(Text('Chennai, India')),
            DataCell(_buildActionButtons()),
          ]),
          DataRow(cells: <DataCell>[
            const DataCell(Text('Charlie Green')),
            const DataCell(Text('+91-9876543214')),
            const DataCell(Text('charlie.green@example.com')),
            const DataCell(Text('Hyderabad, India')),
            DataCell(_buildActionButtons()),
          ]),
        ],
      ),
    );
  }

  // Widget to build action buttons
  Widget _buildActionButtons() {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            // Edit customer action
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightBlue,
          ),
          child: const Text('Edit'),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {
            // Delete customer action
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.redAccent,
          ),
          child: const Text('Delete'),
        ),
      ],
    );
  }
}