import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ImageDisplay extends StatefulWidget {
  const ImageDisplay({super.key});

  @override
  State<ImageDisplay> createState() => _ImageDisplayState();
}

class _ImageDisplayState extends State<ImageDisplay> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Stream to fetch images from Firestore
  Stream<QuerySnapshot> _fetchImagesStream() {
    return _firestore.collection('images').snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Uploaded Images'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _fetchImagesStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No images found'));
          }

          // Extract the list of image documents
          List<DocumentSnapshot> imageDocs = snapshot.data!.docs;

          return ListView.builder(
            itemCount: imageDocs.length,
            itemBuilder: (context, index) {
              var image = imageDocs[index].data() as Map<String, dynamic>;

              // Extract the image name and URL
              String imageName = image['name'] ?? 'No name';
              String imageUrl = image['url'] ?? '';

              return Card(
                child: ListTile(
                  title: Text(imageName),
                  subtitle: imageUrl.isNotEmpty
                      ? CachedNetworkImage(
                          imageUrl: imageUrl,
                          height: 150,
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        )
                      : const Text('No image available'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
