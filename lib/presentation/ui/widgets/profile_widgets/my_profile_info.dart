import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class MyProfileInfo extends StatelessWidget {
  const MyProfileInfo({
    super.key, required this.followingCallback, required this.followersCallback,
  });

  final VoidCallback followingCallback;
  final VoidCallback followersCallback;

  final String demoPic =
      'https://scontent.fdac8-1.fna.fbcdn.net/v/t39.30808-6/467528443_3453863834915316_1496637658964669195_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeE_VZcqJXQiusHDWTfWksOaL70sxtXrqFAvvSzG1euoUIFXhVMSNmhvdDOtpIEbhGpbVLQi-ciTvQATl7v5WfEt&_nc_ohc=ErLqNUFXhb8Q7kNvgHcFRE9&_nc_zt=23&_nc_ht=scontent.fdac8-1.fna&_nc_gid=A67e_NIhQQXi7zfMekKDE7l&oh=00_AYDnwxL9dX2HHV9Wv5xwT5spfZoC2ncxw1lLLZL5k9DxaQ&oe=674BE8EB';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.darkThemeAppBarColor,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                demoPic.toString(),
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
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 16),
                      Row(
                        children: [
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
                        ],
                      ),
                      const SizedBox(width: 16),
                      Text(
                        '85 Followers',
                        style: TextStyle(fontWeight: FontWeight.bold),
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
