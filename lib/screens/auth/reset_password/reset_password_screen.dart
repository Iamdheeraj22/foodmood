import 'package:flutter/material.dart';
import 'package:foodmood/app/common_widget/custom_appbar.dart';
import 'package:foodmood/app/common_widget/custom_button.dart';
import 'package:foodmood/app/common_widget/custom_password_editext_text.dart';
import 'package:foodmood/app/common_widget/text_widget.dart';
import 'package:foodmood/app/res/colors/colors.dart';
import 'package:foodmood/app/res/size/size_config.dart';
import 'package:foodmood/app/res/strings/strings.dart';
import 'package:foodmood/screens/auth/change_password_success_screen.dart';

import '../../../app/res/fonts/font_family.dart';

class ResetPasswordScreen extends StatefulWidget {
  ResetPasswordScreen({Key? key}) : super(key: key);

  static const String id = '/reset_password';

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController _createController = TextEditingController();
  TextEditingController _confirmController = TextEditingController();

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

  bool isShow = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NewCustomAppBar(
        title: 'Reset Password',
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50.h,
              ),
              Center(
                child: TextWidget(
                  textAlign: TextAlign.center,
                  text: Strings.resetPasswordDesc,
                  textSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: context.appOnbordingColor,
                ),
              ),
              SizedBox(
                height: 130.h,
              ),
              CustomPasswordEditextText(
                  hintText: 'New Password',
                  toggleObscured: toggleObscured,
                  prefixIcon: const Icon(Icons.lock),
                  controller: _createController,
                  title: 'New Password',
                  isShow: _obscured,
                  inputAction: TextInputAction.next,
                  inputType: TextInputType.number),
              SizedBox(
                height: 25.h,
              ),
              CustomPasswordEditextText(
                  hintText: 'Confirm Password',
                  toggleObscured: toggleObscured,
                  prefixIcon: const Icon(Icons.lock),
                  controller: _confirmController,
                  title: 'Confrim Password',
                  isShow: _obscured,
                  inputAction: TextInputAction.next,
                  inputType: TextInputType.number),
              SizedBox(
                height: 20.h,
              ),
              CustomButton(
                  height: 60.h,
                  color: ColorsCollections.appPrimaryColor,
                  label: Strings.changePassword,
                  fontWeight: FontStyles.bold,
                  fontSize: 16.sp,
                  onPressed: () {
                    Navigator.pushNamed(
                        context, ChangePasswordSuccessScreen.id);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
