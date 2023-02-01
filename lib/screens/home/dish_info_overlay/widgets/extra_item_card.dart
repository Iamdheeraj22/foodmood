import 'package:flutter/material.dart';
import 'package:foodmood/app/common_widget/text_widget.dart';
import 'package:foodmood/app/res/colors/colors.dart';
import 'package:foodmood/app/res/size/size_config.dart';

class ExtraItemCard extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final bool isSelected;
  const ExtraItemCard({
    Key? key,
    required this.itemName,
    required this.itemPrice,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        children: [
          TextWidget(
            text: itemName,
            textSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: context.black,
          ),
          const Spacer(),
          TextWidget(
            text: itemPrice,
            textSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: context.black,
          ),
          SizedBox(
            width: 30.w,
          ),
          SizedBox(
            height: 25.h,
            width: 25.h,
            child: Checkbox(
              value: isSelected,
              onChanged: (v) {},
            ),
          )
        ],
      ),
    );
  }
}

class ExtraItemModel {
  String itemName;
  String itemPrice;
  bool isSelected;
  ExtraItemModel({
    required this.itemName,
    required this.itemPrice,
    required this.isSelected,
  });
}

List<ExtraItemModel> extraItemList = [
  ExtraItemModel(itemName: 'Baby Corns', itemPrice: '₹ 20', isSelected: false),
  ExtraItemModel(itemName: 'Mushrooms', itemPrice: '₹ 20', isSelected: false),
  ExtraItemModel(itemName: 'Sweet Corns', itemPrice: '₹ 20', isSelected: false),
];
