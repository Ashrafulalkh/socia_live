import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:socia_live/presentation/ui/screens/navigation_screen/others_profile_screen.dart';
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
            MyProfileInfo(
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
                  _buildSaveSection(),
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

  Widget _buildSteamingSection() {
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
                  'https://scontent.fdac8-1.fna.fbcdn.net/v/t39.30808-6/467528443_3453863834915316_1496637658964669195_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeE_VZcqJXQiusHDWTfWksOaL70sxtXrqFAvvSzG1euoUIFXhVMSNmhvdDOtpIEbhGpbVLQi-ciTvQATl7v5WfEt&_nc_ohc=ErLqNUFXhb8Q7kNvgHcFRE9&_nc_zt=23&_nc_ht=scontent.fdac8-1.fna&_nc_gid=A67e_NIhQQXi7zfMekKDE7l&oh=00_AYDnwxL9dX2HHV9Wv5xwT5spfZoC2ncxw1lLLZL5k9DxaQ&oe=674BE8EB',
                ),
                fit: BoxFit.cover,
              ),
            ),
            height: 400,
          );
        },
      ),
    );
  }

  Widget _buildSaveSection() {
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
}
