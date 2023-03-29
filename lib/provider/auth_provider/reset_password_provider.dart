import 'package:flutter/material.dart';
import 'package:foodmood/app/utils/snack_bar.dart';
import 'package:foodmood/app/utils/utils.dart';

class ResetPasswordViewModel extends ChangeNotifier {
  bool newPassword = true;
  bool newConfirmPassword = true;

  bool get getIsNPassword => newPassword;
  bool get getIsNCPassword => newConfirmPassword;

  setNewPassword() {
    newPassword = !newPassword;
    notifyListeners();
  }

  setNewConfirmPassword() {
    newConfirmPassword = !newConfirmPassword;
    notifyListeners();
  }

  bool checkValidation(String nPass, String nCPass, BuildContext context) {
    if (nPass.isEmpty || nCPass.isEmpty) {
      showSnackBar('Please fill the all field.....', context: context);
      return false;
    } else if (!Utils.validatePassCode(nPass, context)) {
      showSnackBar('Password contains only digits...', context: context);
      return false;
    } else if (!Utils.validatePassCode(nCPass, context)) {
      showSnackBar('Password contains only digits...', context: context);
      return false;
    } else if (nPass.toString() != nCPass.toString()) {
      showSnackBar('Password dosen\'t match , please check..',
          context: context);
      return false;
    }
    return true;
  }
}
