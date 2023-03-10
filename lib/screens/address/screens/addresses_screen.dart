import 'package:flutter/material.dart';
import 'package:foodmood/app/common_widget/custom_appbar.dart';
import 'package:foodmood/app/common_widget/text_widget.dart';
import 'package:foodmood/app/res/colors/colors.dart';
import 'package:foodmood/app/res/drawables/icons.dart';
import 'package:foodmood/app/res/size/size_config.dart';
import 'package:foodmood/screens/address/widgets/address_item_card.dart';
import 'package:foodmood/screens/payment/screens/payment_screen.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);
  static const String id = '/address_screen';
  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const NewCustomAppBar(title: 'Addresses'),
        body: Container(
          margin: EdgeInsets.only(top: 20.h),
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 80.h,
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
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 20.h),
                  border: InputBorder.none,
                  hintText: 'Search for area, street name',
                  hintStyle: TextStyle(
                      fontSize: 16.sp,
                      color: context.appGreyColor2,
                      fontWeight: FontWeight.w400),
                  suffixIcon: InkWell(
                      borderRadius: BorderRadius.circular(1000.r),
                      onTap: () {},
                      child: SizedBox(
                        child: Image.asset(
                          AppIcons.search,
                          height: 24.h,
                          width: 24.h,
                        ),
                      )),
                ),
              )),
            ),
            SizedBox(
              height: 10.h,
            ),
            Card(
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, PaymentScreen.id);
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.h, horizontal: 5.w),
                  child: Row(
                    children: [
                      Icon(
                        Icons.my_location_rounded,
                        color: context.appPrimaryColor,
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      TextWidget(
                        text: 'Use current location',
                        fontWeight: FontWeight.w400,
                        textSize: 16.sp,
                        color: context.black,
                      ),
                      const Spacer(),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: context.appPrimaryColor,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            TextWidget(
              text: 'Saved addresses',
              textSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: context.black,
            ),
            AddressItemCard(
              onTap: () {
                Navigator.pushNamed(context, PaymentScreen.id);
              },
            ),
            AddressItemCard(
              onTap: () {
                Navigator.pushNamed(context, PaymentScreen.id);
              },
            ),
            SizedBox(
              height: 30.h,
            ),
            TextWidget(
              text: 'Recent addresses',
              textSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: context.black,
            ),
            AddressItemCard(
              onTap: () {
                Navigator.pushNamed(context, PaymentScreen.id);
              },
            ),
          ]),
        ));
  }
}
