import 'package:flutter/material.dart';
import 'package:foodmood/app/common_widget/text_widget.dart';
import 'package:foodmood/app/res/colors/colors.dart';
import 'package:foodmood/app/res/fonts/font_family.dart';
import 'package:foodmood/app/res/size/size_config.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar(
      {Key? key,
      required this.title,
      this.leading,
      this.actions,
      this.backgroundColor,
      this.elevation})
      : super(key: key);
  final String title;
  final Widget? leading;
  final Color? backgroundColor;
  final List<Widget>? actions;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      titleTextStyle: TextStyle(
          color: context.appPrimaryColor,
          fontSize: 16.sp,
          fontWeight: FontStyles.medium),
      leading: leading,
      surfaceTintColor: Colors.white,
      centerTitle: true,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.h);
}

class NewCustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? title;
  final Color? backgroundColor;
  final List<Widget>? actions;
  final double? elevation;
  const NewCustomAppBar({
    Key? key,
    this.title,
    this.actions,
    this.backgroundColor,
    this.elevation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? Colors.transparent,
      elevation: elevation ?? 0.0,
      title: TextWidget(
        text: title ?? '',
        textSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: context.appPrimaryColor,
      ),
      centerTitle: true,
      leading: Padding(
        padding: const EdgeInsets.all(5.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(200),
          onTap: () {
            Navigator.pop(context);
          },
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
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70.h);
}
