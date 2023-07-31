import 'package:get/get.dart';
import 'package:greengrocer/src/pages/auth/sign_in_screen.dart';
import 'package:greengrocer/src/pages/auth/sign_up_screen.dart';
import 'package:greengrocer/src/pages/base/base_screen.dart';
import 'package:greengrocer/src/pages/splash/splash_screen.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      page: () => const SplashScreen(),
      name: PagesRoutes.splashRoute,
    ),
    GetPage(
      page: () => SignInScreen(),
      name: PagesRoutes.sigInRoute,
    ),
    GetPage(
      page: () => SignUpScrenn(),
      name: PagesRoutes.sigUpRoute,
    ),
    GetPage(
      page: () => const BaseScreen(),
      name: PagesRoutes.baseRoute,
    ),
  ];
}

abstract class PagesRoutes {
  static const String sigInRoute = '/signin';
  static const String sigUpRoute = '/signup';
  static const String splashRoute = '/splash';
  static const String baseRoute = '/';
}
