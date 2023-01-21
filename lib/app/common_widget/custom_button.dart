import 'package:flutter/material.dart';
import 'package:foodmood/app/res/size/size_config.dart';

class CustomButton extends StatefulWidget {
  const CustomButton(
      {Key? key,
      required this.label,
      required this.onPressed,
      this.isLoading = false,
      this.width = 100,
      this.height = double.infinity,
      this.color})
      : super(key: key);
  final String label;
  final VoidCallback onPressed;
  final bool isLoading;
  final Color? color;
  final double? height;
  final double? width;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: widget.isLoading ? () {} : widget.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.color,
          minimumSize:
              Size(widget.width ?? double.infinity, widget.height ?? 50.h),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: widget.isLoading
              ? const CircularProgressIndicator()
              : Text(
                  widget.label,
                  style: TextStyle(color: Colors.white, fontSize: 16.sp),
                ),
        ));
  }
}
