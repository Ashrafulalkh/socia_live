import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:socia_live/presentation/state_holders/theme/theme_controller.dart';
import 'package:socia_live/presentation/ui/utils/app_assets_path.dart';
import 'package:socia_live/presentation/ui/widgets/home_screen/circular_image.dart';

class StoryCard extends StatefulWidget {
  const StoryCard({
    super.key,
  });

  @override
  State<StoryCard> createState() => _StoryCardState();
}

final ThemeController _themeController = Get.find();

class _StoryCardState extends State<StoryCard> {
  @override
  Widget build(BuildContext context) {
    _themeController.updateTheme(context);
    return Container(
      height: 186,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: _themeController.postBgColor,
      ),
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Card(
            child: Stack(
              children: [
                Container(
                  width: 120,
                  height: 186,
                  decoration: BoxDecoration(
                    color: _themeController.postBgColor,
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    border: Border.all(
                        style: BorderStyle.solid,
                        width: 1,
                        color: _themeController.logoColor.withOpacity(0.1)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        width: 128,
                        height: 145,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                          color: _themeController.postBgColor.withOpacity(0.5),
                        ),
                        child: index == 0
                            ? const Center(
                                child: SizedBox(
                                  child: FaIcon(FontAwesomeIcons.plus),
                                ),
                              )
                            : ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(12),
                                    topLeft: Radius.circular(12)),
                                child: Image.network(
                                  AppAssetsPath.demoPicURL1,
                                  fit: BoxFit.cover,
                                ),
                              ),
                      ),
                      const SizedBox(height: 0.70),
                      const Text(
                        "Team Orange",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const Positioned(
                  top: 8,
                  left: 8,
                  child: SizedBox(
                    height: 28,
                    width: 28,
                    child: CircularImage(),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
