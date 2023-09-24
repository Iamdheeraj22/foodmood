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
import 'package:foodmood/app/utils/validator.dart';
import 'package:foodmood/provider/auth_provider/register_provider.dart';
import 'package:foodmood/screens/auth/login/widgets/login_widgets.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  static const String id = "/sign_up_screen";
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _createPasswordController =
      TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const NewCustomAppBar(
          title: 'SignUp',
          backgroundColor: Colors.white,
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SingleChildScrollView(child: Consumer<RegisterViewModel>(
              builder: (context, registerViewModel, child) {
                return Form(
                  key: _formKey,
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
                        validator: (value) {
                          if (value != null) {
                            if (value.isEmpty) {
                              return 'Please enter your name';
                            }
                            if (value.length < 6) {
                              return 'Please enter valid name';
                            }
                          }
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomEditTextWithTitle(
                        controller: _emailController,
                        inputAction: TextInputAction.next,
                        hintText: AppStrings.kEnterYourEmail,
                        inputType: TextInputType.text,
                        title: AppStrings.email,
                        prefixIcon: const Icon(Icons.email),
                        validator: (value) {
                          return Validator.validateEmail(value!);
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomEditTextWithTitle(
                        controller: _usernameController,
                        inputAction: TextInputAction.next,
                        hintText: 'Create new username',
                        inputType: TextInputType.text,
                        title: 'Username',
                        prefixIcon: const Icon(Icons.person),
                        validator: (value) {
                          if (value != null) {
                            if (value.isEmpty) {
                              return 'Please enter your username';
                            }
                            if (value.length < 6) {
                              return 'Please enter valid username';
                            }
                          }
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomPasswordEditText(
                        hintText: AppStrings.kCreateNewPassword,
                        controller: _createPasswordController,
                        title: AppStrings.kCreateNewPassword,
                        toggleObscured: () {
                          registerViewModel.setCPassword();
                        },
                        isShow: registerViewModel.isShowCPassword,
                        prefixIcon: const Icon(Icons.lock),
                        inputAction: TextInputAction.next,
                        inputType: TextInputType.text,
                        validator: (p0) {
                          return Validator.passwordValidator(p0!);
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CustomPasswordEditText(
                          hintText: AppStrings.confirmPassword,
                          controller: _confirmPasswordController,
                          title: AppStrings.confirmPassword,
                          isShow: registerViewModel.isShowCCPassword,
                          toggleObscured: () {
                            registerViewModel.setCCPassword();
                          },
                          validator: (p0) {
                            return Validator.passwordValidator(p0!);
                          },
                          prefixIcon: const Icon(Icons.lock),
                          inputAction: TextInputAction.done,
                          inputType: TextInputType.text),
                      SizedBox(
                        height: 40.h,
                      ),
                      CustomButton(
                          height: 60.h,
                          color: ColorsCollections.appPrimaryColor,
                          label: AppStrings.signUp,
                          fontWeight: FontStyles.bold,
                          fontSize: 16.sp,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {}
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
                              text: AppStrings.kSignUpLine1,
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
                      //Google , Facebook , apple
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CircleIconButton(
                            icon: AppIcons.google,
                            callback: () {
                              showSnackBar(AppStrings.kUnderDevelopement,
                                  context: context);
                            },
                          ),
                          CircleIconButton(
                            icon: AppIcons.facebook,
                            callback: () {
                              showSnackBar(AppStrings.kUnderDevelopement,
                                  context: context);
                            },
                          ),
                          CircleIconButton(
                            icon: AppIcons.apple,
                            callback: () {
                              showSnackBar(AppStrings.kUnderDevelopement,
                                  context: context);
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
                              text: AppStrings.alreadyAccount,
                              style: TextStyle(
                                  color: context.black, fontSize: 14.sp)),
                          TextSpan(
                            text: AppStrings.login,
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
                );
              },
            )),
          ),
        ));
  }
}
