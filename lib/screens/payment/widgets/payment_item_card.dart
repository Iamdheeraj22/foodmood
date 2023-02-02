import 'package:flutter/material.dart';
import 'package:foodmood/app/common_widget/text_widget.dart';
import 'package:foodmood/app/res/colors/colors.dart';
import 'package:foodmood/app/res/drawables/icons.dart';
import 'package:foodmood/app/res/size/size_config.dart';

class PaymentItemCard extends StatelessWidget {
  const PaymentItemCard(
      {Key? key, required this.title, required this.img, required this.onTap})
      : super(key: key);
  final String title;
  final String img;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
        child: Row(
          children: [
            Image.asset(
              img,
              height: 28.h,
              width: 28.h,
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
    );
  }
}
