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
      this.color,
      this.fontSize, this.fontWeight})
      : super(key: key);
  final String label;
  final VoidCallback onPressed;
  final bool isLoading;
  final Color? color;
  final FontWeight? fontWeight;
  final double? height;
  final double? width;
  final double? fontSize;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
          decoration: BoxDecoration(color: widget.color),
          height: widget.height ?? 50.h,
          child: widget.isLoading
              ? const CircularProgressIndicator()
              : Center(
                  child: Text(
                    widget.label,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: widget.fontWeight,
                      fontSize: widget.fontSize?.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )),
    );
  }
}
