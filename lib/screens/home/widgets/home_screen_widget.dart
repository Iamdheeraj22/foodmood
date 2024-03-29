import 'package:flutter/material.dart';
import 'package:foodmood/app/common_widget/text_widget.dart';
import 'package:foodmood/app/res/colors/colors.dart';
import 'package:foodmood/app/res/drawables/icons.dart';
import 'package:foodmood/app/res/drawables/images.dart';
import 'package:foodmood/app/res/size/size_config.dart';
import 'package:foodmood/app/res/strings/strings.dart';
import 'package:foodmood/app/utils/snack_bar.dart';
import 'package:foodmood/screens/food_brands/screens/food_brands_screen.dart';
import 'package:foodmood/screens/home/dish_info_overlay/dish_info_overlay.dart';
import 'package:foodmood/screens/home/widgets/dish_item_card.dart';
import 'package:foodmood/screens/home/widgets/food_brands_card.dart';
import 'package:foodmood/screens/home/widgets/food_item_card.dart';
import 'package:foodmood/screens/today_mood_dishes/screens/today_mood_dishes.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({super.key});

  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 70.h,
                  child: Card(
                      child: TextFormField(
                    controller: _searchController,
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: context.black,
                        fontWeight: FontWeight.w400),
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.text,
                    minLines: 1,
                    maxLines: 1,
                    enableSuggestions: true,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Name ur mood...',
                        hintStyle: TextStyle(
                            fontSize: 16.sp,
                            color: context.appGreyColor2,
                            fontWeight: FontWeight.w400),
                        prefixIcon: InkWell(
                            borderRadius: BorderRadius.circular(1000.r),
                            onTap: () {},
                            child: SizedBox(
                              child: Image.asset(
                                AppIcons.search,
                                height: 24.h,
                                width: 24.h,
                              ),
                            )),
                        suffixIcon: InkWell(
                            borderRadius: BorderRadius.circular(1000.r),
                            onTap: () {},
                            child: SizedBox(
                              child: Image.asset(
                                AppIcons.mic,
                                height: 24.h,
                                width: 24.h,
                              ),
                            ))),
                  )),
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              SizedBox(
                height: 70.h,
                width: 70.h,
                child: Card(
                    child: InkWell(
                  borderRadius: BorderRadius.circular(10.r),
                  onTap: () {},
                  child: Image.asset(
                    AppIcons.slider,
                    height: 24.h,
                    width: 24.h,
                  ),
                )),
              )
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          Card(
            child: Image.asset(
              Images.offer,
              height: 250.h,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Row(
              children: [
                TextWidget(
                  text: 'What’s your mood today?',
                  color: context.black,
                  fontWeight: FontWeight.w600,
                  textSize: 18.sp,
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, TodayMoodDishes.id);
                  },
                  child: TextWidget(
                    text: Strings.viewall,
                    color: context.appPrimaryColor,
                    fontWeight: FontWeight.w400,
                    textSize: 16.sp,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 5.w, top: 20.h),
            height: 135.h,
            child: ListView.builder(
                itemCount: foodList.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return FoodItemCard(
                    title: foodList[index].title,
                    img: foodList[index].imagePath,
                    onTap: () {
                      showSnackBar('Under Development', context: context);
                    },
                  );
                }),
          ),
          SizedBox(
            height: 40.h,
          ),
          //Top foods
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Row(
              children: [
                TextWidget(
                  text: 'Popular moods you can get',
                  color: context.black,
                  fontWeight: FontWeight.w600,
                  textSize: 18.sp,
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, FoodBrandsScreen.id);
                  },
                  child: TextWidget(
                    text: Strings.viewall,
                    color: context.appPrimaryColor,
                    fontWeight: FontWeight.w400,
                    textSize: 16.sp,
                  ),
                )
              ],
            ),
          ),

          //Top Food Brands
          Container(
            margin: EdgeInsets.only(left: 5.w, top: 20.h),
            height: 135.h,
            child: ListView.builder(
                itemCount: foodBrandsList.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return FoodBrandsCard(
                    onTap: () {
                      showSnackBar('Under Development', context: context);
                    },
                    brandLogo: foodBrandsList[index].brandLogo,
                    brandName: foodBrandsList[index].brandName,
                  );
                }),
          ),
          SizedBox(
            height: 30.h,
          ),

          //Recommended dishes
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Row(
              children: [
                TextWidget(
                  text: 'Popular Dishes',
                  color: context.black,
                  fontWeight: FontWeight.w600,
                  textSize: 18.sp,
                ),
                const Spacer(),
                InkWell(
                  child: TextWidget(
                    text: Strings.viewall,
                    color: context.appPrimaryColor,
                    fontWeight: FontWeight.w400,
                    textSize: 16.sp,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          DishItemCard(
            onAdd: () {
              showSnackBar('Under development', context: context);
            },
            onTap: () {
              showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (bu) {
                    return const DishInfoOverlay();
                  });
            },
          ),
          SizedBox(
            height: 40.h,
          ),
        ],
      ),
    );
  }
}
