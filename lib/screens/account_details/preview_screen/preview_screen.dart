import 'package:flutter/material.dart';
import 'package:foodmood/app/common_widget/text_widget.dart';
import 'package:foodmood/app/res/colors/colors.dart';
import 'package:foodmood/app/res/drawables/images.dart';
import 'package:foodmood/app/res/size/size_config.dart';
import 'package:foodmood/app/res/strings/strings.dart';
import 'package:foodmood/screens/account_details/preview_screen/widgets/color_item_card.dart';

class PreviewScreenPage extends StatefulWidget {
  const PreviewScreenPage({Key? key}) : super(key: key);
  static const String id = 'preview_screen';
  @override
  State<PreviewScreenPage> createState() => _PreviewScreenPageState();
}

class _PreviewScreenPageState extends State<PreviewScreenPage> {
  int selectionIndex = -1;
  Color color = ColorsCollections.appPrimaryColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back_ios,
              color: context.appPrimaryColor,
              size: 30.h,
            )),
        title: TextWidget(
          text: AppStrings.preview,
          textSize: 24.sp,
          fontWeight: FontWeight.w400,
          color: context.appPrimaryColor,
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.h),
        child: Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              padding: EdgeInsets.all(15.r),
              height: 210.h,
              decoration: BoxDecoration(color: color),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: 'Dheeraj Prajapat',
                            style: TextStyle(
                                fontSize: 24.sp, fontWeight: FontWeight.w700)),
                        TextSpan(
                            text: '\n+91 7895236100',
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.w600)),
                        TextSpan(
                            text: '\ndheerajprajapat125@yopmail.com',
                            style: TextStyle(
                                fontSize: 12.sp, fontWeight: FontWeight.w400)),
                      ])),
                      const Spacer(),
                      Container(
                          padding: EdgeInsets.all(15.r),
                          height: 116.h,
                          alignment: Alignment.center,
                          width: 116.h,
                          decoration: BoxDecoration(
                              color: context.black,
                              borderRadius: BorderRadius.circular(100.r)),
                          child: ClipRRect(
                            child: Icon(
                              Icons.person,
                              color: context.appPrimaryColor,
                              size: 70.r,
                            ),
                          ))
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      TextWidget(
                        text: 'view activity',
                        textSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: context.white,
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {},
                        child: Image.asset(
                          Images.edit,
                          height: 24,
                          width: 24.w,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              height: 1.h,
              color: context.black,
            ),
            SizedBox(
              height: 30.h,
            ),
            GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemCount: colorList.length,
                itemBuilder: (gContext, gIndex) {
                  return ColorItemCard(
                      color: colorList[gIndex].color,
                      onTap: () {
                        setState(() {
                          selectionIndex = gIndex;
                          color = colorList[gIndex].color;
                        });
                      },
                      isSelected: selectionIndex == gIndex ? true : false);
                }),
            SizedBox(
              height: 30.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15.h),
              margin: EdgeInsets.symmetric(horizontal: 30.h),
              decoration: BoxDecoration(color: context.appPrimaryColor),
              child: InkWell(
                onTap: () {},
                child: Center(
                    child: TextWidget(
                  text: 'Edit your personal information',
                  textSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: context.white,
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
