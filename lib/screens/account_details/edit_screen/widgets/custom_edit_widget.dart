import 'package:flutter/material.dart';
import 'package:foodmood/app/common_widget/text_widget.dart';
import 'package:foodmood/app/res/colors/colors.dart';
import 'package:foodmood/app/res/fonts/font_family.dart';
import 'package:foodmood/app/res/size/size_config.dart';
import 'package:foodmood/app/res/strings/strings.dart';

class CustomEditTextWidget extends StatelessWidget {
  const CustomEditTextWidget(
      {Key? key,
      required this.title,
      required this.hintText,
      required this.controller,
      required this.inputType,
      required this.inputAction,
      required this.update,
      required this.cancel})
      : super(key: key);
  final String title;
  final String hintText;
  final TextEditingController controller;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final VoidCallback update;
  final VoidCallback cancel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            text: title,
            color: context.appTitleColor1,
            textSize: 11.sp,
            fontWeight: FontStyles.regular,
          ),
          TextFormField(
            style: TextStyle(fontSize: 14.sp, color: context.black),
            controller: controller,
            keyboardType: inputType,
            textInputAction: inputAction,
            decoration: InputDecoration(
                hintText: hintText,
                contentPadding: EdgeInsets.zero,
                constraints: BoxConstraints.tightFor(height: 55.h),
                hintStyle:
                    TextStyle(fontSize: 14.sp, color: context.appGreyColor2),
                suffixIcon: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: TextWidget(
                      text: 'Edit',
                      fontWeight: FontStyles.bold,
                      color: context.appPrimaryColor,
                    ),
                  ),
                ),
                suffixIconConstraints: BoxConstraints(maxHeight: 55.h)),
          ),
          SizedBox(
            height: 15.h,
          ),
          CustomEditButton(
            cancel: cancel,
            update: update,
          )
        ],
      ),
    );
  }
}

class CustomEditButton extends StatelessWidget {
  const CustomEditButton(
      {super.key, required this.update, required this.cancel});
  final VoidCallback update;
  final VoidCallback cancel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: update,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(color: context.appPrimaryColor),
              height: 50.h,
              child: TextWidget(
                color: context.white,
                fontWeight: FontStyles.bold,
                text: Strings.update.toUpperCase(),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          child: InkWell(
            onTap: cancel,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: context.white,
                  border: Border.all(color: context.appPrimaryColor, width: 1)),
              height: 50.h,
              child: TextWidget(
                text: Strings.cancel.toUpperCase(),
                fontWeight: FontStyles.bold,
              ),
            ),
          ),
        )
      ],
    );
  }
}
