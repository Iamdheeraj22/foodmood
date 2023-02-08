import 'package:flutter/material.dart';
import 'package:foodmood/app/common_widget/custom_appbar.dart';
import 'package:foodmood/app/res/colors/colors.dart';
import 'package:foodmood/app/res/drawables/icons.dart';
import 'package:foodmood/app/res/size/size_config.dart';
import 'package:foodmood/screens/food_brands/widgets/food_brand_card.dart';
import 'package:foodmood/screens/home/widgets/food_brands_card.dart';

class FoodBrandsScreen extends StatefulWidget {
  const FoodBrandsScreen({Key? key}) : super(key: key);
  static const String id = '/food_brands';
  @override
  State<FoodBrandsScreen> createState() => _FoodBrandsScreenState();
}

class _FoodBrandsScreenState extends State<FoodBrandsScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const NewCustomAppBar(
          title: 'Food Brands',
        ),
        body: Container(
          padding: EdgeInsets.all(20.h),
          child: Column(
            children: [
              SizedBox(
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
                      hintText: 'search food brands',
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
              SizedBox(
                height: 30.h,
              ),
              Expanded(
                child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: foodBrandsList.length,
                    itemBuilder: (gContext, gIndex) {
                      return FoodBrandCard(
                        onTap: () {},
                        icon: foodBrandsList[gIndex].brandLogo,
                        title: foodBrandsList[gIndex].brandName,
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
