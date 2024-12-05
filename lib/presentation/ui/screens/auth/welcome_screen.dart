import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socia_live/presentation/route/route_names.dart';
import 'package:socia_live/presentation/ui/widgets/auth/app_logo.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const AppLogo(),
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
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(300, 45),
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
