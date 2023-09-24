import 'package:flutter/material.dart';
import 'package:foodmood/app/common_widget/custom_appbar.dart';
import 'package:foodmood/app/common_widget/custom_button.dart';
import 'package:foodmood/app/common_widget/custom_password_editext_text.dart';
import 'package:foodmood/app/common_widget/text_widget.dart';
import 'package:foodmood/app/res/colors/colors.dart';
import 'package:foodmood/app/res/size/size_config.dart';
import 'package:foodmood/app/res/strings/strings.dart';
import 'package:foodmood/provider/auth_provider/reset_password_provider.dart';
import 'package:foodmood/screens/auth/change_password_success_screen.dart';
import 'package:provider/provider.dart';

import '../../../app/res/fonts/font_family.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  static const String id = '/reset_password';

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _createController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  late ResetPasswordViewModel resetPasswordViewModel;

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
    resetPasswordViewModel = Provider.of<ResetPasswordViewModel>(context);
    return Scaffold(
      appBar: NewCustomAppBar(
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
                  text: AppStrings.resetPasswordDesc,
                  textSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: context.appOnbordingColor,
                ),
              ),
              SizedBox(
                height: 130.h,
              ),
              CustomPasswordEditText(
                  hintText: 'New Password',
                  toggleObscured: () {
                    resetPasswordViewModel.setNewPassword();
                  },
                  prefixIcon: const Icon(Icons.lock),
                  controller: _createController,
                  title: 'New Password',
                  isShow: resetPasswordViewModel.getIsNPassword,
                  validator: (p0) {},
                  inputAction: TextInputAction.next,
                  inputType: TextInputType.number),
              SizedBox(
                height: 25.h,
              ),
              CustomPasswordEditText(
                  hintText: 'Confirm Password',
                  toggleObscured: () {
                    resetPasswordViewModel.setNewConfirmPassword();
                  },
                  prefixIcon: const Icon(Icons.lock),
                  controller: _confirmController,
                  title: 'Confrim Password',
                  isShow: resetPasswordViewModel.getIsNCPassword,
                  inputAction: TextInputAction.next,
                  validator: (p0) {},
                  inputType: TextInputType.number),
              SizedBox(
                height: 20.h,
              ),
              CustomButton(
                  height: 60.h,
                  color: ColorsCollections.appPrimaryColor,
                  label: AppStrings.changePassword,
                  fontWeight: FontStyles.bold,
                  fontSize: 16.sp,
                  onPressed: () {
                    if (resetPasswordViewModel.checkValidation(
                        _createController.text.toString(),
                        _confirmController.text.toString(),
                        context)) {
                      Navigator.pushNamed(
                          context, ChangePasswordSuccessScreen.id);
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
