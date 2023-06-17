import 'package:flutter/material.dart';
import 'package:foodmood/app/common_widget/text_widget.dart';
import 'package:foodmood/app/res/colors/colors.dart';
import 'package:foodmood/app/res/drawables/food.dart';
import 'package:foodmood/app/res/size/size_config.dart';
import 'package:foodmood/app/res/strings/strings.dart';

class CustomDishCard extends StatelessWidget {
  const CustomDishCard(
      {super.key,
      required this.image,
      required this.title,
      required this.onTap,
      required this.distance,
      required this.price,
      required this.time});
  final String image;
  final String title;
  final VoidCallback onTap;
  final String distance;
  final String price;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
      onTap: onTap,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5.r),
            child: Image.asset(
              image,
              height: 200.h,
              width: 200.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Container(
            margin: EdgeInsets.all(
              5.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: title,
                  fontWeight: FontWeight.w600,
                  textSize: 22.sp,
                  color: context.black,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_pin,
                      size: 20.h,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    TextWidget(
                        text: '$distance away',
                        textSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: context.black),
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.timer,
                      size: 20,
                      color: context.appTitleColor1,
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    TextWidget(
                      text: '$time | $distance',
                      textSize: 14.sp,
                      color: context.black,
                      fontWeight: FontWeight.w400,
                    )
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          Column(
            children: [
              TextWidget(
                text: '\$ $price',
                fontWeight: FontWeight.w700,
                textSize: 20.sp,
              ),
              SizedBox(
                height: 30.h,
              ),
              SizedBox(
                height: 50.h,
                width: 50.h,
                child: FloatingActionButton(
                  backgroundColor: context.appPrimaryColor,
                  onPressed: () {},
                  child: Icon(
                    Icons.add,
                    color: context.white,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            width: 10.w,
          )
        ],
      ),
    ));
  }
}

class FoodModel {
  String title;
  String imagePath;
  String distance;
  String price;
  String time;
  FoodModel(
      {required this.title,
      required this.imagePath,
      required this.distance,
      required this.price,
      required this.time});
}

List<FoodModel> foodTodayList = [
  FoodModel(
      title: Strings.biryani,
      imagePath: FoodStrings.biryani,
      distance: '5 km',
      price: '150',
      time: '30 Minutes'),
  FoodModel(
      title: Strings.pijja,
      imagePath: FoodStrings.pijja,
      distance: '5 km',
      price: '150',
      time: '30 Minutes'),
  FoodModel(
      title: Strings.samosa,
      imagePath: FoodStrings.samosa,
      distance: '5 km',
      price: '150',
      time: '30 Minutes'),
  FoodModel(
      title: Strings.paneer,
      imagePath: FoodStrings.paneer,
      distance: '5 km',
      price: '150',
      time: '30 Minutes'),
  FoodModel(
      title: Strings.thali,
      imagePath: FoodStrings.thali,
      distance: '5 km',
      price: '150',
      time: '30 Minutes'),
];
