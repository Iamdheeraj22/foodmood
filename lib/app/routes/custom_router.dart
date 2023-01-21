import 'package:flutter/material.dart';
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
