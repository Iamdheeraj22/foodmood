import 'package:flutter/material.dart';
import 'package:foodmood/app/res/size/size_config.dart';


class CustomButton extends StatefulWidget {
  const CustomButton(
      {Key? key,
      required this.label,
      required this.onPressed,
      this.isLoading = false,
      this.color})
      : super(key: key);
  final String label;
  final VoidCallback onPressed;
  final bool isLoading;
  final Color? color;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: widget.isLoading ? () {} : widget.onPressed,
        style: ElevatedButton.styleFrom(
            primary: widget.color,
            minimumSize: Size(double.infinity, 50.h),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r))),
        child: widget.isLoading
            ? const CircularProgressIndicator()
            : Text(
                widget.label,
                style: TextStyle(color: Colors.white, fontSize: 16.sp),
              ));
  }
}
