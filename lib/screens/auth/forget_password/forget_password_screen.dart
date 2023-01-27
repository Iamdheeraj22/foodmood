import 'package:flutter/material.dart';
import 'package:foodmood/app/common_widget/custom_appbar.dart';
import 'package:foodmood/app/common_widget/custom_button.dart';
import 'package:foodmood/app/common_widget/custom_edittext_text_widget.dart';
import 'package:foodmood/app/common_widget/text_widget.dart';
import 'package:foodmood/app/res/colors/colors.dart';
import 'package:foodmood/app/res/fonts/font_family.dart';
import 'package:foodmood/app/res/size/size_config.dart';
import 'package:foodmood/app/res/strings/strings.dart';

class ForgetPasswordScreen extends StatefulWidget {
  ForgetPasswordScreen({Key? key}) : super(key: key);
  static const String id = 'forget_password_screen';
  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: context.appPrimaryColor,
              size: 50.r,
            )),
        title: '',
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            Center(
              child: TextWidget(
                text: Strings.forgotPassword2,
                textSize: 24.sp,
                fontWeight: FontWeight.w700,
                color: context.appPrimaryColor,
              ),
            ),
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
                onPressed: () {}),
          ],
        )),
      ),
    );
  }
}
