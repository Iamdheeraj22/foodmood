import 'package:flutter/material.dart';
import 'package:foodmood/app/utils/snack_bar.dart';
import 'package:foodmood/app/utils/utils.dart';

class LoginProviderModel extends ChangeNotifier {
  bool isVisible = false;

  bool get isPasswordVisible => isVisible;

  setPasswordVisibility(bool isShow) {
    isVisible = isShow;
    notifyListeners();
  }

  bool validation(String email, String password, BuildContext context) {
    if (email.isEmpty || password.isEmpty) {
      showSnackBar('Please fill all field.', context: context);
      return false;
    }
    //Check the email is valid or not
    if (!Utils.emailValid(email.toString())) {
      showSnackBar('Please check your email', context: context);
      return false;
    }

    return true;
  }
}
