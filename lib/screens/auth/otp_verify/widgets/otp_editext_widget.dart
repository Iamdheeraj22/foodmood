import 'package:flutter/material.dart';
import 'package:foodmood/app/res/size/size_config.dart';

class OtpEditextWidget extends StatelessWidget {
  const OtpEditextWidget(
      {Key? key,
      required this.controller,
      required this.first,
      required this.last})
      : super(key: key);
  final TextEditingController controller;
  final bool first;
  final bool last;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 60.w,
        child: TextField(
          controller: controller,
          autofocus: true,
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          textAlignVertical: TextAlignVertical.center,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10),
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.black54),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.black54),
            ),
          ),
        ));
  }
}
