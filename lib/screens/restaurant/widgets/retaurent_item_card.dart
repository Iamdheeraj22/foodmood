import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:foodmood/app/common_widget/text_widget.dart';
import 'package:foodmood/app/res/colors/colors.dart';
import 'package:foodmood/app/res/drawables/food.dart';
import 'package:foodmood/app/res/size/size_config.dart';

class RestaurentItemCard extends StatelessWidget {
  const RestaurentItemCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 250.h,
              width: double.infinity,
              child: Stack(alignment: Alignment.bottomCenter, children: [
                PageView.builder(
                    itemCount: _rImages.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.r),
                                topLeft: Radius.circular(10.r))),
                        child: Image.asset(
                          _rImages[index],
                          fit: BoxFit.fill,
                          filterQuality: FilterQuality.high,
                        ),
                      );
                    }),
                Container(
                  margin: EdgeInsets.only(bottom: 10.h),
                  height: 10.h,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _rImages.length,
                      shrinkWrap: true,
                      itemBuilder: (iContext, iIndex) {
                        return Container(
                            margin: EdgeInsets.only(right: 5.w),
                            width: 10.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.r),
                                color: context.appPrimaryColor));
                      }),
                )
              ]),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      TextWidget(
                        text: 'Shyama Dhaba',
                        fontWeight: FontWeight.w600,
                        color: context.black,
                        textSize: 24.sp,
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          SizedBox(
                            height: 15.h,
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: 5,
                                itemBuilder: (rContext, rIndex) {
                                  return Icon(
                                    Icons.star,
                                    color: Colors.green,
                                    size: 15.h,
                                  );
                                }),
                          ),
                          TextWidget(
                            text: '5/5 ratings',
                            textSize: 13.sp,
                            color: context.black,
                            fontWeight: FontWeight.w400,
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_pin,
                        size: 20.h,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      TextWidget(
                          text: '3.5km away',
                          textSize: 20.sp,
                          fontWeight: FontWeight.w600,
                          color: context.black),
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  TextWidget(
                      text:
                          '9, suramya duplex, nr. nigam bus stand besides suramya appartment, ghodasar, ahmedabad - 50',
                      textSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: context.black),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//carousel_slider: ^4.2.1

List<String> _rImages = [
  FoodStrings.biryani,
  FoodStrings.paneer,
  FoodStrings.pijja,
  FoodStrings.thali,
  FoodStrings.samosa
];


/**
 * CarouselSlider(
                items: _rImages
                    .map((e) => Image.asset(
                          e,
                          height: 200.h,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ))
                    .toList(),
                options: CarouselOptions(
                  height: 200.h,

                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  // enlargeCenterPage: true,
                ))
 */