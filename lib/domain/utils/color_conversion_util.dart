import 'dart:ui';

class ColorConversionUtil {
  Color colorConversion(String hexColor) {
    String hexValue = hexColor.replaceAll('Color(', '').replaceAll(')', '');
    if (!hexValue.startsWith('0x')) {
      hexValue = '0x$hexValue';
    }
    final int value = int.parse(hexValue);
    return Color(value);
  }
}
