// ignore_for_file: constant_identifier_names

enum AuthCondition { register, terminate }

/// Permission Error Type
enum PermissionErrType { servicesDisabled, permissionsDenied, permissionsDeniedForever }

/// Message show status
enum ShowMessageStatus { success, error, notShow }

/// Menu Item Button Type
enum MenuItemButtonType {
  subMenu,
  errorLogPage,
  termOfUsePage,
  licensePage,
  settingPage,
  debugMenuDelete,
  debugFace,
  debugLastLog,
  debugCheckNotification,
  debugDeleteNotification,
  debugMoveInOut,
}

/// Device Type
enum DeviceResponsiveType { smallPhone, standardPhone, largePhone, tablet, largeTablet }
