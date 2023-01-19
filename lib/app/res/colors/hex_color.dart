import 'dart:ui';

//This class is used to get color from hex color code
class ColorFromHex extends Color {
  ColorFromHex(String hexColor) : super(_getColorFromHex(hexColor));
  static int _getColorFromHex(String hexColorString) {
    var hexColor = hexColorString;
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }
}
