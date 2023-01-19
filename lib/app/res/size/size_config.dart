import 'dart:math';

import 'package:flutter/cupertino.dart';

/// SizeConfigWidget is used directly under MaterialApp
/// you have to provide draft size and child in this and provide UniqueKey() always.
class SizeConfigWidget extends StatefulWidget {
  const SizeConfigWidget(
      {Key? key, required this.child, required this.draftSize})
      : super(key: key);

  final Widget child;
  final Size draftSize;

  @override
  State<SizeConfigWidget> createState() => _SizeConfigWidgetState();
}

class _SizeConfigWidgetState extends State<SizeConfigWidget> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        SizeConfig.initialize(
          context: context,
          draftWidth: widget.draftSize.width,
          draftHeight: widget.draftSize.height,
        );
        return widget.child;
      },
    );
  }
}

/// SizeConfig class is used to calculate h, w, sp & r.
/// To use this you have 2 option:
/// 1. User SizeConfigWidget
/// 2. or you can initialize SizeConfig.initialize once after MaterialApp
/// it uses Singleton feature
class SizeConfig {
  SizeConfig(
      {required double widthScale,
      required double heightScale,
      bool minTextAdapt = false})
      : _widthScale = widthScale,
        _heightScale = heightScale,
        _textScale = minTextAdapt ? min(widthScale, heightScale) : widthScale;

  factory SizeConfig.initialize({
    required BuildContext context,
    required double draftWidth,
    required double draftHeight,
    bool minTextAdapt = false,
  }) {
    final double actualWidth = MediaQuery.of(context).size.width;
    final double widthScale = actualWidth / draftWidth;

    //height scale calculate
    final double actualHeight = MediaQuery.of(context).size.height;
    final double heightScale = actualHeight / draftHeight;

    instance = SizeConfig(
        heightScale: heightScale,
        widthScale: widthScale,
        minTextAdapt: minTextAdapt);

    if (instance != null) {
      return instance!;
    } else {
      return instance!;
    }
  }
  late final double _widthScale;
  late final double _heightScale;
  late final double _textScale;

  double getHeight(num height) => height * _heightScale;

  double getWidth(num width) => width * _widthScale;

  double getTextSize(num textSize) => textSize * _textScale;

  double getRadius(num r) => r * min(_widthScale, _heightScale);

  static SizeConfig? instance;
}

extension SizeConfigExtension on num {
  double get h => SizeConfig.instance!.getHeight(this);
  double get w => SizeConfig.instance!.getWidth(this);
  double get sp => SizeConfig.instance!.getTextSize(this);
  double get r => SizeConfig.instance!.getRadius(this);
}
