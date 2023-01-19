import 'package:flutter/material.dart';
import 'package:foodmood/app/common_widget/text_widget.dart';
import 'package:foodmood/app/res/size/size_config.dart';

class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget(
      {Key? key,
      this.label,
      this.bottomPadding,
      required this.value,
      this.onChange})
      : super(key: key);
  final String? label;
  final bool value;
  final void Function(bool? value)? onChange;
  final double? bottomPadding;

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.bottomPadding ?? 0),
      child: GestureDetector(
        onTap: () {
          if (widget.onChange != null) {
            widget.onChange!(!widget.value);
          }
        },
        child: Row(
          children: [
            SizedBox(
              height: 20.r,
              width: 20.r,
              child: Checkbox(
                value: widget.value,
                splashRadius: 10.r,
                onChanged: widget.onChange,
                // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            if (widget.label != null)
              Expanded(
                child: TextWidget(
                  text: widget.label!,
                ),
              )
          ],
        ),
      ),
    );
  }
}
