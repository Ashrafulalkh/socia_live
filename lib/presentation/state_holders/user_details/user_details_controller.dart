import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:socia_live/data/models/user_model.dart';
import 'package:socia_live/presentation/ui/utils/supabase_const.dart';

class UserDetailsController extends GetxController {
  bool _inProgress = false;
  UserModel? user;
  
  bool get inProgress => _inProgress;
  
  Future<bool> fetchUserDetails() async {
    bool isSuccess = false;
    _inProgress = false;
    update();
    
    try{
      final response = await supabase.from('user-profile').select().limit(1).single();
      debugPrint(response.toString());
      user = UserModel.fromJson(response);
    }catch(e) {
      debugPrint(e.toString());
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}