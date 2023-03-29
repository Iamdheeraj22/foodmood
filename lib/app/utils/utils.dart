import 'package:flutter/material.dart';
import 'package:foodmood/app/utils/snack_bar.dart';

class Utils {
  static bool validatePassCode(String value, BuildContext context) {
    const pattern = r'(^[0-9]*$)';
    final regExp = RegExp(pattern);
    if (value.isEmpty) {
      showSnackBar('Passcode is Required', context: context);
      return false;
    } else if (value.length != 6) {
      showSnackBar('PassCode must be 6 digits', context: context);
      return false;
    } else if (!regExp.hasMatch(value)) {
      showSnackBar('PassCode must be digits', context: context);
      return false;
    }
    return true;
  }
}
