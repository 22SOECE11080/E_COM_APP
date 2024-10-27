import 'dart:io'; // To handle file paths
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart'; // For image storage
import 'package:image_picker/image_picker.dart'; // For image picking
import 'package:permission_handler/permission_handler.dart'; // For permissions handling

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isPasswordVisible = false; // To toggle password visibility
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController =
      TextEditingController(); // Predefined password will be here

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  String? userId;
  String? _imageUrl; // To store the profile image URL
  File? _imageFile; // To store the selected image file

  @override
  void initState() {
    super.initState();
    _fetchUserData(); // Fetch user data on screen load
  }

  Future<void> _fetchUserData() async {
    User? user = _auth.currentUser;
    if (user != null) {
      userId = user.uid;
      DocumentSnapshot userDoc =
          await _db.collection('users').doc(userId).get();

      if (userDoc.exists) {
        Map<String, dynamic>? userData =
            userDoc.data() as Map<String, dynamic>?;

        if (userData != null) {
          setState(() {
            _nameController.text = userData['name'] ?? '';
            _emailController.text = userData['email'] ?? '';
            _phoneController.text = userData['phone']?.toString() ?? '';
            _passwordController.text =
                userData['password'] ?? ''; // Predefined password
            _imageUrl =
                userData['profileImage'] ?? ''; // Fetch profile image URL
          });
        }
      }
    }
  }

  Future<void> _updateUserData() async {
    if (userId != null) {
      await _db.collection('users').doc(userId).update({
        'name': _nameController.text,
        'email': _emailController.text,
        'phone': int.tryParse(_phoneController.text) ?? 0,
        'password': _passwordController.text, // Update password
        'profileImage': _imageUrl ?? '', // Update profile image URL
      });

      if (_passwordController.text.isNotEmpty) {
        _updatePassword(
            _passwordController.text); // Update password in Firebase Auth
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated successfully')),
      );
    }
  }

  Future<void> _updatePassword(String newPassword) async {
    User? user = _auth.currentUser;
    if (user != null) {
      try {
        await user.updatePassword(newPassword);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Password updated successfully')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error updating password')),
        );
      }
    }
  }

  // Function to pick an image from the gallery
  Future<void> _pickImage() async {
    // Request storage permission before accessing gallery
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      // Request permission if not granted
      status = await Permission.storage.request();
    }

    if (status.isGranted) {
      try {
        final pickedFile = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          maxWidth: 600, // Optional: Adjust width
          maxHeight: 600, // Optional: Adjust height
        );

        if (pickedFile != null) {
          setState(() {
            _imageFile = File(pickedFile.path);
          });
          await _uploadImage();
        } else {
          // User canceled the picker
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('No image selected.')),
          );
        }
      } catch (e) {
        // Handle any exceptions during image picking
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error picking image: $e')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Storage permission denied.')),
      );
    }
  }

  // Function to upload image to Firebase Storage and get the download URL
  Future<void> _uploadImage() async {
    if (_imageFile != null && userId != null) {
      final storageRef = _storage.ref().child('profile_images/$userId.jpg');
      try {
        // Upload the file
        await storageRef.putFile(_imageFile!);

        // Get the download URL
        String downloadUrl = await storageRef.getDownloadURL();

        setState(() {
          _imageUrl = downloadUrl; // Set the new image URL
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Image uploaded successfully')),
        );
      } catch (e) {
        // Handle any errors during the upload process
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error uploading image: $e')),
        );
      }
    } else {
      // No image selected
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select an image first.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
              child: Container(
                height: 60.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          'Profile',
                          style: TextStyle(
                            color: Color(0xFF2E7D32),
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Center(
                      child: GestureDetector(
                        onTap: _pickImage, // Pick image on tap
                        child: CircleAvatar(
                          radius: 60,
                          backgroundImage: _imageUrl != null &&
                                  _imageUrl!.isNotEmpty
                              ? NetworkImage(
                                  _imageUrl!) // Display uploaded image
                              : const AssetImage(
                                      'assets/images/default_profile.png') // Fallback image
                                  as ImageProvider,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        children: [
                          buildTextField(
                            controller: _nameController,
                            labelText: 'Name',
                            hintText: 'Nishant',
                            icon: Icons.person,
                          ),
                          const SizedBox(height: 20),
                          buildTextField(
                            controller: _emailController,
                            labelText: 'Your Email',
                            hintText: 'nishanttaliya@gmail.com',
                            icon: Icons.email,
                          ),
                          const SizedBox(height: 20),
                          buildTextField(
                            controller: _phoneController,
                            labelText: 'Phone Number',
                            hintText: '9999999999',
                            icon: Icons.phone,
                          ),
                          const SizedBox(height: 20),
                          buildPasswordField(), // Password field
                          const SizedBox(height: 30),
                          ElevatedButton(
                            onPressed: _updateUserData,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 100, vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                                side:
                                    const BorderSide(color: Color(0xFFCEC9C9)),
                              ),
                            ),
                            child: const Text(
                              'Save Changes',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF005843),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Reusable text field widget
  Widget buildTextField({
    required TextEditingController controller,
    required String labelText,
    required String hintText,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  // Password text field with visibility toggle
  Widget buildPasswordField() {
    return TextField(
      controller: _passwordController,
      obscureText: !_isPasswordVisible,
      decoration: InputDecoration(
        labelText: 'Password',
        prefixIcon: const Icon(Icons.lock),
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
