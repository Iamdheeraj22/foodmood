import 'package:flutter/material.dart';
import 'package:foodmood/app/common_widget/custom_appbar.dart';
import 'package:foodmood/app/common_widget/text_widget.dart';
import 'package:foodmood/app/res/colors/colors.dart';
import 'package:foodmood/app/res/drawables/icons.dart';
import 'package:foodmood/app/res/size/size_config.dart';
import 'package:foodmood/app/res/strings/strings.dart';
import 'package:foodmood/screens/account_details/profile_screen/widgets/option_item_card.dart';

class SettingsScreenPage extends StatefulWidget {
  const SettingsScreenPage({Key? key}) : super(key: key);
  static const String id = '/setting_screen';
  @override
  State<SettingsScreenPage> createState() => _SettingsScreenPaState();
}

class _SettingsScreenPaState extends State<SettingsScreenPage> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {},
          child: Icon(
            Icons.arrow_back_ios,
            size: 30.r,
            color: context.appPrimaryColor,
          ),
        ),
        title: TextWidget(
          text: Strings.settings,
          color: context.appPrimaryColor,
          fontWeight: FontWeight.w500,
          textSize: 20.sp,
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(
              height: 25.h,
            ),
            OptionItemCard(
                title: Strings.helpSupport,
                onPressed: () {},
                itemICon: AppIcons.helpCircle),
            SizedBox(
              height: 15.h,
            ),
            OptionItemCard(
                title: Strings.feedback,
                onPressed: () {},
                itemICon: AppIcons.feedback),
            SizedBox(
              height: 15.h,
            ),
            Card(
              elevation: 2,
              shadowColor: context.appOnbordingColor,
              child: InkWell(
                  onTap: () {
                    setState(() {
                      isDark = !isDark;
                    });
                  },
                  child: Container(
                    height: 64.h,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    child: Row(
                      children: [
                        Image.asset(
                          AppIcons.theme,
                          height: 30.h,
                          width: 30.w,
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        TextWidget(
                          text: 'Dark Mode',
                          color: context.appOnbordingColor,
                          fontWeight: FontWeight.w600,
                          textSize: 16.sp,
                        ),
                        Spacer(),
                        Switch(
                            value: isDark,
                            onChanged: (v) {
                              setState(() {
                                isDark = v;
                              });
                            })
                      ],
                    ),
                  )),
            ),
            SizedBox(
              height: 15.h,
            ),
            OptionItemCard(
                title: Strings.about,
                onPressed: () {},
                itemICon: AppIcons.info),
            SizedBox(
              height: 50.h,
            ),
            TextWidget(
              text: 'Version 1.0.0',
              color: context.appOnbordingColor,
              fontWeight: FontWeight.w600,
              textSize: 16.sp,
            ),
          ],
        ),
      ),
    );
  }
}
