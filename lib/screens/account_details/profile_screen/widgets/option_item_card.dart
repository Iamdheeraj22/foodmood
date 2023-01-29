import 'package:flutter/material.dart';
import 'package:foodmood/app/common_widget/text_widget.dart';
import 'package:foodmood/app/res/colors/colors.dart';
import 'package:foodmood/app/res/size/size_config.dart';

class OptionItemCard extends StatelessWidget {
  const OptionItemCard(
      {Key? key,
      required this.title,
      required this.onPressed,
      required this.itemICon})
      : super(key: key);
  final String title;
  final VoidCallback onPressed;
  final String itemICon;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: context.appOnbordingColor,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 64.h,
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          child: Row(
            children: [
              Image.asset(
                itemICon,
                color: context.appOnbordingColor,
                height: 30.h,
                width: 30.w,
              ),
              SizedBox(
                width: 20.w,
              ),
              TextWidget(
                text: title,
                color: context.appOnbordingColor,
                fontWeight: FontWeight.w600,
                textSize: 16.sp,
              ),
              const Spacer(),
              Icon(
                Icons.arrow_forward_ios,
                size: 20.r,
              )
            ],
          ),
        ),
      ),
    );
  }
}
