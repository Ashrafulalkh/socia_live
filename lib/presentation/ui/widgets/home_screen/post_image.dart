import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socia_live/presentation/ui/utils/app_assets_path.dart';

class PostImage extends StatelessWidget {
  const PostImage({
    super.key,
    required this.context,
  });

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        AppAssetsPath.demoPicURL3,
        width: context.width * 1.2,
        height: context.height * 0.4,
        fit: BoxFit.cover,
      ),
    );
  }
}