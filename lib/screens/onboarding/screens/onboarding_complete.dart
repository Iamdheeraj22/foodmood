import 'package:flutter/material.dart';
import 'package:foodmood/app/common_widget/custom_button.dart';
import 'package:foodmood/app/common_widget/text_widget.dart';
import 'package:foodmood/app/res/colors/colors.dart';
import 'package:foodmood/app/res/drawables/images.dart';
import 'package:foodmood/app/res/size/size_config.dart';
import 'package:foodmood/app/res/strings/strings.dart';
import 'package:foodmood/screens/auth/login/login_screen.dart';

class OnBoardingCompleteScreen extends StatefulWidget {
  const OnBoardingCompleteScreen({Key? key}) : super(key: key);
  static const String id = '/onboarding_complete';
  @override
  State<OnBoardingCompleteScreen> createState() =>
      _OnBoardingCompleteScreenState();
}

class _OnBoardingCompleteScreenState extends State<OnBoardingCompleteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            Image.asset(
              Images.pasta,
              height: 255.h,
              width: 300.w,
            ),
            SizedBox(
              height: 20.h,
            ),
            TextWidget(
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w800,
              text: Strings.onboardingTitle4,
              textSize: 24.sp,
              color: ColorsCollections.appPrimaryColor,
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: TextWidget(
                text: Strings.onboardingDesc4,
                textAlign: TextAlign.center,
                textSize: 16.sp,
                color: ColorsCollections.appOnbordingColor,
              ),
            ),
            const Spacer(),
            Container(
                margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 30),
                child: CustomButton(
                    height: 50.h,
                    color: ColorsCollections.appPrimaryColor,
                    label: Strings.getMoody,
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, LoginScreen.id, ModalRoute.withName('/'));
                    }))
          ],
        ),
      ),
    );
  }
}
