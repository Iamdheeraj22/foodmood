import 'package:flutter/material.dart';
import 'package:foodmood/app/common_widget/custom_edittext_text_widget.dart';
import 'package:foodmood/app/common_widget/text_widget.dart';
import 'package:foodmood/app/res/colors/colors.dart';
import 'package:foodmood/app/res/drawables/icons.dart';
import 'package:foodmood/app/res/size/size_config.dart';
import 'package:foodmood/app/res/strings/strings.dart';
import 'package:foodmood/screens/account_details/edit_screen/widgets/custom_edit_widget.dart';

class EditScreenPage extends StatefulWidget {
  const EditScreenPage({Key? key}) : super(key: key);
  static const String id = '/edit_screen';
  @override
  State<EditScreenPage> createState() => _EditScreenPageState();
}

class _EditScreenPageState extends State<EditScreenPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
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
          text: 'Edit Personal Information',
          color: context.appPrimaryColor,
          textSize: 20.sp,
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.r),
        child: Column(
          children: [
            SizedBox(
              height: 25.h,
            ),
            //Edit Profile Picture
            Center(
              child: Container(
                padding: EdgeInsets.all(15.r),
                height: 175.h,
                width: 175.h,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      height: 150.h,
                      width: 150.h,
                      decoration: BoxDecoration(
                          color: context.appPrimaryColor,
                          borderRadius: BorderRadius.circular(100.r)),
                      child: Icon(
                        Icons.person,
                        size: 50.h,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10.r),
                      height: 48.h,
                      width: 48.h,
                      decoration: BoxDecoration(
                          color: context.black,
                          borderRadius: BorderRadius.circular(50.r)),
                      child: Image.asset(
                        AppIcons.camera,
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            CustomEditTextWidget(
              title: Strings.name,
              hintText: Strings.enterName,
              controller: _nameController,
              inputAction: TextInputAction.next,
              inputType: TextInputType.text,
              update: () {},
              cancel: () {},
            ),
            SizedBox(
              height: 25.h,
            ),
            CustomEditTextWidget(
              update: () {},
              cancel: () {},
              title: Strings.phoneNumber,
              hintText: Strings.enterPhoneNumber,
              controller: _phoneController,
              inputAction: TextInputAction.next,
              inputType: TextInputType.phone,
            ),
            SizedBox(
              height: 25.h,
            ),
            CustomEditTextWidget(
              update: () {},
              cancel: () {},
              title: Strings.email,
              hintText: Strings.enterEmailHint,
              controller: _emailController,
              inputAction: TextInputAction.done,
              inputType: TextInputType.emailAddress,
            )
          ],
        ),
      ),
    );
  }
}
