import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:socia_live/presentation/route/route_names.dart';

import 'package:socia_live/presentation/ui/utils/assets_path.dart';

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
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            SvgPicture.asset(AppAssetsPath.appLogo, height: 50),
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
