import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:user_panel/admin_screen/appdrawer_screen.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _regularPriceController = TextEditingController();
  final TextEditingController _stockQuantityController =
      TextEditingController();
  final TextEditingController _discountController = TextEditingController();

  File? _selectedImage;
  String? _imageUrl;

  final ImagePicker _picker = ImagePicker();

  Future<String?> _uploadImage(File imageFile) async {
    try {
      String fileName = DateTime.now().millisecondsSinceEpoch.toString();
      Reference ref =
          FirebaseStorage.instance.ref().child('product_images/$fileName');

      UploadTask uploadTask = ref.putFile(imageFile);

      uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
        print(
            'Progress: ${(snapshot.bytesTransferred / snapshot.totalBytes) * 100} %');
      });

      TaskSnapshot snapshot = await uploadTask.whenComplete(() => null);
      String downloadUrl = await snapshot.ref.getDownloadURL();
      return downloadUrl;
    } catch (e) {
      print('Image upload failed: $e');
      return null;
    }
  }

  Future<void> _pickImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _selectedImage = File(pickedFile.path);
          print('Selected Image Path: ${_selectedImage!.path}');
        });
      } else {
        print('No image selected.');
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  Future<void> _addProduct() async {
    try {
      if (_selectedImage != null) {
        String? imageUrl = await _uploadImage(_selectedImage!);
        _imageUrl = imageUrl; // Store the image URL for display
      }

      // Save product details to Firestore
      await FirebaseFirestore.instance.collection('products').add({
        'name': _nameController.text,
        'description': _descriptionController.text,
        'category': _categoryController.text,
        'brand': _brandController.text,
        'Price': double.tryParse(_regularPriceController.text) ?? 0,
        'stockQuantity': int.tryParse(_stockQuantityController.text) ?? 0,
        'discount': double.tryParse(_discountController.text) ?? 0,
        'imageUrl': _imageUrl, // Save the image URL here
        'createdAt': Timestamp.now(),
        'updatedAt': Timestamp.now(),
      });

      _clearFields();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Product added successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to add product: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _clearFields() {
    _nameController.clear();
    _descriptionController.clear();
    _categoryController.clear();
    _brandController.clear();
    _regularPriceController.clear();
    _stockQuantityController.clear();
    _discountController.clear();
    setState(() {
      _selectedImage = null;
      _imageUrl = null;
    });
  }

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
              hintText: 'Search',
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
      drawer: const AppDrawer(),
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
                      _buildTextField(
                          'Product Name', _nameController, 'Type name here'),
                      _buildTextField('Description', _descriptionController,
                          'Type Description here',
                          maxLines: 3),
                      _buildTextField('Category', _categoryController,
                          'Type Category here'),
                      _buildTextField('Brand Name', _brandController,
                          'Type brand name here'),
                      Row(
                        children: [
                          Expanded(
                            child: _buildTextField('Regular Price',
                                _regularPriceController, '₹1000'),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: _buildTextField('Stock Quantity',
                                _stockQuantityController, '1258'),
                          ),
                        ],
                      ),
                      _buildTextField('Discount', _discountController,
                          'Type discount here'),
                      const SizedBox(height: 20),
                      // Show selected image
                      // Show selected image
                      _selectedImage != null
                          ? _imageUrl != null
                              ? Image.network(_imageUrl!,
                                  height:
                                      150) // Display the uploaded image using the URL
                              : Container(
                                  height: 150,
                                  width: double.infinity,
                                  color: Colors.grey.shade200,
                                  child: const Center(
                                    child: Text('Uploading image...'),
                                  ),
                                )
                          : Container(
                              height: 150,
                              width: double.infinity,
                              color: Colors.grey.shade200,
                              child: const Center(
                                child: Text('No image selected'),
                              ),
                            ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: _pickImage, // Image picker button
                        child: const Text('Select Image'),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: _addProduct,
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
                                Navigator.pop(context); // Go back
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      String label, TextEditingController controller, String placeholder,
      {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 5),
        TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: placeholder,
            filled: true,
            fillColor: Colors.grey.shade100,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            contentPadding: const EdgeInsets.all(10),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
