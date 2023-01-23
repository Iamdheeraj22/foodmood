import 'package:flutter/material.dart';
import 'package:foodmood/app/common_widget/custom_edittext_text_widget.dart';
import 'package:foodmood/app/common_widget/custom_password_editext_text.dart';

import 'package:foodmood/app/common_widget/text_widget.dart';
import 'package:foodmood/app/res/colors/colors.dart';
import 'package:foodmood/app/res/drawables/images.dart';
import 'package:foodmood/app/res/fonts/font_family.dart';
import 'package:foodmood/app/res/size/size_config.dart';
import 'package:foodmood/app/res/strings/strings.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);
  static const String id = "/login_screen";
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              text: Strings.signIn,
              textSize: 24.sp,
              color: ColorsCollections.appPrimaryColor,
              fontWeight: FontWeight.w800,
            ),
            SizedBox(
              height: 30.h,
            ),
            Image.asset(
              Images.logo,
              height: 110.h,
            ),
            SizedBox(
              height: 30.h,
            ),
            CustomEditTextWithTitle(
              controller: _emailController,
              hintText: 'Enter email address',
              title: 'Email address',
              prefixIcon: Icon(Icons.email),
              inputType: TextInputType.text,
              inputAction: TextInputAction.next,
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomPasswordEditextText(
              controller: _passwordController,
              hintText: 'Enter password',
              title: 'Password',
              inputType: TextInputType.visiblePassword,
              prefixIcon: Icon(Icons.lock),
              inputAction: TextInputAction.done,
              isShow: false,
            ),
          ],
        ),
      )),
    );
  }
}
