
import 'package:flutter/material.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:socia_live/presentation/ui/utils/app_assets_path.dart';
import '../../utils/app_colors.dart';

class MyProfileInfoWidget extends StatelessWidget {
  const MyProfileInfoWidget({
    super.key,
    required this.followingCallback,
    required this.followersCallback,
  });

  final VoidCallback followingCallback;
  final VoidCallback followersCallback;

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Container(
      color: isDarkTheme ? AppColors.darkThemeAppBarColor : AppColors.lightThemeAppBarColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            InstaImageViewer(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  AppAssetsPath.demoPicURL1.toString(),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Nafiur Rahman',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    '@nafiur_',
                    style: TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    children: [
                      const Text(
                        '50 Posts',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(width: 16),
                      GestureDetector(
                        onTap: followersCallback,
                        child: const Text(
                          '12 Following',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(width: 16),
                      GestureDetector(
                        onTap: followersCallback,
                        child: const Text(
                          '82 Followers',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
