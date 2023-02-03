import 'package:flutter/material.dart';
import 'package:foodmood/app/common_widget/text_widget.dart';
import 'package:foodmood/app/res/colors/colors.dart';
import 'package:foodmood/app/res/size/size_config.dart';

class PriceDetailsBottomsheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: context.appPrimaryColor),
      child: Stack(alignment: Alignment.topRight, children: [
        Padding(
          padding: EdgeInsets.only(top: 10.h, right: 10.h),
          child: SizedBox(
            height: 30.h,
            width: 30.w,
            child: FloatingActionButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                backgroundColor: context.white,
                child: Icon(
                  Icons.close,
                  size: 20.r,
                )),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 50.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RowItem(txt1: 'SubTotal', txt2: '₹ 175'),
              RowItem(txt1: 'Taxes & Fees', txt2: '₹ 30'),
              RowItem(txt1: 'Delivery Charges', txt2: 'Free'),
              Container(
                height: 1.h,
                margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
                color: context.white,
              ),
              RowItem(txt1: 'Total', txt2: '₹ 205'),
              SizedBox(
                height: 15.h,
              ),
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 20.h),
                decoration: BoxDecoration(
                    border: Border.all(color: context.white, width: 1.h)),
                margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
                child: TextWidget(
                  text: 'Voucher Code',
                  fontWeight: FontWeight.w600,
                  textSize: 20.sp,
                  color: context.white,
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  decoration: BoxDecoration(color: context.white),
                  margin:
                      EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
                  child: TextWidget(
                    text: 'Checkout Order',
                    fontWeight: FontWeight.w600,
                    textSize: 20.sp,
                    color: context.appPrimaryColor,
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        )
      ]),
    );
  }
}

class RowItem extends StatelessWidget {
  const RowItem({Key? key, required this.txt1, required this.txt2})
      : super(key: key);
  final String txt1;
  final String txt2;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
      child: Row(
        children: [
          TextWidget(
            text: txt1,
            fontWeight: FontWeight.w400,
            textSize: 20.sp,
            color: context.white,
          ),
          const Spacer(),
          TextWidget(
            text: txt2,
            fontWeight: FontWeight.w600,
            textSize: 20.sp,
            color: context.white,
          )
        ],
      ),
    );
  }
}
