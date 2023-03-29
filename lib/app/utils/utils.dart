import 'package:flutter/material.dart';
import 'package:foodmood/app/utils/snack_bar.dart';

class Utils {
  static bool validatePassCode(String value, BuildContext context) {
    const pattern = r'(^[0-9]*$)';
    final regExp = RegExp(pattern);
    if (value.length != 6) {
      showSnackBar('PassCode must be 6 digits', context: context);
      return false;
    } else if (!regExp.hasMatch(value)) {
      showSnackBar('PassCode must be digits', context: context);
      return false;
    }
    return true;
  }

  static bool isUserName(String val, BuildContext context) {
    const pattern =
        r'^(?=.{8,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$';
    final regExp = RegExp(pattern);
    if (!regExp.hasMatch(val)) {
      showSnackBar(
          'Username can only use letters,numbers, minimum length is 8 characters',
          context: context);
      return false;
    }
    return true;
  }

  static bool emailValid(email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }
}
