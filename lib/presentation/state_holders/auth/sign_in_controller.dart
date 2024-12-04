import 'dart:math';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
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

      if (response.user != null) {
        isSuccess = true;
      } else {
        log('Sign In Failed' as num);
      }
    } catch (e) {
      log('Sign In Error: $e' as num);
    } finally {
      _inProgress = false;
      update();
    }

    return isSuccess;
  }
}