import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socia_live/presentation/route/route_names.dart';
import 'package:socia_live/presentation/ui/screens/navigation_screen/main_bottom_nav_bar_screen.dart';

import 'package:socia_live/presentation/ui/utils/app_constants.dart';
import 'package:socia_live/presentation/ui/widgets/auth/app_logo.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

final GlobalKey<FormState> _key = GlobalKey<FormState>();
final TextEditingController _emailTEController = TextEditingController();
final TextEditingController _passwordTEController = TextEditingController();

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Form(
            key: _key,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              children: [
                const AppLogo(),
                const SizedBox(height: 12),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text("Welcome Back"),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return "Something went wrong";
                    }
                    if (AppConstants.emailRegExp.hasMatch(value!) == false) {
                      return "Invalid Email Address";
                    }
                    return null;
                  },
                  controller: _emailTEController,
                  decoration: const InputDecoration(
                      labelText: "Email",
                      hintText: "Enter Your Email Address",
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.email_outlined)),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return "Something went wrong";
                    }
                    return null;
                  },
                  controller: _passwordTEController,
                  decoration: const InputDecoration(
                      labelText: "Password",
                      hintText: "Enter Your Password",
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.lock_outline_rounded)),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _moveToBottomBarScreen,
                  child: const Text(
                    "Log In",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 18),
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: "  Sign Up",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.offNamed(RouteNames.signupScreen)),
                ], text: "Don't have an account ?"))
              ],
            ),
          ),
        ),
      )),
    );
  }

  void _moveToBottomBarScreen() {
    Get.to(const MainBottomNavBarScreen());
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _passwordTEController.dispose();
    super.dispose();
  }
}
