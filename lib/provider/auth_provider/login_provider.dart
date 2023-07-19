import 'package:flutter/material.dart';

class LoginProviderModel extends ChangeNotifier {
  bool isVisible = false;

  bool get isPasswordVisible => isVisible;

  setPasswordVisibility(bool isShow) {
    isVisible = isShow;
    notifyListeners();
  }
}
