import 'package:get/get.dart';
import 'package:socia_live/presentation/route/route_names.dart';

import 'package:socia_live/presentation/ui/screens/auth/log_in_screen.dart';
import 'package:socia_live/presentation/ui/screens/auth/sign_up_screen.dart';
import 'package:socia_live/presentation/ui/screens/auth/splash_screen.dart';
import 'package:socia_live/presentation/ui/screens/auth/welcome_screen.dart';

class Routes {
  static final pages = [
    GetPage(
      name: RouteNames.splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: RouteNames.welcomeScreen,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: RouteNames.signupScreen,
      page: () => const SignUpScreen(),
    ),
    GetPage(
      name: RouteNames.loginScreen,
      page: () => const LogInScreen(),
    )
  ];
}
