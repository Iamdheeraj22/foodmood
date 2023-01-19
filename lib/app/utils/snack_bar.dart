import 'package:flutter/material.dart';
import 'package:foodmood/app/common_widget/text_widget.dart';
import 'package:foodmood/app/res/fonts/font_family.dart';
import 'package:foodmood/app/res/size/size_config.dart';
import 'package:foodmood/app/services/navigator_service.dart';

showSnackBar(String data, {BuildContext? context, Duration? duration}) {
  ScaffoldMessenger.of(
          context ?? NavigationService.navigatorKey.currentContext!)
      .hideCurrentSnackBar();
  ScaffoldMessenger.of(
          context ?? NavigationService.navigatorKey.currentContext!)
      .showSnackBar(
    SnackBar(
      backgroundColor: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 4.h, horizontal: 4.w),
      elevation: 5,
      content: TextWidget(
        text: data,
        color: Colors.white,
        textSize: 14.sp,
        fontWeight: FontStyles.medium,
      ),
      duration: duration ?? const Duration(seconds: 2),
    ),
  );
}

showSuccessSnackBar(String data, {BuildContext? context, Duration? duration}) {}

/*
TODO REMOVE FOR TOAST
showToast(String data, {bool showForShortPeriod = true}) {
  Fluttertoast.showToast(
      msg: data,
      toastLength: showForShortPeriod ? Toast.LENGTH_SHORT : Toast.LENGTH_LONG);
}

showCantReSubmitSnack() {
  showSnackBar(AppStrings.cantReSubmit, duration: const Duration(seconds: 3));
}*/
