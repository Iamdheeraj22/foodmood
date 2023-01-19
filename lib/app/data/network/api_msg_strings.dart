class ApiMsgStrings {
  ApiMsgStrings._();

  static const String txtServerError =
      'Error occurred while Communication with Server with StatusCode :';
  static const String txtNoInternetConnection = 'Internet is not working';
  static const String txtErrorDuringCommunication =
      'Error During Communication: ';
  static const String txtInvalidRequest = 'Invalid Request: ';
  static const String txtSuccessful = 'Successful';
  static const String txtUnauthorised =
      'Session has been expired please login again to continue';
  static const String txtInvalidInput = 'Invalid Input: ';
  static const String txtForbiddenException = 'Forbidden exception: ';
  static const String txtNotFoundException = 'Not Found exception: ';
  static const String txtInternalServerException =
      'Internal Server exception: ';
  static const String txtOk = 'Ok';
  static const String txtPleaseWait = 'Please wait...';
  static const String txtLoginSuccessful = 'Login successful!';

  static const String txtSomethingWentWrong =
      'Server is busy, please try after sometime.';
  static const String txtConnectionTimeOut =
      'The connection has timed out, Please try again!';
  static const String txtSlowServerResponse =
      'Looks like the server is taking too long to respond, Please check your connection and try again in a while.';
}

class ApiStrings {
  ApiStrings._();

  //these strings are used to access parameters form response data
  static const String successMsg = 'successMsg';
  static const String failureMsg = 'failureMsg';
  static const String responseCode = 'responseCode';
}
