import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar section with search bar
      appBar: AppBar(
        backgroundColor: Color(0xFFE9F5EC),
        elevation: 0,
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Hinted search text',
            prefixIcon: Icon(Icons.search),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(26),
              borderSide: BorderSide.none,
          
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color:Colors.white,
              ),
              child: Image.asset('assets/images/satvakrushi_logo.jpg'),
              
            ),
            ListTile(
              leading: Icon(Icons.dashboard, color: Colors.green),
              title: Text('Dashboard'),
              onTap: () {},
            ),
            ExpansionTile(
              leading:
                  Icon(Icons.production_quantity_limits, color: Colors.green),
              title: Text('Products'),
              children: [
                ListTile(title: Text('Product List')),
              ],
            ),
            ExpansionTile(
              leading: Icon(Icons.receipt_long, color: Colors.green),
              title: Text('Order List'),
              children: [
                ListTile(title: Text('Orders')),
              ],
            ),
            ExpansionTile(
              leading: Icon(Icons.shopping_cart, color: Colors.green),
              title: Text('Current Orders'),
              children: [
                ListTile(title: Text('Current Orders')),
              ],
            ),
            ExpansionTile(
              leading: Icon(Icons.people, color: Colors.green),
              title: Text('Customer'),
              children: [
                ListTile(title: Text('Customer List')),
              ],
            ),
            ExpansionTile(
              leading: Icon(Icons.analytics, color: Colors.green),
              title: Text('Analytics'),
              children: [
                ListTile(title: Text('Reports')),
              ],
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.help, color: Colors.green),
              title: Text('Help'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.green),
              title: Text('Logout'),
              onTap: () {},
            ),
          ],
        ),
      ),
      // Main content
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Dashboard title
              Text(
                'Dashboard',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              // Recent Product Table and Recent Sell Table
              Expanded(
                child: ListView(
                  children: [
                    Center(
                        child: _buildTableSection(
                            'Recent Product', _buildProductDataTable())),
                    SizedBox(height: 20),
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
          // Add new item action
        },
        label: Text('Create new'),
        icon: Icon(Icons.add),
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
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        table,
      ],
    );
  }

  // Recent Product Data Table
  Widget _buildProductDataTable() {
    return Center(
      child: DataTable(
        columns: const <DataColumn>[
          DataColumn(label: Text('Product')),
          DataColumn(label: Text('Product_image')),
          DataColumn(label: Text('P_id')),
          DataColumn(label: Text('Date')),
          DataColumn(label: Text('Quantity')),
          DataColumn(label: Text('Price')),
          DataColumn(label: Text('Actions')),
        ],
        rows: <DataRow>[
          DataRow(cells: <DataCell>[
            DataCell(Text('Elegant')),
            DataCell(ImageIcon(AssetImage('assets/images/cyclops.png'))),
            DataCell(Text('#25426')),
            DataCell(Text('Nov 8th, 2023')),
            DataCell(Text('500')),
            DataCell(Text('₹200.00')),
            DataCell(Row(
              children: [
                ElevatedButton(
                  onPressed: null,
                  child: Text('Edit'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.lightBlue, // Light blue color for Edit
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: null,
                  child: Text('Delete'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Colors.redAccent[100], // Light red color for Delete
                  ),
                ),
              ],
            )),
          ]),
          DataRow(cells: <DataCell>[
            DataCell(Text('Elegant')),
            DataCell(ImageIcon(AssetImage('assets/images/cyclops.png'))),
            DataCell(Text('#25425')),
            DataCell(Text('Nov 7th, 2023')),
            DataCell(Text('450')),
            DataCell(Text('₹200.00')),
            DataCell(Row(
              children: [
                ElevatedButton(
                  onPressed: null,
                  child: Text('Edit'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: null,
                  child: Text('Delete'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent[100],
                  ),
                ),
              ],
            )),
          ]),
          DataRow(cells: <DataCell>[
            DataCell(Text('Elegant')),
            DataCell(ImageIcon(AssetImage('assets/images/cyclops.png'))),
            DataCell(Text('#25424')),
            DataCell(Text('Nov 6th, 2023')),
            DataCell(Text('700')),
            DataCell(Text('₹200.00')),
            DataCell(Row(
              children: [
                ElevatedButton(
                  onPressed: null,
                  child: Text('Edit'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue,
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: null,
                  child: Text('Delete'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent[100],
                  ),
                ),
              ],
            )),
          ]),
        ],
      ),
    );
  }

  // Recent Sell Data Table
  Widget _buildSellDataTable() {
    return Center(
      child: DataTable(
        columns: const <DataColumn>[
          DataColumn(label: Text('Product')),
          DataColumn(label: Text('Product_image')),
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
            DataCell(Text('Elegant')),
            DataCell(ImageIcon(AssetImage('assets/images/cyclops.png'))),
            DataCell(Text('#25424')),
            DataCell(Text('Nov 6th, 2023')),
            DataCell(Text('Nishant')),
            DataCell(Text('Delivered')),
            DataCell(Text('₹200.00')),
          ]),
        ],
      ),
    );
  }
}
