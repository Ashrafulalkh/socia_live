import 'package:flutter/material.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:socia_live/data/models/user_model.dart';
import 'package:socia_live/presentation/ui/utils/app_assets_path.dart';
import '../../utils/app_colors.dart';

class MyProfileInfoWidget extends StatelessWidget {
  const MyProfileInfoWidget({
    super.key,
    required this.followingCallback,
    required this.followersCallback, required this.user,
  });

  final VoidCallback followingCallback;
  final VoidCallback followersCallback;
  final UserModel? user;

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
                  Text(
                    user?.userName ?? 'Unknown',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '@${user?.userName ?? 'Unknown'}',
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    children: [
                      const Text(
                        '0 Posts',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(width: 16),
                      GestureDetector(
                        onTap: followersCallback,
                        child: const Text(
                          '0 Following',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(width: 16),
                      GestureDetector(
                        onTap: followersCallback,
                        child: const Text(
                          '0 Followers',
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
