import 'package:flutter/material.dart';
import 'package:user_panel/admin_screen/addproduct_screen.dart';
import 'package:user_panel/admin_screen/appdrawer_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9F5EC),
      // AppBar section with search bar
      appBar: AppBar(
        backgroundColor: const Color(0xFFE9F5EC),
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.all(160.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Hinted search text',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(26),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      drawer: const AppDrawer(), // Use the AppDrawer here
      // Main content
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Dashboard title
              const Text(
                'Dashboard',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              // Recent Product Table and Recent Sell Table
              Expanded(
                child: ListView(
                  children: [
                    Center(
                        child: _buildTableSection(
                            'Recent Product', _buildProductDataTable())),
                    const SizedBox(height: 20),
                    Center(
                        child: _buildTableSection(
                            'Recent Sell', _buildSellDataTable())),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // Floating action button for "Create new"
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddProductScreen()),
    );
          // Add new item action
        },
        label: const Text('Create new'),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }

  // Widget to build each table section
  Widget _buildTableSection(String title, Widget table) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        table,
      ],
    );
  }

  // Recent Product Data Table
  Widget _buildProductDataTable() {
    return Center(
      child: DataTable(
        columnSpacing: 15,
        dataRowColor:
            WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          return Colors.white; // Set body rows to white
        }),
        headingRowColor: WidgetStateColor.resolveWith(
          (states) => const Color(0xFFE7F2E4),
        ),
        border: TableBorder.all(color: Colors.grey), // Add border to the table
        columns: const <DataColumn>[
          DataColumn(label: Text('Product')),
          DataColumn(label: Text('Image')),
          DataColumn(label: Text('P_id')),
          DataColumn(label: Text('Date')),
          DataColumn(label: Text('Quantity')),
          DataColumn(label: Text('Price')),
          DataColumn(label: Text('Actions')),
        ],
        rows: <DataRow>[
          DataRow(cells: <DataCell>[
            const DataCell(Text('Elegant')),
            const DataCell(ImageIcon(AssetImage('assets/images/cyclops.png'))),
            const DataCell(Text('#25426')),
            const DataCell(Text('Nov 8th, 2023')),
            const DataCell(Text('500')),
            const DataCell(Text('₹200.00')),
            DataCell(_buildActionButtons()),
          ]),
          DataRow(cells: <DataCell>[
            const DataCell(Text('Elegant')),
            const DataCell(ImageIcon(AssetImage('assets/images/cyclops.png'))),
            const DataCell(Text('#25425')),
            const DataCell(Text('Nov 7th, 2023')),
            const DataCell(Text('450')),
            const DataCell(Text('₹200.00')),
            DataCell(_buildActionButtons()),
          ]),
          DataRow(cells: <DataCell>[
            const DataCell(Text('Royal Gold')),
            const DataCell(ImageIcon(AssetImage('assets/images/cyclops.png'))),
            const DataCell(Text('#25430')),
            const DataCell(Text('Nov 10th, 2023')),
            const DataCell(Text('600')),
            const DataCell(Text('₹250.00')),
            DataCell(_buildActionButtons()),
          ]),
        ],
      ),
    );
  }

  // Recent Sell Data Table
  Widget _buildSellDataTable() {
    return Center(
      child: DataTable(
        columnSpacing: 15,
        dataRowColor:
            WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          return Colors.white; // Set body rows to white
        }),
        headingRowColor: WidgetStateColor.resolveWith(
          (states) => const Color(0xFFE7F2E4),
        ),
        border: TableBorder.all(color: Colors.grey), // Add border to the table
        columns: const <DataColumn>[
          DataColumn(label: Text('Product')),
          DataColumn(label: Text('Image')),
          DataColumn(label: Text('Order ID')),
          DataColumn(label: Text('Date')),
          DataColumn(label: Text('Customer Name')),
          DataColumn(label: Text('Status')),
          DataColumn(label: Text('Amount')),
        ],
        rows: const <DataRow>[
          DataRow(cells: <DataCell>[
            DataCell(Text('Elegant')),
            DataCell(ImageIcon(AssetImage('assets/images/cyclops.png'))),
            DataCell(Text('#25426')),
            DataCell(Text('Nov 8th, 2023')),
            DataCell(Text('Nishant')),
            DataCell(Text('Delivered')),
            DataCell(Text('₹200.00')),
          ]),
          DataRow(cells: <DataCell>[
            DataCell(Text('Elegant')),
            DataCell(ImageIcon(AssetImage('assets/images/cyclops.png'))),
            DataCell(Text('#25425')),
            DataCell(Text('Nov 7th, 2023')),
            DataCell(Text('Nishant')),
            DataCell(Text('Canceled')),
            DataCell(Text('₹200.00')),
          ]),
          DataRow(cells: <DataCell>[
            DataCell(Text('Royal Gold')),
            DataCell(ImageIcon(AssetImage('assets/images/cyclops.png'))),
            DataCell(Text('#25430')),
            DataCell(Text('Nov 10th, 2023')),
            DataCell(Text('Nishant')),
            DataCell(Text('Delivered')),
            DataCell(Text('₹250.00')),
          ]),
        ],
      ),
    );
  }

  // Build action buttons with colors
  Widget _buildActionButtons() {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            // Edit action
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightBlue, // Add color to Edit button
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          child: const Text('Edit'),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {
            // Delete action
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red, // Add color to Delete button
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          child: const Text('Delete'),
        ),
      ],
    );
  }
}
