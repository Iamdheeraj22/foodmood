import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodmood/app/common_widget/custom_button.dart';
import 'package:foodmood/app/common_widget/text_widget.dart';
import 'package:foodmood/app/res/drawables/images.dart';
import 'package:foodmood/app/res/size/size_config.dart';
import 'package:foodmood/app/res/strings/strings.dart';

class OnBoardingWidget extends StatelessWidget {
  final String title;
  final String desc;
  final String image;
  const OnBoardingWidget(
      {Key? key, required this.title, required this.desc, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          image,
          height: 255.h,
          width: 300.w,
        ),
        TextWidget(text: title),
        TextWidget(text: desc)
      ],
    );
  }
}

class OnBoardingCompleteWidget extends StatelessWidget {
  final String title;
  final String desc;
  final String image;
  const OnBoardingCompleteWidget(
      {Key? key, required this.title, required this.desc, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          image,
          height: 255.h,
          width: 300.w,
        ),
        TextWidget(text: title),
        TextWidget(text: desc),
        CustomButton(label: Strings.getMoody, onPressed: () {})
      ],
    );
  }
}
