import 'package:flutter/material.dart';
import 'package:foodmood/app/common_widget/custom_appbar.dart';
import 'package:foodmood/app/res/colors/colors.dart';
import 'package:foodmood/app/res/drawables/icons.dart';
import 'package:foodmood/app/res/size/size_config.dart';
import 'package:foodmood/screens/today_mood_dishes/widgets/custom_dish_card.dart';

class TodayMoodDishes extends StatefulWidget {
  const TodayMoodDishes({Key? key}) : super(key: key);
  static const String id = '/today_mood_dishes';
  @override
  State<TodayMoodDishes> createState() => _TodayMoodDishesState();
}

class _TodayMoodDishesState extends State<TodayMoodDishes> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NewCustomAppBar(
        title: 'Today Mood Dishes',
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
                    hintText: 'search dishes',
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
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: foodTodayList.length,
                  itemBuilder: (tContext, tIndex) {
                    return CustomDishCard(
                      image: foodTodayList[tIndex].imagePath,
                      title: foodTodayList[tIndex].title,
                      onTap: () {},
                      distance: foodTodayList[tIndex].distance,
                      price: foodTodayList[tIndex].price,
                      time: foodTodayList[tIndex].time,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
