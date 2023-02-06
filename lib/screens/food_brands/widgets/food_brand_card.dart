import 'package:flutter/material.dart';
import 'package:foodmood/app/common_widget/text_widget.dart';
import 'package:foodmood/app/res/colors/colors.dart';
import 'package:foodmood/app/res/size/size_config.dart';

class FoodBrandCard extends StatelessWidget {
  final String title;
  final String icon;
  VoidCallback onTap;
  FoodBrandCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.bottomCenter,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFFFFFFFF), Color(0xFFFF9D01)])),
            ),
            Center(
                child: Image.asset(
              icon,
              height: 100.h,
            )),
            Container(
              margin: EdgeInsets.only(bottom: 20.h),
              alignment: Alignment.bottomCenter,
              child: TextWidget(
                text: title,
                textSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: context.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
