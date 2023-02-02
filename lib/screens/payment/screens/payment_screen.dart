import 'package:flutter/material.dart';
import 'package:foodmood/app/common_widget/custom_appbar.dart';
import 'package:foodmood/app/common_widget/text_widget.dart';
import 'package:foodmood/app/res/colors/colors.dart';
import 'package:foodmood/app/res/drawables/icons.dart';
import 'package:foodmood/app/res/drawables/payments.dart';
import 'package:foodmood/app/res/size/size_config.dart';
import 'package:foodmood/screens/payment/widgets/payment_item_card.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen({Key? key}) : super(key: key);
  static const String id = '/payment_Screen';
  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: context.appPrimaryColor,
              size: 50.r,
            )),
        title: Text(
          'Payment',
          style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: context.appPrimaryColor),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 10.h,
          ),

          //Cards ITem
          PaymentItemCard(
            extendWidth: false,
            title: 'Debit / Credit Card',
            img: AppIcons.creditCard,
            onTap: () {},
          ),

          SizedBox(
            height: 10.h,
          ),
          PaymentItemCard(
              extendWidth: true,
              title: 'Pay with UPI',
              img: PaymentsStrings.upi,
              onTap: () {}),

          SizedBox(
            height: 10.h,
          ),
          PaymentItemCard(
              extendWidth: true,
              title: 'Payment Wallet',
              img: PaymentsStrings.paytm,
              onTap: () {}),
          SizedBox(
            height: 10.h,
          ),
          PaymentItemCard(
              extendWidth: true,
              title: 'Phonepe Wallet',
              img: PaymentsStrings.phonepe,
              onTap: () {}),

          SizedBox(
            height: 10.h,
          ),
          PaymentItemCard(
              extendWidth: false,
              title: 'Netbanking',
              img: PaymentsStrings.bank,
              onTap: () {}),

          SizedBox(
            height: 10.h,
          ),
          PaymentItemCard(
              extendWidth: true,
              title: 'Pay on Delivery',
              img: PaymentsStrings.biCash,
              onTap: () {}),
        ])),
      ),
    );
  }
}
