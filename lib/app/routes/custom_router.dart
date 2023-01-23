import 'package:flutter/material.dart';
import 'package:foodmood/screens/auth/login/login_screen.dart';
import 'package:foodmood/screens/auth/register/screens/sign_up_screen.dart';
import 'package:foodmood/screens/onboarding/screens/onboarding_complete.dart';
import 'package:foodmood/screens/onboarding/screens/onboarding_screen.dart';

class CustomRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case OnBoardingScreen.id:
        return MaterialPageRoute(
            settings: settings, builder: (_) => OnBoardingScreen());
      case OnBoardingCompleteScreen.id:
        return MaterialPageRoute(
            settings: settings, builder: (_) => OnBoardingCompleteScreen());
      case LoginScreen.id:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const LoginScreen());
      case SignUpScreen.id:
        return MaterialPageRoute(
            settings: settings, builder: (_) => SignUpScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
