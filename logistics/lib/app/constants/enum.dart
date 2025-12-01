// ignore_for_file: constant_identifier_names

enum AuthCondition { register, terminate }

enum AppEnv { deva, devb, devc, it, hotfixit, ita, itb, demo, prod, stg }

/// Permission Error Type
enum PermissionErrType { servicesDisabled, permissionsDenied, permissionsDeniedForever }

/// Face indicator shapes
enum IndicatorShape { defaultShape, square }

/// Camera state
enum CameraState { uninitialized, initializing, initialized, disposing }

/// Message show status
enum ShowMessageStatus { success, error, notShow }

/// Camera permission status
enum CameraPermissionStatus { granted, denied, running }

/// Face indicator colors
enum FaceFieldAuthStatus { init, success, errorWorkerResponse, errorAdminResponse, errorOthers }

/// Error Type when calling API in Kpas
enum ApiKpasErrorType {
  // Error when server is not connected
  serverNotConnected,
  // Error when server is not reachable
  errorTimeout,
  // Error when server is not reachable
  code403,
  // Error when code not 200 and not 403
  codeOther200,
  // No Person detected
  noPerson,
  // muError
  muError_02032001,
  muError_02090000,
  muErrorOthers,
  // MultiMatch
  multiMatch,
  // Others
  errorOthers,
}

/// Task to send to server
enum TaskToSend { checkInOutLogs, faceApiFieldAuth, mobileNoticesList }

/// Schema Version for Realm
enum SchemaVersion {
  // Initial version
  BLDE_V2_55078(5);

  const SchemaVersion(this.version);
  final int version;
}

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

/// Eye Type
enum Eyes { left, right }

/// ServiceType
enum AuthServiceType {
  // Not Use
  notUse(0),
  // KPAS
  kpas(1);

  const AuthServiceType(this.value);
  final int value;
}

/// IntegrationServiceId
/// 顔レコ
enum IntegrationServiceId {
  // KPAS (default)
  kpas(4),
  // KPAS Obayashi
  kpasObayashi(6);

  const IntegrationServiceId(this.value);
  final int value;
}

/// Device Type
enum DeviceResponsiveType { smallPhone, standardPhone, largePhone, tablet, largeTablet }
