import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socia_live/presentation/state_holders/bottom_nav_bar_controller.dart';
import 'package:socia_live/presentation/ui/screens/navigation_screen/add_post_screen.dart';
import 'package:socia_live/presentation/ui/screens/navigation_screen/explorer_screen.dart';
import 'package:socia_live/presentation/ui/screens/navigation_screen/home_screen.dart';
import 'package:socia_live/presentation/ui/screens/navigation_screen/my_profile_screen.dart';

class MainBottomNavBarScreen extends StatefulWidget {
  const MainBottomNavBarScreen({super.key});

  @override
  State<MainBottomNavBarScreen> createState() => _MainBottomNavBarScreenState();
}

class _MainBottomNavBarScreenState extends State<MainBottomNavBarScreen> {
  final BottomNavBarController _navBarController =
      Get.find<BottomNavBarController>();

  final List<Widget> _screens = const [
    HomeScreen(),
    ExplorerScreen(),
    AddPostScreen(),
    MyProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavBarController>(builder: (_) {
      return Scaffold(
          body: _screens[_navBarController.selectedIndex],
          bottomNavigationBar: NavigationBar(
              selectedIndex: _navBarController.selectedIndex,
              onDestinationSelected: _navBarController.changeIndex,
              height: 75,
              destinations: const [
                NavigationDestination(
                    icon: Icon(Icons.home_outlined), label: ''),
                NavigationDestination(
                    icon: Icon(Icons.search_outlined), label: ''),
                NavigationDestination(icon: Icon(Icons.add), label: ''),
                NavigationDestination(
                    icon: Icon(Icons.person_outline_outlined), label: ''),
              ]));
    });
  }
}
