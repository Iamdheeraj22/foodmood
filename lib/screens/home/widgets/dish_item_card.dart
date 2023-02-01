import 'package:flutter/material.dart';
import 'package:foodmood/app/common_widget/text_widget.dart';
import 'package:foodmood/app/res/colors/colors.dart';
import 'package:foodmood/app/res/drawables/food.dart';
import 'package:foodmood/app/res/size/size_config.dart';

class DishItemCard extends StatelessWidget {
  // const DishItemCard(
  //     {Key? key,
  //     required this.restrauntName,
  //     required this.dishName,
  //     required this.tags,
  //     required this.distance,
  //     required this.price,
  //     required this.deliverdTime,
  //     required this.dishImage,
  //     required this.onAdd,
  //     required this.onTap})
  //     : super(key: key);
  // final String restrauntName;
  // final String dishName;
  // final List<String> tags;
  // final String distance;
  // final String price;
  // final String deliverdTime;
  // final String dishImage;
  final VoidCallback onAdd;
  final VoidCallback onTap;
  const DishItemCard({
    Key? key,
    required this.onAdd,
    required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          Column(
            children: [
              Image.asset(
                FoodStrings.pijja,
                fit: BoxFit.fill,
                width: double.infinity,
                height: 220.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 30.h,
                          width: 30.h,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.greenAccent)),
                          child: Container(
                            margin: EdgeInsets.all(5.r),
                            decoration: BoxDecoration(
                                color: Colors.greenAccent,
                                borderRadius: BorderRadius.circular(200.r)),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        TextWidget(
                          text: 'La Pinos Pizza',
                          textSize: 20.sp,
                          color: context.black,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        TextWidget(
                          text: 'Pizza, Fast food',
                          textSize: 16.sp,
                          color: context.black,
                          fontWeight: FontWeight.w400,
                        )
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextWidget(
                          text: 'Loaded Pizza',
                          textSize: 20.sp,
                          color: context.appPrimaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        TextWidget(
                          text: '\$ 2/-',
                          textSize: 20.sp,
                          color: context.appPrimaryColor,
                          fontWeight: FontWeight.w400,
                        ),
                        SizedBox(
                          height: 3.h,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.timer,
                              size: 20,
                              color: context.appTitleColor1,
                            ),
                            TextWidget(
                              text: ' 25 mins | 1.5 km',
                              textSize: 14.sp,
                              color: context.black,
                              fontWeight: FontWeight.w400,
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          Center(
            child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 200.h),
                height: 50.h,
                width: 50.h,
                child: FloatingActionButton(
                  backgroundColor: context.appPrimaryColor,
                  onPressed: onAdd,
                  child: Icon(
                    Icons.add,
                    color: context.white,
                    size: 25.r,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

class DishCardModel {
  String restrauntName;
  String dishName;
  List<String> tags;
  String distance;
  String price;
  String deliverdTime;
  String dishImage;
  DishCardModel({
    required this.restrauntName,
    required this.dishName,
    required this.tags,
    required this.distance,
    required this.price,
    required this.deliverdTime,
    required this.dishImage,
  });
}
