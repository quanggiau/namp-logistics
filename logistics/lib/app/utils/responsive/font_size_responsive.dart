
import 'package:logistics/app/utils/responsive/device_responsive.dart';

///
/// Determines the font size of the text responsively.
///
class FontSizeResponsive {
  static double getFontSizeResponsive(double fontSize) => DeviceResponsive.isTablet ? fontSize * 1.25 : fontSize;
}