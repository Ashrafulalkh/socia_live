import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socia_live/presentation/ui/screens/auth/splash_screen.dart';

class SociaLive extends StatelessWidget {
  const SociaLive({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: SplashScreen(),
    );
  }
}
