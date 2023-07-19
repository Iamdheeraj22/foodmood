import 'package:flutter/material.dart';
import 'package:foodmood/app/common_widget/text_widget.dart';
import 'package:foodmood/app/res/colors/colors.dart';
import 'package:foodmood/app/res/fonts/font_family.dart';
import 'package:foodmood/app/res/size/size_config.dart';

class CustomEditTextWithTitle extends StatefulWidget {
  const CustomEditTextWithTitle({
    Key? key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    required this.controller,
    required this.title,
    required this.inputAction,
    required this.inputType,
    required this.validator,
  }) : super(key: key);
  final String hintText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final TextEditingController controller;
  final String title;
  final TextInputAction inputAction;
  final TextInputType inputType;
  final String? Function(String?) validator;

  @override
  State<CustomEditTextWithTitle> createState() =>
      _CustomEditTextWithTitleState();
}

class _CustomEditTextWithTitleState extends State<CustomEditTextWithTitle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: widget.title,
          color: context.appPrimaryColor,
          fontWeight: FontWeight.w700,
        ),
        SizedBox(
          height: 10.h,
        ),
        TextFormField(
            controller: widget.controller,
            textAlignVertical: TextAlignVertical.center,
            textInputAction: widget.inputAction,
            validator: widget.validator,
            keyboardType: widget.inputType,
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                fontFamily: FontFamily.gilmerHeavy),
            decoration: InputDecoration(
                prefixIcon: widget.prefixIcon,
                suffixIcon: widget.suffixIcon,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(color: context.appGreyColor1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(color: context.appPrimaryColor),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: const BorderSide(color: Colors.red),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: const BorderSide(color: Colors.red),
                ),
                hintStyle: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: FontFamily.gilmerHeavy),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                ),
                border: InputBorder.none,
                hintText: widget.hintText)),
      ],
    );
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
