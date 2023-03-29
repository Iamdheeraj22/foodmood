import 'dart:developer';

import 'package:flutter/gestures.dart';
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
import 'package:foodmood/app/services/navigator_service.dart';
import 'package:foodmood/app/utils/snack_bar.dart';
import 'package:foodmood/provider/auth_provider/login_provider.dart';
import 'package:foodmood/screens/auth/forget_password/forget_password_screen.dart';
import 'package:foodmood/screens/auth/login/widgets/login_widgets.dart';
import 'package:foodmood/screens/auth/register/screens/sign_up_screen.dart';
import 'package:foodmood/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static const String id = "/login_screen";
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late LoginProviderModel loginProviderModel;

  @override
  void initState() {
    super.initState();
  }

  final textFieldFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    loginProviderModel = Provider.of<LoginProviderModel>(context, listen: true);
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
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
                toggleObscured: () {
                  loginProviderModel.setPasswordVisibility(
                      !loginProviderModel.isPasswordVisible);
                  log(loginProviderModel.isPasswordVisible.toString());
                },
                inputType: TextInputType.visiblePassword,
                prefixIcon: const Icon(Icons.lock),
                inputAction: TextInputAction.done,
                isShow: loginProviderModel.isPasswordVisible,
              ),
              SizedBox(
                height: 20.h,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, ForgetPasswordScreen.id);
                  },
                  child: TextWidget(
                    text: Strings.forgotPassword,
                    textSize: 14.sp,
                    color: context.appPrimaryColor,
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              CustomButton(
                  height: 60.h,
                  color: ColorsCollections.appPrimaryColor,
                  label: Strings.signIn,
                  fontWeight: FontStyles.bold,
                  fontSize: 16.sp,
                  onPressed: () {
                    if (loginProviderModel.validation(
                        _emailController.text.toString(),
                        _passwordController.text.toString(),
                        context)) {
                      Navigator.pushNamed(context, HomePageScreen.id);
                    }
                  }),
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
                      text: Strings.dontHaveAnAccount,
                      style: TextStyle(color: context.black, fontSize: 14.sp)),
                  TextSpan(
                    text: Strings.signUp,
                    style: TextStyle(
                        color: context.appPrimaryColor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, SignUpScreen.id);
                      },
                  )
                ])),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
