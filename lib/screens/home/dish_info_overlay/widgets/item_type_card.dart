import 'package:flutter/material.dart';
import 'package:foodmood/app/common_widget/text_widget.dart';
import 'package:foodmood/app/res/colors/colors.dart';

import 'package:foodmood/app/res/size/size_config.dart';

class ItemTypeCard extends StatelessWidget {
  final String itemTitle;
  final String itemPrice;
  const ItemTypeCard(
      {Key? key, required this.itemTitle, required this.itemPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(children: [
        TextWidget(
          text: itemTitle,
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
        )
      ]),
    );
  }
}

class ItemTypeModel {
  String itemTitle;
  String itemPrice;
  ItemTypeModel({
    required this.itemTitle,
    required this.itemPrice,
  });
}

List<ItemTypeModel> itemTypeList = [
  ItemTypeModel(itemTitle: 'Individual Giant Slice', itemPrice: '₹ 150'),
  ItemTypeModel(itemTitle: 'Regular ( serves 1 )', itemPrice: '₹ 175'),
  ItemTypeModel(itemTitle: 'Medium ( serves 2 )', itemPrice: '₹ 225'),
  ItemTypeModel(itemTitle: 'Large ( serves 4 )', itemPrice: '₹ 255'),
  ItemTypeModel(itemTitle: 'Giant ( serves 8 )', itemPrice: '₹ 595'),
  ItemTypeModel(itemTitle: 'Monster ( serves 12 )', itemPrice: '₹ 765'),
];
