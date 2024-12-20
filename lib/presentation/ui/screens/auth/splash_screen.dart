import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socia_live/presentation/route/route_names.dart';
import 'package:socia_live/presentation/state_holders/auth/auth_controller.dart';
import 'package:socia_live/presentation/ui/widgets/auth/app_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    bool isLoggedIn = await Get.find<AuthController>().checkAuthState();
    if(isLoggedIn){
      Get.offAllNamed(RouteNames.mainBottomNavBarScreen);
    }else {
      Get.offAllNamed(RouteNames.welcomeScreen);
    }
  }

  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            AppLogo(),
            Spacer(),
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text(
              'version 1.0.0',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      )),
    );
  }
}
