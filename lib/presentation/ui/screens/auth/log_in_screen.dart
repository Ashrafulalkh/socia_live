import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:socia_live/presentation/route/route_names.dart';
import 'package:socia_live/presentation/state_holders/auth/sign_in_controller.dart';
import 'package:socia_live/presentation/ui/screens/navigation_screen/main_bottom_nav_bar_screen.dart';
import 'package:socia_live/presentation/ui/utils/app_assets_path.dart';
import 'package:socia_live/presentation/ui/utils/app_constants.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passwordTEController = TextEditingController();

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
                  SvgPicture.asset(AppAssetsPath.appLogo),
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
                        return "Please enter your email.";
                      }
                      if (!AppConstants.emailRegExp.hasMatch(value!)) {
                        return "Invalid Email Address.";
                      }
                      return null;
                    },
                    controller: _emailTEController,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      hintText: "Enter Your Email Address",
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return "Please enter your password.";
                      }
                      return null;
                    },
                    controller: _passwordTEController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Password",
                      hintText: "Enter Your Password",
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.lock_outline_rounded),
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () async {
                      if (!_key.currentState!.validate()) {
                        return; 
                      }

                      try {
                        final result =
                            await Get.find<SignInController>().signIn(
                          _emailTEController.text.trim(),
                          _passwordTEController.text.trim(),
                        );

                        if (result) {
                          Get.off(const MainBottomNavBarScreen());
                          Get.snackbar(
                            'Login Successful',
                            'Welcome!',
                            colorText: Colors.white,
                            backgroundColor: Colors.green,
                          );
                        } else {
                          Get.snackbar(
                            'Login Failed',
                            'Invalid credentials.',
                            colorText: Colors.white,
                            backgroundColor: Colors.red,
                          );
                        }
                      } catch (e) {
                        Get.snackbar(
                          'Error',
                          'Something went wrong: $e',
                          colorText: Colors.white,
                          backgroundColor: Colors.red,
                        );
                      }
                    },
                    child: const Text(
                      "Log In",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text.rich(
                    TextSpan(
                      text: "Don't have an account? ",
                      children: [
                        TextSpan(
                          text: "Sign Up",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()
                            ..onTap =
                                () => Get.offNamed(RouteNames.signupScreen),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
