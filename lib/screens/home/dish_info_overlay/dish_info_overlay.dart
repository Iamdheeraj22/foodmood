import 'package:flutter/material.dart';
import 'package:foodmood/app/common_widget/custom_button.dart';
import 'package:foodmood/app/common_widget/text_widget.dart';
import 'package:foodmood/app/res/colors/colors.dart';
import 'package:foodmood/app/res/drawables/food.dart';
import 'package:foodmood/app/res/drawables/icons.dart';
import 'package:foodmood/app/res/size/size_config.dart';
import 'package:foodmood/screens/cart/screens/cart_screen.dart';
import 'package:foodmood/screens/home/dish_info_overlay/widgets/extra_item_card.dart';
import 'package:foodmood/screens/home/dish_info_overlay/widgets/item_type_card.dart';

class DishInfoOverlay extends StatelessWidget {
  const DishInfoOverlay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 30.h,
          ),
          Container(
            decoration: BoxDecoration(color: context.white),
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 250.h,
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Image.asset(
                        FoodStrings.pijja,
                        fit: BoxFit.fill,
                        width: double.infinity,
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 15.w, bottom: 15.h),
                          child: Image.asset(AppIcons.heart),
                        ),
                      ),
                      Container(
                        height: 50.h,
                        width: 50.h,
                        margin: EdgeInsets.only(top: 10.h, right: 10.h),
                        decoration: BoxDecoration(
                            color: context.black,
                            borderRadius: BorderRadius.circular(200.r)),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.close,
                            color: context.white,
                            size: 30.h,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          TextWidget(
                            text: 'Loaded Pizza',
                            textSize: 20.sp,
                            color: context.black,
                            fontWeight: FontWeight.w600,
                          ),
                          const Spacer(),
                          Container(
                            height: 30.h,
                            width: 30.h,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.greenAccent)),
                            child: Container(
                              margin: EdgeInsets.all(5.r),
                              decoration: BoxDecoration(
                                  color: Colors.greenAccent,
                                  borderRadius: BorderRadius.circular(200.r)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      TextWidget(
                        text:
                            'A fully loaded pizza with a little tangy twist \nand spicy taste of flavours',
                        textSize: 13.sp,
                        color: context.black,
                        fontWeight: FontWeight.w400,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 15.h),
                        height: 1.h,
                        color: context.appGreyColor2,
                      ),
                      TextWidget(
                        text: 'Customisation',
                        textSize: 16.sp,
                        color: context.black,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      ListView.builder(
                          itemCount: itemTypeList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ItemTypeCard(
                                itemTitle: itemTypeList[index].itemTitle,
                                itemPrice: itemTypeList[index].itemPrice);
                          }),
                      SizedBox(
                        height: 15.h,
                      ),
                      TextWidget(
                        text: 'Toppings',
                        textSize: 16.sp,
                        color: context.black,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      ListView.builder(
                          itemCount: extraItemList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ExtraItemCard(
                              itemName: extraItemList[index].itemName,
                              itemPrice: extraItemList[index].itemPrice,
                              isSelected: extraItemList[index].isSelected,
                            );
                          }),
                      SizedBox(
                        height: 30.h,
                      ),
                      Container(
                        alignment: Alignment.center,
                        decoration:
                            BoxDecoration(color: context.appPrimaryColor),
                        height: 50.h,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 50.w),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, CartScreen.id);
                          },
                          child: TextWidget(
                            text: 'Add to cart',
                            textSize: 20.sp,
                            color: context.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
