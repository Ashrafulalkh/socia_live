import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:socia_live/presentation/state_holders/auth/auth_controller.dart';
import 'package:socia_live/presentation/ui/utils/supabase_const.dart';

class SignInController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  Future<bool> signIn(String email, String password) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    try {
      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (response.session != null) {
        isSuccess = true;
        Get.find<AuthController>().saveAccessToken(response.session!.accessToken);
      } else {
        debugPrint("Sign in Failed");
      }
    } catch (e) {
      debugPrint("Sign in Failed");
    } finally {
      _inProgress = false;
      update();
    }

    return isSuccess;
  }
}
