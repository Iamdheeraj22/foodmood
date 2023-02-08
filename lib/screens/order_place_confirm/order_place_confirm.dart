import 'package:flutter/material.dart';
import 'package:foodmood/app/common_widget/text_widget.dart';
import 'package:foodmood/app/res/colors/colors.dart';
import 'package:foodmood/app/res/drawables/images.dart';
import 'package:foodmood/app/res/size/size_config.dart';
import 'package:foodmood/screens/home/home_screen.dart';

class OrderPlaceConfirmScreen extends StatefulWidget {
  const OrderPlaceConfirmScreen({Key? key}) : super(key: key);
  static const String id = '/order_confirm';
  @override
  State<OrderPlaceConfirmScreen> createState() =>
      _OrderPlaceConfirmScreenState();
}

class _OrderPlaceConfirmScreenState extends State<OrderPlaceConfirmScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: context.white),
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Images.offferSuccess),
            SizedBox(
              height: 20.h,
            ),
            TextWidget(
              text: 'Your order has been placed!',
              textSize: 24.sp,
              fontWeight: FontWeight.w600,
              color: context.appPrimaryColor,
            ),
            SizedBox(
              height: 5.h,
            ),
            TextWidget(
              text: 'You will receive an email shortly.',
              textSize: 20.sp,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(
              height: 100.h,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, HomePageScreen.id, ModalRoute.withName('/'));
              },
              child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 50.h, vertical: 10.h),
                  decoration: BoxDecoration(
                      border: Border.all(color: context.appPrimaryColor),
                      borderRadius: BorderRadius.circular(10.r)),
                  child: TextWidget(
                    text: 'Go moody again...',
                    color: context.appPrimaryColor,
                    fontWeight: FontWeight.bold,
                    textSize: 24.sp,
                  )),
            )
          ],
        ),
      ),
    );
  }
}
