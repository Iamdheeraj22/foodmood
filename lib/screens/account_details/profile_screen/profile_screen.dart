import 'package:flutter/material.dart';

import 'package:foodmood/app/common_widget/text_widget.dart';
import 'package:foodmood/app/res/colors/colors.dart';
import 'package:foodmood/app/res/drawables/icons.dart';
import 'package:foodmood/app/res/drawables/images.dart';
import 'package:foodmood/app/res/size/size_config.dart';
import 'package:foodmood/app/res/strings/strings.dart';
import 'package:foodmood/screens/account_details/profile_screen/widgets/option_item_card.dart';

class ProfileScreenPage extends StatefulWidget {
  const ProfileScreenPage({Key? key}) : super(key: key);
  static const String id = '/profile_screen';
  @override
  State<ProfileScreenPage> createState() => _ProfileScreenPageState();
}

class _ProfileScreenPageState extends State<ProfileScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: TextWidget(
          text: Strings.profile,
          fontWeight: FontWeight.w700,
          color: context.appPrimaryColor,
          textSize: 24.sp,
        ),
      ),
      body: Container(
          margin: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Container(
                padding: EdgeInsets.all(15.r),
                height: 210.h,
                decoration: BoxDecoration(color: context.appPrimaryColor),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: 'Dheeraj Prajapat',
                              style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w700)),
                          TextSpan(
                              text: '\n+91 7895236100',
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600)),
                          TextSpan(
                              text: '\ndheerajprajapat125@yopmail.com',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400)),
                        ])),
                        const Spacer(),
                        Container(
                          padding: EdgeInsets.all(15.r),
                          height: 116.h,
                          alignment: Alignment.center,
                          width: 116.h,
                          decoration: BoxDecoration(
                              color: context.black,
                              borderRadius: BorderRadius.circular(100.r)),
                          child: TextWidget(
                            text: 'D',
                            textSize: 50.sp,
                            color: context.appPrimaryColor,
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        TextWidget(
                          text: 'view activity',
                          textSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: context.white,
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Image.asset(
                            Images.edit,
                            height: 24,
                            width: 24.w,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 1.h,
                color: context.black,
              ),
              SizedBox(
                height: 20.h,
              ),
              OptionItemCard(
                  title: Strings.orderHistory,
                  onPressed: () {},
                  itemICon: AppIcons.shoppingBag),
              SizedBox(
                height: 15.h,
              ),
              OptionItemCard(
                  title: Strings.trackOrder,
                  onPressed: () {},
                  itemICon: AppIcons.truck),
              SizedBox(
                height: 15.h,
              ),
              OptionItemCard(
                  title: Strings.transactions,
                  onPressed: () {},
                  itemICon: AppIcons.creditCard),
              SizedBox(
                height: 15.h,
              ),
              OptionItemCard(
                  title: Strings.settings,
                  onPressed: () {},
                  itemICon: AppIcons.accountSetting),
              SizedBox(
                height: 15.h,
              ),
              OptionItemCard(
                  title: Strings.logout,
                  onPressed: () {},
                  itemICon: AppIcons.logout),
            ],
          )),
    );
  }
}
