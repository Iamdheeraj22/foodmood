import 'package:flutter/material.dart';
import 'package:foodmood/app/common_widget/custom_appbar.dart';
import 'package:foodmood/app/common_widget/custom_button.dart';
import 'package:foodmood/app/common_widget/custom_edittext_text_widget.dart';
import 'package:foodmood/app/common_widget/text_widget.dart';
import 'package:foodmood/app/res/colors/colors.dart';
import 'package:foodmood/app/res/fonts/font_family.dart';
import 'package:foodmood/app/res/size/size_config.dart';
import 'package:foodmood/app/res/strings/strings.dart';
import 'package:foodmood/screens/auth/otp_verify/otp_verification_Screen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);
  static const String id = '/forget_password_screen';
  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NewCustomAppBar(
        title: Strings.forgotPassword2,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            TextWidget(
              text: Strings.forgotPasswordDesc,
              textSize: 16.sp,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 100.h,
            ),
            CustomEditTextWithTitle(
                hintText: 'Ente your Email ID / Mobile number',
                controller: _emailController,
                title: 'Email address',
                inputAction: TextInputAction.done,
                prefixIcon: const Icon(Icons.email),
                inputType: TextInputType.text),
            SizedBox(
              height: 20.h,
            ),
            CustomButton(
                height: 60.h,
                color: ColorsCollections.appPrimaryColor,
                label: Strings.submit,
                fontWeight: FontStyles.bold,
                fontSize: 16.sp,
                onPressed: () {
                  Navigator.pushNamed(context, OtpVerificationScreen.id);
                }),
          ],
        )),
      ),
    );
  }
}
