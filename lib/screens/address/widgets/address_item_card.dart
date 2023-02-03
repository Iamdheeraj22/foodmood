import 'package:flutter/material.dart';
import 'package:foodmood/app/common_widget/text_widget.dart';
import 'package:foodmood/app/res/colors/colors.dart';
import 'package:foodmood/app/res/size/size_config.dart';

class AddressItemCard extends StatelessWidget {
  const AddressItemCard({Key? key}) : super(key: key);
  // final String typeName;
  // final String address;
  // final String icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.h),
      child: InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.home,
              size: 30.h,
              color: context.black,
            ),
            SizedBox(
              width: 15.w,
            ),
            Expanded(
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: 'Home',
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: context.black)),
                TextSpan(
                    text:
                        '\n9, suramya duplex, nr. nigam bus stand besides suramya appartment, ghodasar, ahmedabad - 50',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: context.black))
              ])),
            ),
          ],
        ),
      ),
    );
  }
}
