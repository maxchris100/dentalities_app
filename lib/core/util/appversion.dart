import 'dart:io';
import 'package:package_info_plus/package_info_plus.dart';

class AppVersion {
  static String? appName;
  static String? packageName;
  static String? version;
  static String? buildNumber;

  static String getPlatform() {
    if (Platform.isAndroid) {
      return "android";
    } else if (Platform.isIOS) {
      return "ios";
    } else if (Platform.isWindows) {
      return "windows";
    } else if (Platform.isLinux) {
      return "linux";
    } else if (Platform.isFuchsia) {
      return "fuchsia";
    } else if (Platform.isMacOS) {
      return "macos";
    } else {
      return "unknownplatform";
    }
  }

  static Future<void> getPackageInfo() async {
    if (!Platform.isWindows) {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      appName = packageInfo.appName;
      packageName = packageInfo.packageName;
      version = packageInfo.version;
      buildNumber = packageInfo.buildNumber;
    }
  }

  static String getVersion() {
    String v = '';
    if (version != null) {
      v += version!;
    }
    if (buildNumber != null) {
      v += "+${buildNumber!}";
    }
    return v;
  }
}
