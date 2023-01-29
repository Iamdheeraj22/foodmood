import 'package:flutter/material.dart';
import 'package:foodmood/app/res/colors/colors.dart';
import 'package:foodmood/app/res/drawables/icons.dart';
import 'package:foodmood/app/res/size/size_config.dart';

class HomePageScreen extends StatefulWidget {
  HomePageScreen({Key? key}) : super(key: key);
  static const String id = '/home_page';
  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int selectedItemIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        color: const Color(0xFFFFFF),
      ),
    );
  }
}
