import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foodmood/app/common_widget/custom_appbar.dart';
import 'package:foodmood/app/common_widget/custom_button.dart';
import 'package:foodmood/app/common_widget/custom_edittext_text_widget.dart';
import 'package:foodmood/app/common_widget/custom_password_editext_text.dart';
import 'package:foodmood/app/common_widget/text_widget.dart';
import 'package:foodmood/app/res/colors/colors.dart';
import 'package:foodmood/app/res/drawables/icons.dart';
import 'package:foodmood/app/res/fonts/font_family.dart';
import 'package:foodmood/app/res/size/size_config.dart';
import 'package:foodmood/app/res/strings/strings.dart';
import 'package:foodmood/screens/auth/login/widgets/login_widgets.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);
  static const String id = "sign_up_screen";
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _createPasswordController =
      TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool isShow = false;

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
                    text: Strings.signUp,
                    textSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    color: context.appPrimaryColor,
                  ),
                ),
                SizedBox(
                  height: 100.h,
                ),
                CustomEditTextWithTitle(
                  controller: _nameController,
                  inputAction: TextInputAction.next,
                  hintText: 'Enter your name',
                  inputType: TextInputType.text,
                  title: 'Full Name',
                  prefixIcon: Icon(Icons.person),
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomEditTextWithTitle(
                  controller: _emailController,
                  inputAction: TextInputAction.next,
                  hintText: 'Enter email address',
                  inputType: TextInputType.text,
                  title: 'Email address',
                  prefixIcon: Icon(Icons.email),
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomEditTextWithTitle(
                  controller: _mobileController,
                  inputAction: TextInputAction.next,
                  hintText: 'Enter your name',
                  inputType: TextInputType.text,
                  title: 'Full Name',
                  prefixIcon: Icon(Icons.person),
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomPasswordEditextText(
                    hintText: 'Create new password',
                    controller: _createPasswordController,
                    title: 'Create password',
                    isShow: isShow,
                    prefixIcon: Icon(Icons.lock),
                    inputAction: TextInputAction.next,
                    inputType: TextInputType.text),
                SizedBox(
                  height: 20.h,
                ),
                CustomPasswordEditextText(
                    hintText: 'Confirm your password',
                    controller: _createPasswordController,
                    title: 'Confirm password',
                    isShow: isShow,
                    prefixIcon: Icon(Icons.lock),
                    inputAction: TextInputAction.next,
                    inputType: TextInputType.text),
                SizedBox(
                  height: 40.h,
                ),
                CustomButton(
                    height: 60.h,
                    color: ColorsCollections.appPrimaryColor,
                    label: Strings.signUp,
                    fontWeight: FontStyles.bold,
                    fontSize: 16.sp,
                    onPressed: () {}),
                SizedBox(
                  height: 60.h,
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
                        text: 'Or Sign up with',
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
                        text: Strings.alreadyAccount,
                        style:
                            TextStyle(color: context.black, fontSize: 14.sp)),
                    TextSpan(
                      text: Strings.signUp,
                      style: TextStyle(
                          color: context.appPrimaryColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    )
                  ])),
                ),
                SizedBox(
                  height: 50.h,
                ),
              ],
            ),
          ),
        ));
  }
}
