import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socia_live/presentation/state_holders/theme/theme_controller.dart';
import 'package:socia_live/presentation/ui/widgets/home_screen/post_card_bottom_bar.dart';
import 'package:socia_live/presentation/ui/widgets/home_screen/post_card_top_bar.dart';
import 'package:socia_live/presentation/ui/widgets/home_screen/post_image.dart';

class PostCard extends StatefulWidget {
  const PostCard({super.key});

  @override
  State<PostCard> createState() => _PostCardState();
}

final ThemeController _themeController = Get.find();

class _PostCardState extends State<PostCard> {
  @override
  Widget build(BuildContext context) {
    _themeController.updateTheme(context);
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: _themeController.postBgColor),
          child: Column(
            children: <Widget>[
              const PostCardTopBar(),
              const SizedBox(height: 8),
              PostImage(context: context),
              const PostCardBottomBar(),
            ],
          ),
        ),
      );
    });
  }
}
