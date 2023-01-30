import 'package:flutter/material.dart';
import 'package:foodmood/app/common_widget/custom_button.dart';
import 'package:foodmood/app/common_widget/text_widget.dart';
import 'package:foodmood/app/res/colors/colors.dart';
import 'package:foodmood/app/res/drawables/icons.dart';
import 'package:foodmood/app/res/drawables/images.dart';
import 'package:foodmood/app/res/size/size_config.dart';

class LogoutScreenPage extends StatefulWidget {
  const LogoutScreenPage({Key? key}) : super(key: key);
  static const String id = '/logout_screen';
  @override
  State<LogoutScreenPage> createState() => _LogoutScreenPageState();
}

class _LogoutScreenPageState extends State<LogoutScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 200.h,
              width: 200.h,
              decoration: BoxDecoration(
                  color: context.appPrimaryColor,
                  borderRadius: BorderRadius.circular(200)),
              child: Center(
                child: Image.asset(
                  AppIcons.logout,
                  height: 100.h,
                  color: context.white,
                  width: 100.h,
                ),
              ),
            ),
            SizedBox(
              height: 100.h,
            ),
            TextWidget(
              text: 'Oh no! You are leaving...',
              textSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              'Are you sure?',
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline,
                  color: context.appPrimaryColor),
            ),
            SizedBox(
              height: 100.h,
            ),
            Container(
              height: 60.h,
              margin: EdgeInsets.symmetric(horizontal: 30.w),
              child: CustomButton(
                label: 'Yes, Log me out',
                onPressed: () {},
                color: context.appGreyColor2,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Container(
              height: 60.h,
              margin: EdgeInsets.symmetric(horizontal: 30.w),
              child: CustomButton(
                label: 'Nah! Just kidding',
                onPressed: () {},
                color: context.appPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
