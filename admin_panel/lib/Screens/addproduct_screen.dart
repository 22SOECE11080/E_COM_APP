import 'package:flutter/material.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE7F2E4),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE7F2E4),
        elevation: 0,
        title: Center(
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
        child: SingleChildScrollView(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Products',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Home > Add New Product',
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 20),
                      _buildTextField('Product Name', 'Type name here'),
                      _buildTextField('Description', 'Type Description here',
                          maxLines: 3),
                      _buildTextField('Category', 'Type Category here'),
                      _buildTextField('Brand Name', 'Type brand name here'),
                      Row(
                        children: [
                          Expanded(
                            child: _buildTextField('Regular Price', '₹1000'),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: _buildTextField('Stock Quantity', '1258'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                // Handle Add button
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFE7F2E4),
                              ),
                              child: const Text('ADD'),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                // Handle Cancel button
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey.shade300,
                              ),
                              child: const Text('CANCEL'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Product Gallery',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      DottedBorderBox(),
                      SizedBox(height: 10),
                      ProductThumbnailList(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String placeholder, {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 5),
        TextField(
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: placeholder,
            filled: true,
            fillColor: Colors.grey.shade100,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            contentPadding: const EdgeInsets.all(10), // Added padding
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}

class DottedBorderBox extends StatelessWidget {
  const DottedBorderBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.image, size: 40, color: Colors.grey),
            SizedBox(height: 5),
            Text('Drop your image here, or browse'),
            Text('Jpeg, png are allowed'),
          ],
        ),
      ),
    );
  }
}

class ProductThumbnailList extends StatelessWidget {
  const ProductThumbnailList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildThumbnail('Product thumbnail.png'),
        _buildThumbnail('Product thumbnail.png'),
        _buildThumbnail('Product thumbnail.png'),
      ],
    );
  }

  Widget _buildThumbnail(String fileName) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        color: Colors.grey.shade300,
      ),
      title: Text(fileName),
      trailing: const Icon(Icons.check_circle, color: Color(0xFF005843)),
    );
  }
}
