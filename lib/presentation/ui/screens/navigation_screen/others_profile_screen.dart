import 'package:flutter/material.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:socia_live/presentation/ui/utils/app_assets_path.dart';
import 'package:socia_live/presentation/ui/widgets/profile_widgets/profile_photo_gallery_list_grid_view.dart';
import 'package:socia_live/presentation/ui/widgets/profile_widgets/profile_photo_gallery_list_view.dart';


import '../../widgets/profile_widgets/others_profile_info.dart';

class OthersProfileScreen extends StatefulWidget {
  const OthersProfileScreen({super.key});

  @override
  State<OthersProfileScreen> createState() => _OthersProfileScreenState();
}

class _OthersProfileScreenState extends State<OthersProfileScreen> {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'profile\'s name',
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: Column(
          children: [
            const OthersProfileInfoWidget(),
            _buildTabBar(),
            const SizedBox(
              height: 10
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ProfilePhotoGalleryListGridView(imageList:AppAssetsPath().demoImageList,),
                  ProfilePhotoGalleryListView(imageList: AppAssetsPath().demoImageList,),
                ],
              ),
            ),
          ],
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
              Icon(Icons.grid_on),
              SizedBox(width: 8),
              Text('Grid View'),
            ],
          ),
        ),
        Tab(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.list),
              SizedBox(width: 8),
              Text('List View'),
            ],
          ),
        ),
      ],
    );
  }
}
