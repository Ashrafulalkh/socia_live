import 'package:flutter/material.dart';
import 'package:socia_live/presentation/ui/utils/app_colors.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  final String default_image =
      'https://scontent.fdac8-1.fna.fbcdn.net/v/t39.30808-6/467528443_3453863834915316_1496637658964669195_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeE_VZcqJXQiusHDWTfWksOaL70sxtXrqFAvvSzG1euoUIFXhVMSNmhvdDOtpIEbhGpbVLQi-ciTvQATl7v5WfEt&_nc_ohc=ErLqNUFXhb8Q7kNvgHcFRE9&_nc_zt=23&_nc_ht=scontent.fdac8-1.fna&_nc_gid=A67e_NIhQQXi7zfMekKDE7l&oh=00_AYDnwxL9dX2HHV9Wv5xwT5spfZoC2ncxw1lLLZL5k9DxaQ&oe=674BE8EB';

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
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: Column(
          children: [
            _buildMyProfileInfoSection(),
            _buildTabBar(),
            const SizedBox(
              height: 10,
            ),
            // Expanded for TabBarView
            Expanded(
              child: TabBarView(
                children: [
                  _buildGridViewSection(),
                  _buildListViewSection(),
                  _buildGridViewSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListViewSection() {
    return Padding(
      padding: const EdgeInsets.all(17.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 9,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 8),
            // Space between list items
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                image: NetworkImage(
                  'https://scontent.fdac8-1.fna.fbcdn.net/v/t39.30808-6/467528443_3453863834915316_1496637658964669195_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeE_VZcqJXQiusHDWTfWksOaL70sxtXrqFAvvSzG1euoUIFXhVMSNmhvdDOtpIEbhGpbVLQi-ciTvQATl7v5WfEt&_nc_ohc=ErLqNUFXhb8Q7kNvgHcFRE9&_nc_zt=23&_nc_ht=scontent.fdac8-1.fna&_nc_gid=A67e_NIhQQXi7zfMekKDE7l&oh=00_AYDnwxL9dX2HHV9Wv5xwT5spfZoC2ncxw1lLLZL5k9DxaQ&oe=674BE8EB', // Replace with the image URL
                ),
                fit: BoxFit.cover,
              ),
            ),
            height: 400, // Height of each list item
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
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                image: NetworkImage(
                  'https://scontent.fdac8-1.fna.fbcdn.net/v/t39.30808-6/467528443_3453863834915316_1496637658964669195_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeE_VZcqJXQiusHDWTfWksOaL70sxtXrqFAvvSzG1euoUIFXhVMSNmhvdDOtpIEbhGpbVLQi-ciTvQATl7v5WfEt&_nc_ohc=ErLqNUFXhb8Q7kNvgHcFRE9&_nc_zt=23&_nc_ht=scontent.fdac8-1.fna&_nc_gid=A67e_NIhQQXi7zfMekKDE7l&oh=00_AYDnwxL9dX2HHV9Wv5xwT5spfZoC2ncxw1lLLZL5k9DxaQ&oe=674BE8EB', // Replace with the image URLs
                ),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
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

  // Widget _buildTabBar() {
  //   return const TabBar(
  //     tabs: [
  //       Tab(
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Icon(Icons.grid_on),
  //             SizedBox(width: 8),
  //             Text('Grid View'),
  //           ],
  //         ),
  //       ),
  //       Tab(
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Icon(Icons.list),
  //             SizedBox(width: 8),
  //             Text('List View'),
  //           ],
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget _buildMyProfileInfoSection() {
    return Container(
      color:  AppColors.darkThemeAppBarColor,
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://scontent.fdac8-1.fna.fbcdn.net/v/t39.30808-6/467528443_3453863834915316_1496637658964669195_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeE_VZcqJXQiusHDWTfWksOaL70sxtXrqFAvvSzG1euoUIFXhVMSNmhvdDOtpIEbhGpbVLQi-ciTvQATl7v5WfEt&_nc_ohc=ErLqNUFXhb8Q7kNvgHcFRE9&_nc_zt=23&_nc_ht=scontent.fdac8-1.fna&_nc_gid=A67e_NIhQQXi7zfMekKDE7l&oh=00_AYDnwxL9dX2HHV9Wv5xwT5spfZoC2ncxw1lLLZL5k9DxaQ&oe=674BE8EB', // Replace with the image URL
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nafiur Rahman',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '@nafiur_',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 8),
                  Wrap(
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
