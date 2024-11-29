import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

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
            OthersProfileInfoSection(),
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
          return Container(
            margin: const EdgeInsets.only(bottom: 8),
            // Space between list items
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                image: NetworkImage(
                    'https://scontent.fdac8-1.fna.fbcdn.net/v/t1.6435-9/119113030_2419352075033169_3633025472637871918_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=a5f93a&_nc_eui2=AeEqgNZISYzknMRryWVvP2brzoapYF7OEDvOhqlgXs4QO3l3kVZfKUCAs24CU_pku8EEpgBE2Kd2MbwFxQt4N-sT&_nc_ohc=V03yMPeEKiYQ7kNvgF0VpXD&_nc_zt=23&_nc_ht=scontent.fdac8-1.fna&_nc_gid=AUlEHN_y0FNNvUhbp1kqCVV&oh=00_AYBKv8ibTMyqdPAu6cUDIVot-YAmix2ymA3VOSgRxScBfg&oe=6771432C'),
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
                  'https://scontent.fdac8-1.fna.fbcdn.net/v/t1.6435-9/119113030_2419352075033169_3633025472637871918_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=a5f93a&_nc_eui2=AeEqgNZISYzknMRryWVvP2brzoapYF7OEDvOhqlgXs4QO3l3kVZfKUCAs24CU_pku8EEpgBE2Kd2MbwFxQt4N-sT&_nc_ohc=V03yMPeEKiYQ7kNvgF0VpXD&_nc_zt=23&_nc_ht=scontent.fdac8-1.fna&_nc_gid=AUlEHN_y0FNNvUhbp1kqCVV&oh=00_AYBKv8ibTMyqdPAu6cUDIVot-YAmix2ymA3VOSgRxScBfg&oe=6771432C',
                ),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}

class OthersProfileInfoSection extends StatelessWidget {
  const OthersProfileInfoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.darkThemeAppBarColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://scontent.fdac8-1.fna.fbcdn.net/v/t1.6435-9/119113030_2419352075033169_3633025472637871918_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=a5f93a&_nc_eui2=AeEqgNZISYzknMRryWVvP2brzoapYF7OEDvOhqlgXs4QO3l3kVZfKUCAs24CU_pku8EEpgBE2Kd2MbwFxQt4N-sT&_nc_ohc=V03yMPeEKiYQ7kNvgF0VpXD&_nc_zt=23&_nc_ht=scontent.fdac8-1.fna&_nc_gid=AUlEHN_y0FNNvUhbp1kqCVV&oh=00_AYBKv8ibTMyqdPAu6cUDIVot-YAmix2ymA3VOSgRxScBfg&oe=6771432C',
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
                            backgroundColor:
                                AppColors.darkThemeProfileButtonColor,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20),
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
                            backgroundColor:
                                AppColors.darkThemeProfileButtonColor,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20),
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
