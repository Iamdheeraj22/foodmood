import 'package:flutter/material.dart';
import 'package:foodmood/app/common_widget/text_widget.dart';
import 'package:foodmood/app/res/colors/colors.dart';
import 'package:foodmood/app/res/size/size_config.dart';
import 'package:foodmood/screens/cart/widgets/cart_item_card.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);
  static const String id = '/cart';
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Cart',
          style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w500,
              color: context.appPrimaryColor),
        ),
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              children: [const CartItemCard(), const CartItemCard()],
            ),
          ),
          Container(
            decoration: BoxDecoration(color: context.appPrimaryColor),
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 10.h,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                    text: TextSpan(children: [
                  TextSpan(
                      text: '₹ 175',
                      style: TextStyle(
                          fontSize: 24.sp, fontWeight: FontWeight.w500)),
                  TextSpan(
                      text: '\nIncludes all GST & Taxes',
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.w500)),
                ])),
                SizedBox(
                  height: 20.h,
                  width: 20.h,
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.info,
                        color: context.white,
                      )),
                ),
                const Spacer(),
                Card(
                  child: Container(
                      alignment: Alignment.center,
                      height: 50.h,
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                      ),
                      child: TextWidget(
                        text: 'Checkout',
                        fontWeight: FontWeight.w400,
                        textSize: 18.sp,
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
