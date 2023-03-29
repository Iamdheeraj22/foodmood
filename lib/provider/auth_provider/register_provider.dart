import 'package:flutter/material.dart';
import 'package:foodmood/app/utils/snack_bar.dart';
import 'package:foodmood/app/utils/utils.dart';

class RegisterViewModel extends ChangeNotifier {
  bool isShowCPassword = true;
  bool isShowCCPassword = true;

  bool get getCPassword => isShowCPassword;
  bool get getCCPassword => isShowCCPassword;

  setCPassword() {
    isShowCPassword = !isShowCPassword;
    notifyListeners();
  }

  setCCPassword() {
    isShowCCPassword = !isShowCCPassword;
    notifyListeners();
  }

  checkValidation(String fName, String email, String userName, String cPass,
      String ccPass, BuildContext context) {
    if (fName.isEmpty ||
        email.isEmpty ||
        userName.isEmpty ||
        cPass.isEmpty ||
        ccPass.isEmpty) {
      showSnackBar('Please fill all field...', context: context);
      return false;
    } else if (!Utils.emailValid(email)) {
      showSnackBar('Please check your email', context: context);
      return false;
    } else if (!Utils.isUserName(userName, context)) {
      return false;
    } else if (cPass != ccPass) {
      showSnackBar('Password dosen\'t match.. , Please check',
          context: context);
      return false;
    } else if (!Utils.validatePassCode(cPass, context)) {
      return false;
    }
    return true;
  }
}
