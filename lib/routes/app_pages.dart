import 'package:get/get.dart';
import 'package:hackathon/ui/pages/forgotpass_view.dart';
import 'package:hackathon/ui/pages/login_view.dart';
import 'package:hackathon/ui/pages/profile_view.dart';
import 'package:hackathon/ui/pages/register_view.dart';
import 'package:hackathon/ui/pages/splash.dart';
import '../ui/screens/home.dart';
import 'app_routes.dart';

class AppPages {
  // ignore: constant_identifier_names
  static const INITIAL = Routes.SPLASH;
  static final routes = [
    GetPage(
      transition: Transition.rightToLeft,
      name: Routes.SPLASH,
      page: () => const SplashScreen(),
    ),
     GetPage(
      transition: Transition.rightToLeft,
      name: Routes.PROFILE,
      page: () => const Profile(),
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: Routes.LOGIN,
      page: () => const LoginScreen(),
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: Routes.FORGET,
      page: () => const ForgetPass(),
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: Routes.SIGNUP_SCREEN,
      page: () => const RegisterScreen(),
    ),
    GetPage(
      transition: Transition.rightToLeft,
      name: Routes.HOMEPAGE,
      page: () => const Homepage(),
    ),
  ];
}
