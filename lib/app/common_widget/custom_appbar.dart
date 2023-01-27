import 'package:flutter/material.dart';
import 'package:foodmood/app/res/fonts/font_family.dart';
import 'package:foodmood/app/res/size/size_config.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar(
      {Key? key, required this.title, this.leading, this.actions})
      : super(key: key);
  final String title;
  final Widget? leading;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      titleTextStyle: TextStyle(
          color: Colors.white, fontSize: 16.sp, fontWeight: FontStyles.medium),
      leading: leading,
      surfaceTintColor: Colors.white,
      centerTitle: true,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(50.h);
}
