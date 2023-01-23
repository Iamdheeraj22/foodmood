import 'package:flutter/material.dart';
import 'package:foodmood/app/res/colors/hex_color.dart';

class ColorsCollections {
  static MaterialColor materialColorPrimarySwatch =
      createMaterialColor(colorPrimary);

  static MaterialColor createMaterialColor(Color color) {
    final List strengths = <double>[.05];
    final Map<int, Color> swatch = {};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }

  static final Color colorPrimary = ColorFromHex('#0A5597');
  static Color colorPrimaryDark = ColorFromHex('#232f3f');
  static Color colorAccent = ColorFromHex('#77A6F7');
  static Color cremeColor = ColorFromHex('#E9E9E9');
  static Color lightBlue = ColorFromHex('#17223E');
  static Color lightBorder = ColorFromHex('#DFDFDF');

  //new colors
  static const Color appPrimaryColor = Color(0xFFFF9D01);
  static const Color appOnbordingColor = Color(0xFF161616);
  static const Color appGreyColor1 = Color(0xFFDADADA);
  static const Color appGreyColor2 = Color(0xFFD9D9D9);
}

extension ColorExtenstion on BuildContext {
  Color get primaryColor => Theme.of(this).brightness == Brightness.light
      ? ColorsCollections.colorPrimary
      : ColorsCollections.colorPrimaryDark;
  Color get appPrimaryColor => Theme.of(this).brightness == Brightness.light
      ? ColorsCollections.appPrimaryColor
      : ColorsCollections.appPrimaryColor;
  Color get appGreyColor1 => Theme.of(this).brightness == Brightness.light
      ? ColorsCollections.appGreyColor1
      : ColorsCollections.appGreyColor1;
  Color get appGreyColor2 => Theme.of(this).brightness == Brightness.light
      ? ColorsCollections.appGreyColor2
      : ColorsCollections.appGreyColor2;
}
