import 'package:flutter/material.dart';
import 'package:foodmood/app/common_widget/custom_button.dart';
import 'package:foodmood/app/common_widget/custom_edittext_text_widget.dart';
import 'package:foodmood/app/common_widget/custom_password_editext_text.dart';

import 'package:foodmood/app/common_widget/text_widget.dart';
import 'package:foodmood/app/res/colors/colors.dart';
import 'package:foodmood/app/res/drawables/icons.dart';
import 'package:foodmood/app/res/drawables/images.dart';
import 'package:foodmood/app/res/fonts/font_family.dart';
import 'package:foodmood/app/res/size/size_config.dart';
import 'package:foodmood/app/res/strings/strings.dart';
import 'package:foodmood/screens/auth/login/widgets/login_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String id = "/login_screen";
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isShow = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 50.h),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
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
                prefixIcon: const Icon(Icons.email),
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
                prefixIcon: const Icon(Icons.lock),
                inputAction: TextInputAction.done,
                isShow: isShow,
              ),
              SizedBox(
                height: 15.h,
              ),
              InkWell(
                onTap: () {
                  changeCheckValue();
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                        height: 30.h,
                        width: 30.w,
                        child: Checkbox(
                            activeColor: context.appPrimaryColor,
                            value: isShow,
                            onChanged: (v) {
                              changeCheckValue();
                            })),
                    SizedBox(
                      width: 10.w,
                    ),
                    TextWidget(
                      text: 'Show password',
                      fontWeight: FontWeight.w400,
                      textSize: 15.sp,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              InkWell(
                onTap: () {},
                child: TextWidget(
                  text: Strings.forgotPassword,
                  textSize: 14.sp,
                  color: context.appPrimaryColor,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  child: CustomButton(
                      height: 60.h,
                      color: ColorsCollections.appPrimaryColor,
                      label: Strings.signIn,
                      fontWeight: FontStyles.bold,
                      fontSize: 16.sp,
                      onPressed: () {})),
              SizedBox(
                height: 30.h,
              ),
              Row(
                children: [
                  Container(
                    color: context.black,
                    height: 1.h,
                    width: 123.w,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    child: TextWidget(
                      text: 'Or Sign in with',
                      fontWeight: FontWeight.w600,
                      textSize: 14.sp,
                    ),
                  ),
                  Container(
                    color: context.black,
                    height: 1.h,
                    width: 123.w,
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleIconButton(
                    icon: AppIcons.google,
                    callback: () {},
                  ),
                  CircleIconButton(
                    icon: AppIcons.facebook,
                    callback: () {},
                  ),
                  CircleIconButton(
                    icon: AppIcons.apple,
                    callback: () {},
                  )
                ],
              ),
              SizedBox(
                height: 50.h,
              ),
              Center(
                child: RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: Strings.dontHaveAnAccount,
                      style: TextStyle(color: context.black, fontSize: 14.sp)),
                  TextSpan(
                      text: Strings.signUp,
                      style: TextStyle(
                          color: context.appPrimaryColor, fontSize: 14.sp))
                ])),
              ),
            ],
          ),
        ),
      )),
    );
  }

  changeCheckValue() {
    setState(() {
      isShow = !isShow;
    });
  }
}
