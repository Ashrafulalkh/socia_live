import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socia_live/presentation/state_holders/navigation_screen/bottom_nav_bar_controller.dart';
import 'package:socia_live/presentation/ui/widgets/auth/app_logo.dart';
import 'package:socia_live/presentation/ui/widgets/home_screen/circular_image.dart';
import 'package:socia_live/presentation/ui/widgets/home_screen/post_card.dart';
import 'package:socia_live/presentation/ui/widgets/home_screen/story_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            expandedHeight: 60,
            leading: GestureDetector(
              onTap: () {
                Get.find<BottomNavBarController>().selectProfile();
              },
              child: const Padding(
                padding: EdgeInsets.all(6.0),
                child: CircularImage(),
              ),
            ),
            title: const AppLogo(),
            centerTitle: true,
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.chat)),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_active_outlined)),
            ],
          ),
          SliverToBoxAdapter(
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              itemCount: 1,
              itemBuilder: (context, index) {
                return const StoryCard();
              },
            ),
          ),
          SliverToBoxAdapter(
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const BouncingScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return const PostCard();
              },
            ),
          )
        ],
      ),
    );
  }
}
