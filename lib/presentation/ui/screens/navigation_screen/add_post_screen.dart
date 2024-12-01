import 'package:flutter/material.dart';

import '../../widgets/photo_upload_dialog.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * .5,
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return PhotoSelectionDialog(
                    onCameraTap: () {},
                    onGalleryTap: () {},
                  );
                },
              );
            },
            child: const Text('Upload Photo'),
          ),
        ),
      ),
    );
  }
}
