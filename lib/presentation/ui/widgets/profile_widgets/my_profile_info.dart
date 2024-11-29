import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
    return Container(
      color: AppColors.darkThemeAppBarColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
               AppAssetsPath.demoPicURL1.toString(),
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
                        '50 ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        'Posts',
                        style: TextStyle(),
                      ),
                      const SizedBox(width: 16),
                      const Text(
                        '12 ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: followersCallback,
                        child: const Text(
                          'Following',
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Text(
                        '85 ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: followersCallback,
                        child: const Text(
                          'Followers',
                          style: TextStyle(),
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
