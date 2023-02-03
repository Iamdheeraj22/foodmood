import 'package:flutter/material.dart';
import 'package:foodmood/app/common_widget/text_widget.dart';
import 'package:foodmood/app/res/colors/colors.dart';
import 'package:foodmood/app/res/drawables/food.dart';
import 'package:foodmood/app/res/size/size_config.dart';
import 'package:foodmood/app/res/strings/strings.dart';

class FoodBrandsCard extends StatelessWidget {
  const FoodBrandsCard(
      {Key? key,
      required this.brandName,
      required this.brandLogo,
      required this.onTap})
      : super(key: key);
  final String brandName;
  final String brandLogo;
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
            Container(
              height: 135.h,
              width: 135.w,
              alignment: Alignment.bottomCenter,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFFFFFFFF), Color(0xFFFF9D01)])),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset(
                height: 135.h,
                width: 135.w,
                brandLogo,
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Container(
                color: const Color.fromARGB(50, 0, 0, 0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FoodBrandModel {
  String brandName;
  String brandLogo;
  FoodBrandModel({
    required this.brandName,
    required this.brandLogo,
  });
}

List<FoodBrandModel> foodBrandsList = [
  FoodBrandModel(
      brandName: Strings.burgerKing, brandLogo: FoodStrings.burgerKing),
  FoodBrandModel(
      brandName: Strings.pizzaHhut, brandLogo: FoodStrings.pizzaHhut),
  FoodBrandModel(brandName: Strings.subway, brandLogo: FoodStrings.subway),
  FoodBrandModel(
      brandName: Strings.dunkinDonuts, brandLogo: FoodStrings.dunkinDonuts),
  FoodBrandModel(
      brandName: Strings.wendysLogo, brandLogo: FoodStrings.wendysLogo),
  FoodBrandModel(brandName: Strings.kfc, brandLogo: FoodStrings.kfc),
  FoodBrandModel(
      brandName: Strings.mcdonalds, brandLogo: FoodStrings.mcdonalds),
  FoodBrandModel(
      brandName: Strings.starkbucksCoffee,
      brandLogo: FoodStrings.starkbucksCoffee),
  FoodBrandModel(brandName: Strings.dominos, brandLogo: FoodStrings.dominos),
  FoodBrandModel(
      brandName: Strings.popeyesChicken, brandLogo: FoodStrings.popeyesChicken),
];
