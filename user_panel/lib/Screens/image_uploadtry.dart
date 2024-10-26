import 'dart:html' as html;
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({super.key});

  @override
  _UploadImageState createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  bool loading = false;
  String? _imageUrl; // Store image URL instead of the image file
  final picker = ImagePicker();
  final firebase_storage.FirebaseStorage _storage =
      firebase_storage.FirebaseStorage.instance;
  final CollectionReference _dbRef =
      FirebaseFirestore.instance.collection('Images');

  // Function to show toast messages
  void toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }

  // Function to pick image from gallery
  Future<void> pickImageFromGallery() async {
    try {
      // Check if running on web
      if (kIsWeb) {
        // Use HTML input to pick image
        html.File? file = await _pickFile();

        if (file != null) {
          uploadImageToFirebase(file);
        } else {
          toastMessage('No image selected');
        }
      } else {
        final pickedFile = await picker.pickImage(source: ImageSource.gallery);
        if (pickedFile != null) {
          uploadImageToFirebase(pickedFile.path);
        } else {
          toastMessage('No image selected');
        }
      }
    } catch (e) {
      toastMessage('Failed to pick image: $e');
    }
  }

  Future<html.File?> _pickFile() async {
    // Create an HTML input element to pick a file
    final input = html.FileUploadInputElement()..accept = 'image/*';
    input.click();

    return await input.onChange.first.then((_) {
      final files = input.files;
      if (files != null && files.isNotEmpty) {
        return files[0];
      }
      return null;
    });
  }

  // Function to upload image to Firebase Storage
  Future<void> uploadImageToFirebase(dynamic file) async {
    setState(() {
      loading = true;
    });

    try {
      // Generate a unique ID for each image
      String imageId = DateTime.now().millisecondsSinceEpoch.toString();

      // Reference to Firebase Storage
      firebase_storage.Reference storageRef =
          _storage.ref('FolderName/$imageId');

      if (kIsWeb) {
        // Upload the file directly for web
        final reader = html.FileReader();
        reader.readAsArrayBuffer(file);

        // Wait until the file is read
        await reader.onLoad.first;

        // Create a Blob from the file
        final blob = reader.result as Uint8List;

        // Upload the file
        firebase_storage.UploadTask uploadTask = storageRef.putData(blob);

        await uploadTask;
      } else {
        // Upload file from mobile
        firebase_storage.UploadTask uploadTask = storageRef.putFile(File(file));

        await uploadTask;
      }

      // Get the download URL of the uploaded image
      String imageUrl = await storageRef.getDownloadURL();

      // Store the image URL and metadata in Firestore
      await _dbRef.doc(imageId).set({
        'id': imageId,
        'url': imageUrl,
      });

      setState(() {
        _imageUrl = imageUrl; // Store the URL of the uploaded image
      });

      toastMessage('Image uploaded successfully!');
    } catch (e) {
      toastMessage('Upload failed: $e');
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Center(
          child: Text('Upload Image', style: TextStyle(color: Colors.white)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: pickImageFromGallery,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: _imageUrl != null
                    ? Image.network(_imageUrl!) // Display uploaded image
                    : const Center(child: Icon(Icons.image)),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: loading ? null : pickImageFromGallery,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: loading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text(
                      'Upload',
                      style: TextStyle(fontSize: 18),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
