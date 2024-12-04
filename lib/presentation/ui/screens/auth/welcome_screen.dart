import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:socia_live/presentation/route/route_names.dart';
import 'package:socia_live/presentation/ui/utils/app_assets_path.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

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
              SvgPicture.asset(
                AppAssetsPath.appLogo,
                height: 35,
                colorFilter: ColorFilter.mode(
                  isLightTheme ? Colors.black : Colors.white,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(height: 24),
              _buildSignUpSection(),
              const SizedBox(height: 12),
              _buildLoginSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginSection() {
    return TextButton(
      onPressed: _onTapLoginScreen,
      child: const Text(
        "Log In",
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
      ),
    );
  }

  Widget _buildSignUpSection() {
    return ElevatedButton(
      onPressed: _onTapSignupScreen,
      style: ButtonStyle(
        minimumSize: WidgetStateProperty.all(const Size(300, 45)),
      ),
      child: const Text("Create Account"),
    );
  }

  void _onTapLoginScreen() {
    Get.toNamed(RouteNames.loginScreen);
  }

  void _onTapSignupScreen() {
    Get.toNamed(RouteNames.signupScreen);
  }
}
