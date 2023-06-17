import 'package:flutter/material.dart';
import 'package:foodmood/app/common_widget/text_widget.dart';
import 'package:foodmood/app/res/colors/colors.dart';
import 'package:foodmood/app/res/drawables/icons.dart';
import 'package:foodmood/app/res/size/size_config.dart';
import 'package:foodmood/screens/home/widgets/home_screen_widget.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);
  static const String id = '/home_page';
  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int selectedItemIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            borderRadius: BorderRadius.circular(1000.r),
            onTap: () {},
            child: Image.asset(
              AppIcons.bell,
              height: 24.h,
              width: 24.h,
            ),
          ),
          centerTitle: true,
          title: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_pin,
                    size: 26.h,
                    color: context.appPrimaryColor,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  TextWidget(
                    text: 'Home',
                    fontWeight: FontWeight.w500,
                    color: context.black,
                    textSize: 18.sp,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Icon(
                    Icons.keyboard_arrow_down,
                    size: 23.h,
                    color: context.black,
                  ),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              TextWidget(
                text: '9, suramya duplex, nr. nigam bus stand.....',
                textSize: 12.sp,
              )
            ],
          ),
          actions: [
            Container(
              padding: EdgeInsets.all(10.h),
              height: 34.h,
              child: InkWell(
                onTap: () {},
                child: Image.asset(
                  AppIcons.heart,
                  height: 34.h,
                  width: 34.h,
                ),
              ),
            ),
            SizedBox(
              width: 10.w,
            )
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(color: context.white),
          child: BottomNavigationBar(
              currentIndex: selectedItemIndex,
              onTap: (v) {
                setState(() {
                  selectedItemIndex = v;
                });
              },
              items: [
                BottomNavigationBarItem(
                    icon: Column(
                      children: [
                        Visibility(
                          visible: selectedItemIndex == 0,
                          child: Container(
                            width: 50.w,
                            height: 3.h,
                            color: context.appPrimaryColor,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Image.asset(
                          AppIcons.home,
                          height: 24.h,
                          width: 24.w,
                          color: selectedItemIndex == 0
                              ? context.appPrimaryColor
                              : null,
                        ),
                      ],
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Column(
                      children: [
                        Visibility(
                          visible: selectedItemIndex == 1,
                          child: Container(
                            width: 50.w,
                            height: 3.h,
                            color: context.appPrimaryColor,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Image.asset(
                          AppIcons.category,
                          height: 24.h,
                          width: 24.w,
                          color: selectedItemIndex == 1
                              ? context.appPrimaryColor
                              : null,
                        ),
                      ],
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Column(
                      children: [
                        Visibility(
                          visible: selectedItemIndex == 2,
                          child: Container(
                            width: 50.w,
                            height: 3.h,
                            color: context.appPrimaryColor,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Image.asset(
                          height: 24.h,
                          width: 24.w,
                          AppIcons.shop,
                          color: selectedItemIndex == 2
                              ? context.appPrimaryColor
                              : null,
                        ),
                      ],
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Column(
                      children: [
                        Visibility(
                          visible: selectedItemIndex == 3,
                          child: Container(
                            width: 50.w,
                            height: 3.h,
                            color: context.appPrimaryColor,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Image.asset(
                          height: 24.h,
                          width: 24.w,
                          AppIcons.cart,
                          color: selectedItemIndex == 3
                              ? context.appPrimaryColor
                              : null,
                        ),
                      ],
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: Column(
                      children: [
                        Visibility(
                          visible: selectedItemIndex == 4,
                          child: Container(
                            width: 50.w,
                            height: 3.h,
                            color: context.appPrimaryColor,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Image.asset(
                          height: 24.h,
                          width: 24.w,
                          AppIcons.user,
                          color: selectedItemIndex == 4
                              ? context.appPrimaryColor
                              : null,
                        ),
                      ],
                    ),
                    label: ''),
              ]),
        ),
        body: Container(
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            child: const HomeScreenWidget()));
  }
}
