class Validator {
  Validator._();

  static String? validateName(String? value) {
    if (value != null) {
      const pattern = r'(^[a-zA-Z]*$)';
      final regExp = RegExp(pattern);
      if (value.isEmpty) {
        return 'Name is Required';
      } else if (!regExp.hasMatch(value.trim())) {
        return 'Name must be a-z and A-Z';
      }
    } else {
      return 'Name is Required';
    }
    return null;
  }

  static String? validateName2(String? value) {
    if (value != null) {
      //const pattern = r'(^[a-zA-Z]*$)';
      // final regExp = RegExp(pattern);
      if (value.trim().isEmpty) {
        return 'Name is Required';
      }
    } else {
      return 'Name is Required';
    }
    return null;
  }

  static String? validateMobile(String? value) {
    const pattern = r'(^[0-9]*$)';
    final regExp = RegExp(pattern);
    if (value != null) {
      if (value.isEmpty) {
        return 'Phone number is Required';
      } else if (value.length != 10) {
        return 'Phone number must be of 10 digits';
      } else if (!regExp.hasMatch(value)) {
        return 'Phone number must contain digits only';
      }
    } else {
      return 'Phone number is Required';
    }

    return null;
  }

  static String? validate6DigitCode(String value) {
    const pattern = r'(^[0-9]*$)';
    final regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Passcode is Required';
    } else if (value.length != 6) {
      return 'PassCode must be 6 digits';
    } else if (!regExp.hasMatch(value)) {
      return 'PassCode must be digits';
    }
    return null;
  }

  static String? validate6DigitToken(String value) {
    const pattern = r'(^[0-9]*$)';
    final regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter a valid token';
    } else if (value.length != 6) {
      return 'PassCode must be 6 digits';
    } else if (!regExp.hasMatch(value)) {
      return 'PassCode must be digits';
    }
    return null;
  }

  static String? validatePassCode(String value) {
    const pattern = r'(^[0-9]*$)';
    final regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Passcode is Required';
    } else if (value.length != 6) {
      return 'PassCode must be 6 digits';
    } else if (!regExp.hasMatch(value)) {
      return 'PassCode must be digits';
    }
    return null;
  }

  static String? passwordValidator(String? value) {
    //final regExp = RegExp('');
    if (value != null) {
      if (value.isEmpty) {
        return 'Password cannot be empty';
      }
    } else {
      return 'Password cannot be empty';
    }
    return null;
  }

  static String? passwordValidator2(String? value) {
    final regExp = RegExp(
        r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&\s]{6,16}$');
    if (value != null) {
      if (value.isEmpty) {
        return 'Password cannot be empty';
      } else {
        if (regExp.hasMatch(value)) {
          return null;
        } else {
          return 'Password should be alpha-numeric and may contain special letter,must have at least 6 digit';
        }
      }
    } else {
      return 'Password cannot be empty';
    }
  }

  static String? requiredValidator(String? value) {
    if (value != null) {
      if (value.isEmpty) {
        return '* Required';
      }
    } else {
      return '* Required';
    }
    return null;
  }

  static String? requiredValidator2(String? value) {
    if (value != null) {
      if (value.trim().isEmpty) {
        return '* Required';
      }
    } else {
      return '* Required';
    }
    return null;
  }

  static String? passwordDoNotMatch(String value, String confirmValue) {
    const pattern = r'(^[0-9]*$)';
    final regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'PassCode is Required';
    } else if (value.length != 6) {
      return 'PassCode must be 6 digits';
    } else if (!regExp.hasMatch(value)) {
      return 'PasscodeCode must be digits';
    } else if (value != confirmValue) {
      return 'Password do not match!';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    const pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final regExp = RegExp(pattern);
    if (value != null) {
      if (value.isEmpty) {
        return 'Email cannot be empty';
      } else if (!regExp.hasMatch(value)) {
        return 'Email format is invalid.';
      } else {
        return null;
      }
    } else {
      return 'Email cannot be empty';
    }
  }

  RegExp regEmail() {
    const pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final regExp = RegExp(pattern);
    return regExp;
  }

  static String? validateText(String value, String text) {
    const pattern = r'(^[a-zA-Z ]*$)';
    final regExp = RegExp(pattern);
    if (value.isEmpty) {
      return '$text is Required';
    } else if (!regExp.hasMatch(value.trim())) {
      return '$text must be a-z and A-Z';
    }
    return null;
  }

  static String? validateNumber(String value, String desc) {
    if (value.isEmpty) {
      return '$desc is Required';
    }
    return null;
  }
}
