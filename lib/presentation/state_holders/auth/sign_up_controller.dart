import 'dart:developer';

import 'package:get/get.dart';
import 'package:socia_live/presentation/ui/utils/supabase_const.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  Future<bool> signUp(String email, String userName, String number,
      String password,) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    AuthResponse response =
        await supabase.auth.signUp(password: password, email: email);
    final userId = response.user?.id;
    if (userId != null) {
      isSuccess = true;
      await supabase.from('user-profile').insert(
        {
          'id': userId,
          'email': email,
          'user_name': userName,
          'phone_number': number,
        },
      );
    } else {
      log('Sign Up Failed');
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
