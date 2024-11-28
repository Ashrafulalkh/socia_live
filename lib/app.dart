import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socia_live/controller_binder.dart';
import 'package:socia_live/presentation/route/route_names.dart';
import 'package:socia_live/presentation/route/routes.dart';
import 'package:socia_live/presentation/theme/theme.dart';

import 'package:socia_live/presentation/ui/utils/app_strings.dart';

class SociaLive extends StatelessWidget {
  const SociaLive({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppStrings.appName,
      theme: darkTheme,
      getPages: Routes.pages,
      initialRoute: RouteNames.splashScreen,
      defaultTransition: Transition.noTransition,
      initialBinding: ControllerBinder(),
    );
  }
}
