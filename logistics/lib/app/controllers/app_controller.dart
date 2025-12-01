import 'package:logistics/app/services/logger.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:logistics/app/utils/responsive/device_responsive.dart';
import 'package:package_info_plus/package_info_plus.dart';

///
/// AppController is the only one controller in this application
///
class AppController extends GetxController {

  /// call when controller start
  @override
  void onInit() async{
    logger.i("AppController[entrance_mobile_prime].init");
    super.onInit();

    logger.i("flavor:${const String.fromEnvironment('flavor', defaultValue: 'なし')}");

    logger.i("mediaQuery:${Get.mediaQuery}");
    var info = await GetIt.I.getAsync<PackageInfo>();
    logger.i("appName:${info.appName}\n"
              "packageName:${info.packageName}\n"
              "buildNumber:${info.buildNumber}\n"
              "version:${info.version}\n"
              "buildSignature:${info.buildSignature}\n"
              "DeviceResponsive.isTablet :${DeviceResponsive.isTablet}\n"
              "DeviceResponsive.isNotSquareTabletDevice :${DeviceResponsive.isNotSquareTabletDevice}");
  }
}