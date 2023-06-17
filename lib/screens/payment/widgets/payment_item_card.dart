import 'package:flutter/material.dart';
import 'package:foodmood/app/common_widget/text_widget.dart';
import 'package:foodmood/app/res/colors/colors.dart';
import 'package:foodmood/app/res/size/size_config.dart';

class PaymentItemCard extends StatelessWidget {
  const PaymentItemCard({
    Key? key,
    required this.title,
    required this.img,
    required this.onTap,
    required this.extendWidth,
  }) : super(key: key);
  final String title;
  final String img;
  final VoidCallback onTap;
  final bool extendWidth;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 5.w),
          child: Row(
            children: [
              Image.asset(
                img,
                height: extendWidth ? 30.h : 28.h,
                width: extendWidth ? 41.h : 28.h,
              ),
              SizedBox(
                width: 15.w,
              ),
              TextWidget(
                text: title,
                fontWeight: FontWeight.w400,
                textSize: 16.sp,
                color: context.black,
              ),
              const Spacer(),
              const Icon(Icons.keyboard_arrow_right)
            ],
          ),
        ),
      ),
    );
  }
}
