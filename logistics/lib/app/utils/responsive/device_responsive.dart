import 'package:get/get.dart';
import 'package:logistics/app/constants/enum.dart';

///
/// Responsive device class.
///
class DeviceResponsive {
  /// Determines if the device is a tablet.
  static bool get isTablet => Get.width > 600;

  /// Determines if the device is a tablet and the height is not equivalent to the width.
  static bool get isNotSquareTabletDevice => !(Get.height / Get.width < 1.5) && isTablet;

  /// Determines the type of device based on its width.
  static DeviceResponsiveType get deviceResponsiveType {
    var width = Get.width;
    if (width >= 900) {
      return DeviceResponsiveType.largeTablet;
    } else if (width >= 600) {
      return DeviceResponsiveType.tablet;
    } else if (width > 480) {
      return DeviceResponsiveType.largePhone;
    } else {
      return DeviceResponsiveType.smallPhone;
    }
  }
}
