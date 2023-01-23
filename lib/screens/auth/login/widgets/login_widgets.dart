import 'package:flutter/material.dart';
import 'package:foodmood/app/res/colors/colors.dart';
import 'package:foodmood/app/res/size/size_config.dart';

class CircleIconButton extends StatelessWidget {
  final String icon;
  final VoidCallback callback;
  const CircleIconButton({Key? key, required this.icon, required this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.r),
          border: Border.all(
            color: context.black,
          )),
      height: 100.h,
      width: 82.w,
      child: InkWell(
          borderRadius: BorderRadius.circular(100.r),
          onTap: callback,
          child: Center(child: Image.asset(icon))),
    );
  }
}
