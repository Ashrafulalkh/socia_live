import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:socia_live/presentation/route/route_names.dart';
import 'package:socia_live/presentation/state_holders/auth/sign_up_controller.dart';
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
final TextEditingController _nameTEController = TextEditingController();
final TextEditingController _numberTEController = TextEditingController();
final TextEditingController _confirmPasswordTEController =
    TextEditingController();

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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return "Enter a Valid Email Address ";
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
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return "Enter a Valid User Name";
                      }

                      return null;
                    },
                    controller: _nameTEController,
                    decoration: const InputDecoration(
                        labelText: "User Name",
                        hintText: "Enter Your User Name",
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.perm_identity)),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return "Enter a Valid mobile number";
                      }

                      return null;
                    },
                    controller: _numberTEController,
                    decoration: const InputDecoration(
                        labelText: "Mobile No",
                        hintText: "Enter Your Mobile Number",
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.phone)),
                  ),
                  const SizedBox(height: 12),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return "Enter a Valid Password";
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
                  const SizedBox(height: 12),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return "Enter Valid ConfirmPassword";
                      } else if (_passwordTEController.text !=
                          _confirmPasswordTEController.text) {
                        return 'Password and confirm password does not match!! Check again';
                      }
                      return null;
                    },
                    controller: _confirmPasswordTEController,
                    decoration: const InputDecoration(
                        labelText: "Confirm Password",
                        hintText: "Enter Your Confirm Password",
                        hintStyle: TextStyle(color: Colors.grey),
                        prefixIcon: Icon(Icons.lock_outline_rounded)),
                  ),
                  const SizedBox(height: 24),
                  _buildSignUpButtonSection(),
                  const SizedBox(height: 18),
                  Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: "  Log In",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.toNamed(RouteNames.loginScreen),
                      ),
                    ], text: "Already have an account ?"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpButtonSection() {
    return GetBuilder<SignUpController>(builder: (signUpController) {
      return Visibility(
        visible: !signUpController.inProgress,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ElevatedButton(
          onPressed: () {
            _onTapSignUpButton();
          },
          child: const Text(
            "Sign Up",
            style: TextStyle(fontSize: 18),
          ),
        ),
      );
    });
  }

  Future<void> _onTapSignUpButton() async {
    if (!_key.currentState!.validate()) {
      return;
    }
    final result = await Get.find<SignUpController>().signUp(
        _emailTEController.text.trim(),
        _nameTEController.text.trim(),
        _numberTEController.text.trim(),
        _passwordTEController.text);
    if (result) {
      _clearFields();
      Get.offNamed(RouteNames.loginScreen);
      Get.snackbar('Sign Up', 'You have successfully Signed Up',
          colorText: Colors.white, backgroundColor: Colors.green);
    } else {
      Get.snackbar('Sign Up', 'Sign Up failed!! Please try again',
          colorText: Colors.white,
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 4));
    }
  }

  void _clearFields() {
    _emailTEController.clear();
    _nameTEController.clear();
    _numberTEController.clear();
    _passwordTEController.clear();
    _confirmPasswordTEController.clear();
  }

  @override
  void dispose() {
    _emailTEController.dispose();
    _nameTEController.dispose();
    _numberTEController.dispose();
    _passwordTEController.dispose();
    _confirmPasswordTEController.dispose();
    super.dispose();
  }
}
