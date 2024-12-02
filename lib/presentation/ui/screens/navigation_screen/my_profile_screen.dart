import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:socia_live/presentation/ui/screens/navigation_screen/others_profile_screen.dart';
import '../../utils/app_assets_path.dart';
import '../../widgets/profile_widgets/my_profile_info.dart';

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
                  _buildAllPostSection(),
                  _buildSteamingSection(),
                  _buildSaveSection(),
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

  Widget _buildAllPostSection() {
    return MasonryGridView.builder(
        itemCount: AppAssetsPath().demoImageList.length,
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (context, index) => InstaImageViewer(
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: Image.network(
                  AppAssetsPath().demoImageList[index].toString(),
                  // AppAssetsPath.demoPicURL1.toString(),
                ),
              ),
            ));
  }

  Widget _buildSteamingSection() {
    return Padding(
      padding: const EdgeInsets.all(17.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) {
          return InstaImageViewer(
            child: Container(
              margin: const EdgeInsets.only(bottom: 8),
              // Space between list items
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(
                    AppAssetsPath.demoPicURL1.toString(),
                  ),
                  // fit: BoxFit.cover,
                ),
              ),
              height: 400,
            ),
          );
        },
      ),
    );
  }

  Widget _buildSaveSection() {
    return MasonryGridView.builder(
        itemCount: AppAssetsPath().demoImageList.length,
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (context, index) => InstaImageViewer(
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Image.network(
              AppAssetsPath().demoImageList[index].toString(),
              // AppAssetsPath.demoPicURL1.toString(),
            ),
          ),
        ));
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
