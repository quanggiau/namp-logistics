import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logistics/app/constants/style_constants.dart';
import 'package:logistics/app/controllers/app_controller.dart';
import 'package:logistics/app/utils/responsive/image_size_responsive.dart';
import 'package:logistics/app/widgets/text/style.dart';

class MainTemplateAppBar extends GetView<AppController> {
  /// Main template widget for the application
  final Widget content;

  /// Title of the application
  final String title;

  /// Whether to display the application icon
  final bool isDisplayAppIcon;

  /// Background color (default: White)
  final Color? backgroundColor;

  /// Leading widget for the application bar
  final Widget? leadingWidget;

  /// Trailing widget for the application bar
  final Widget? trailingWidget;

  /// Whether to show the application bar
  final bool isShowAppBar;

  /// Whether to use safe area
  final bool useSafeArea;

  /// Whether to use bottom border for the application bar
  final bool useAppBarBottomBorder;

  /// Bottom navigation bar widget
  final Widget? bottomNavigationBar;

  const MainTemplateAppBar({
    super.key,
    required this.content,
    this.title = '',
    this.isDisplayAppIcon = true,
    this.backgroundColor,
    this.leadingWidget,
    this.trailingWidget,
    this.isShowAppBar = true,
    this.useSafeArea = true,
    this.useAppBarBottomBorder = true,
    this.bottomNavigationBar,
  }) ;

  /// Creates the layout for the title in the application bar
  Widget _createLayoutTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: kToolbarHeight,
          child: Align(alignment: Alignment.centerLeft, child: leadingWidget),
        ),
        const SizedBox(width: kToolbarHeight),
        SizedBox(
          width: Get.width - (kToolbarHeight * 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isDisplayAppIcon) _createIconApp(),
              Flexible(
                child: AutoSizeText(
                  title,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.getTextStyle(color: Colors.black, fontSize: FontSize.pageTitle),
                ),
              ),
            ],
          ),
        ),

        SizedBox(
          width: kToolbarHeight*2,
          child: Align(alignment: Alignment.centerRight, child: trailingWidget),
        ),
      ],
    );
  }

  /// Creates the application icon widget on the app bar
  Widget _createIconApp() {
    final iconSize = ImageSizeResponsive.iconAppBarSize;
    var padding = Get.width * 0.025;
    return Padding(
      padding: EdgeInsets.all(padding),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset('assets/images/logo.png', width: iconSize, height: iconSize, fit: BoxFit.cover),
      ),
    );
  }

  /// Creates the application bar widget
  PreferredSizeWidget _createAppBar(BuildContext context) {
    var shape = useAppBarBottomBorder ? Border(bottom: BorderSide(color: Colors.grey, width: 1)) : null;
    var elevation = useAppBarBottomBorder ? 1.0 : 0.0;
    return AppBar(titleSpacing: 0 ,automaticallyImplyLeading: false, shape: shape, elevation: elevation, backgroundColor: Colors.white, title: _createLayoutTitle());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? Colors.white,
      appBar: isShowAppBar ? _createAppBar(context) : null,
      body: useSafeArea ? SafeArea(child: content) : content,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
