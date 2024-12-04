import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:socia_live/presentation/route/route_names.dart';
import 'package:socia_live/presentation/ui/utils/app_assets_path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offNamed(RouteNames.welcomeScreen);
  }

  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    // current theme is light or dark
    final isLightTheme = Theme.of(context).brightness == Brightness.light;
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            SvgPicture.asset(
              AppAssetsPath.appLogo,
              height: 50,
              colorFilter: ColorFilter.mode(
                isLightTheme ? Colors.black : Colors.white,
                BlendMode.srcIn,
              ),
            ),
            const Spacer(),
            const CircularProgressIndicator(),
            const SizedBox(height: 16),
            const Text(
              'version 1.0.0',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      )),
    );
  }
}
