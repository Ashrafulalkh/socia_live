import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

class ProfilePhotoGalleryListGridView extends StatelessWidget {
  const ProfilePhotoGalleryListGridView({
    super.key,
    required this.imageList,
  });

  final List<String> imageList;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      itemCount: imageList.length,
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (context, index) => InstaImageViewer(
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Image.network(
            imageList[index],
          ),
        ),
      ),
    );
  }
}
