import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  var isLightTheme = true.obs;

  void updateTheme(BuildContext context) {
    isLightTheme.value = Theme.of(context).brightness == Brightness.light;
  }

  Color get logoColor => isLightTheme.value ? Colors.black : Colors.white;
}
