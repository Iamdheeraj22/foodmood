import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodmood/app/common_widget/text_widget.dart';
import 'package:foodmood/app/res/size/size_config.dart';


class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {Key? key,
      this.controller,
      this.label,
      this.hintText,
      this.leading,
      this.bottomPadding,
      this.obscureText,
      this.textInputType,
      this.textInputAction,
      this.showVisibilityIcon = false,
      this.onTextChanged,
      this.autoValidateMode,
      this.validator,
      this.enabled,
      this.onTap,
      this.textInputFormatters,
      this.maxLength,
      this.maxLines,
      this.showCounterText = false})
      : super(key: key);
  final TextEditingController? controller;
  final String? label;
  final String? hintText;
  final Widget? leading;
  final double? bottomPadding;
  final bool? obscureText;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final bool showVisibilityIcon;
  final int? maxLength;
  final List<TextInputFormatter>? textInputFormatters;
  final Function(String value)? onTextChanged;
  final AutovalidateMode? autoValidateMode;
  final String? Function(String? value)? validator;
  final bool? enabled;
  final VoidCallback? onTap;
  final int? maxLines;
  final bool showCounterText;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _passwordVisible;

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.bottomPadding ?? 18.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != null)
            TextWidget(
              text: widget.label ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          InkWell(
            onTap: widget.onTap,
            child: TextFormField(
              controller: widget.controller,
              onChanged: widget.onTextChanged,
              //autocorrect: false,
              enabled: widget.enabled,
              inputFormatters: widget.textInputFormatters,
              autovalidateMode: widget.autoValidateMode,
              validator: widget.validator,
              enableInteractiveSelection: true,
              maxLength: widget.maxLength,
              obscureText: widget.obscureText != null && !_passwordVisible
                  ? true
                  : false,
              keyboardType: widget.textInputType,
              textInputAction: widget.textInputAction,
              maxLines: widget.maxLines,
              minLines: 1,
              decoration: InputDecoration(
                hintText: widget.hintText,
                counterText: widget.showCounterText ? null : '',
                isDense: true,
                errorMaxLines: 2,
                errorStyle: const TextStyle(color: Colors.redAccent),
                prefixIconConstraints: BoxConstraints(
                    maxHeight: 20.h,
                    maxWidth: 34.w,
                    minHeight: 20.h,
                    minWidth: 34.w),
                prefixIcon: widget.leading,
                suffixIconConstraints: BoxConstraints(
                    maxHeight: 20.h,
                    maxWidth: 34.w,
                    minHeight: 20.h,
                    minWidth: 34.w),
                suffixIcon: widget.showVisibilityIcon
                    ? IconButton(
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.black,
                          //    color: Theme.of(context).primaryColorDark,
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                        iconSize: 20.r,
                        padding: EdgeInsets.zero,
                      )
                    : null,
              ),
            ),
          )
        ],
      ),
    );
  }
}
