import 'package:flutter/material.dart';
import 'package:foodmood/app/utils/snack_bar.dart';
import 'package:foodmood/app/utils/utils.dart';

class ForgetPasswordViewModel extends ChangeNotifier {
  bool checkValidation(String email, BuildContext context) {
    if (email.isEmpty) {
      showSnackBar('Please enter the your email.', context: context);
      return false;
    } else if (!Utils.emailValid(email)) {
      showSnackBar("Please check your email.", context: context);
      return false;
    }
    return true;
  }
}
