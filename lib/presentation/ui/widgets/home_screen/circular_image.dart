import 'package:flutter/material.dart';
import 'package:socia_live/presentation/ui/utils/app_assets_path.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 20,
      backgroundImage: NetworkImage(AppAssetsPath.demoPicURL2),
    );
  }
}
