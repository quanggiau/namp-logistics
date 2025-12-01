import 'package:flutter/material.dart';
import 'package:logistics/app/utils/responsive/font_size_responsive.dart';

class AppTextStyle {
  ///
  /// Create a text style with the given parameters
  ///
  static TextStyle getTextStyle(
      {Color? color,
      double? fontSize,
      bool autoSizeResponsive = true,
      FontWeight? fontWeight,
      List<Shadow>? shadows,
      TextOverflow? overflow,
      bool isUnderline = false}) {
    var autoFontSize = fontSize;
    if (autoSizeResponsive && fontSize != null) {
      autoFontSize = FontSizeResponsive.getFontSizeResponsive(fontSize);
    }
    return TextStyle(
        color: color ?? Colors.black,
        fontSize: autoFontSize,
        fontWeight: fontWeight,
        fontFamily: "ipaexg",
        shadows: shadows,
        overflow: overflow,
        decoration: isUnderline ? TextDecoration.underline : TextDecoration.none,
        decorationColor: color ?? Colors.black,
        decorationThickness: 1.5);
  }
}