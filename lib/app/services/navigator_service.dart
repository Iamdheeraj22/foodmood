import 'package:flutter/material.dart';

//This class is used for app navigation handling
class NavigationService {
  factory NavigationService() {
    return _singleton;
  }

  NavigationService._internal();

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static final NavigationService _singleton = NavigationService._internal();

  //navigate without clear route
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) async {
    bool isNewRouteSameAsCurrent = false;
    navigatorKey.currentState!.popUntil((route) {
      if (route.settings.name == routeName) {
        isNewRouteSameAsCurrent = true;
      }
      return true;
    });

    if (!isNewRouteSameAsCurrent) {
      return navigatorKey.currentState!
          .pushNamed(routeName, arguments: arguments);
    }
  }

  //navigate with clear route
  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {Object? arguments}) async {
    bool isNewRouteSameAsCurrent = false;
    navigatorKey.currentState!.popUntil((route) {
      if (route.settings.name == routeName) {
        isNewRouteSameAsCurrent = true;
      }
      return true;
    });
    if (isNewRouteSameAsCurrent) {
      return navigatorKey.currentState!.pushNamedAndRemoveUntil(
          routeName, (route) => false,
          arguments: arguments);
    } else if (!isNewRouteSameAsCurrent) {
      return navigatorKey.currentState!
          .pushNamed(routeName, arguments: arguments);
    }
  }
}
