import 'package:flutter/material.dart';

class PhotoSelectionDialog extends StatelessWidget {
  final VoidCallback onCameraTap;
  final VoidCallback onGalleryTap;

  const PhotoSelectionDialog(
      {super.key, required this.onCameraTap, required this.onGalleryTap});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      contentPadding: const EdgeInsets.all(16.0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Select from",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: onCameraTap,
                child: const Column(
                  children: [
                    Icon(Icons.camera_alt, size: 40.0, color: Colors.blue),
                    SizedBox(height: 8.0),
                    Text("Camera"),
                  ],
                ),
              ),
              GestureDetector(
                onTap: onGalleryTap,
                child: const Column(
                  children: [
                    Icon(Icons.photo, size: 40.0, color: Colors.blue),
                    SizedBox(height: 8.0),
                    Text("Gallery"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
