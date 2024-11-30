import 'package:flutter/material.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:socia_live/presentation/ui/utils/app_assets_path.dart';


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
            OthersProfileInfoWidget(),
            _buildTabBar(),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildGridViewSection(),
                  _buildListViewSection(),
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

  Widget _buildListViewSection() {
    return Padding(
      padding: const EdgeInsets.all(17.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 9,
        itemBuilder: (context, index) {
          return InstaImageViewer(
            child: Container(
              margin: const EdgeInsets.only(bottom: 8),
              // Space between list items
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(
                   AppAssetsPath.demoPicURL2.toString(),
                  ),
                ),
              ),
              height: 400, // Height of each list item
            ),
          );
        },
      ),
    );
  }

  Widget _buildGridViewSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: 50,
        itemBuilder: (context, index) {
          return InstaImageViewer(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: NetworkImage(
                    AppAssetsPath.demoPicURL2.toString(),
                  ),
                  // fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
