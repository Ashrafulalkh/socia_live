import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:socia_live/presentation/state_holders/theme/theme_controller.dart';
import 'package:socia_live/presentation/ui/utils/app_assets_path.dart';

class AppLogo extends StatefulWidget {
  const AppLogo({super.key});

  @override
  State<AppLogo> createState() => _AppLogoState();
}

final ThemeController _themeController = Get.find();

class _AppLogoState extends State<AppLogo> {
  @override
  Widget build(BuildContext context) {
    _themeController.updateTheme(context);
    return Obx(() {
      return SvgPicture.asset(
        AppAssetsPath.appLogo,
        colorFilter: ColorFilter.mode(
          _themeController.logoColor,
          BlendMode.srcIn,
        ),
      );
    });
  }
}
