import 'package:flutter/material.dart';
import 'package:foodmood/app/common_widget/text_widget.dart';
import 'package:foodmood/app/res/colors/colors.dart';
import 'package:foodmood/app/res/drawables/food.dart';
import 'package:foodmood/app/res/size/size_config.dart';
import 'package:foodmood/app/res/strings/strings.dart';

class FoodItemCard extends StatelessWidget {
  const FoodItemCard(
      {Key? key, required this.title, required this.img, required this.onTap})
      : super(key: key);
  final String title;
  final String img;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15.w),
      height: 135.h,
      width: 135.w,
      child: InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Image.asset(
              height: 135.h,
              width: 135.w,
              img,
              fit: BoxFit.fill,
            ),
            Expanded(
              child: Container(
                color: const Color.fromARGB(50, 0, 0, 0),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 5.h),
              alignment: Alignment.bottomCenter,
              child: TextWidget(
                text: title,
                textSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: context.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FoodItemModel {
  String title;
  String imagePath;
  FoodItemModel({
    required this.title,
    required this.imagePath,
  });
}

List<FoodItemModel> foodList = [
  FoodItemModel(title: Strings.biryani, imagePath: FoodStrings.biryani),
  FoodItemModel(title: Strings.pijja, imagePath: FoodStrings.pijja),
  FoodItemModel(title: Strings.samosa, imagePath: FoodStrings.samosa),
  FoodItemModel(title: Strings.paneer, imagePath: FoodStrings.paneer),
  FoodItemModel(title: Strings.thali, imagePath: FoodStrings.thali),
];
