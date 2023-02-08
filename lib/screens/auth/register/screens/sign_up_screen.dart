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
import 'package:foodmood/app/utils/snack_bar.dart';
import 'package:foodmood/screens/auth/login/widgets/login_widgets.dart';
import 'package:foodmood/screens/auth/otp_verify/otp_verification_Screen.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);
  static const String id = "/sign_up_screen";
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

  final textFieldFocusNode = FocusNode();
  bool _obscured = false;

  void toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) {
        return;
      } // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus =
          false; // Prevents focus if tap on eye
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const NewCustomAppBar(
          title: 'SignUp',
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                CustomEditTextWithTitle(
                  controller: _nameController,
                  inputAction: TextInputAction.next,
                  hintText: 'Enter your name',
                  inputType: TextInputType.text,
                  title: 'Full Name',
                  prefixIcon: const Icon(Icons.person),
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
                  prefixIcon: const Icon(Icons.email),
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
                  prefixIcon: const Icon(Icons.person),
                ),
                SizedBox(
                  height: 20.h,
                ),
                CustomPasswordEditextText(
                    hintText: 'Create new password',
                    controller: _createPasswordController,
                    title: 'Create password',
                    toggleObscured: toggleObscured,
                    isShow: _obscured,
                    prefixIcon: const Icon(Icons.lock),
                    inputAction: TextInputAction.next,
                    inputType: TextInputType.text),
                SizedBox(
                  height: 20.h,
                ),
                CustomPasswordEditextText(
                    hintText: 'Confirm your password',
                    controller: _createPasswordController,
                    title: 'Confirm password',
                    isShow: _obscured,
                    toggleObscured: toggleObscured,
                    prefixIcon: const Icon(Icons.lock),
                    inputAction: TextInputAction.done,
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
                      callback: () {
                        showSnackBar('Under Development', context: context);
                      },
                    ),
                    CircleIconButton(
                      icon: AppIcons.facebook,
                      callback: () {
                        showSnackBar('Under Development', context: context);
                      },
                    ),
                    CircleIconButton(
                      icon: AppIcons.apple,
                      callback: () {
                        showSnackBar('Under Development', context: context);
                      },
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
                      text: Strings.login,
                      style: TextStyle(
                          color: context.appPrimaryColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pop(context);
                        },
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
