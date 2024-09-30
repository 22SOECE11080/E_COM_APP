import 'package:flutter/material.dart';

class CustomerScreen extends StatelessWidget {
  const CustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE7F2E4),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE7F2E4),
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
              child: Center(
                child: Image.asset('assets/images/satvakrushi_logo.jpg'),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard, color: Color(0xFF2E7D32)),
              title: const Text('Dashboard'),
              onTap: () {},
            ),
            const ExpansionTile(
              leading:
                  Icon(Icons.production_quantity_limits, color: Color(0xFF2E7D32)),
              title: Text('Products'),
              children: [
                ListTile(title: Text('Product List')),
              ],
            ),
            const ExpansionTile(
              leading: Icon(Icons.receipt_long, color: Color(0xFF2E7D32)),
              title: Text('Order List'),
              children: [
                ListTile(title: Text('Orders')),
                ListTile(title: Text('Order Details')),
              ],
            ),
            const ExpansionTile(
              leading: Icon(Icons.people, color: Color(0xFF2E7D32)),
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
              leading: const Icon(Icons.help, color: Color(0xFF2E7D32)),
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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

  // Updated Customer Data Table with dashboard-style design
  Widget _buildCustomerDataTable() {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: DataTable(
          // headingRowColor:
          //     WidgetStateProperty.all(Colors.green), // Header background color
          // headingTextStyle: const TextStyle(
          //   color: Colors.white, // Header text color
          //   fontWeight: FontWeight.bold,
          // ),
          // dataRowColor: WidgetStateProperty.all(
          //     Colors.white), // Body rows background color
          // headingRowHeight: 50.0, // Adjust row height for better visuals
          // columnSpacing: 30.0, // Spacing between columns
          // decoration: BoxDecoration(
          //   border: Border.all(color: Colors.green), // Border around the table
          //   borderRadius: BorderRadius.circular(8),
          // ),
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
            DataColumn(
              label: Text(
                'Customer Name',
              ),
            ),
            DataColumn(
              label: Text(
                'Contact',
              ),
            ),
            DataColumn(
              label: Text(
                'Email',
              ),
            ),
            DataColumn(
              label: Text(
                'Address',
              ),
            ),
            DataColumn(
              label: Text(
                'Actions',
              ),
            ),
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
