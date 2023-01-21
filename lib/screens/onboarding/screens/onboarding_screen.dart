import 'package:flutter/material.dart';
import 'package:foodmood/app/res/drawables/images.dart';
import 'package:foodmood/app/res/size/size_config.dart';
import 'package:foodmood/app/res/strings/strings.dart';
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
  final List<Widget> _pages = [
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
    const OnBoardingCompleteWidget(
        title: Strings.onboardingTitle4,
        desc: Strings.onboardingDesc4,
        image: Images.pasta),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          PageView.builder(
            controller: pageController,
            onPageChanged: (int page) {
              setState(() {
                _activePage = page;
              });
            },
            itemCount: _pages.length,
            itemBuilder: (BuildContext context, int index) {
              return _pages[index % _pages.length];
            },
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List<Widget>.generate(
                  _pages.length,
                  (index) => Padding(
                        padding: EdgeInsets.only(right: 10.r),
                        child: InkWell(
                          onTap: () {
                            pageController.animateToPage(index,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn);
                          },
                          child: CircleAvatar(
                            radius: 5,
                            backgroundColor: _activePage == index
                                ? Colors.amber
                                : Colors.grey,
                          ),
                        ),
                      )))
        ],
      ),
    );
  }
}
