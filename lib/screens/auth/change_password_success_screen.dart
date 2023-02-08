import 'package:flutter/material.dart';
import 'package:foodmood/app/common_widget/custom_button.dart';
import 'package:foodmood/app/common_widget/text_widget.dart';
import 'package:foodmood/app/res/colors/colors.dart';
import 'package:foodmood/app/res/drawables/images.dart';
import 'package:foodmood/app/res/fonts/font_family.dart';
import 'package:foodmood/app/res/size/size_config.dart';
import 'package:foodmood/app/res/strings/strings.dart';
import 'package:foodmood/screens/auth/login/login_screen.dart';
import 'package:foodmood/screens/onboarding/screens/onboarding_screen.dart';

class ChangePasswordSuccessScreen extends StatefulWidget {
  const ChangePasswordSuccessScreen({Key? key}) : super(key: key);

  static const String id = '/success_screen';

  @override
  State<ChangePasswordSuccessScreen> createState() =>
      _ChangePasswordSuccessScreenState();
}

class _ChangePasswordSuccessScreenState
    extends State<ChangePasswordSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              Images.success,
              height: 255.h,
              width: 300.w,
            ),
          ),
          SizedBox(
            height: 80.h,
          ),
          Center(
            child: TextWidget(
              text: Strings.success,
              textSize: 24.sp,
              fontWeight: FontWeight.w700,
              color: context.appPrimaryColor,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          TextWidget(
            text: Strings.successDesc1,
            textSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: context.appOnbordingColor,
          ),
          SizedBox(
            height: 5.h,
          ),
          TextWidget(
            text: Strings.successDesc2,
            textSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: context.appOnbordingColor,
          ),
          SizedBox(
            height: 50.h,
          ),
          CustomButton(
              height: 60.h,
              color: ColorsCollections.appPrimaryColor,
              label: Strings.goMoody,
              fontWeight: FontStyles.bold,
              fontSize: 16.sp,
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => OnBoardingScreen()),
                    (route) => false);
              }),
        ],
      ),
    ));
  }
}
