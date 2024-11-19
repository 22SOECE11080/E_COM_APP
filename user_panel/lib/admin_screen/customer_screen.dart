import 'package:flutter/material.dart';
import 'package:user_panel/admin_screen/appdrawer_screen.dart';

// Define a Customer model
class Customer {
  String name;
  String contact;
  String email;
  String address;

  Customer({
    required this.name,
    required this.contact,
    required this.email,
    required this.address,
  });
}

class CustomerScreen extends StatefulWidget {
  const CustomerScreen({super.key});

  @override
  _CustomerScreenState createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  // List of customers
  List<Customer> customers = [
    Customer(
        name: 'John Doe',
        contact: '+91-9876543210',
        email: 'john.doe@example.com',
        address: 'New Delhi, India'),
    Customer(
        name: 'Jane Smith',
        contact: '+91-9876543211',
        email: 'jane.smith@example.com',
        address: 'Mumbai, India'),
    Customer(
        name: 'Alice Johnson',
        contact: '+91-9876543212',
        email: 'alice.johnson@example.com',
        address: 'Bangalore, India'),
    Customer(
        name: 'Bob Brown',
        contact: '+91-9876543213',
        email: 'bob.brown@example.com',
        address: 'Chennai, India'),
    Customer(
        name: 'Charlie Green',
        contact: '+91-9876543214',
        email: 'charlie.green@example.com',
        address: 'Hyderabad, India'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
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
                  _buildCustomerDataTable(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Build the Data Table dynamically
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
          columnSpacing: 15,
          headingRowColor:
              MaterialStateColor.resolveWith((states) => Colors.green.shade100),
          border: TableBorder.all(color: Colors.grey),
          columns: const <DataColumn>[
            DataColumn(label: Text('Customer Name')),
            DataColumn(label: Text('Contact')),
            DataColumn(label: Text('Email')),
            DataColumn(label: Text('Address')),
            DataColumn(label: Text('Actions')),
          ],
          rows: customers.map((customer) {
            return DataRow(cells: [
              DataCell(Text(customer.name)),
              DataCell(Text(customer.contact)),
              DataCell(Text(customer.email)),
              DataCell(Text(customer.address)),
              DataCell(_buildActionButtons(customer)),
            ]);
          }).toList(),
        ),
      ),
    );
  }

  // Build action buttons for each row
  Widget _buildActionButtons(Customer customer) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {
            _editCustomer(customer);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.lightBlue,
          ),
          child: const Text('Edit'),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {
            _deleteCustomer(customer);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.redAccent,
          ),
          child: const Text('Delete'),
        ),
      ],
    );
  }

  // Edit customer details
  void _editCustomer(Customer customer) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final nameController = TextEditingController(text: customer.name);
        final contactController = TextEditingController(text: customer.contact);
        final emailController = TextEditingController(text: customer.email);
        final addressController = TextEditingController(text: customer.address);

        return AlertDialog(
          title: const Text('Edit Customer'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: contactController,
                decoration: const InputDecoration(labelText: 'Contact'),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: addressController,
                decoration: const InputDecoration(labelText: 'Address'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  customer.name = nameController.text;
                  customer.contact = contactController.text;
                  customer.email = emailController.text;
                  customer.address = addressController.text;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  // Delete customer
  void _deleteCustomer(Customer customer) {
    setState(() {
      customers.remove(customer);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${customer.name} has been deleted')),
    );
  }
}
