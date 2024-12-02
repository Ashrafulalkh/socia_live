import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import '../../utils/app_assets_path.dart';
import '../../utils/app_colors.dart';

class OthersProfileInfoWidget extends StatelessWidget {
  const OthersProfileInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return Container(
      color: isDarkTheme ? AppColors.darkThemeAppBarColor : Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InstaImageViewer(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  AppAssetsPath.demoPicURL2.toString(),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Wrap(
                    children: [
                      Text(
                        '50 Posts',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 16),
                      Text(
                        '12 Following',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 16),
                      Text(
                        '85 Followers',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Wrap(
                    children: [
                      Text('Visit: '),
                      Text('pagelink.com'),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 100,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isDarkTheme
                                ? AppColors.darkThemeProfileButtonColor
                                : AppColors.lightThemeProfileButtonColor,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                          ),
                          child: const Text('Follow'),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: 100,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isDarkTheme
                                ? AppColors.darkThemeProfileButtonColor
                                : AppColors.lightThemeProfileButtonColor,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                          ),
                          child: const Text('Message'),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
