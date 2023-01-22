import 'package:flutter/material.dart';
import 'package:foodmood/app/res/fonts/font_family.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {Key? key,
      required this.text,
      this.textSize = 14,
      this.padding = const EdgeInsets.all(0.0),
      this.color = Colors.black,
      this.fontWeight = FontWeight.normal,
      this.backgroundColor = Colors.transparent,
      this.textAlign = TextAlign.start,
      this.fontFamily = FontStyles.gilmerHeavy,
      this.textDecoration = TextDecoration.none,
      this.maxLines,
      this.overflow,
      this.lineSpace})
      : super(key: key);

  final String text;
  final double textSize;
  final double? lineSpace;
  final EdgeInsets padding;
  final Color color;
  final Color backgroundColor;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final String fontFamily;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDecoration textDecoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: padding,
      child: Text(
        text,
        maxLines: maxLines == null ? null : maxLines!,
        overflow: overflow == null ? TextOverflow.visible : overflow!,
        style: TextStyle(
          decoration: textDecoration,
          fontSize: textSize,
          color: color,
          fontWeight: fontWeight,
          height: lineSpace ?? 1.2,
          fontFamily: FontStyles.gilmerHeavy,
        ),
        textAlign: textAlign,
      ),
    );
  }
}
