import 'package:logistics/app/constants/enum.dart';
import 'package:logistics/app/utils/responsive/device_responsive.dart';

class ImageSizeResponsive {
  /// Returns the icon size based on the device type.
  /// This is icon on app bar
  static double get iconAppBarSize {
    var type = DeviceResponsive.deviceResponsiveType;
    switch (type) {
      case DeviceResponsiveType.smallPhone:
        return 24;
      case DeviceResponsiveType.standardPhone:
        return 28;
      case DeviceResponsiveType.largePhone:
        return 32;
      case DeviceResponsiveType.tablet:
        return 36;
      case DeviceResponsiveType.largeTablet:
        return 40;
    }
  }

  /// Returns the icon size based on screen width (without using Get.width)
  static double getIconAppBarSize(double screenWidth) {
    if (screenWidth >= 900) {
      return 40; // largeTablet
    } else if (screenWidth >= 600) {
      return 36; // tablet
    } else if (screenWidth > 480) {
      return 32; // largePhone
    } else {
      return 24; // smallPhone
    }
  }
}
