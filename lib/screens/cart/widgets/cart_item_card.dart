import 'package:flutter/material.dart';
import 'package:foodmood/app/common_widget/text_widget.dart';
import 'package:foodmood/app/res/colors/colors.dart';
import 'package:foodmood/app/res/drawables/food.dart';
import 'package:foodmood/app/res/size/size_config.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Image.asset(
            FoodStrings.paneer,
            height: 200.h,
            width: 200.h,
          ),
          SizedBox(
            width: 15.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: 'Loaded Pizza',
                fontWeight: FontWeight.w800,
                textSize: 24.sp,
                color: context.appPrimaryColor,
              ),
              TextWidget(
                text: 'Regular',
                fontWeight: FontWeight.w400,
                textSize: 20.sp,
                color: context.black,
              ),
              SizedBox(
                height: 15.h,
              ),
              TextWidget(
                text: '₹ 175',
                fontWeight: FontWeight.w700,
                textSize: 28.sp,
                color: context.black,
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50.h,
                    width: 50.w,
                    child: FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: context.appPrimaryColor,
                      child: TextWidget(
                        text: '-',
                        textSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  TextWidget(text: '1'),
                  SizedBox(
                    width: 15.w,
                  ),
                  SizedBox(
                    height: 50.h,
                    width: 50.w,
                    child: FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: context.appPrimaryColor,
                      child: TextWidget(
                        text: '+',
                        textSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
