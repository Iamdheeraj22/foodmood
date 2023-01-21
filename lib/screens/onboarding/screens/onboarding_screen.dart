import 'package:flutter/material.dart';
import 'package:foodmood/app/common_widget/text_widget.dart';
import 'package:foodmood/app/res/colors/colors.dart';
import 'package:foodmood/app/res/drawables/images.dart';
import 'package:foodmood/app/res/size/size_config.dart';
import 'package:foodmood/app/res/strings/strings.dart';
import 'package:foodmood/app/services/navigator_service.dart';
import 'package:foodmood/screens/onboarding/screens/onboarding_complete.dart';
import 'package:foodmood/screens/onboarding/widgets/onbording_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key? key}) : super(key: key);
  static const String id = "/onboarding_screen";
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController = PageController(initialPage: 0);
  int _activePage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            PageView.builder(
              controller: pageController,
              onPageChanged: (int page) {
                setState(() {
                  _activePage = page;
                });
              },
              itemCount: pages.length,
              itemBuilder: (BuildContext context, int index) {
                return pages[index % pages.length];
              },
            ),
            Container(
              margin: EdgeInsets.only(bottom: 50.h),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(
                      pages.length,
                      (index) => Padding(
                            padding: EdgeInsets.only(right: 10.r),
                            child: InkWell(
                              onTap: () {
                                pageController.animateToPage(index,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeIn);
                              },
                              child: CircleAvatar(
                                radius: 3,
                                backgroundColor: _activePage == index
                                    ? Colors.amber
                                    : Colors.grey,
                              ),
                            ),
                          ))),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => OnBoardingCompleteScreen()));
                  },
                  child: TextWidget(
                    text: Strings.skip,
                    textSize: 14.sp,
                    color: ColorsCollections.appPrimaryColor,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
