import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socia_live/presentation/state_holders/navigation_screen/bottom_nav_bar_controller.dart';
import 'package:socia_live/presentation/state_holders/user_details/user_details_controller.dart';
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
  void initState() {
    Get.find<UserDetailsController>().fetchUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.find<BottomNavBarController>().backToHome();
              },
              icon: const Icon(Icons.arrow_back_ios_new)),
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: const Text(
            'My Profile',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: GetBuilder<UserDetailsController>(
          builder: (userDetailsController) {
            return Visibility(
              visible: !userDetailsController.inProgress,
              replacement: const Center(
                child: CircularProgressIndicator(),
              ),
              child: Column(
                children: [
                  MyProfileInfoWidget(
                    followingCallback: () {},
                    followersCallback: () {},  user: userDetailsController.user,
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
            );
          }
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
