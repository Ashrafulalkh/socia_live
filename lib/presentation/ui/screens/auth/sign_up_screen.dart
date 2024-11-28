import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:socia_live/presentation/route/route_names.dart';
import 'package:socia_live/presentation/ui/utils/app_assets_path.dart';

import 'package:socia_live/presentation/ui/utils/app_constants.dart';
import 'package:socia_live/presentation/ui/utils/app_strings.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

final GlobalKey<FormState> _key = GlobalKey<FormState>();
final TextEditingController _emailTEController = TextEditingController();
final TextEditingController _passwordTEController = TextEditingController();

class _SignUpScreenState extends State<SignUpScreen> {
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
                        "Create an account ",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text("Welcome to ${AppStrings.appName}"),
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
                    if (value?.trim().isEmpty ?? true) {
                      return "Invalid username";
                    }

                    return null;
                  },
                  controller: _emailTEController,
                  decoration: const InputDecoration(
                      labelText: "User Name",
                      hintText: "Enter Your User Name",
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.perm_identity)),
                ),
                const SizedBox(height: 12), TextFormField(
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return "Invalid mobile number";
                    }

                    return null;
                  },
                  controller: _emailTEController,
                  decoration: const InputDecoration(
                      labelText: "Mobile No",
                      hintText: "Enter Your Mobile Number",
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.phone)),
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
                TextFormField(
                  validator: (String? value) {
                    if (value?.isEmpty ?? true) {
                      return "Something went wrong";
                    }
                    return null;
                  },
                  controller: _passwordTEController,
                  decoration: const InputDecoration(
                      labelText: "Confirm Password",
                      hintText: "Enter Your Confirm Password",
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.lock_outline_rounded)),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 18),
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: "  Log In",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.toNamed(RouteNames.signupScreen)),
                ], text: "Already have an account ?"))
              ],
            ),
          ),
        ),
      )),
    );
  }
}
