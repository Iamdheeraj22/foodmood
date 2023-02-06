import 'package:flutter/material.dart';
import 'package:foodmood/app/common_widget/custom_appbar.dart';
import 'package:foodmood/app/res/size/size_config.dart';

class FoodBrandsScreen extends StatefulWidget {
  const FoodBrandsScreen({Key? key}) : super(key: key);
  static const String id = '/food_brands';
  @override
  State<FoodBrandsScreen> createState() => _FoodBrandsScreenState();
}

class _FoodBrandsScreenState extends State<FoodBrandsScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: NewCustomAppBar(
          title: 'Food Brands',
        ),
        body: Container(
          padding: EdgeInsets.all(20.h),
        ),
      ),
    );
  }
}
