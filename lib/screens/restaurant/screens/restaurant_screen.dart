import 'package:flutter/material.dart';
import 'package:foodmood/app/common_widget/text_widget.dart';
import 'package:foodmood/app/res/colors/colors.dart';
import 'package:foodmood/app/res/drawables/icons.dart';
import 'package:foodmood/app/res/size/size_config.dart';
import 'package:foodmood/app/res/strings/strings.dart';
import 'package:foodmood/screens/restaurant/widgets/retaurent_item_card.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({Key? key}) : super(key: key);
  static const String id = '/restaurant_screen';
  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextWidget(
          text: AppStrings.restarant,
          textSize: 20.sp,
          fontWeight: FontWeight.w600,
          color: context.appPrimaryColor,
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(5.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(200),
            onTap: () {},
            child: SizedBox(
              height: 40.h,
              width: 40.h,
              child: Icon(
                Icons.keyboard_arrow_left,
                color: context.appPrimaryColor,
              ),
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
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
                      color: context.appPrimaryColor,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10.r),
                        onTap: () {},
                        child: Image.asset(
                          AppIcons.slider,
                          height: 22.h,
                          color: context.white,
                          width: 22.h,
                        ),
                      )),
                )
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  itemBuilder: (ctc, index) {
                    return const RestaurentItemCard();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
