import 'package:flutter/material.dart';
import 'package:foodmood/app/res/colors/colors.dart';

import 'package:foodmood/app/res/size/size_config.dart';

class ColorItemCard extends StatelessWidget {
  const ColorItemCard(
      {Key? key,
      required this.color,
      required this.onTap,
      required this.isSelected})
      : super(key: key);
  final Color color;
  final VoidCallback onTap;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(20.h),
        color: color,
        height: 20.h,
        width: 20.h,
        child: Visibility(
            visible: isSelected, child: const Center(child: Icon(Icons.done))),
      ),
    );
  }
}

class ColorItemModel {
  Color color;
  bool isSelected;
  ColorItemModel({
    required this.color,
    required this.isSelected,
  });
}

List<ColorItemModel> colorList = [
  ColorItemModel(color: ColorsCollections.appPrimaryColor, isSelected: true),
  ColorItemModel(color: const Color(0xFFFFD79A), isSelected: false),
  ColorItemModel(color: const Color(0xFFFF0000), isSelected: false),
  ColorItemModel(color: const Color(0xFF0066FF), isSelected: false),
  ColorItemModel(color: const Color(0xFFFAFF00), isSelected: false),
  ColorItemModel(color: const Color(0xFF24FF00), isSelected: false),
  ColorItemModel(color: const Color(0xFFFF00C7), isSelected: false),
  ColorItemModel(color: const Color(0xFFBD00FF), isSelected: false),
  ColorItemModel(color: const Color(0xFF00F0FF), isSelected: false),
  ColorItemModel(color: const Color(0xFF873900), isSelected: false),
];
