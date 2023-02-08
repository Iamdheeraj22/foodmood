import 'package:flutter/material.dart';
import 'package:foodmood/app/common_widget/custom_appbar.dart';
import 'package:foodmood/app/common_widget/custom_button.dart';
import 'package:foodmood/app/common_widget/text_widget.dart';
import 'package:foodmood/app/res/colors/colors.dart';
import 'package:foodmood/app/res/fonts/font_family.dart';
import 'package:foodmood/app/res/size/size_config.dart';
import 'package:foodmood/app/res/strings/strings.dart';
import 'package:foodmood/screens/auth/otp_verify/widgets/otp_editext_widget.dart';
import 'package:foodmood/screens/auth/reset_password/reset_password_screen.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({Key? key}) : super(key: key);
  static const String id = '/otp_verification_screen';
  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _first = TextEditingController();
  final TextEditingController _second = TextEditingController();
  final TextEditingController _third = TextEditingController();
  final TextEditingController _forth = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NewCustomAppBar(title: 'Enter OTP'),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 40.h,
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: Strings.enterOTPDesc,
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: context.black)),
            TextSpan(
                text: '  +91 1234567890',
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: context.appPrimaryColor)),
          ])),
          SizedBox(
            height: 70.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OtpEditextWidget(
                controller: _first,
                first: true,
                last: false,
              ),
              OtpEditextWidget(
                controller: _second,
                first: false,
                last: false,
              ),
              OtpEditextWidget(
                controller: _third,
                first: false,
                last: false,
              ),
              OtpEditextWidget(
                controller: _forth,
                first: false,
                last: true,
              )
            ],
          ),
          SizedBox(
            height: 30.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            child: CustomButton(
                height: 60.h,
                color: ColorsCollections.appPrimaryColor,
                label: Strings.verify,
                fontWeight: FontStyles.bold,
                fontSize: 16.sp,
                onPressed: () {
                  Navigator.pushNamed(context, ResetPasswordScreen.id);
                }),
          ),
        ],
      )),
    );
  }
}
