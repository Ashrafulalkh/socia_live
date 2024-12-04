import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socia_live/presentation/ui/screens/navigation_screen/others_profile_screen.dart';
import 'package:socia_live/presentation/ui/widgets/profile_widgets/profile_steaming_list.dart';
import '../../utils/app_assets_path.dart';
import '../../widgets/profile_widgets/my_profile_info.dart';
import '../../widgets/profile_widgets/profile_photo_gallery_list_grid_view.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: const Text(
            'My Profile',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: Column(
          children: [
            MyProfileInfoWidget(
              followingCallback: () {},
              followersCallback: () {},
            ),
            _buildTabBar(),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ProfilePhotoGalleryListGridView(
                    imageList: AppAssetsPath().demoImageList,
                  ),
                  const ProfileSteamingList(),
                  ProfilePhotoGalleryListGridView(
                    imageList: AppAssetsPath().demoImageList,
                  ),
                ],
              ),
            ),
          ],
        ),

        ////// Please remove this after after navigated others profile.....
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => const OthersProfileScreen());
          },
          child: const Icon(Icons.account_circle),
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return const TabBar(
      tabs: [
        Tab(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 8),
              Text('All Post'),
            ],
          ),
        ),
        Tab(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 8),
              Text('Steaming'),
            ],
          ),
        ),
        Tab(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 8),
              Text('Save'),
            ],
          ),
        ),
      ],
    );
  }
}
