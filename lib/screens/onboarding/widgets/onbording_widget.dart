import 'package:flutter/material.dart';
import 'package:foodmood/app/common_widget/text_widget.dart';
import 'package:foodmood/app/res/colors/colors.dart';
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
        SizedBox(
          height: 40.h,
        ),
        TextWidget(
          text: title,
          fontWeight: FontWeight.w800,
          textSize: 24.sp,
          textAlign: TextAlign.center,
          color: ColorsCollections.appPrimaryColor,
        ),
        SizedBox(
          height: 40.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.w),
          child: TextWidget(
            text: desc,
            textAlign: TextAlign.center,
            textSize: 16.sp,
            color: ColorsCollections.appOnbordingColor,
          ),
        ),
      ],
    );
  }
}

final List<Widget> pages = [
  const OnBoardingWidget(
      title: Strings.onboardingTitle1,
      desc: Strings.onboardingDesc1,
      image: Images.chef),
  const OnBoardingWidget(
      title: Strings.onboardingTitle2,
      desc: Strings.onboardingDesc2,
      image: Images.coffeeShop),
  const OnBoardingWidget(
      title: Strings.onboardingTitle3,
      desc: Strings.onboardingDesc3,
      image: Images.takeaway),
];
