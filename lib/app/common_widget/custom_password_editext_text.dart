import 'package:flutter/material.dart';
import 'package:foodmood/app/common_widget/text_widget.dart';
import 'package:foodmood/app/res/colors/colors.dart';
import 'package:foodmood/app/res/fonts/font_family.dart';
import 'package:foodmood/app/res/size/size_config.dart';

class CustomPasswordEditText extends StatelessWidget {
  const CustomPasswordEditText(
      {Key? key,
      required this.hintText,
      this.prefixIcon,
      this.suffixIcon,
      required this.controller,
      required this.title,
      required this.isShow,
      required this.inputAction,
      required this.inputType,
      required this.validator,
      required this.toggleObscured})
      : super(key: key);
  final String hintText;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final TextEditingController controller;
  final String title;
  final TextInputAction inputAction;
  final bool isShow;
  final String? Function(String?) validator;
  final TextInputType inputType;
  final VoidCallback toggleObscured;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: title,
          color: context.appPrimaryColor,
          fontWeight: FontWeight.w700,
        ),
        SizedBox(
          height: 10.h,
        ),
        TextFormField(
            obscureText: isShow,
            controller: controller,
            validator: validator,
            textAlignVertical: TextAlignVertical.center,
            keyboardType: inputType,
            textInputAction: TextInputAction.done,
            style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                fontFamily: FontFamily.gilmerHeavy),
            decoration: InputDecoration(
                prefixIcon: prefixIcon,
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
                suffixIcon: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                    child: InkWell(
                        onTap: toggleObscured,
                        child: Icon(
                          isShow
                              ? Icons.visibility_rounded
                              : Icons.visibility_off_rounded,
                          size: 24,
                        ))),
                hintStyle: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: FontFamily.gilmerHeavy),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                ),
                border: InputBorder.none,
                hintText: hintText)),
      ],
    );
  }
}
