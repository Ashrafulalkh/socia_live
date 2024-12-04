import 'package:get/get.dart';
import 'package:socia_live/presentation/state_holders/auth/sign_in_controller.dart';
import 'package:socia_live/presentation/state_holders/auth/sign_up_controller.dart';
import 'package:socia_live/presentation/state_holders/bottom_nav_bar_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(SignUpController());
    Get.put(BottomNavBarController());
    Get.put(SignInController());
  }
}
